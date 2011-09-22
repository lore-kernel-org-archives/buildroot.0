From: bruce bushby <bruce.bushby@gmail.com>
Date: Thu, 22 Sep 2011 22:29:45 +0100
Subject: [Buildroot] Kernel config and recommended books
Message-ID: <CAHvj1qY9ZzmuTzcE0W4V4dpErO-0FT4dXphAjA2VC6AFgT3oVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I wanted to ask how I retain a kernel config ".config"?  I'm trying to
build a kernel for an OMAP3 Beagleboard .....so I run "make
menuconfig" and select the bare basic but I change my login terminal
to ttyS2 and for a "defconfig" I enter "omap2plus".

Everything compiles ok, the uImage uncompresses and starts to boot but
I don't see anything on the screen, cursor sits at the end of the word
uncompresses:


u-boot env:

OMAP3 beagleboard.org # printenv
baudrate=115200
beaglerev=xMA
bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript; then run
bootscript; else if run loaduimage; then run mmcboot; else run
nandboot; fi; fi; else run nandboot; fi
bootdelay=1
bootscript=echo Running bootscript from mmc ...; source ${loadaddr}
console=ttyS2,115200n8
defaultdisplay=dvi
dieid#=603400029ff800000163810c1402902c
dvimode=1024x768MR-16 at 60
loadaddr=0x82000000
loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr
loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage
mmcargs=setenv bootargs console=${console} mpurate=${mpurate}
vram=${vram} MEM=256M omapfb.mode=dvi:omapfb omapfb.debug=y
omapdss.def_disp=tv:ntsc root=root=/dev/ram0 rw
rootfstype=${mmcrootfsty}
mmcboot=echo Booting from mmc ...; run mmcargs; bootm ${loadaddr}
mmcdev=0
mmcroot=/dev/mmcblk0p2 rw
mmcrootfstype=ext3 rootwait
mpurate=1000
nandargs=setenv bootargs console=${console} mpurate=${mpurate}
vram=${vram} omapfb.mode=dvi:${dvimode} omapfb.debug=y
omapdss.def_disp=${defaultdisplay} root=${nandroot}
rootfstype=${nandrootfst}
nandboot=echo Booting from nand ...; run nandargs; nand read
${loadaddr} 280000 400000; bootm ${loadaddr}
nandroot=/dev/mtdblock4 rw
nandrootfstype=jffs2
usbtty=cdc_acm
vram=12M






Boot sequence:

OMAP3 beagleboard.org # 60?H?H?U?
??
?Instruments X-Loader 1.4.4ss
(May 19 2011 - 08:26:18)
Beagle xM Rev A
Reading boot sector
Loading u-boot.bin from mmc


U-Boot 2010.12 (Jun 01 2011 - 10:37:16)

OMAP3630/3730-GP ES2.1, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  512 MiB
NAND:  512 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Beagle xM Rev A
Beagle GPIO 136 00
Beagle GPIO 137 00
Beagle GPIO 138 00
Beagle GPIO 127 00
Die ID #603400029ff800000163810c1402902c
Hit any key to stop autoboot:  0
reading boot.scr

414 bytes read
Running bootscript from mmc ...
## Executing script at 82000000
reading uImage

3205900 bytes read
***** Kernel: /dev/mmcblk0p1/uImage *****
***** RootFS: /dev/mmcblk0p2 *****
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-3.0.4
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3205836 Bytes = 3.1 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.








So my question relates to the kernel ".config" .... before running
make I don't have a kernel ".config" ... after running make I have:
./output/build/linux-3.0.4/.config

and I think it's this file I need to change:

[root at dlxarm01 buildroot-2011.08]# grep tty ./output/build/linux-3.0.4/.config
CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
[root at dlxarm01 buildroot-2011.08]#

that should be ttyS2....from what I've read on the net. So I take a
copy of this file and I run a "make clean" .....but I can't put it
back because the directory "./output/build/linux-3.0.4/"  no longer
exists.



What would be the correct way/method to maintain my kernel ".config"
within the buildlroot environment?

and lastly, what is considered the "defacto" book with regards to
embedded linux kernels?

I've previously struggled with trying to get a kernel running on a
Telit GE863-PRO module so I have an idea about the complexities
surrounding flash initialization and "board support" I doubt I'll ever
manage my own but I would like to start  understanding more rather
then trail and error?




Thanks
Bruce






I then run a find ".config" and
