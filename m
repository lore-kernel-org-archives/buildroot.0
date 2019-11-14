From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 14 Nov 2019 09:42:15 -0300
Subject: [Buildroot] [PATCH/next v2 5/5] configs/beaglebone_qt5: don't use
 custom post-image script
In-Reply-To: <20191114124215.12985-1-unixmania@gmail.com>
References: <20191114124215.12985-1-unixmania@gmail.com>
Message-ID: <20191114124215.12985-6-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Use a post-build script to copy uEnv.txt to BINARIES_DIR, as made for
beaglebone.

Drop the post-image script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 board/beaglebone/post-image.sh   | 29 -----------------------------
 configs/beaglebone_qt5_defconfig |  4 +++-
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100755 board/beaglebone/post-image.sh

diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
deleted file mode 100755
index 68fe0896c6..0000000000
--- a/board/beaglebone/post-image.sh
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-# post-image.sh for CircuitCo BeagleBone and TI am335x-evm
-# 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
-# 2016, Lothar Felten <lothar.felten@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-
-# copy the uEnv.txt to the output/images directory
-cp board/beaglebone/uEnv.txt $BINARIES_DIR/uEnv.txt
-
-# the 4.1 kernel does not provide a dtb for beaglebone green, so we
-# use a different genimage config if am335x-bonegreen.dtb is not
-# built:
-if [ -e ${BINARIES_DIR}/am335x-bonegreen.dtb ] ; then
-	GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-else
-	GENIMAGE_CFG="${BOARD_DIR}/genimage_linux41.cfg"
-fi
-
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
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 4a558c9ad4..99355e855c 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -5,7 +5,9 @@ BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
-- 
2.18.1
