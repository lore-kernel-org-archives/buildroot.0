From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 13 Nov 2017 23:06:10 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
Message-ID: <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Add MacchiatoBin board by SolidRun. This board is based on Marvell
> > Armada 8040 SoC. Board support package includes the following
> > two options: mainline and vendor BSPs.
> > 
> > Mainline BSP:
> > - Marvell ATF v1.3-armada-17.10 and its dependencies
> > - mainline U-Boot v2017.09
> > - mainline Linux kernel v4.13.11
> 
> Thanks. For the mainline kernel BSP:
> 
> Tested-by: Baruch Siach <baruch@tkos.co.il>
> 
> I'll note though that 'df' crashes here consistently:
> 
> [  962.179129] df[1346]: unhandled level 2 translation fault (11) at 0x00000a74, esr 0x92000046, in busybox[400000+a4000]
> [  962.190801] CPU: 0 PID: 1346 Comm: df Not tainted 4.13.11 #1
> [  962.197869] Hardware name: Marvell 8040 MACHIATOBin (DT)
> ...
> 
> I have not investigated it any further.

This issue is not specific to MacchiatoBin board. I observed it last week
testing images for another arm64 board - Orange Pi Zero Plus2 board.
I haven't investigated it yet.

Meanwhile this is not the only problem with mainline BSP. It turned out that
network interfaces do not work properly neither on v4.13.11 nor in fresh v4.14.
Kernel v4.13.11 doesn't enable them in DTS. Kernel v4.14 does enable them,
but I couldn't make them work: Tx looks ok, but no Rx. Meanwhile on kernel from
devel-4.14/all branch from https://github.com/MISL-EBU-System-SW/mainline-public
management 1Gb interface appears to be working fine.

I plan to bump kernel version to 4.14 and find minimal set of patches needed to
enable networking.

> > +This default configuration will allow you to start experimenting with the
> > +buildroot environment for the MacchiatoBin board based on Marvell Armada
> > +8040 SoC. Documentation for the board hardware and software
> > +is available on wiki: http://wiki.macchiatobin.net
> > +
> > +This default configuration will bring-up the board and allow
> > +access through the serial console.
> 
> Would be nice to note that the serial console is accessible at the micro-USB 
> connector marked CON9.

Ok, will do.

> > +How to write the SD card
> > +========================
> > +
> > +Once the build process is finished you will have an image
> > +called "sdcard.img" in the output/images/ directory.
> > +
> > +Copy the bootable "sdcard.img" onto an SD card with "dd":
> > +
> > +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> > +  $ sudo sync
> 
> A somewhat faster one liner:
> 
>   sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync

Ok, thanks! Will do.


> > +Insert the micro SDcard in MacchiatoBin board and power it up.
> > +The console is on the serial line, 115200 8N1.
> > +
> > +Note that MacchiatoBin board can be setup to load bootloader
> > +from different sources including eMMC, SPI flash, and SD card.
> > +Make sure to properly configure DIP switches SW1 and SW2
> > +according to information available on wiki.
> 
> Would be nice to write here the DIP switches configuration for SD card boot:
> 
> SW2: 01110
> SW1: 1xxxx

Good point. Will do.


> > +=> setenv fdt_addr 0x1000000
> > +=> setenv fdt_high 0xffffffffffffffff
> > +=> setenv fdt_name boot/armada-8040-mcbin.dtb
> > +=> setenv kernel_addr 0x2000000
> > +=> setenv image_name boot/Image
> > +=> setenv bootcmd 'mmc dev 1; ext4load mmc 1:1 $kernel_addr $image_name; ext4load mmc 1:1 $fdt_addr $fdt_name; booti $kernel_addr - $fdt_addr'
> > +=> boot
> 
> Having to type all that on the console is not nice. Unfortunately, current 
> mainline U-Boot does not make it easy to override the SPI flash stored 
> environment. But we can ease the pain somewhat. Create a uEnv.txt file, and 
> store it in /boot. The sequence above can now be shortened to:
> 
> => ext4load mmc 1:1 0x01700000 /boot/uEnv.txt
> => env import -t 0x01700000 $filesize
> => boot

Indeed, that will be easier for quick start.

Regards,
Sergey
