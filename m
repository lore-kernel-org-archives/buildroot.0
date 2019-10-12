From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 11:49:25 -0300
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix mesa3d
 glx support
Message-ID: <20191012144925.14157-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
Adjust xserver_xorg-server to use it.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 board/pandaboard/post-image.sh                   | 16 ----------------
 configs/pandaboard_defconfig                     |  3 ++-
 .../xserver_xorg-server/xserver_xorg-server.mk   |  2 +-
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100755 board/pandaboard/post-image.sh

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
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a33cb25076..c15047cbe4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -120,7 +120,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 else
-- 
2.18.1
