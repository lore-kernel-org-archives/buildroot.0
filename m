From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 12:12:07 +0100
Subject: [Buildroot] [PATCH 2/9] configs: Add a tested working
 STM32F469-DISCO defconfig
In-Reply-To: <1455901745-18486-3-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
 <1455901745-18486-3-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222121207.0296eaff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lee Jones,

On Fri, 19 Feb 2016 17:08:58 +0000, Lee Jones wrote:

> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> new file mode 100644
> index 0000000..b9e7dbe
> --- /dev/null
> +++ b/configs/stm32f469_disco_defconfig
> @@ -0,0 +1,29 @@
> +BR2_arm=y
> +BR2_cortex_m3=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y

I think this line is useless, since it will be the only option anyway
for Cortex-M, so it should already be the default. It isn't the case?

> +BR2_STRIP_none=y

Why?

> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/OSELAS.Toolchain-2014.12.1/arm-cortexm3-uclinuxeabi/gcc-4.9.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.16-sanitized/"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-cortexm3-uclinuxeabi"

This means the defconfig will not build without first installing this
toolchain in this specific location. This isn't acceptable as it breaks
the point of defconfigs, and will break our Travis-CI testing of
defconfigs.

We need to either make the internal toolchain work with Cortex-M3, or
alternatively, make the external toolchain logic support the OSELAS
toolchain. I *think* I tried the latter option, but ran into troubles,
but I can't remember which ones.

> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
> +# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Why?

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32/stm32f469-disco/patches/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_LATEST_VERSION=y
> +BR2_LINUX_KERNEL_PATCH="board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel"

Not needed since you have BR2_GLOBAL_PATCH_DIR. Just put the kernel
patches in board/stmicroelectronics/stm32/stm32f469-disco/patches/linux.

> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_GZIP=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
> +BR2_TARGET_AFBOOT_STM32=y
> +BR2_PACKAGE_HOST_OPENOCD=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
