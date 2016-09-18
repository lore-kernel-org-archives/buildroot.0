From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 17:10:32 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs: add defconfig for TS-4900
In-Reply-To: <1474143804-19181-3-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1474143804-19181-3-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <20160918171032.2ee45abd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 16:23:24 -0400, Mathieu Audat wrote:
> The TS-4900 uses a custom Linux 4.X from Technologic Systems:
> https://github.com/embeddedarm/linux-3.10.17-imx6/tree/imx_4.1.15_1.0.0_ga
> Indeed, it is not supported by mainline Linux but this work is ongoing.
> 
> This patch is inspired by a previous work for the TS-4800.
> A post image script is provided to generate an image that can be
> directly written to an SD card. It also adds an fpga wifi module.
> 
> Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>

Thanks for this contribution, I've applied your patch, after doing some
tweaks. See below.

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

This exit $? is not needed, so I removed it.


> +The bootloader comes pre-flashed on the board on an SPI flash. Since updating
> +the bootloader is risky and not trivial, it is not included in the Buildroot
> +defconfig. Refer to http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details
> +on which U-Boot config to use and how to flash it.

I don't really like the fact that Buildroot doesn't rebuild the entire
system. Why is it "risky" to update the bootloader? It's an i.MX6
processor, so you have imx-usb-loader to recover the board whatever
happens. I believe Buildroot defconfigs should rebuild all the software
components that runs on the board.

> diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
> new file mode 100644
> index 0000000..7f1c0cd
> --- /dev/null
> +++ b/configs/ts4900_defconfig
> @@ -0,0 +1,19 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_KERNEL_HEADERS_AS_KERNEL=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y

I don't know how you generate this defconfig, but this combination of
options is wrong, and causes kconfig to complain:

thomas at skate:~/projets/buildroot (master)$ make ts4900_defconfig
/home/thomas/projets/buildroot/configs/ts4900_defconfig:4:warning: override: BR2_KERNEL_HEADERS_AS_KERNEL changes choice state

Only the last of those three options was needed to make things work.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="$(TOPDIR)/board/technologic/ts4900/post-image.sh"

$(TOPDIR) not needed, the top-level Buildroot source directory is
always the location from which paths are interpreted.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.10.17-imx6.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="70d1e85a22879e27cc9e36384438d5a9793e44b0"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-ts4900"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_PACKAGE_TS4900_FPGA=y
> +BR2_PACKAGE_HOST_GENIMAGE=y

I've applied with those minor tweaks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
