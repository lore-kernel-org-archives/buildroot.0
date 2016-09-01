From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 08:30:51 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for TS-4900
In-Reply-To: <1472691530-17643-3-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1472691530-17643-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1472691530-17643-3-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <e2b6dab3-68c7-8340-65c0-c1d3741404aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Mathieu,

On 01-09-16 02:58, Mathieu Audat wrote:
> The TS-4900 uses a custom Linux 4.X from Technologic Systems:
> https://github.com/embeddedarm/linux-3.10.17-imx6/tree/imx_4.1.15_1.0.0_ga
> Indeed, it is not supported by mainline Linux but this work is ongoing.
> 
> This patch is inspired by a previous work for the TS-4800.
> A post image script is provided to generate an image that can be
> directly written to an SD card. It also adds an fpga wifi module
                                                                  ^.

> 
> Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
> ---
>  board/technologic/ts4900/genimage.cfg  | 10 ++++++++
>  board/technologic/ts4900/post-image.sh | 20 +++++++++++++++
>  board/technologic/ts4900/readme.txt    | 45 ++++++++++++++++++++++++++++++++++
>  configs/ts4900_defconfig               | 21 ++++++++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 board/technologic/ts4900/genimage.cfg
>  create mode 100755 board/technologic/ts4900/post-image.sh
>  create mode 100644 board/technologic/ts4900/readme.txt
>  create mode 100644 configs/ts4900_defconfig
> 
> diff --git a/board/technologic/ts4900/genimage.cfg b/board/technologic/ts4900/genimage.cfg
> new file mode 100644
> index 0000000..7e580eb
> --- /dev/null
> +++ b/board/technologic/ts4900/genimage.cfg
> @@ -0,0 +1,10 @@
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		size = 256M
> +	}
> +}
> diff --git a/board/technologic/ts4900/post-image.sh b/board/technologic/ts4900/post-image.sh
> new file mode 100755
> index 0000000..3ce6bc1
> --- /dev/null
> +++ b/board/technologic/ts4900/post-image.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +#
> +# Copyright (C) 2015-2016 Savoir-Faire Linux
> +# Post image generation script.
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG=$BOARD_DIR/genimage.cfg
> +GENIMAGE_TMP=$BUILD_DIR/.genimage_tmp
> +
> +rm -rf $GENIMAGE_TMP
> +
> +${HOST_DIR}/usr/bin/genimage \
> +        --config ${GENIMAGE_CFG} \
> +        --rootpath $TARGET_DIR \
> +        --tmppath $GENIMAGE_TMP \
> +        --inputpath $BINARIES_DIR \
> +        --outputpath $BINARIES_DIR
> +
> +exit $?
> +
> diff --git a/board/technologic/ts4900/readme.txt b/board/technologic/ts4900/readme.txt
> new file mode 100644
> index 0000000..8498574
> --- /dev/null
> +++ b/board/technologic/ts4900/readme.txt
> @@ -0,0 +1,45 @@
> +Technologic Systems TS-4900
> +===========================
> +
> +This document explains how to set up a basic Buildroot system for the
> +Technologic Systems TS-4900 System on Module.
> +
> +The TS-4900 is a TS-SOCKET macrocontroller board based on the
> +Freescale i.MX6 Single or Quad Core ARM Cortex-A9 CPU clocked at
> +1GHz. The TS-4900 features Gigabit Ethernet, SATA II Port, PCI Express
> +Bus, high speed USB host and device (OTG), and microSD card.
> +More details on the board here:
> +   http://wiki.embeddedarm.com/wiki/TS-4900
> +
> +The TS-4900 is not currently supported by mainline Linux, so a
> +Technologic Systems Linux is used based on Linux 4.x.
                                                    4.1.

> +The default U-boot configuration flashed scans the SD card to find the
> +0x83 partition type, corresponding to the rootfs. Then it will load
> +both uImage and dts from the /boot directory.
> +To build the default configuration you only have to:
> +
> +   $ make ts4900_defconfig
> +   $ make
> +
> +The output looks like:
> +output/images/
> +??? imx6q-ts4900.dtb
> +??? rootfs.ext2
> +??? rootfs.tar
> +??? sdcard.img
> +??? uImage
> +
> +Since both the uImage and the dts are contained in the /boot
> +directory, the provided post-image script generates an image file
> +containing only 1 partition for the rootfs:
> +   $ fdisk output/images/sdcard.img
> +                      Device Boot Start    End Blocks Id  System
> +output/images/sdcard.img1               1      524288      262144   83  Linux
> +
> +This image can be directly written to an SD card.
> +
> +   $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
> +
> +In order to test the image on TS-4900 board, a TS baseboard, such as
> +the TS-9xxx the serie, is needed to provide power, console header,
               ^^^^^^^^^series

> +RJ45 connector etc.


 I was going to say that I'd also like the bootloader to be included in the
defconfig, even if it wouldn't be flashed. However, there are different U-Boot
configs depending on the exact board type, so we'd need different Buildroot
defconfigs as well... So instead, let's add a paragraph to the readme:

The bootloader comes pre-flashed on the board on an SPI flash. Since updating
the bootloader is risky and not trivial, it is not included in the Buildroot
defconfig. Refer to http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details
on which U-Boot config to use and how to flash it.


> diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
> new file mode 100644
> index 0000000..e0fc095
> --- /dev/null
> +++ b/configs/ts4900_defconfig
> @@ -0,0 +1,21 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.1.15"

 Nowadays we typically use BR2_KERNEL_HEADERS_AS_KERNEL instead.

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="$(TOPDIR)/board/technologic/ts4900/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.10.17-imx6.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="70d1e85a22879e27cc9e36384438d5a9793e44b0"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_PACKAGE_TS4900-FPGA=y

 Kind of weird ordering here :-)

> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"

 Unfortunately, yes, they still need uImage...

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-ts4900"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

 Your genimage script only creates a partition table, not a FAT filesystem, so
dosfstools and mtools are not needed.

 Regards,
 Arnout

> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
