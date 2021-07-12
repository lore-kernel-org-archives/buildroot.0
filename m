From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Jul 2021 13:27:03 -0300
Subject: [Buildroot] [RFC] board/mx6cubox: Switch to extlinux.conf
Message-ID: <20210712162703.2937572-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently mx6cubox uses a custom boot.scr.txt script
and custom image generation scripts: genimage.cfg, post-build.sh
and post-image.sh.

Switch to using the more standard extlinux.conf solution
and remove the custom scripts in favor of the standard
board/freescale/common/imx/post-image.sh one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Francois,

I don't have access to a mx6cubox to try this.

Is it possible for you to test this patch, please?

Thanks

 board/solidrun/mx6cubox/boot.scr.txt          |  7 -----
 board/solidrun/mx6cubox/genimage.cfg          | 29 -------------------
 board/solidrun/mx6cubox/post-build.sh         |  8 -----
 board/solidrun/mx6cubox/post-image.sh         | 14 ---------
 .../boot/extlinux/extlinux.conf               |  4 +++
 configs/mx6cubox_defconfig                    |  4 +--
 6 files changed, 6 insertions(+), 60 deletions(-)
 delete mode 100644 board/solidrun/mx6cubox/boot.scr.txt
 delete mode 100644 board/solidrun/mx6cubox/genimage.cfg
 delete mode 100755 board/solidrun/mx6cubox/post-build.sh
 delete mode 100755 board/solidrun/mx6cubox/post-image.sh
 create mode 100644 board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/solidrun/mx6cubox/boot.scr.txt b/board/solidrun/mx6cubox/boot.scr.txt
deleted file mode 100644
index e4cf8147837d..000000000000
--- a/board/solidrun/mx6cubox/boot.scr.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv finduuid "part uuid mmc 1:1 uuid"
-run finduuid
-run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 1:1 ${fdt_addr} boot/${fdtfile}
-load mmc 1:1 ${loadaddr} boot/zImage
-bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/solidrun/mx6cubox/genimage.cfg b/board/solidrun/mx6cubox/genimage.cfg
deleted file mode 100644
index 490986ac8674..000000000000
--- a/board/solidrun/mx6cubox/genimage.cfg
+++ /dev/null
@@ -1,29 +0,0 @@
-# Minimal SD card image for the MX6 Cubox/Hummingboard
-#
-# U-Boot SPL and u-boot.img are flashed in the first 1MB raw partition.
-# A single root filesystem partition is used (Ext4 in this case).
-#
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition spl {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.img"
-		offset = 69K
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		offset = 1M
-		size = 512M
-	}
-}
diff --git a/board/solidrun/mx6cubox/post-build.sh b/board/solidrun/mx6cubox/post-build.sh
deleted file mode 100755
index 6ddc1137022d..000000000000
--- a/board/solidrun/mx6cubox/post-build.sh
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
diff --git a/board/solidrun/mx6cubox/post-image.sh b/board/solidrun/mx6cubox/post-image.sh
deleted file mode 100755
index b4ac4608ffa4..000000000000
--- a/board/solidrun/mx6cubox/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
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
diff --git a/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf b/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..d01106635742
--- /dev/null
+++ b/board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-cubox Buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate} 
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index ae2353582461..93838378b120 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -11,8 +11,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/mx6cubox/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/mx6cubox/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.25.1
