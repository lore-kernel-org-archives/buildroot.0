From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue,  6 Feb 2018 21:36:06 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: bump kernel and uboot
 version
Message-ID: <20180206203606.26096-1-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to Linux kernel version 4.9.59 from the TI SDK 04.02.00.09
(TI SDK release date: 23.12.2017)
Upadted uboot to version 2018.01

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/beaglebone/uEnv.txt    |  8 ++++++--
 configs/beaglebone_defconfig | 14 +++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index 70b3b721..8365c3af 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -1,4 +1,8 @@
 bootpart=0:1
+devtype=mmc
 bootdir=
-bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
-uenvcmd=run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr};
+bootfile=zImage
+bootpartition=mmcblk0p2
+set_mmc1=if test $board_name = A33515BB; then setenv bootpartition mmcblk1p2; fi; 
+set_bootargs=setenv bootargs console=ttyO0,115200n8 root=/dev/${bootpartition} rw rootfstype=ext4 rootwait
+uenvcmd=run set_mmc1; run set_bootargs;run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr};
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 611b6941..af8b682c 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,30 +1,26 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a75d8e93056181d512f6c818e8627bd4554aaf92"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.14.1
