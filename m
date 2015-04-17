From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 17 Apr 2015 17:20:44 -0400
Subject: [Buildroot] [PATCH] board/wandboard: add a genimage config
Message-ID: <1429305644-9284-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a genimage config file and a post-image script for the
Wandboard, to generate a medium image "sdcard.img", ready to be booted.
The image contains the layout explained in the board readme.txt file:
U-Boot, its environment, and an Ext2 rootfs partition.

The defconfig has been slightly changed to enable this feature. Also
lighten the readme file since the config file is documented and simpler.

Tested on a Wandboard Solo.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/wandboard/genimage.cfg  | 32 ++++++++++++++++++++++++++++++++
 board/wandboard/post-image.sh | 15 +++++++++++++++
 board/wandboard/readme.txt    | 41 +++++++++--------------------------------
 configs/wandboard_defconfig   |  2 ++
 4 files changed, 58 insertions(+), 32 deletions(-)
 create mode 100644 board/wandboard/genimage.cfg
 create mode 100755 board/wandboard/post-image.sh

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
new file mode 100644
index 0000000..24c4049
--- /dev/null
+++ b/board/wandboard/genimage.cfg
@@ -0,0 +1,32 @@
+# Minimal SD card image for the Wandboard
+#
+# The SD card must have at least 1 MB free at the beginning.
+# U-Boot and its environment are dumped as is.
+# A single root filesystem partition is required (Ext2 in this case).
+#
+# For details about the layout, see:
+# http://wiki.wandboard.org/index.php/Boot-process
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition u-boot-env {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 393216
+    size = 8192
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+    size = 512M
+  }
+}
diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
new file mode 100755
index 0000000..8d224c9
--- /dev/null
+++ b/board/wandboard/post-image.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+GENIMAGE_CFG="board/wandboard/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/.genimage_tmp"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+RET=${?}
+rm -rf "${GENIMAGE_TMP}"
+exit ${RET}
diff --git a/board/wandboard/readme.txt b/board/wandboard/readme.txt
index 4dd9c2c..adc4e5c 100644
--- a/board/wandboard/readme.txt
+++ b/board/wandboard/readme.txt
@@ -1,37 +1,14 @@
-Minimal board support for the Wandboard
+Wandboard
 
-Wandboard's homepage is here: http://www.wandboard.org/
+http://www.wandboard.org
 
-This config is only tested with the dual core wandboard.
+To build a minimal support for this board:
 
-Installing:
+    $ make wandboard_defconfig
+    $ make
 
-You need a micro SD card and a slot/adapter for your development machine.
-
-Partition the SD card leaving at least 1 MB in front of the first partition.
-
-Partition layout (example):
-
-Disk /dev/sdi: 3965 MB, 3965190144 bytes
-255 heads, 63 sectors/track, 482 cylinders
-Units = cylinders of 16065 * 512 = 8225280 bytes
-Sector size (logical/physical): 512 bytes / 512 bytes
-I/O size (minimum/optimal): 512 bytes / 512 bytes
-Disk identifier: 0x77b47445
-
-   Device Boot      Start         End      Blocks   Id  System
-/dev/sdi1               2         482     3863632+  83  Linux
-
-Copy u-boot and its environment to the SD card:
-sudo dd if=output/images/u-boot.imx bs=512 seek=2 of=/dev/sd<x>
-sudo dd if=output/images/uboot-env.bin bs=512 seek=768 of=/dev/sd<x>
-
-Copy the root filesystem:
-sudo dd if=output/images/rootfs.ext2 of=/dev/sd<x>1
-
-Alternative commands to copy root filesystem:
-sudo mkfs.ext4 /dev/sd<x>1
-sudo mount /dev/sd<x>1 /mnt
-sudo tar xf output/images/rootfs.tar -C /mnt
-sudo umount /mnt
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on an SD card.
 
+For details about the medium image layout, see the definition in
+board/wandboard/genimage.cfg.
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 0a6ba50..5d74fc3 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -4,6 +4,8 @@ BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.0.101"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.3.5
