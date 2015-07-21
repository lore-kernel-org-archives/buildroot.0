From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:38:49 +0200
Subject: [Buildroot] [PATCH 3/4] cubieboard: update build support for
 cubieboard 1/2/3.
In-Reply-To: <1437443362-8025-3-git-send-email-fancp2007@gmail.com>
References: <1437443362-8025-3-git-send-email-fancp2007@gmail.com>
Message-ID: <20150721233849.001ac032@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Tue, 21 Jul 2015 09:49:21 +0800, Scott Fan wrote:
> This patch update the cb1/cb2's defconfig to mainline u-boot version,
> and bump their linux-sunxi kernel to latest stage/sunxi-3.4 branch.
> 
> Additionally, add defconfig for cubieboard3 (a.k.a. cubietruck).
> 
> Finally, support set up the SD card only to boot from network.

Why? This is clearly not what we want as the default. What we want as
the default is that the system is entirely contained on the SD card.



> diff --git a/board/cubietech/cubieboard/mkcubiecard.sh b/board/cubietech/cubieboard/mkcubiecard.sh
> index f1d5a9f..a5bd8ec 100755
> --- a/board/cubietech/cubieboard/mkcubiecard.sh
> +++ b/board/cubietech/cubieboard/mkcubiecard.sh
> @@ -1,4 +1,9 @@
> -#! /bin/sh
> +#!/bin/sh
> +### BEGIN INTRO
> +# mkcubiecard.sh v0.2:
> +# 2015, Scott Fan <fancp2007@gmail.com>
> +# rewrite this script more clear;
> +# add the 'netboot' argument, to make a network-bootable card.

Ah, so netboot is in fact optional? Please don't make the script more
complicated. Our defconfigs are meant to be minimal and not offer
myriads of options. So can you please remove this "netboot" feature
from the script as well as the corresponding boot.env file?


> +####################
> +# Preparing
> +####################
> +echo `fdisk -l $DRIVE | grep Disk | grep bytes`

left-over debug print?


> diff --git a/board/cubietech/cubieboard/post-image.sh b/board/cubietech/cubieboard/post-image.sh
> new file mode 100755
> index 0000000..4d792a4
> --- /dev/null
> +++ b/board/cubietech/cubieboard/post-image.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# post-image.sh for CubieBoard
> +# 2015, Scott Fan <fancp2007@gmail.com>
> +# 2013, Carlo Caione <carlo.caione@gmail.com>
> +
> +BOARD_DIR="$(dirname $0)"
> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
> +BOOT_CMD=$BOARD_DIR/boot.cmd
> +BOOT_CMD_H=$BINARIES_DIR/boot.scr
> +
> +MKENVIMAGE=$HOST_DIR/usr/bin/mkenvimage
> +BOOT_ENV_SIZE=0x20000
> +BOOT_ENV_SRC=$BOARD_DIR/boot.env
> +BOOT_ENV_BIN=$BINARIES_DIR/u-boot-env.bin
> +
> +# U-Boot script
> +if [ -e $MKIMAGE -a -e $BOOT_CMD ];
> +then
> +	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
> +fi
> +
> +# U-Boot environment
> +if [ -e $MKENVIMAGE -a -e $BOOT_ENV_SRC ];
> +then
> +	$MKENVIMAGE -s $BOOT_ENV_SIZE -o $BOOT_ENV_BIN $BOOT_ENV_SRC
> +fi

Creating the binary environment can be done by Buildroot itself, use
the BR2_TARGET_UBOOT_ENVIMAGE option.



