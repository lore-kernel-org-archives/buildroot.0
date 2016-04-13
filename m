From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:34 -0300
Subject: [Buildroot] [PATCH 09/15] board/galileo: Leverage the new genimage
	infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-10-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/intel/galileo/post-image.sh | 13 -------------
 configs/galileo_defconfig         |  4 ++--
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100755 board/intel/galileo/post-image.sh

diff --git a/board/intel/galileo/post-image.sh b/board/intel/galileo/post-image.sh
deleted file mode 100755
index f9aef0b1ba6c..000000000000
--- a/board/intel/galileo/post-image.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh -e
-
-GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-    --rootpath "${TARGET_DIR}" \
-    --tmppath "${GENIMAGE_TMP}" \
-    --inputpath "${BINARIES_DIR}" \
-    --outputpath "${BINARIES_DIR}" \
-    --config "${GENIMAGE_CFG}"
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 9334266b1e96..dde324cccd80 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -8,7 +8,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_OVERLAY="board/intel/galileo/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
@@ -18,8 +17,9 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.8.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_I386_EFI=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.0
