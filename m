From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu,  5 Jul 2018 10:25:59 +0300
Subject: [Buildroot] [PATCH] configs/olimex_a10_olinuxino_lime_defconfig:
 new board
Message-ID: <1530775559-19415-1-git-send-email-leon.anavi@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
of the A20-OLinuXino-Lime and A13-OLinuXino files.

The configurations for Olimex A10-OLinuXino-LIME feature:
- U-Boot 2018.03
- Mainline Linux kernel 4.14.26

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 DEVELOPERS                                  |  4 ++
 board/olimex/a10_olinuxino/boot.cmd         |  5 +++
 board/olimex/a10_olinuxino/genimage.cfg     | 17 +++++++++
 board/olimex/a10_olinuxino/post-build.sh    |  3 ++
 board/olimex/a10_olinuxino/readme.txt       | 57 +++++++++++++++++++++++++++++
 configs/olimex_a10_olinuxino_lime_defconfig | 48 ++++++++++++++++++++++++
 6 files changed, 134 insertions(+)
 create mode 100644 board/olimex/a10_olinuxino/boot.cmd
 create mode 100644 board/olimex/a10_olinuxino/genimage.cfg
 create mode 100755 board/olimex/a10_olinuxino/post-build.sh
 create mode 100644 board/olimex/a10_olinuxino/readme.txt
 create mode 100644 configs/olimex_a10_olinuxino_lime_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fa0020..40baa7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2146,3 +2146,7 @@ F:	package/tinc/
 
 N:	Pierre Ducroquet <pinaraf@pinaraf.info>
 F:	package/kf5/
+
+N:	Leon Anavi <leon.anavi@konsulko.com>
+F:	board/olimex/a10_olinuxino
+F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
new file mode 100644
index 0000000..44d9239
--- /dev/null
+++ b/board/olimex/a10_olinuxino/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a10_olinuxino/genimage.cfg b/board/olimex/a10_olinuxino/genimage.cfg
new file mode 100644
index 0000000..fc2f7f8
--- /dev/null
+++ b/board/olimex/a10_olinuxino/genimage.cfg
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
new file mode 100755
index 0000000..d3f612f
--- /dev/null
+++ b/board/olimex/a10_olinuxino/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a10_olinuxino/readme.txt b/board/olimex/a10_olinuxino/readme.txt
new file mode 100644
index 0000000..ba4bf69
--- /dev/null
+++ b/board/olimex/a10_olinuxino/readme.txt
@@ -0,0 +1,57 @@
+A10-OLinuXino-LIME
+
+Intro
+=====
+
+These are open hardware boards, all based on the Allwinner A10 SoC.
+
+for more details about the boards see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/open-source-hardware
+ - https://www.olimex.com/Products/OLinuXino/A10/A10-OLinuXino-LIME/
+
+The following defconfigs are available:
+ - olimex_a10_olinuxino_lime_defconfig
+   for the A10-OLinuXino-LIME board using mainline kernel
+
+(see http://linux-sunxi.org/Linux_Kernel for more details)
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make <board>_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- boot.scr
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- sun4i-a10-olinuxino-lime.dtb (lime, mainline)
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+Eject the SD card, insert it in the A10-OLinuXino board, and power it up.
+
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
new file mode 100644
index 0000000..0b975b0
--- /dev/null
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -0,0 +1,48 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+#BR2_ARM_EABIHF=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="a10-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a10_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.26"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-olinuxino-lime"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
