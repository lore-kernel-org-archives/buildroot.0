From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:43:21 +0100
Subject: [Buildroot] [PATCH v4 2/3] board: Add Vyasa RK388 board support
In-Reply-To: <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
 <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171123224321.447ed853@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Title is wrong I believe, it shoul dbe RK3288 I guess.

On Sat, 18 Nov 2017 10:28:48 +0100, Jagan Teki wrote:

> diff --git a/board/amarula/vyasa/linux_gmac.fragment b/board/amarula/vyasa/linux_gmac.fragment
> new file mode 100644
> index 0000000..dd458c7
> --- /dev/null
> +++ b/board/amarula/vyasa/linux_gmac.fragment
> @@ -0,0 +1,3 @@
> +# Currently kernel mainline exhibits issues when running rockchip gmac
> +# on the board, so enable it as loadable module and insert it later
> +CONFIG_DWMAC_ROCKCHIP=m
> diff --git a/board/amarula/vyasa/post-build.sh b/board/amarula/vyasa/post-build.sh
> new file mode 100755
> index 0000000..ffbbcde
> --- /dev/null
> +++ b/board/amarula/vyasa/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +MKIMAGE=$HOST_DIR/bin/mkimage

So you need host-uboot-tools, but it is not enabled in your defconfig.


> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
> new file mode 100644
> index 0000000..5e62ac0
> --- /dev/null
> +++ b/configs/amarula_vyasa_rk3288_defconfig
> @@ -0,0 +1,59 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a17=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, a 4.13 series
> +BR2_KERNEL_HEADERS_4_13=y
> +
> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please keep the default toolchain configuration.

> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7e8a1fd62911a59f1f95d4620e89603230fdd6f9"

Using linux-next doesn't work, as it gets rebased constantly. The
commit 7e8a1fd62911a59f1f95d4620e89603230fdd6f9 no longer exists. You
have to wait for the support for this board to land into the mainline
kernel, or point to a vendor-specific Git tree.

> +# evtest
> +BR2_PACKAGE_EVTEST=y
> +
> +# qt5
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_EXAMPLES=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_EGLFS=y
> +BR2_PACKAGE_MALI_T76X=y

Please remove this custom selection of packages. We want to have minimal
defconfigs in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
