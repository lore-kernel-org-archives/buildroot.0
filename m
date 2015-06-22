From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 Jun 2015 16:39:12 +0200
Subject: [Buildroot] [V3 2/2] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <1434983952-7662-1-git-send-email-francois.perrad@gadz.org>
References: <1434983952-7662-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1434983952-7662-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

config mali / sunxi

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino_lime/boot-mali.cmd    |  5 +++
 board/olimex/a20_olinuxino_lime/post-build.sh    |  4 ++
 board/olimex/a20_olinuxino_lime/readme.txt       | 16 +++++++-
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 47 ++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 board/olimex/a20_olinuxino_lime/boot-mali.cmd
 create mode 100644 configs/olimex_a20_olinuxino_lime_mali_defconfig

diff --git a/board/olimex/a20_olinuxino_lime/boot-mali.cmd b/board/olimex/a20_olinuxino_lime/boot-mali.cmd
new file mode 100644
index 0000000..4e3cdc7
--- /dev/null
+++ b/board/olimex/a20_olinuxino_lime/boot-mali.cmd
@@ -0,0 +1,5 @@
+setenv bootm_boot_mode sec
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x43000000 /boot/script.bin
+ext4load mmc 0 0x48000000 /boot/zImage
+bootz 0x48000000
diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino_lime/post-build.sh
index 4e6fbec..ac8d4df 100755
--- a/board/olimex/a20_olinuxino_lime/post-build.sh
+++ b/board/olimex/a20_olinuxino_lime/post-build.sh
@@ -6,3 +6,7 @@
 MKIMAGE=$HOST_DIR/usr/bin/mkimage
 
 $MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
+
+if [ -e $BINARIES_DIR/script.bin ]; then
+	cp $BINARIES_DIR/script.bin $3/script.bin
+fi
diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
index 3fc9c02..92ee24a 100644
--- a/board/olimex/a20_olinuxino_lime/readme.txt
+++ b/board/olimex/a20_olinuxino_lime/readme.txt
@@ -6,11 +6,24 @@ Intro
 This is a open hardware board,
 see https://www.olimex.com/Products/OLinuXino/open-source-hardware
 
+The legacy linux-sunxi kernels are based on the vendor code drops.
+It is only useful when accelerated 3D graphics and multimedia support
+is strictly necessary.
+
+The Mainline Kernel is already a much better choice for a headless server.
+And also the mainline kernel works fine even for a basic Linux desktop
+system running on top of a simple framebuffer, which may be good enough for
+the users who do not need fancy 3D graphics or video playback acceleration.
+
 How to build it
 ===============
 
     $ make olimex_a20_olinuxino_lime_defconfig
 
+or
+
+    $ make olimex_a20_olinuxino_lime_mali_defconfig
+
 Compile everything and build the rootfs image:
 
     $ make
@@ -23,7 +36,8 @@ After building, you should get a tree like this:
     output/images/
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
-    +-- sun7i-a20-olinuxino-lime.dtb
+    +-- script.bin (mali)
+    +-- sun7i-a20-olinuxino-lime.dtb (mainline)
     +-- u-boot.bin
     +-- u-boot-sunxi-with-spl.bin
     `-- zImage
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
new file mode 100644
index 0000000..a515ded
--- /dev/null
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Kernel headers
+BR2_KERNEL_HEADERS_3_4=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot-mali.cmd $(TARGET_DIR)/boot"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# sunxi packages
+BR2_PACKAGE_SUNXI_TOOLS=y
+BR2_PACKAGE_SUNXI_BOARDS=y
+BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Additional tools
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.1.4
