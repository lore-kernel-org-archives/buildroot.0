From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 00:30:32 +0200
Subject: [Buildroot] [PATCH 3/5] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1434393964-20355-4-git-send-email-francois.perrad@gadz.org>
References: <1434393964-20355-1-git-send-email-francois.perrad@gadz.org>
 <1434393964-20355-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <5581F508.9000708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 20:46, Francois Perrad wrote:
> config device tree / mainline (4.0.5)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[snip]
> diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino_lime/post-build.sh
> new file mode 100755
> index 0000000..d8d8fa4
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/post-build.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +BOOT_DIR=$TARGET_DIR/boot
> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
> +
> +rm -rf $BOOT_DIR
> +mkdir $BOOT_DIR
> +mkdir $BOOT_DIR/dtb
> +cp $BINARIES_DIR/sun7i-a20-olinuxino-lime.dtb $BOOT_DIR/dtb/sun7i-a20-olinuxino-lime.dtb

 If you set BR2_LINUX_KERNEL_INSTALL_TARGET=y, buildroot will install the dtb(s)
and the kernel in /boot. It will not use a dtb directory but that's not really
needed, right?

> +$MKIMAGE -A arm -O linux -T script -C none -d $BOARD_DIR/boot.cmd $BOOT_DIR/boot.scr

 So actually, this is the only part of the script that is really needed.

 Perhaps we could add an option in boot/uboot to do this from buildroot as well.

> +cp $BINARIES_DIR/zImage $BOOT_DIR/zImage
> diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
> new file mode 100644
> index 0000000..32148b7
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme.txt
> @@ -0,0 +1,89 @@
[snip]
> +Copy images on the SD card
> +--------------------------
> +
> +    # dd if=output/images/rootfs.ext2 of=/dev/sdX1 bs=512

 bs is not needed here (it just slows thing down).

> +    # dd if=output/images/u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1024 seek=8
> +
> +
> +Finish
> +======
> +
> +Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
> +
> diff --git a/configs/olimex_a20_olinuxino_defconfig b/configs/olimex_a20_olinuxino_defconfig
> new file mode 100644
> index 0000000..ce9435c
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_defconfig
> @@ -0,0 +1,35 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +

 Please also use a custom kernel headers version (4.1 will be the default soon...).

> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use OLinuXino!"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0.5"

 and use SAME_AS_HEADERS here.

> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"

 As mentioned above, use BR2_LINUX_KERNEL_INSTALL_TARGET

> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y

 I think we should start using BR2_TARGET_ROOTFS_EXT2_4 where possible. A few of
our defconfigs have it already but it should be generalized IMHO.

> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_VERSION="2015.04"
> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> 


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
