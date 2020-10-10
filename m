From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 10 Oct 2020 09:30:22 +0300
Subject: [Buildroot] [PATCH 5/5] board/udoo: drop custom post-image script
In-Reply-To: <20201010063022.448414-1-geomatsi@gmail.com>
References: <20201010063022.448414-1-geomatsi@gmail.com>
Message-ID: <20201010063022.448414-6-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use generic genimage.sh script instead.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/udoo/common/post-image.sh  | 15 ---------------
 configs/mx6sx_udoo_neo_defconfig |  3 ++-
 configs/mx6udoo_defconfig        |  3 ++-
 3 files changed, 4 insertions(+), 17 deletions(-)
 delete mode 100755 board/udoo/common/post-image.sh

diff --git a/board/udoo/common/post-image.sh b/board/udoo/common/post-image.sh
deleted file mode 100755
index 18e76aa40d..0000000000
--- a/board/udoo/common/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
-
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index bec87561bb..e22f6a35af 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -6,7 +6,8 @@ BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/udoo/common/genimage.cfg"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 5be82e5e39..388c9c7b64 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -8,7 +8,8 @@ BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/udoo/common/genimage.cfg"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.28.0
