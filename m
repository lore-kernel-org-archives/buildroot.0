From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:26:26 +0200
Subject: [Buildroot] [PATCH] board: add support for nanopi-m1-plus
In-Reply-To: <1499364298-8433-1-git-send-email-chakra@openedev.com>
References: <1499364298-8433-1-git-send-email-chakra@openedev.com>
Message-ID: <20170706212626.0abcaf57@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 23:34:58 +0530, Chakra Divi wrote:
> Add initial support for nanopi-m1-plus board
> with below features
> - U-Boot 2017.07-rc3

Would be good to mention why you use this version of U-Boot. I know
why, but it's better when it's explicitly written in the commit log.
Indeed, using release candidate versions is normally not accepted.

> - Linux 4.11.5
> - linux patches to add nanopi-m1-plus dts
> - Default packages from buildroot
> 
> Signed-off-by: Chakra Divi <chakra@openedev.com>

Thanks, looks mostly good.

> diff --git a/board/friendlyarm/nanopi-m1-plus/genimage.cfg b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
> new file mode 100644
> index 0000000..7c407ed
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m1-plus/genimage.cfg

At some point, factorizing the genimage.cfg file across similar
Allwinner boards might be useful. See board/freescale/common/imx for an
example.

But it's OK for now to have it as you did.

> diff --git a/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch b/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
> new file mode 100644
> index 0000000..e41c549
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to
-linux-4.11.5.patch

Has this patch submitted mainline?

> @@ -0,0 +1,101 @@
> +From a2906d34dccec1c097aa3ef8d3082c0bf394ecc0 Mon Sep 17 00:00:00 2001
> +From: Chakra Divi <chakra@openedev.com>
> +Date: Thu, 6 Jul 2017 18:22:35 +0530
> +Subject: [PATCH] ARM: dts: nanopi-m1-plus : add dts to linux 4.11.5
> +
> +This patch is used to add nanopi-m1-plus dts
> +file in linux source code helps to add nanopi-m1-plus
> +board support in buildroot

If so, please indicate it here.

Also, please put this patch in:

board/friendlyarm/nanopi-m1-plus/linux/patches/

and name it just 0001-<something>.patch (i.e without the linux- prefix).

> diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
> new file mode 100644
> index 0000000..5c05eaa
> --- /dev/null
> +++ b/configs/nanopi_m1_plus_defconfig
> @@ -0,0 +1,44 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 4.11 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1-plus"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1 Plus"
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc3"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
> +BR2_LINUX_KERNEL_PATCH="board/friendlyarm/nanopi-m1-plus/patches/linux-*.patch"

And replace this with BR2_GLOBAL_PATCH_DIR.

Otherwise looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
