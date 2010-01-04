From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 4 Jan 2010 19:29:35 +0000 (UTC)
Subject: [Buildroot] at91sam9g20dfc_defconfig doesn't build
Message-ID: <hhtfiv$rdm$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building from git HEAD fails using at91sam9g20dfc_defconfig. It
looks like libgcc is using hardware floating point when it
should be using soft floating point.  Here's the tail end of
the failed build output:

   [...]
   make[2]: Entering directory `/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/board/atmel/at91sam9260ek'
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -DTEXT_BASE=0x23f00000 -I/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/include -fno-builtin -ffreestanding -nostdinc -isystem /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5te  -Wall -Wstrict-prototypes -fno-stack-protector   -o at91sam9260ek.o at91sam9260ek.c -c
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -DTEXT_BASE=0x23f00000 -I/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/include -fno-builtin -ffreestanding -nostdinc -isystem /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5te  -Wall -Wstrict-prototypes -fno-stack-protector   -o led.o led.c -c
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -DTEXT_BASE=0x23f00000 -I/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/include -fno-builtin -ffreestanding -nostdinc -isystem /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5te  -Wall -Wstrict-prototypes -fno-stack-protector   -o partition.o partition.c -c
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ar crv libat91sam9260ek.a at91sam9260ek.o led.o partition.o 
   a - at91sam9260ek.o
   a - led.o
   a - partition.o
   make[2]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/board/atmel/at91sam9260ek'
   UNDEF_SYM=`/home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-objdump -x board/atmel/at91sam9260ek/libat91sam9260ek.a lib_generic/libgeneric.a lib_generic/lzma/liblzma.a lib_generic/lzo/liblzo.a cpu/arm926ejs/libarm926ejs.a cpu/arm926ejs/at91/libat91.a lib_arm/libarm.a fs/cramfs/libcramfs.a fs/fat/libfat.a fs/fdos/libfdos.a fs/jffs2/libjffs2.a fs/reiserfs/libreiserfs.a fs/ext2/libext2fs.a fs/yaffs2/libyaffs2.a fs/ubifs/libubifs.a net/libnet.a disk/libdisk.a drivers/bios_emulator/libatibiosemu.a drivers/block/libblock.a drivers/dma/libdma.a drivers/fpga/libfpga.a drivers/gpio/libgpio.a drivers/hwmon/libhwmon.a drivers/i2c/libi2c.a drivers/input/libinput.a drivers/misc/libmisc.a drivers/mmc/libmmc.a drivers/mtd/libmtd.a drivers/mtd/nand/libnand.a drivers/mtd/onenand/libonenand.a drivers/mtd/ubi/libubi.a drivers/mtd/spi/libspi_flash.a drivers/net/libnet.a drivers/net/phy/libphy.a drivers/net/sk98lin/libsk98lin.a drivers/pci/libpci.a drivers/pcmcia/libpc
 mcia.a drivers/power/libpower.a drivers/spi/libspi.a drivers/rtc/librtc.a drivers/serial/libserial.a drivers/twserial/libtws.a drivers/usb/gadget/libusb_gadget.a drivers/usb/host/libusb_host.a drivers/usb/musb/libusb_musb.a drivers/video/libvideo.a drivers/watchdog/libwatchdog.a common/libcommon.a libfdt/libfdt.a api/libapi.a post/libpost.a | sed  -n -e 's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`; cd /home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11 && /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld -L/home/nextgen/buildroot/buildroot/output/staging/lib -L/home/nextgen/buildroot/buildroot/output/staging/usr/lib --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -Bstatic -T u-boot.lds  -Ttext 0x23f00000 $UNDEF_SYM cpu/arm926ejs/start.o --start-group lib_generic/libgeneric.a lib_generic/lzma/liblzma.a lib_generic/lzo/liblzo.a cpu/arm926ejs/libarm926ejs.a cpu/arm926ejs/at91/libat91.a lib_arm/libarm.a fs/cramfs/libcramfs.a fs/fat
 /libfat.a fs/fdos/libfdos.a fs/jffs2/libjffs2.a fs/reiserfs/libreiserfs.a fs/ext2/libext2fs.a fs/yaffs2/libyaffs2.a fs/ubifs/libubifs.a net/libnet.a disk/libdisk.a drivers/bios_emulator/libatibiosemu.a drivers/block/libblock.a drivers/dma/libdma.a drivers/fpga/libfpga.a drivers/gpio/libgpio.a drivers/hwmon/libhwmon.a drivers/i2c/libi2c.a drivers/input/libinput.a drivers/misc/libmisc.a drivers/mmc/libmmc.a drivers/mtd/libmtd.a drivers/mtd/nand/libnand.a drivers/mtd/onenand/libonenand.a drivers/mtd/ubi/libubi.a drivers/mtd/spi/libspi_flash.a drivers/net/libnet.a drivers/net/phy/libphy.a drivers/net/sk98lin/libsk98lin.a drivers/pci/libpci.a drivers/pcmcia/libpcmcia.a drivers/power/libpower.a drivers/spi/libspi.a drivers/rtc/librtc.a drivers/serial/libserial.a drivers/twserial/libtws.a drivers/usb/gadget/libusb_gadget.a drivers/usb/host/libusb_host.a drivers/usb/musb/libusb_musb.a drivers/video/libvideo.a drivers/watchdog/libwatchdog.a common/libcommon.a libfdt/libfdt.a api/liba
 pi.a post/libpost.a board/atmel/at91sam9260ek/libat91sam9260ek.a --end-group /home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/lib_arm/eabi_compat.o -L /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4 -lgcc -Map u-boot.map -o u-boot
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_udivsi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_udivsi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_divsi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_divsi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_umodsi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_umodsi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_modsi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_modsi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_dvmd_lnx.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_dvmd_lnx.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_lshrdi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_lshrdi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_ashldi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_ashldi3.o)
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: error: /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_ashrdi3.o) uses hardware FP, whereas u-boot uses software FP
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-ld: failed to merge target specific data of file /home/nextgen/buildroot/buildroot/output/staging/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.4/libgcc.a(_ashrdi3.o)
   make[1]: *** [u-boot] Error 1
   make[1]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11'
   make: *** [/home/nextgen/buildroot/buildroot/output/build/u-boot-2009.11/u-boot.bin] Error 2

Is this something that needs to be fixed in the toolchain
configuration, in u-boot's configuration, or both?
   

-- 
Grant Edwards                   grante             Yow! I'm wearing PAMPERS!!
                                  at               
                               visi.com            
