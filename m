From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Wed, 14 Oct 2015 16:03:38 +0200
Subject: [Buildroot] [PATCH 2/2] imx6sabre: use zImage format for kernel
In-Reply-To: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
References: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <1444831418-13483-3-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with u-boot rel_imx_3.10.53_1.1.0_ga, the default is to boot a
zImage instead of an uImage. Update the i.MX6 defconfigs accordingly.
This repairs the boot from SD card.

While at it, align freescale_imx6sololiteevk_defconfig a bit more on the
other i.MX6 defconfigs, update documentation and SD card creation script
comments to reflect the change to zImage.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/freescale/create-boot-sd.sh           |  2 +-
 board/freescale/imx6sabre/readme.txt        |  2 +-
 configs/freescale_imx6dlsabreauto_defconfig |  2 +-
 configs/freescale_imx6dlsabresd_defconfig   |  2 +-
 configs/freescale_imx6qsabreauto_defconfig  |  2 +-
 configs/freescale_imx6qsabresd_defconfig    |  2 +-
 configs/freescale_imx6sololiteevk_defconfig | 10 +++++++++-
 7 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/board/freescale/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
index cfb1101..e75d107 100755
--- a/board/freescale/create-boot-sd.sh
+++ b/board/freescale/create-boot-sd.sh
@@ -57,7 +57,7 @@ sync
 # Partition the card.
 # SD layout for i.MX6 boot:
 # - Bootloader at offset 1024
-# - FAT partition starting at 1MB offset, containing uImage and *.dtb
+# - FAT partition starting at 1MB offset, containing uImage or zImage, and *.dtb
 # - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
 sfdisk ${DEV} <<EOF
 start=1MiB, size=64MiB, type=b
diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 6850885..6958d92 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -43,7 +43,7 @@ You will find in ./output/images/ the following files:
   - rootfs.ext2
   - rootfs.tar
   - u-boot.imx
-  - uImage
+  - zImage
 
 Create a bootable SD card
 =========================
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 0de8eea..c175530 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 3010d7d..25bd6ce 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
 
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 70367a7..b5ecc0e 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
 
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 3fad77a..6dea756 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 5d98e9a..18ed588 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -2,6 +2,14 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
@@ -11,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
-- 
2.5.3
