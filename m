From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:43:15 +0100
Subject: [Buildroot] [git commit branch/next] olimex_a20_olinuxino_micro:
	update to use genimage
Message-ID: <20160224224623.C60F280462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=316215a746f59f9ffcbc39d3a1475f432e02dd27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/olimex/a20_olinuxino/genimage.cfg      | 16 ++++++++++++++++
 board/olimex/a20_olinuxino/post-image.sh     | 16 ++++++++++++++++
 board/olimex/a20_olinuxino/readme.txt        | 17 +++++++++++++++--
 configs/olimex_a20_olinuxino_micro_defconfig |  2 ++
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
new file mode 100644
index 0000000..8ea24cc
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
index 0000000..9cca1b1
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
index 485bf56..febfbe7 100644
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
index f84da34..3574a75 100644
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
