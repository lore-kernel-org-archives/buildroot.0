From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:46:42 +0100
Subject: [Buildroot] [git commit] configs/beaglebone_qt5: don't use custom
 post-image script
Message-ID: <20191230133719.68B008E7B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5502a889dd9f065ec4694a993cfa509377da2cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Use a post-build script to copy uEnv.txt to BINARIES_DIR, as made for
beaglebone.

Drop the post-image script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/post-image.sh   | 29 -----------------------------
 configs/beaglebone_qt5_defconfig |  4 +++-
 2 files changed, 3 insertions(+), 30 deletions(-)

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