> @@ -31,10 +36,10 @@ After building, you should obtain this tree:
>      +-- rootfs.tar
>      +-- boot.scr
>      +-- script.bin
> -    +-- sunxi-spl.bin
>      +-- u-boot.bin
> -    +-- u-boot-sunxi-with-spl.bin (optional)
> -    `-- uImage
> +    +-- u-boot-env.bin
> +    +-- u-boot-sunxi-with-spl.bin
> +    +-- uImage

So now you always have u-boot-sunxi-with-spl.bin and never
sunxi-spl.bin ? If that's the case, why do you keep the logic testing
if SPL_IMG exists, and if yes use it, if not fall back to SPL_UBOOT ?

>  --------------------------
>  How setting up the SD card
> @@ -54,9 +59,21 @@ Use dmesg to find out where the SD card is attached in the /dev tree
>  where:
>   - <images_dir> is the directory containing the generated files (usually
>     output/images)
> - - <device> is the device file of the SD card (usually /dev/sdX)
> + - <device> is the device file of the SD card (usually /dev/mmcblk0 or /dev/sdX)

mmcblkX

> diff --git a/board/cubietech/cubieboard/sun4i-cubieboard.config b/board/cubietech/cubieboard/sun4i-cubieboard.config
> new file mode 100644
> index 0000000..43eee73
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun4i-cubieboard.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_EMAC=y
> diff --git a/board/cubietech/cubieboard/sun7i-cubieboard2.config b/board/cubietech/cubieboard/sun7i-cubieboard2.config
> new file mode 100644
> index 0000000..43eee73
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun7i-cubieboard2.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_EMAC=y
> diff --git a/board/cubietech/cubieboard/sun7i-cubietruck.config b/board/cubietech/cubieboard/sun7i-cubietruck.config
> new file mode 100644
> index 0000000..ff7813f
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun7i-cubietruck.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_GMAC=y

This is great: I like the usage of config fragments!

> diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
> index f85760d..41d5266 100644
> --- a/configs/cubieboard2_defconfig
> +++ b/configs/cubieboard2_defconfig
> @@ -1,40 +1,21 @@
> -# Architecture

It would have been good to keep the comments and the general
organization/ordering of the defconfig.

>  BR2_arm=y
>  BR2_cortex_a7=y
> -
> -# System configuration
> +BR2_KERNEL_HEADERS_3_4=y
>  BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
> -BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-build.sh"
> -
> -# Additional tools
> -BR2_PACKAGE_HOST_SUNXI_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_SUNXI_TOOLS=y
> -BR2_PACKAGE_SUNXI_BOARDS=y
> -BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/cubieboard2.fex"
> -
> -# Kernel headers
> -BR2_KERNEL_HEADERS_3_4=y
> -
> -# Kernel
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dda5145c877335e17bd9ca48954841acc0f785a"
> -BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/cubietech/cubieboard/linux-cubieboard2.config"
> -
> -# Bootloaders
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun7i-cubieboard2.config"
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/cubieboard2.fex"
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="cubieboard2"
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_VERSION="sunxi"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
> -BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_BOARDNAME="Cubieboard2"
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
> index 1da019f..85dc794 100644
> --- a/configs/cubieboard_defconfig
> +++ b/configs/cubieboard_defconfig
> @@ -1,39 +1,21 @@
> -# Architecture
>  BR2_arm=y
>  BR2_cortex_a8=y
> -
> -# System configuration
> +BR2_KERNEL_HEADERS_3_4=y
>  BR2_TARGET_GENERIC_HOSTNAME="Cubieboard"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
> -BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-build.sh"
> -
> -# Additional tools
> -BR2_PACKAGE_HOST_SUNXI_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_SUNXI_TOOLS=y
> -BR2_PACKAGE_SUNXI_BOARDS=y
> -BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/cubieboard.fex"
> -
> -# Kernel headers
> -BR2_KERNEL_HEADERS_3_4=y
> -
> -# Kernel
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
> -BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
>  BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
> -
> -# Bootloaders
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun4i-cubieboard.config"
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/cubieboard.fex"
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_VERSION="sunxi"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1a8ac55429f7f8cc9f100c1cf2dc0195cf81e76f"
> -BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_BOARDNAME="Cubieboard"
>  BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/cubietruck_defconfig b/configs/cubietruck_defconfig
> new file mode 100644
> index 0000000..01a5fc2
> --- /dev/null
> +++ b/configs/cubietruck_defconfig
> @@ -0,0 +1,21 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_KERNEL_HEADERS_3_4=y
> +BR2_TARGET_GENERIC_HOSTNAME="Cubietruck"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun7i-cubietruck.config"
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/cubietruck.fex"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="Cubietruck"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Can you rework the patch according to these comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
