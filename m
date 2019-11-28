From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Thu, 28 Nov 2019 22:09:21 +0100
Subject: [Buildroot] [PATCH 1/1] configs/friendlyarm_nanopi_neo_plus2: use
 an extlinux instead of boot.cmd
Message-ID: <20191128210921.5737-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This remove the file boot.cmd to use an extlinux.conf instead.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 board/friendlyarm/nanopi-neo-plus2/boot.cmd      | 6 ------
 board/friendlyarm/nanopi-neo-plus2/extlinux.conf | 4 ++++
 board/friendlyarm/nanopi-neo-plus2/genimage.cfg  | 2 +-
 board/friendlyarm/nanopi-neo-plus2/post-build.sh | 4 ++++
 configs/friendlyarm_nanopi_neo_plus2_defconfig   | 3 +--
 5 files changed, 10 insertions(+), 9 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-neo-plus2/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/extlinux.conf
 create mode 100755 board/friendlyarm/nanopi-neo-plus2/post-build.sh

diff --git a/board/friendlyarm/nanopi-neo-plus2/boot.cmd b/board/friendlyarm/nanopi-neo-plus2/boot.cmd
deleted file mode 100644
index 227604a23d..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-nanopi-neo-plus2.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-neo-plus2/extlinux.conf b/board/friendlyarm/nanopi-neo-plus2/extlinux.conf
new file mode 100644
index 0000000000..fcb6f632c1
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /sun50i-h5-nanopi-neo-plus2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
index a4c2a7a894..fb871abd43 100644
--- a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
@@ -3,7 +3,7 @@ image boot.vfat {
 		files = {
 			"Image",
 			"sun50i-h5-nanopi-neo-plus2.dtb",
-			"boot.scr"
+			"extlinux"
 		}
 	}
 	size = 64M
diff --git a/board/friendlyarm/nanopi-neo-plus2/post-build.sh b/board/friendlyarm/nanopi-neo-plus2/post-build.sh
new file mode 100755
index 0000000000..ec20fca7d9
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/configs/friendlyarm_nanopi_neo_plus2_defconfig b/configs/friendlyarm_nanopi_neo_plus2_defconfig
index c807b3100b..461e468cb6 100644
--- a/configs/friendlyarm_nanopi_neo_plus2_defconfig
+++ b/configs/friendlyarm_nanopi_neo_plus2_defconfig
@@ -27,8 +27,6 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo-plus2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -49,6 +47,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo-plus2/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo-plus2/post-build.sh"
 
 # wireless firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.24.0
