From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 12:14:46 +0100
Subject: [Buildroot] [PATCH 7/9] boards: stm32f469-disco: Add kernel
 patch to set RAM address to 0
In-Reply-To: <1455901745-18486-8-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
 <1455901745-18486-8-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222121446.2e0e142e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lee,

On Fri, 19 Feb 2016 17:09:03 +0000, Lee Jones wrote:
> At the time of submission, the Mainline kernel does not currently
> support the STM32f469.  This patch makes changes to the defconfig
> to enable booting with the CPIO which Buildroot puts together.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../patches/kernel/0004-enable-cpio-rootfs.patch   | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0004-enable-cpio-rootfs.patch
> 
> diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0004-enable-cpio-rootfs.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0004-enable-cpio-rootfs.patch
> new file mode 100644
> index 0000000..28a1b81
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0004-enable-cpio-rootfs.patch
> @@ -0,0 +1,26 @@
> +From 025cf91280af68d2e7f527e46dce072713fa79ac Mon Sep 17 00:00:00 2001
> +From: Lee Jones <lee.jones@linaro.org>
> +Date: Thu, 18 Feb 2016 11:07:25 +0000
> +Subject: [PATCH 1/1] ARM: stm32: Add support for booting with a CPIO rootfs
> +
> +Signed-off-by: Lee Jones <lee.jones@linaro.org>
> +---
> + arch/arm/configs/stm32_defconfig | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> +index 4725fab..eaac94c 100644
> +--- a/arch/arm/configs/stm32_defconfig
> ++++ b/arch/arm/configs/stm32_defconfig
> +@@ -68,3 +68,8 @@ CONFIG_MAGIC_SYSRQ=y
> + # CONFIG_FTRACE is not set
> + CONFIG_CRC_ITU_T=y
> + CONFIG_CRC7=y
> ++CONFIG_INITRAMFS_ROOT_UID=0
> ++CONFIG_INITRAMFS_ROOT_GID=0
> ++CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
> ++CONFIG_RD_GZIP=y
> ++CONFIG_INITRAMFS_COMPRESSION_GZIP=y

This is not needed. Buildroot already sets those options when building
a kernel with BR2_TARGET_ROOTFS_INITRAMFS=y in the Buildroot
configuration. See linux/linux.mk, and search for
BR2_TARGET_ROOTFS_INITRAMFS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
