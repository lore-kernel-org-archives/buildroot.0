From: Lothar Felten <lothar.felten@gmail.com>
Date: Thu, 15 Feb 2018 12:37:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] configs: beaglebone: bump kernel and
 uboot version
Message-ID: <20180215113718.27952-1-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to Linux kernel version 4.9.59 from the TI SDK 04.02.00.09
(TI SDK release date: 23.12.2017)
Updated uboot to version 2018.01
uEnv.txt corrected to boot from sd card on the ti-am335x-evm

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---

v3:
- set uboot version to 2018.01 in defconfig
- keep default rootfs size
- keep Kconfig and dtc for uboot

Tested on beaglebone back and ti-am335x-evm.

 board/beaglebone/uEnv.txt    | 8 ++++++--
 configs/beaglebone_defconfig | 8 +++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index 70b3b721..a665f208 100644
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
+set_mmc1=if test $board_name = A33515BB; then setenv bootpartition mmcblk1p2; fi
+set_bootargs=setenv bootargs console=ttyO0,115200n8 root=/dev/${bootpartition} rw rootfstype=ext4 rootwait
+uenvcmd=run set_mmc1; run set_bootargs;run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr}
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 611b6941..80b27147 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,13 +1,13 @@
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
@@ -16,13 +16,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.14.1
