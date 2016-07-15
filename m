From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 23:26:55 +0200
Subject: [Buildroot] [PATCH v7 2/2] configs: add defconfig for TS-4800
In-Reply-To: <1468610588-9709-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468610588-9709-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1468610588-9709-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160715232655.748ef852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 15:23:08 -0400, Patrick Keroulas wrote:
> The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot
> as of v2016-07.
> 
> The config requires the custom ts4800-mbrboot routine.
> 
> A post-image script is provided to generate an image that can be "dd"
> directly to an SD card.
> 
> More details on the board here:
>   http://wiki.embeddedarm.com/wiki/TS-4800
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>

I was about to apply this patch, but there's one big thing missing: a
readme.txt file. We have one for each defconfig we support, to tell the
user how to use the defconfig from Buildroot: how to flash it and how
to boot the board with it.

Also, a few more comments below.

> diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
> new file mode 100755
> index 0000000..bbfea28
> --- /dev/null
> +++ b/board/technologic/ts4800/post-image.sh
> @@ -0,0 +1,22 @@
> +#!/bin/bash
> +#
> +# Copyright (C) 2015 Savoir-faire Linux
> +# Post image generation script.
> +
> +IDIR="$1"

Not needed.

> +
> +BOARD_DIR="board/technologic/ts4800"

Use:

BOARD_DIR="$(dirname $0)"

> +GENIMAGE_CFG_DEFAULT="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_CFG=${GENIMAGE_CFG_DEFAULT}

Why do you have two variables here? Just define GENIMAGE_CFG and that's
enough.

> +GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
> +
> +rm -rf ${GENIMAGE_TMP}
> +
> +${HOST_DIR}/usr/bin/genimage \
> +        --config ${GENIMAGE_CFG} \
> +        --rootpath ${TARGET_DIR} \
> +        --tmppath ${GENIMAGE_TMP} \
> +        --inputpath $IDIR \

replace $IDIR by ${BINARIES_DIR}

> +        --outputpath $IDIR

ditto.

> +
> +exit $?
> diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
> new file mode 100644
> index 0000000..0dd3e84
> --- /dev/null
> +++ b/configs/ts4800_defconfig
> @@ -0,0 +1,19 @@
> +BR2_arm=y
> +BR2_cortex_a8=y

Please make it explicit with kernel headers are being used:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(TOPDIR)/board/technologic/ts4800/linux.fragment"

$(TOPDIR)/ not needed.

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"
> +BR2_PACKAGE_BUSYBOX_WATCHDOG=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_TS4800_MBRBOOT=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="ts4800"

Please specify the exact U-Boot version being used:

+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
