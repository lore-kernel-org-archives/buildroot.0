From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:39 -0300
Subject: [Buildroot] [PATCH 14/15] board/raspberry*: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-15-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's rework the board and config files to use the
recently added genimage infra, which generates the
SD card image directly.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/raspberrypi/post-build.sh |  8 ++++++++
 board/raspberrypi/post-image.sh | 22 ----------------------
 configs/raspberrypi2_defconfig  |  5 +++--
 configs/raspberrypi_defconfig   |  5 +++--
 4 files changed, 14 insertions(+), 26 deletions(-)
 create mode 100755 board/raspberrypi/post-build.sh
 delete mode 100755 board/raspberrypi/post-image.sh

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
new file mode 100755
index 000000000000..8b66536d84c6
--- /dev/null
+++ b/board/raspberrypi/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Mark the kernel as DT-enabled
+mkdir -p "${BINARIES_DIR}/kernel-marked"
+${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
+	"${BINARIES_DIR}/kernel-marked/zImage"
+
+exit $?
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
deleted file mode 100755
index 73ffd658e7ca..000000000000
--- a/board/raspberrypi/post-image.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME="$(basename ${BOARD_DIR})"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-# Mark the kernel as DT-enabled
-mkdir -p "${BINARIES_DIR}/kernel-marked"
-${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
-	"${BINARIES_DIR}/kernel-marked/zImage"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 1d82f6041742..fed926869cc9 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -25,11 +25,12 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/raspberrypi2/genimage-raspberrypi2.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 615c052bdd26..10cb812a3371 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -24,11 +24,12 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/raspberrypi/genimage-raspberrypi.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
-- 
2.7.0
