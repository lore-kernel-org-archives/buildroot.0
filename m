From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jun 2015 12:06:56 +0200
Subject: [Buildroot] [V4 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
References: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

config device tree / mainline (4.0.5)

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino_lime/boot.cmd      |  5 ++
 board/olimex/a20_olinuxino_lime/post-build.sh |  8 +++
 board/olimex/a20_olinuxino_lime/readme.txt    | 86 +++++++++++++++++++++++++++
 configs/olimex_a20_olinuxino_lime_defconfig   | 45 ++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
 create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
 create mode 100644 configs/olimex_a20_olinuxino_lime_defconfig

diff --git a/board/olimex/a20_olinuxino_lime/boot.cmd b/board/olimex/a20_olinuxino_lime/boot.cmd
new file mode 100644
index 0000000..44d9239
--- /dev/null
+++ b/board/olimex/a20_olinuxino_lime/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino_lime/post-build.sh
new file mode 100755
index 0000000..4e6fbec
--- /dev/null
+++ b/board/olimex/a20_olinuxino_lime/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $2    path of boot.cmd
+# $3    output directory for boot.scr
+
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+
+$MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
new file mode 100644
index 0000000..3fc9c02
--- /dev/null
+++ b/board/olimex/a20_olinuxino_lime/readme.txt
@@ -0,0 +1,86 @@
+A20-OLinuXino-LIME
+
+Intro
+=====
+
+This is a open hardware board,
+see https://www.olimex.com/Products/OLinuXino/open-source-hardware
+
+How to build it
+===============
+
+    $ make olimex_a20_olinuxino_lime_defconfig
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
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sun7i-a20-olinuxino-lime.dtb
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+
+How to write the SD card
+========================
+
+
+Prepare the SD card
+-------------------
+
+Erase existing stuff, and create an unique Linux partition with `fdisk`.
+
+    # fdisk /dev/sdX
+    Command (m for help): o
+    Building a new DOS disklabel with disk identifier 0xf9e1616a.
+    Changes will remain in memory only, until you decide to write them.
+    After that, of course, the previous content won't be recoverable.
+
+    Command (m for help): n
+    Partition type:
+        p   primary (0 primary, 0 extended, 4 free)
+        e   extended
+    Select (default p): p
+    Partition number (1-4, default 1): 1
+    First sector (2048-7626751, default 2048): 2048
+    Last sector, +sectors or +size{K,M,G} (2048-7626751, default 7626751): 
+    Using default value 7626751
+
+    Command (m for help): p
+
+    Disk /dev/sdX: 3904 MB, 3904897024 bytes
+    4 heads, 16 sectors/track, 119168 cylinders, total 7626752 sectors
+    Units = sectors of 1 * 512 = 512 bytes
+    Sector size (logical/physical): 512 bytes / 512 bytes
+    I/O size (minimum/optimal): 512 bytes / 512 bytes
+    Disk identifier: 0xf9e1616a
+
+            Device Boot      Start         End      Blocks   Id  System
+    /dev/sdX1                 2048     7626751     3812352   83  Linux
+
+    Command (m for help): w
+    The partition table has been altered!
+
+    Calling ioctl() to re-read partition table.
+    Syncing disks.
+
+Copy images on the SD card
+--------------------------
+
+    # dd if=output/images/rootfs.ext2 of=/dev/sdX1
+    # dd if=output/images/u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1024 seek=8
+
+
+Finish
+======
+
+Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
+
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
new file mode 100644
index 0000000..62f0a4c
--- /dev/null
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+
+# Lock to 4.0 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.0.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot.cmd $(TARGET_DIR)/boot"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0.5"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.04"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Additional tools
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.1.4
