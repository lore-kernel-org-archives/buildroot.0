From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:36 -0300
Subject: [Buildroot] [PATCH 11/15] board/boundarydevices: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-12-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/boundarydevices/common/post-image.sh | 16 ----------------
 configs/nitrogen6sx_defconfig              |  4 ++--
 configs/nitrogen6x_defconfig               |  4 ++--
 configs/nitrogen7_defconfig                |  4 ++--
 4 files changed, 6 insertions(+), 22 deletions(-)
 delete mode 100755 board/boundarydevices/common/post-image.sh

diff --git a/board/boundarydevices/common/post-image.sh b/board/boundarydevices/common/post-image.sh
deleted file mode 100755
index 9cca1b1789ec..000000000000
--- a/board/boundarydevices/common/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
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
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 9d2531769050..29a4ffdc27c6 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -6,13 +6,13 @@ BR2_cortex_a9=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/boundarydevices/common/genimage.cfg"
 
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 866b1f8ffc3a..1307d713bb68 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -6,13 +6,13 @@ BR2_cortex_a9=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/boundarydevices/common/genimage.cfg"
 
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 9d54d789fa11..0b1cd558ba48 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -6,14 +6,14 @@ BR2_cortex_a7=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/boundarydevices/common/genimage.cfg"
 
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
-- 
2.7.0
