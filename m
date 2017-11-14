From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Nov 2017 15:00:02 +0200
Subject: [Buildroot] [PATCH v2 2/2] board: Add Vyasa RK388 board support
In-Reply-To: <1510659831-22535-2-git-send-email-jagan@amarulasolutions.com>
References: <1510659831-22535-1-git-send-email-jagan@amarulasolutions.com>
 <1510659831-22535-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171114130002.ypspgquvmyuuybtm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Tue, Nov 14, 2017 at 12:43:51PM +0100, Jagan Teki wrote:
> Add Vyasa board, from rk3288 family SOC.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

[...]

> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
> new file mode 100644
> index 0000000..3e24cbf
> --- /dev/null
> +++ b/configs/amarula_vyasa_rk3288_defconfig
> @@ -0,0 +1,55 @@
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

Why do you need glibc?

All defconfigs use the default toolchain unless there is a reason for that. If 
there is one please explain in the commit log.

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
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
> +BR2_TARGET_UBOOT_TPL=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"

Buildroot defconfig kernel/bootloader versions are never set to branch names. 
We try to make the defconfigs reproducible, in the sense that you get the same 
result at any time, as much as possible. Git branches might, and do, change 
from time to time. Tomorrow the same defconfig would generate a different 
kernel.

Please use a tag (preferably), or a commit id.

baruch

> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-vyasa"
> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="vyasa-rk3288"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to VYASA RK3288!"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
> +
> +# qt5
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_EXAMPLES=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_EGLFS=y
> +BR2_PACKAGE_MALI_T76X=y

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
