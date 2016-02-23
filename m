From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 01:24:30 +0100
Subject: [Buildroot] [PATCH 6/9] olimex_a20_olinuxino_micro: update to use
	genimage
In-Reply-To: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456187073-2876-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/olimex/a20_olinuxino/genimage.cfg      | 16 ++++++++++++++++
 board/olimex/a20_olinuxino/post-image.sh     | 16 ++++++++++++++++
 board/olimex/a20_olinuxino/readme.txt        | 17 +++++++++++++++--
 configs/olimex_a20_olinuxino_micro_defconfig |  2 ++
 4 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 board/olimex/a20_olinuxino/genimage.cfg
 create mode 100755 board/olimex/a20_olinuxino/post-image.sh

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
new file mode 100644
index 000000000000..8ea24ccab8f3
--- /dev/null
+++ b/board/olimex/a20_olinuxino/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/olimex/a20_olinuxino/post-image.sh b/board/olimex/a20_olinuxino/post-image.sh
new file mode 100755
index 000000000000..9cca1b1789ec
--- /dev/null
+++ b/board/olimex/a20_olinuxino/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index ab7ab1ec2426..feba9daefc6f 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -52,6 +52,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
     +-- script.bin (lime_mali)
+    +-- sdcard.img (micro)
     +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
     +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
     +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
@@ -60,8 +61,20 @@ After building, you should get a tree like this:
     `-- zImage
 
 
-How to write the SD card
-========================
+How to write the SD card - boards with sdcard.img
+=================================================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+
+How to write the SD card - other boards
+=======================================
 
 
 Prepare the SD card
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index f84da343eb8c..3574a75baf49 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 
 # Kernel
@@ -39,4 +40,5 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.9.1
