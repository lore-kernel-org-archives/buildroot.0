From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 21:59:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20180605092745.26198-1-jagan@amarulasolutions.com>
References: <20180605092745.26198-1-jagan@amarulasolutions.com>
Message-ID: <20180617215956.71c3d68c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 14:57:44 +0530, Jagan Teki wrote:

> +label linux-4.17.0-rc3
> +  kernel /Image
> +  devicetree /sun50i-a64-amarula-relic.dtb
> +  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p4 rootwait

Is mmcblk1 going to be the SD card or the eMMC ?

> +image sdcard.img {

So you're producing a sdcard.img, but your readme.txt doesn't use it.

> diff --git a/board/amarula/a64-relic/post-build.sh b/board/amarula/a64-relic/post-build.sh
> new file mode 100755
> index 0000000000..ec20fca7d9
> --- /dev/null
> +++ b/board/amarula/a64-relic/post-build.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
> diff --git a/board/amarula/a64-relic/readme.txt b/board/amarula/a64-relic/readme.txt
> new file mode 100644
> index 0000000000..5d8ae65112
> --- /dev/null
> +++ b/board/amarula/a64-relic/readme.txt
> @@ -0,0 +1,77 @@
> +Amarula A64 Relic
> +================
> +
> +Amarula A64-Relic is A64 based IoT device, which support
> +- Allwinner A64 Cortex-A53
> +- Mali-400MP2 GPU
> +- AXP803 PMIC
> +- 1GB DDR3 RAM
> +- 8GB eMMC
> +- AP6330 Wifi/BLE
> +- MIPI-DSI
> +- CSI: OV5640 sensor
> +- USB OTG
> +- 12V DC power supply
> +
> +Build
> +=====
> +
> +  $ make amarula_a64_relic_defconfig
> +
> +  $ make
> +
> +build files at output/images/:
> +  - sunxi-spl.bin
> +  - u-boot.itb
> +  - Image
> +  - sun50i-a64-amarula-relic.dtb
> +  - boot.vfat
> +  - rootfs.ext4
> +  - sdcard.img
> +
> +Write eMMC
> +=========
> +
> +The board comes with an operating system preloaded on the eMMC.
> +To replace it with the Buildroot-built system, take the following
> +steps
> +
> +1. Connect the board UART with host and open minicom(ttyUSBx/115200N8)
> +
> +2. Supply 12V DC for power-on the board.
> +
> +3. Interrupt U-Boot by pressing enter
> +
> +4. Create GPT partitions
> +  => mmc dev 1
> +  => gpt write mmc 1 $partitions
> +
> +5. Connect the board USB-OTG with USB slot on the host.
> +
> +6. Initiate fastboot
> +  => fastboot 0
> +
> +7. Write images from host onto eMMC using fastboot
> +
> +  $ output/images
> +  $ fastboot -i 0x1f3a flash loader1 sunxi-spl.bin
> +  $ fastboot -i 0x1f3a flash loader2 u-boot.itb
> +  $ fastboot -i 0x1f3a flash esp boot.vfat
> +  $ fastboot -i 0x1f3a flash system rootfs.ext4

Is this going to work with the extlinux.conf provided above ? I doubt
the same extlinux.conf can work for both the SD card booting and eMMC
booting.

If you want to support both eMMC and SD card booting, that's OK, but it
should be explained in the readme.txt, and it should be clear whether
the default extlinux.conf is meant for SD card booting or eMMC booting.

> +
> +Update eMMC during Development
> +==============================
> +
> +In order to avoid image packing with specified file-system every time
> +during development, it better to alter the data in the partition by
> +mounting on host with the help of 'ums' in U-Boot.

What is "image packing with specified file-system" ? I don't understand
what you mean here. Perhaps you wanted to say:

""

During development, reflashing the entire filesystem image at every
change is time consuming. A useful alternative is to directly access
over USB the filesystem stored on the eMMC, using the USB Mass Storage
capability of U-Boot. To achieve this:

""

Last thing, since your readme.txt says to use fastboot, you should
probably enable BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT, which will
make sure fastboot is available in output/host/bin/. And so your
readme.txt should point to this fastboot.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
