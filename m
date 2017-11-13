From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 14:27:02 +0200
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171112201646.15558-5-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
Message-ID: <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sun, Nov 12, 2017 at 11:16:45PM +0300, Sergey Matyukevich wrote:
> Add MacchiatoBin board by SolidRun. This board is based on Marvell
> Armada 8040 SoC. Board support package includes the following
> two options: mainline and vendor BSPs.
> 
> Mainline BSP:
> - Marvell ATF v1.3-armada-17.10 and its dependencies
> - mainline U-Boot v2017.09
> - mainline Linux kernel v4.13.11

Thanks. For the mainline kernel BSP:

Tested-by: Baruch Siach <baruch@tkos.co.il>

I'll note though that 'df' crashes here consistently:

[  962.179129] df[1346]: unhandled level 2 translation fault (11) at 0x00000a74, esr 0x92000046, in busybox[400000+a4000]
[  962.190801] CPU: 0 PID: 1346 Comm: df Not tainted 4.13.11 #1
[  962.197869] Hardware name: Marvell 8040 MACHIATOBin (DT)
...

I have not investigated it any further.

A few more comments below.

> Marvell BSP with more hardware support enabled:
> - Marvell ATF v1.3-armada-17.10 and its dependencies
> - vendor U-Boot based on v2017.03
> - Marvell Linux kernel based v4.4.52
> 
> More details about this board are available on wiki:
> - http://wiki.macchiatobin.net
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  board/solidrun/macchiatobin/genimage.cfg         | 16 ++++++
>  board/solidrun/macchiatobin/readme.txt           | 70 ++++++++++++++++++++++++
>  configs/solidrun_macchiatobin_mainline_defconfig | 46 ++++++++++++++++
>  configs/solidrun_macchiatobin_marvell_defconfig  | 48 ++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 board/solidrun/macchiatobin/genimage.cfg
>  create mode 100644 board/solidrun/macchiatobin/readme.txt
>  create mode 100644 configs/solidrun_macchiatobin_mainline_defconfig
>  create mode 100644 configs/solidrun_macchiatobin_marvell_defconfig
> 
> diff --git a/board/solidrun/macchiatobin/genimage.cfg b/board/solidrun/macchiatobin/genimage.cfg
> new file mode 100644
> index 0000000000..fdcda368a2
> --- /dev/null
> +++ b/board/solidrun/macchiatobin/genimage.cfg
> @@ -0,0 +1,16 @@
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition uboot {
> +		in-partition-table = "no"
> +		image = "flash-image.bin"
> +		offset = 0x200000
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		offset = 0x2200000
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
> new file mode 100644
> index 0000000000..7bab5aca3c
> --- /dev/null
> +++ b/board/solidrun/macchiatobin/readme.txt
> @@ -0,0 +1,70 @@
> +Intro
> +=====
> +
> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the MacchiatoBin board based on Marvell Armada
> +8040 SoC. Documentation for the board hardware and software
> +is available on wiki: http://wiki.macchiatobin.net
> +
> +This default configuration will bring-up the board and allow
> +access through the serial console.

Would be nice to note that the serial console is accessible at the micro-USB 
connector marked CON9.

> +
> +How to build
> +============
> +
> +There are two build options. The first option is mainline BSP:
> + - Linux v4.13.11
> + - U-Boot v2017.09
> +
> +The second option is vendor BSP which enables more hardware.
> +Marvell BSP is based on the following Linux and U-Boot versions:
> + - Linux v4.4.52
> + - U-Boot v2017.03
> +Sources are available on Marvell GitHub page:
> +   https://github.com/MarvellEmbeddedProcessors
> +
> +To use mainline BSP run the following commands:
> +    $ make solidrun_macchiatobin_mainline_defconfig
> +    $ make
> +
> +To use vendor BSP run the following commands:
> +    $ make solidrun_macchiatobin_marvell_defconfig
> +    $ make
> +
> +Note: you will need access to the internet to download
> +all the required sources.
> +
> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image
> +called "sdcard.img" in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +  $ sudo sync

A somewhat faster one liner:

  sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync

> +Insert the micro SDcard in MacchiatoBin board and power it up.
> +The console is on the serial line, 115200 8N1.
> +
> +Note that MacchiatoBin board can be setup to load bootloader
> +from different sources including eMMC, SPI flash, and SD card.
> +Make sure to properly configure DIP switches SW1 and SW2
> +according to information available on wiki.

Would be nice to write here the DIP switches configuration for SD card boot:

SW2: 01110
SW1: 1xxxx

> +By default U-Boot will use environment from SPI flash. If SPI flash
> +is empty or it keeps legacy environment which is incompatible with
> +up-to-date mainline U-Boot and kernel, then the following
> +commands can be used to boot the board:
> +
> +=> env default -f -a
> +=> setenv bootargs console=ttyS0,115200 root=/dev/mmcblk1p1 rw rootwait
> +=> setenv bootdelay 2

This doesn't make much sense, since the user is now at the serial console 
already.

> +=> setenv fdt_addr 0x1000000
> +=> setenv fdt_high 0xffffffffffffffff
> +=> setenv fdt_name boot/armada-8040-mcbin.dtb
> +=> setenv kernel_addr 0x2000000
> +=> setenv image_name boot/Image
> +=> setenv bootcmd 'mmc dev 1; ext4load mmc 1:1 $kernel_addr $image_name; ext4load mmc 1:1 $fdt_addr $fdt_name; booti $kernel_addr - $fdt_addr'
> +=> boot

Having to type all that on the console is not nice. Unfortunately, current 
mainline U-Boot does not make it easy to override the SPI flash stored 
environment. But we can ease the pain somewhat. Create a uEnv.txt file, and 
store it in /boot. The sequence above can now be shortened to:

=> ext4load mmc 1:1 0x01700000 /boot/uEnv.txt
=> env import -t 0x01700000 $filesize
=> boot

The uEnv.txt file that I tested is attached.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
bootargs=console=ttyS0,115200 root=/dev/mmcblk1p1 rw rootwait
fdt_addr=0x1000000
fdt_high=0xffffffffffffffff
fdt_name=boot/armada-8040-mcbin.dtb
kernel_addr=0x2000000
image_name=boot/Image
bootcmd=mmc dev 1; ext4load mmc 1:1 $kernel_addr $image_name; ext4load mmc 1:1 $fdt_addr $fdt_name; booti $kernel_addr - $fdt_addr
