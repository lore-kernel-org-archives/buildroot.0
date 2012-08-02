From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 2 Aug 2012 11:28:33 -0700
Subject: [Buildroot] trouble running an ARM uImage
Message-ID: <CALo-6+gUf2nptY=7yaUVa_0hgF0aniLg9gV5Ai35b9P0UkXzZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having trouble running a Linux kernel built with several
toolchains with my AM3517 project. The only one that seems to work
correctly is the external installation of CodeSourcery's 2010.09.

A uImage built with the toolchain inside buildroot, selecting 2011.09
or 2012.03 gives me what appears to be a proper uImage, and u-boot
loads it, but it doesnt run. It just stops in u-boot after the message
"Uncompressing Linux... done, booting the kernel.".

I have ensured the mkimage I am using comes from /tools in u-boot. As
I recall, only 3 things are necessary to build a uImage. 1) ARCH 2)
CROSS_COMPILE & 3) mkimage.

My experience is that the linux kernel is very insensitive to
toolchains, that is, any old arm toolchain should work fine.

Am I caught up in gnu versus eabi? What other things can I check to
figure out how to move forward?

Signed, Charles "puzzled" Krinke





Working with ArmCodeSourcery (2010.09)
NAND read: device 0 offset 0x280000, size 0x400000

Skipping bad block 0x00360000

 4194304 bytes read: OK

## Booting kernel from Legacy Image at 80007fc0 ...

   Image Name:   Linux-2.6.37-svn48

   Image Type:   ARM Linux Kernel Image (uncompressed)

   Data Size:    3012112 Bytes = 2.9 MiB

   Load Address: 80008000

   Entry Point:  80008000

   Verifying Checksum ... OK

   XIP Kernel Image ... OK

OK



Starting kernel ...



Uncompressing Linux... done, booting the kernel.

[    0.000000] Linux version 2.6.37-svn48 (ckrinke at dellx) (gcc version
4.5.1 (Sourcery G++ Lite 2012

[    0.000000] CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f

[    0.000000] CPU: VIPT nonaliasing data cache, VIPT nonaliasing
instruction cache

[    0.000000] Machine: OMAP3517/AM3517 EVM

[    0.000000] Reserving 4194304 bytes SDRAM for VRAM


Not working with CodeBench (2012.03)
NAND read: device 0 offset 0x280000, size 0x400000

Skipping bad block 0x00360000

 4194304 bytes read: OK

## Booting kernel from Legacy Image at 80007fc0 ...

   Image Name:   Linux-2.6.37-svn48

   Image Type:   ARM Linux Kernel Image (uncompressed)

   Data Size:    3144060 Bytes = 3 MiB

   Load Address: 80008000

   Entry Point:  80008000

   Verifying Checksum ... OK

   XIP Kernel Image ... OK

OK



Starting kernel ...



Uncompressing Linux... done, booting the kernel.






Mkimage view of non-working (first) and working (second). They appear
similar from the mkimage viewpoint.
$ make clean && make uImage
$ mkimage -l arch/arm/boot/uImage
Image Name:   Linux-2.6.37-svn48
Created:      Thu Aug  2 08:20:50 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    3144060 Bytes = 3070.37 kB = 3.00 MB
Load Address: 80008000
Entry Point:  80008000
$ which arm-none-linux-gnueabi-gcc
/home/ckrinke/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux/bin//arm-none-linux-gnueabi-gcc
$ make clean && make
PATH=/home/ckrinke/ArmCodeSourcery/Sourcery_G++_Lite/bin:$PATH uImage
ckrinke at dellx:~/atc_nema/agc/linux-2.6.37$ mkimage -l arch/arm/boot/uImage
Image Name:   Linux-2.6.37-svn48
Created:      Thu Aug  2 08:55:56 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    3012112 Bytes = 2941.52 kB = 2.87 MB
Load Address: 80008000
Entry Point:  80008000


-- 
Charles Krinke
