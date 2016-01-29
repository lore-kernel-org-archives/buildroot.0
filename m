From: Eelco Chaudron <echaudron@xiot.nl>
Date: Fri, 29 Jan 2016 15:27:48 +0100
Subject: [Buildroot] [PATCH 1/1] configs/orangepi: Changing Linux kernel to
	v4.5-rc1
Message-ID: <1454077668-1021-1-git-send-email-echaudron@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
---
 board/orangepi/orangepipc/post-image.sh | 8 +++++++-
 board/orangepi/orangepipc/readme.txt    | 4 ----
 configs/orangepipc_defconfig            | 8 ++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
index 9cca1b1..dbe1516 100755
--- a/board/orangepi/orangepipc/post-image.sh
+++ b/board/orangepi/orangepipc/post-image.sh
@@ -6,7 +6,13 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
 
-genimage                           \
+# As we now use the Linux v4.5-RC1 kernel no orangepi-pc dtb exists yet.
+# However the orangepi-plus dtb has not much content, only mmc0 and uart
+# which are equal to the pc version of the board, so we use it here.
+mv ${BINARIES_DIR}/sun8i-h3-orangepi-plus.dtb ${BINARIES_DIR}/sun8i-h3-orangepi-pc.dtb
+
+
+genimage                               \
 	--rootpath "${TARGET_DIR}"     \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
diff --git a/board/orangepi/orangepipc/readme.txt b/board/orangepi/orangepipc/readme.txt
index 00845a4..f12c867 100644
--- a/board/orangepi/orangepipc/readme.txt
+++ b/board/orangepi/orangepipc/readme.txt
@@ -7,10 +7,6 @@ This default configuration will allow you to start experimenting with the
 buildroot environment for the OrangePi PC. With the current configuration
 it will bring-up the board, and allow access through the serial console.
 
-Unfortunately this boards processor is not yet supported by the
-mainline kernel, and therefore this default configuration is using a
-private Linux kernel repository based on 4.4-rc.
-
 How to build it
 ===============
 
diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index 34358fb..79a7bd4 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -10,20 +10,20 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/jwrdegoede/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a516ac6dda21e6f5edceecd08b475b16e360656b"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.5-rc1"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.5.0
