use <common_modules.scad>

$fn=125;

hole_d=28.95;
id=47;
bezel=5;
plug_t=.77;
plate_t=2.5;

blockInset=2;
block_x=id+(bezel*2)-(blockInset*2);
block_y=8;
block_z=9.08;
bolthole_d=3.20;
rivnut_d=4.85;
bolthole_spacing=id/4;



//translate([0,0,26])rivnut_tester(rivnut_d);
printUnit();

//difference(){backStrap();rivnutHoles();}
//difference(){translate([0,0,0])structure();boltHoles();}

module printUnit(){
translate([0,-id/2-block_y/2,-plate_t-plug_t])difference(){backStrap();rivnutHoles();}
difference(){translate([0,0,0])structure();boltHoles();}

}


module rivnut_tester(dia=4.85,h=9.08){
//rivnutTester

difference(){
    translate([0,0,0])cube([dia+4,dia+4,h],center=true);
    translate([0,0,-10])cylinder(h+20,dia/2,dia/2);
}
}


//bolt holes


module rivnutHoles(){
translate([bolthole_spacing,0,-10])cylinder(50,rivnut_d/2,rivnut_d/2);
translate([id+(bezel*2)-bolthole_spacing,0,-10])cylinder(50,rivnut_d/2,rivnut_d/2);
}



module boltHoles(){
translate([bolthole_spacing,0,-10])cylinder(50,bolthole_d/2,bolthole_d/2);
translate([id+(bezel*2)-bolthole_spacing,0,-10])cylinder(50,bolthole_d/2,bolthole_d/2);
}

module backStrap(){

difference(){
translate([blockInset,-block_y/2,plate_t+plug_t])color([0,1,0])cube([block_x,block_y,block_z]);
    
translate([blockInset-3,-block_y/2-1,plate_t+plug_t])color([1,0,0])rotate([0,-45,0])cube([block_x/4,5+block_y,block_z]);
translate([id-blockInset*2+6,-block_y/2-1,9.5+plate_t+plug_t])color([1,0,0])rotate([0,45,0])cube([block_x/4,5+block_y,block_z]);    
    
translate([block_x/2+bezel/2,20,25])rotate([90,0,0])cylinder(50,block_x/3.2,block_x/3.2);
translate([bezel,-block_y/2-1,-5])cube([id,block_y+2,block_z]);    
}



    
    
}
module structure(){
    union(){
        translate([bezel,0,plate_t-.01])linear_extrude(plug_t)circlePlate(hole_d,id);
        translate([0,0,0])linear_extrude(plate_t)circlePlate(hole_d+(bezel*2),id+(bezel*2));
    }
}