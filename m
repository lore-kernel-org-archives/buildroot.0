From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 11:14:01 +0100
Subject: [Buildroot] [PATCH 3/3] cubieboard: add support
In-Reply-To: <1363289498-20993-3-git-send-email-carlo.caione@gmail.com>
References: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
 <1363289498-20993-3-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130324111401.63662412@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Thu, 14 Mar 2013 20:31:38 +0100, Carlo Caione wrote:
> patch adding:
> 	- defconfig file
> 	- post-build script
> 	- script to generate bootable sd-card
> 
> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
> 
> v1 -> v2:
> 	- Generation of script.bin now moved from post-build script to a new
> 	  package
> 	- mkcubiecard.sh: small modifications
> 	- new packages in defconfig

Changelog must go...

> ---

... here, i.e below the "---". If you put the changelog before the
"---", then it gets committed as part of the project's git history.

>  board/sunxi/cubieboard/boot.cmd       |   4 ++
>  board/sunxi/cubieboard/mkcubiecard.sh | 119 ++++++++++++++++++++++++++++++++++
>  board/sunxi/cubieboard/post-build.sh  |  19 ++++++

Maybe this should be board/cubietech/cubieboard/, since we generally
use board/<manufacturer>/<boardname>/. But that's not really a strong
suggestion.

> diff --git a/board/sunxi/cubieboard/mkcubiecard.sh b/board/sunxi/cubieboard/mkcubiecard.sh
> new file mode 100755
> index 0000000..bed8002
> --- /dev/null
> +++ b/board/sunxi/cubieboard/mkcubiecard.sh
> @@ -0,0 +1,119 @@
> +#! /bin/sh
> +# mkCubieCard.sh v0.1:
> +# 2013, Carlo Caione <carlo.caione@gmail.com>
> +# heavely based on :
> +# mkA10card.sh v0.1
> +# 2012, Jason Plum <jplum@archlinuxarm.org>
> +# loosely based on :
> +# mkcard.sh v0.5
> +# (c) Copyright 2009 Graeme Gregory <dp@xora.org.uk>
> +# Licensed under terms of GPLv2
> +#
> +# Parts of the procudure base on the work of Denys Dmytriyenko
> +# http://wiki.omap.com/index.php/MMC_Boot_Format

It would be good to have a board/cubietech/cubieboard/readme.txt that
explains how to use this script. Look at other readme.txt files in
board/, they generally try to give a very quick howto on how to use a
given defconfig for a board, and generate something bootable on the
board.

I believe this script may possibly be useful for other A10/A13 boards,
but we'll see how it turns out when other A10/A13 boards are supported
in Buildroot. For now, adding the script in a cubieboard-specific
location is fine.

> diff --git a/board/sunxi/cubieboard/post-build.sh b/board/sunxi/cubieboard/post-build.sh
> new file mode 100755
> index 0000000..1f560e0
> --- /dev/null
> +++ b/board/sunxi/cubieboard/post-build.sh
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +# post-build.sh for CubieBoard
> +# 2013, Carlo Caione <carlo.caione@gmail.com>
> +
> +TARGET_DIR=$1
> +IMAGES_DIR=$1/../images
> +BOARD_DIR="$(dirname $0)"
> +HOST_DIR=$1/../host/usr/bin

Unfortunately, this is not really true. If the user sets BR2_HOST_DIR,
then it may not be located at a place that can be guessed relatively to
$TARGET_DIR.

Instead, HOST_DIR and BINARIES_DIR (which you name IMAGES_DIR) are
exported in the environment. You should use these instead.

> +
> +MKIMAGE=$HOST_DIR/mkimage
> +BOOT_CMD=$BOARD_DIR/boot.cmd
> +BOOT_CMD_H=$IMAGES_DIR/boot.scr
> +
> +# U-Boot script
> +if [ -e $MKIMAGE -a -e $BOOT_CMD ];
> +then
> +	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
> +fi
> +
> diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
> new file mode 100644
> index 0000000..1e0bfb8
> --- /dev/null
> +++ b/configs/cubieboard_defconfig
> @@ -0,0 +1,47 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a8=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sunxi/cubieboard/post-build.sh"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_SUNXI_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD=y
> +BR2_PACKAGE_SUNXI_BOARDS_FILE="cubieboard"
> +
> +# Kernel Header Options
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.4.29"
> +BR2_DEFAULT_KERNEL_HEADERS="3.4.29"

Those three lines should just be:

BR2_KERNEL_HEADERS_3_4=y

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="66025966cbe563e356b5e1dda0a572e738e13c42"
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
> +
> +# Misc
> +BR2_JLEVEL=0
> +BR2_CCACHE=y
> +BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache"

Those four lines should be removed. They are not related to Cubieboard
specifically.

> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_VERSION="sunxi"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="7aa9f04f571247a6bb999c168b49e09f05b86465"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
