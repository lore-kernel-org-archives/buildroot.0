From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:45:24 +0100
Subject: [Buildroot] [PATCH v4 3/3] board: Add Tinker RK388 board support
In-Reply-To: <1510997329-4111-3-git-send-email-jagan@amarulasolutions.com>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
 <1510997329-4111-3-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171123224524.1e933449@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Nov 2017 10:28:49 +0100, Jagan Teki wrote:
> Add Tinker board, from rk3288 family SOC.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Same question about the title: shouldn't it be RK3288 ?


> diff --git a/board/asus/tinker/post-build.sh b/board/asus/tinker/post-build.sh
> new file mode 100755
> index 0000000..8108ed8
> --- /dev/null
> +++ b/board/asus/tinker/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +MKIMAGE=$HOST_DIR/bin/mkimage

host-uboot-tools is needed.


> diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
> new file mode 100644
> index 0000000..7f20cf1
> --- /dev/null
> +++ b/configs/asus_tinker_rk3288_defconfig
> @@ -0,0 +1,55 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a17=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, a 4.12 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
> +
> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Keep the default toolchain configuration.

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="tinker-rk3288"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to TINKER RK3288!"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
> +
> +# qt5
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_EXAMPLES=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_EGLFS=y
> +BR2_PACKAGE_MALI_T76X=y

And keep the configuration minimal by not adding Qt5/OpenGL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
