From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 12:02:37 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 10/10]
 configs/freescale_ls1028ardb*: new board
In-Reply-To: <20191125231736.59b1eb19@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-11-jerry.huang@nxp.com>
 <20191125231736.59b1eb19@windsurf>
Message-ID: <VI1PR04MB5136D550D8C06CBB3D139B7EFE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 6:18 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 10/10] configs/freescale_ls1028ardb*:
> new board
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Thu, 21 Nov 2019 18:23:24 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> 
> > diff --git a/board/freescale/ls1028ardb/genimage.xspi.cfg.template
> > b/board/freescale/ls1028ardb/genimage.xspi.cfg.template
> > new file mode 100644
> > index 0000000000..14d75a17f3
> > --- /dev/null
> > +++ b/board/freescale/ls1028ardb/genimage.xspi.cfg.template
> > @@ -0,0 +1,53 @@
> > +# Minimal QSPI image for the NXP boards Template # # We mimic the
> > +.sdcard NXP's image format:
> > +# * the SD card must have 4 kB free space at the beginning,
> 
> SD card ? But this file is about creating an image for a QSPI flash.
Will fix that in v3

> > +# * U-Boot is dumped as is,
> > +# * a single root filesystem partition is required (ext2, ext3 or
> > +ext4)
> 
> I don't see the root filesystem in this genimage configuration file
Will fix that in v3

> > diff --git a/configs/freescale_ls1028ardb-emmc_defconfig
> > b/configs/freescale_ls1028ardb-emmc_defconfig
> 
> To be honest, I'm not sure we want 3 different configurations for this board. Can
> we pick just one ?
There are three basic boot mode for ls1028ardb, so three configurations is for this board.
I think we need these three configurations.

> > new file mode 100644
> > index 0000000000..c34db6cb0b
> > --- /dev/null
> > +++ b/configs/freescale_ls1028ardb-emmc_defconfig
> > @@ -0,0 +1,136 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_cortex_a72=y
> > +
> > +# Filesystem
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_GZIP=y
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="500M"
> 
> Keep the default size and compression.
Sure,

> > +
> > +# Hostname and issue
> > +BR2_TARGET_GENERIC_HOSTNAME="LS1028ARDB"
> > +
> > +# Linux headers same as kernel
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> > +
> > +# toolchain
> > +BR2_TOOLCHAIN_EXTERNAL=y
> 
> Please stick to using the internal toolchain for defconfigs.
Sure,

> > +# bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
> > +BR2_TARGET_UBOOT_BOARDNAME="ls1028ardb_tfa"
> > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> >
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://eur01.safelinks.protectio
> n.outlook.com/?url=https%3A%2F%2Fsource.codeaurora.org%2Fexternal%2Fqo
> riq%2Fqoriq-components%2Fu-boot&amp;data=02%7C01%7Cjerry.huang%40nx
> p.com%7C8bf20e9e0b6144a467fa08d771f5485b%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C637103170604588864&amp;sdata=y79I0o0l%2F%2
> BpHp9bkvMis693dAAbhvXUcIkCS%2BTBSetQ%3D&amp;reserved=0"
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-19.09"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_FORMAT_BIN=n
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.bin"
> > +BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
> > +BR2_TARGET_UBOOT_ENVIMAGE=y
> >
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/freescale/ls1028ardb/u-b
> oot-environment-emmc.txt"
> > +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> >
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://eur01.safelinks.protection
> .outlook.com/?url=https%3A%2F%2Fsource.codeaurora.org%2Fexternal%2Fqor
> iq%2Fqoriq-components%2Flinux&amp;data=02%7C01%7Cjerry.huang%40nxp.
> com%7C8bf20e9e0b6144a467fa08d771f5485b%7C686ea1d3bc2b4c6fa92cd99c
> 5c301635%7C0%7C0%7C637103170604588864&amp;sdata=mSyrWd0ZWOMh
> gsvIXTUx4y3sAITe50SLIhZ%2Bo14qIXc%3D&amp;reserved=0"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> >
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64
> /configs/lsdk.config"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> > +
> > +# Serial port config
> > +BR2_TARGET_GENERIC_GETTY=y
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> > +
> > +# required tools to create the microSD image
> > +BR2_PACKAGE_HOST_DOSFSTOOLS=y BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_HOST_MTOOLS=y
> >
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/ls/post-image
> .sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR)
> $(UBOOT_DIR)"
> > +
> > +# busybox setting
> >
> +#BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/freescale/com
> mon/ls/busybox.config"
> > +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > +
> > +# packages for rcw
> > +BR2_PACKAGE_HOST_RCW=y
> > +BR2_PACKAGE_HOST_RCW_ATF=y
> > +BR2_PACKAGE_HOST_RCW_BOOT_MODE="emmc"
> >
> +BR2_PACKAGE_HOST_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1300_em
> mcboot.bin"
> > +
> > +#Display port firmware
> > +BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW=y
> > +
> > +# basic packages and tools
> > +BR2_PACKAGE_MTD=y
> > +BR2_PACKAGE_MTD_MTD_DEBUG=y
> > +BR2_PACKAGE_SYSSTAT=y
> > +BR2_PACKAGE_E2FSPROGS=y
> > +BR2_PACKAGE_RT_TESTS=y
> > +BR2_PACKAGE_OPENSSH=y
> > +BR2_PACKAGE_OPENSSL=y
> > +BR2_PACKAGE_WGET=y
> > +
> > +# docker packages
> > +BR2_PACKAGE_DOCKER_CONTAINERD=y
> > +BR2_PACKAGE_DOCKER_ENGINE=y
> > +BR2_PACKAGE_DOCKER_ENGINE_DAEMON=y
> > +BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL=y
> > +BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS=y
> > +BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER=y
> > +BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS=y
> > +BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
> > +BR2_PACKAGE_CGROUPFS_MOUNT=y
> > +BR2_PACKAGE_LIBCGROUP=y
> 
> Please remove all extra packages: keep only Busybox in the target filesystem.
> We want minimal defconfigs, that only build the bootloader, kernel and a
> minimal root filesystem.
sure

> Thanks!
> 
> Thmas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C8bf20e9e0b6144a467
> fa08d771f5485b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371
> 03170604588864&amp;sdata=yvLKBVKXw7uBYHIPRRwjz6BzvH%2BO778aOz5i
> oYSBN1I%3D&amp;reserved=0
