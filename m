From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:41:59 +0200
Subject: [Buildroot] [git commit] board/wandboard: switch to extlinux.conf
Message-ID: <20210718210817.78A018836B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=1176ed86f5e27ea21ba80648356537e843c803ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently wandboard uses a custom boot.scr.txt script
and custom image generation scripts, genimage.cfg and
post-build.sh.

Switch to using the more standard extlinux.conf solution
and remove the custom scripts in favor of the standard
board/freescale/common/imx/post-image.sh one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/wandboard/boot.scr.txt                       |  7 -----
 board/wandboard/genimage.cfg                       | 32 ----------------------
 board/wandboard/post-build.sh                      |  8 ------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 +++
 configs/wandboard_defconfig                        |  5 ++--
 5 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/board/wandboard/boot.scr.txt b/board/wandboard/boot.scr.txt
deleted file mode 100644
index 7a8aa4bd54..0000000000
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
index ad4a6a55d5..0000000000
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
index 6ddc113702..0000000000
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
index 0000000000..e3b90660c0
--- /dev/null
+++ b/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-wandboard Buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate} 
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 7915248cf1..37628ea403 100644
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
