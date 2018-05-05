From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  5 May 2018 20:12:22 -0300
Subject: [Buildroot] [PATCH 1/3] configs/freescale_imx6sololiteevk: Remove
 target
Message-ID: <1525561944-1511-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently this target fails to build:

Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed

This problem has been already solved in upstream U-Boot, but not
on NXP version of U-Boot.

To avoid the maintainance burden of keeping two defconfigs for the
same board, remove freescale_imx6sololiteevk_defconfig in favor
of imx6slevk_defconfig, which uses U-Boot and kernel mainline.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/66561693
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/freescale_imx6sololiteevk_defconfig | 39 -----------------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 configs/freescale_imx6sololiteevk_defconfig

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
deleted file mode 100644
index b840f2f..0000000
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ /dev/null
@@ -1,39 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-
-# system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
-
-# filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-
-# required tools to create the microSD image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.7.4
