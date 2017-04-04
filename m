From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:13:32 +0200
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
In-Reply-To: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
References: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
Message-ID: <20170404221332.342b1fd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 17:18:18 +0530, Abhimanyu Vishwakarma wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> 
> Add post-image script to generate sdcard.img for
> preparing sdcard/usb device.
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>

Thanks for this new version. It looks a lot better, but unfortunately,
there are still a few things that are not good. Mainly because you're
trying to make things too complicated. See below.

> diff --git a/board/ci40/post-build.sh b/board/ci40/post-build.sh
> new file mode 100755
> index 0000000..0cd06b7
> --- /dev/null
> +++ b/board/ci40/post-build.sh
> @@ -0,0 +1,6 @@
> +#!/bin/bash
> +
> +FITIMAGE=$BINARIES_DIR/vmlinux.gz.itb
> +
> +# Copy to target
> +cp -a $FITIMAGE $TARGET_DIR/fitImage

Just:

cp ${BINARIES_DIR}/vmlinux.gz.itb ${TARGET_DIR}/fitImage

> diff --git a/board/ci40/post-image.sh b/board/ci40/post-image.sh
> new file mode 100755
> index 0000000..18e76aa
> --- /dev/null
> +++ b/board/ci40/post-image.sh
> @@ -0,0 +1,15 @@
> +#!/usr/bin/env bash
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage \
> +  --rootpath "${TARGET_DIR}" \
> +  --tmppath "${GENIMAGE_TMP}" \
> +  --inputpath "${BINARIES_DIR}" \
> +  --outputpath "${BINARIES_DIR}" \
> +  --config "${GENIMAGE_CFG}"

Please use support/scripts/genimage.sh.

> diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt
> new file mode 100644
> index 0000000..2fde2b8
> --- /dev/null
> +++ b/board/ci40/readme.txt
> @@ -0,0 +1,70 @@
> +*********************
> +* MIPS Creator CI40 *
> +*********************
> +
> +The 'ci40_defconfig' will create a root filesystem and a fitImage
> +under the 'output/images/' directory. This document explains how
> +to use them in order to run Buildroot in the MIPS Creator CI40 board.

I think this introduction is not really useful. What about instead:

This document details how to build and run a Buildroot system on the
MIPS Creator CI40 platform. For more details about the CI40, see
https://creatordev.io/ci40-iot-hub.html.

How to build
------------

 $ make ci40_defconfig
 $ make

> +Prepare USB/MMC for boot
> +------------------------
> +It can be done 2 ways:
> +
> +1. Using "sdcard.img" file created in output/images folder
> +
> +Use following command to write image to bootable device
> +
> +# dd if=./output/images/sdcard.img of=/dev/<your-microsd-or-usb-device>

Document only this method. We don't care about the next method since
you're now generating a complete SD card/USB image.

> +Booting from USB/MMC
> +--------------------

Please add an empty line after each title.

> +The boot loader is already present in NOR flash. To boot your newly generated
> +Linux and root filesystem, you need to interrupt U-Boot autoboot. Current U-Boot
> +is configured with 2 seconds of boot-delay, after expiry of this boot-delay
> +timeout U-Boot start booting default image. To interrupt autoboot, press any

start -> starts

"booting default image" -> "booting the default image"

> +key before the boot-delay time expires, U-Boot will stops the autoboot process

stops -> stop

> +and gives a U-Boot prompt. You can now boot to your preferred boot method as

gives -> give

> +describe below:
> +
> +From USB
> +  pistachio # run usbboot
> +
> +From SD-Card
> +  pistachio # run mmcboot
> +
> +Booting from network (nfsboot)
> +------------------------------

Remove this section, we don't document network booting in readme.txt
files in general.

> +Prepare nfs root (See Buildroot manual) and extract rootfs.tar file into it.
> +
> +  pistachio # setenv serverip <server-ip-address>
> +  pistachio # setenv rootpath <nfs root path>
> +  pistachio # run netboot
> +
> +Persistent boot command
> +-----------------------
> +To boot automatically to your preferred boot method, use following command to
> +make it persistent, for example to automatically boot to usb:
> +
> +  pistachio # setenv bootcmd run usbboot
> +  pistachio # saveenv
> +
> +Flash new bootloader
> +--------------------
> +After booting with above method. Copy file u-boot-pistachio_marduk-2015.10-v1.0.4.img
> +to /tmp.

Where is the u-boot-pistachio_marduk-2015.10-v1.0.4.img file? Why do
you need to copy it specifically to /tmp?

> Use following command to flash new bootloader:
> +
> +# flashcp -v /tmp/u-boot-pistachio_marduk-2015.10-v1.0.4.img /dev/mtd0
> +
> +Online docs
> +-----------
> +Mostly for OpenWRT but it is applicable to Buildroot
> +https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
> +
> +Prebuilt uboot
> +--------------
> +http://downloads.creatordev.io/?q=u-boot/

Why would we document how to get a pre-built U-Boot if Buildroot is
already building a working U-Boot ?

The rest looks good to me. Could you rework those last small details,
and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
