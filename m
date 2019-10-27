From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:21:29 +0100
Subject: [Buildroot] [git commit] configs/pandaboard: drop custom post-image
 script
Message-ID: <20191027111554.1E9CE89012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fdaf76a52216d773dcdaf0980a3e0abe3dd093d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pandaboard/post-image.sh | 16 ----------------
 configs/pandaboard_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/board/pandaboard/post-image.sh b/board/pandaboard/post-image.sh
deleted file mode 100755
index 9cca1b1789..0000000000
--- a/board/pandaboard/post-image.sh
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
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index bb4dd28783..408bced9c0 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -6,7 +6,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pandaboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.62"
