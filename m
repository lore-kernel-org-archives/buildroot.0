From: John Stile <john@stilen.com>
Date: Sun, 03 Mar 2013 10:04:43 -0800
Subject: [Buildroot] fw_printenv and mtdparts
Message-ID: <1362333883.20183.60.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to read the uboot environment from my booted embedded Linux
system, created with buildroot-2011.11, on a at91sam9g20ek with a 8Mb
NOR and 256Mb NAND.

I've had some strange progress, but I need some help.

First the background:

My actual write addresses in the tcl used by sam-ba to write the NAND
and NOR:
## NandFlash Mapping
set bootStrapAddrNand1  0x00000000
set ubootAddrNand1      0x00020000
set ubootEnvAddrNand1   0x00060000
set kernelAddrNand1     0x00200000
set rootfsAddrNand1     0x00400000
set bootStrapAddrNand2  0x08000000
set ubootAddrNand2      0x08020000
set ubootEnvAddrNand2   0x08060000
set kernelAddrNand2     0x08200000
set rootfsAddNand2      0x08400000
## DataFlash Mapping
set baseAddrNor         0xD0000000
set bootStrapAddrNor    0x00000000
set ubootEnvAddrNor     0x00004200
set ubootAddrNor        0x00008400
set kernelAddrNor       0x00042000
set rootfsAddrNor       0x00294000

My Linux kernel gets the /proc/mtd lines form the 'mtdparts' in the
'bootargs', which I suspect is wrong.
bootargs=mem=64M console=ttyS0,115200
mtdparts=atmel_nand:128k(bootstrap1)ro,256k(uboot1)ro,128k(env1)ro,1536K(unused),2M(linux1),124M(rootfs1),128k(bootstrap2)ro,256k(uboot2)ro,128k(env2)ro,1536k(unused2),2M(linux2),124M(rootfs2);spi0.1-AT45DB642x:2640k(bootstrap/env/uboot/kernel)ro,-(rootfs) root=/dev/mtdblock13 rw rootfstype=jffs2"

When I cat /proc/mtd I see:
dev:    size   erasesize  name
mtd0: 00020000 00020000 "bootstrap1"
mtd1: 00040000 00020000 "uboot1"
mtd2: 00020000 00020000 "env1"
mtd3: 00180000 00020000 "unused"
mtd4: 00200000 00020000 "linux1"
mtd5: 07c00000 00020000 "rootfs1"
mtd6: 00020000 00020000 "bootstrap2"
mtd7: 00040000 00020000 "uboot2"
mtd8: 00020000 00020000 "env2"
mtd9: 00180000 00020000 "unused2"
mtd10: 00200000 00020000 "linux2"
mtd11: 07c00000 00020000 "rootfs2"
mtd12: 00294000 00000420 "bootstrap/env/uboot/kernel"
mtd13: 005ac000 00000420 "rootfs"
 
On the booted system, When I run these: 
 od -t xz /dev/mtd4
 od -t xz /dev/mtd5
I see ascii uboot-environment data, 
both show timestamp=1236, which is a variable I added to env1, but I do
not see the timestamp=1237 I added to env2, so I'm not getting to nand2
env.
I would expect this to be in /dev/mtd2, so I must be off.

When I try any one of the following lines in /etc/fw_env.config:
/dev/mtd8  0x00000 0x20000 0x20000 
/ev/mtd2   0x00000 0x20000 0x20000 
/dev/mtd8  0xa0000 0x20000 0x20000
/dev/mtd8  0x60000 0x20000 0x20000
/dev/mtd4   0x00000 0x20000 0x20000

It prints the default, which are compiled into uboot.
Warning: Bad CRC, using default environment
bootcmd=bootp; setenv bootargs root=/dev/nfs nfsroot=${serverip}:
${rootpath} ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:
${hostname}::off; bootm
bootdelay=5
baudrate=115200

I suspect my mtdparts statement is wrong.

Is there some way I check my 'mtdparts' in 'bootcmd'?

Is there some other problem happening here?
