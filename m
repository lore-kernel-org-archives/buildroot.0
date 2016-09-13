From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Sep 2016 09:20:38 +0200
Subject: [Buildroot] [PATCH 2/2] configs/orangepipc: Use Linux 4.7.3
In-Reply-To: <1473751238-12409-1-git-send-email-peter@korsgaard.com>
References: <1473751238-12409-1-git-send-email-peter@korsgaard.com>
Message-ID: <1473751238-12409-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's now an sun8i-h3-orangepi-pc dts, so we can use that and drop the
hack in the post-image script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepipc/post-image.sh | 8 --------
 configs/orangepipc_defconfig            | 6 +++---
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
index dbe1516..359b4c9 100755
--- a/board/orangepi/orangepipc/post-image.sh
+++ b/board/orangepi/orangepipc/post-image.sh
@@ -6,17 +6,9 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
 
-# As we now use the Linux v4.5-RC1 kernel no orangepi-pc dtb exists yet.
-# However the orangepi-plus dtb has not much content, only mmc0 and uart
-# which are equal to the pc version of the board, so we use it here.
-mv ${BINARIES_DIR}/sun8i-h3-orangepi-plus.dtb ${BINARIES_DIR}/sun8i-h3-orangepi-pc.dtb
-
-
 genimage                               \
 	--rootpath "${TARGET_DIR}"     \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
 	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index 2e127d0..1bea541 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -1,17 +1,17 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.8.1
