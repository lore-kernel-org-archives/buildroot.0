From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Jul 2021 09:48:23 -0300
Subject: [Buildroot] [PATCH 1/2] board/wandboard: Switch to extlinux.conf
Message-ID: <20210711124824.1025887-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently wandboard uses a custom boot.scr.txt script
and custom image generation scripts, genimage.cfg and 
post-build.sh.

Switch to using the more standard extlinux.conf solution
and remove the custom scripts in favor of the standard
board/freescale/common/imx/post-image.sh one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/wandboard/boot.scr.txt                  |  7 ----
 board/wandboard/genimage.cfg                  | 32 -------------------
 board/wandboard/post-build.sh                 |  8 -----
 .../boot/extlinux/extlinux.conf               |  4 +++
 configs/wandboard_defconfig                   |  5 ++-
 5 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 board/wandboard/boot.scr.txt
 delete mode 100644 board/wandboard/genimage.cfg
 delete mode 100755 board/wandboard/post-build.sh
 create mode 100644 board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/wandboard/boot.scr.txt b/board/wandboard/boot.scr.txt
deleted file mode 100644
index 7a8aa4bd5475..000000000000
--- a/board/wandboard/boot.scr.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
-run finduuid
-run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
-bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
deleted file mode 100644
index ad4a6a55d56d..000000000000
--- a/board/wandboard/genimage.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-# Minimal SD card image for the Wandboard
-#
-# The SD card must have at least 1 MB free at the beginning.
-# U-Boot and its environment are dumped as is.
-# A single root filesystem partition is required (Ext4 in this case).
-#
-# For details about the layout, see:
-# http://wiki.wandboard.org/index.php/Boot-process
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition spl {
-    in-partition-table = "no"
-    image = "SPL"
-    offset = 1024
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.img"
-    offset = 70656
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-    offset = 1M
-    size = 512M
-  }
-}
diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
deleted file mode 100755
index 6ddc1137022d..000000000000
--- a/board/wandboard/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -d -m 755 $TARGET_DIR/boot
-
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
-	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
diff --git a/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..e3b90660c0e4
--- /dev/null
+++ b/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-wandboard Buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate} 
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 7915248cf106..37628ea403b0 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -12,9 +12,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # Image
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/wandboard/genimage.cfg"
+BR2_ROOTFS_OVERLAY="board/wandboard/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.25.1
