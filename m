From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:00:46 +0100
Subject: [Buildroot] [PATCH] configs/nanopi_neo: update kernel to 5.3
In-Reply-To: <20191122181604.30828-1-viktar.palstsiuk@promwad.com>
References: <20191122181604.30828-1-viktar.palstsiuk@promwad.com>
Message-ID: <20191125220046.09ed540f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Viktar,

Thanks for your contribution! However, I have a number of comments, see
below.

On Fri, 22 Nov 2019 21:16:04 +0300
Viktar Palstsiuk <viktar.palstsiuk@promwad.com> wrote:

> Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>

The first comment is that this commit makes a number of changes that
are not directly related to each other. Another comment is that the
commit title doesn't reflect what the patch is doing (the commit title
only mentions the Linux update to 5.3, but none of the other changes).

> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
> index ad43d31049..cd1892b699 100644
> --- a/board/friendlyarm/nanopi-neo/genimage.cfg
> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
> @@ -29,6 +29,6 @@ image sdcard.img {
>  	partition rootfs {
>  		partition-type = 0x83
>  		image = "rootfs.ext4"
> -		size = 32M
> +		size = 64M

This size field should be completely dropped, genimage can figure out
the partition size from the filesystem image size.

This should be one separate patch.

> diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
> deleted file mode 100755
> index 9759efb568..0000000000
> --- a/board/friendlyarm/nanopi-neo/post-build.sh
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#!/bin/sh
> -# post-build.sh for Nanopi NEO, based on the Orange Pi PC
> -# 2013, Carlo Caione <carlo.caione@gmail.com>
> -# 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -BOARD_DIR="$( dirname "${0}" )"
> -MKIMAGE="${HOST_DIR}/bin/mkimage"
> -BOOT_CMD="${BOARD_DIR}/boot.cmd"
> -BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
> -
> -# U-Boot script
> -"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
> diff --git a/board/friendlyarm/nanopi-neo/post-image.sh b/board/friendlyarm/nanopi-neo/post-image.sh
> deleted file mode 100755
> index 740386ef82..0000000000
> --- a/board/friendlyarm/nanopi-neo/post-image.sh
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#!/bin/sh
> -# post-image.sh for Nanopi NEO, based on the Orange Pi PC
> -
> -BOARD_DIR="$( dirname "${0}" )"
> -GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> -GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> -
> -rm -rf "${GENIMAGE_TMP}"
> -
> -genimage                               \
> -	--rootpath "${TARGET_DIR}"     \
> -	--tmppath "${GENIMAGE_TMP}"    \
> -	--inputpath "${BINARIES_DIR}"  \
> -	--outputpath "${BINARIES_DIR}" \
> -	--config "${GENIMAGE_CFG}"

Dropping the post-image/post-build scripts is a good idea, but it
should be another separate patch from bumping the versions of
Linux/U-Boot.

> +# Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> -BR2_TARGET_ROOTFS_EXT2_INODES=8192

Good that you drop this, can be part of the patch dropping the size in
the genimage.cfg file as well.

> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"

Should be in the patch removing the post-build and post-image scripts.

>  # BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Additional tools
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Same.

Could you rework your patch according to the comments above?
Ultimately, we want 3 patches:

 - One fixing the filesystem size usage
 - One removing post-build/post-image script
 - One doing the update of Linux/U-Boot versions

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
