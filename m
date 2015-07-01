From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  1 Jul 2015 12:48:07 +0200
Subject: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino_micro: new board
Message-ID: <1435747687-7412-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a defconfig for the Olimex A20-OLinuXino-Micro board, reusing most
of the A20-OLinuXino-Lime files.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changed v1 -> v2:
 - remove useless reference to U-Boot in the defconfig list (suggested by
   Fran?ois Perrad)
---
 board/olimex/a20_olinuxino/readme.txt        | 31 +++++++++++++------
 configs/olimex_a20_olinuxino_micro_defconfig | 46 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 10 deletions(-)
 create mode 100644 configs/olimex_a20_olinuxino_micro_defconfig

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 6b83914..7e9af84 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -1,10 +1,22 @@
-A20-OLinuXino-LIME
+A20-OLinuXino-LIME and A20-OLinuXino-MICRO
 
 Intro
 =====
 
-This is a open hardware board,
-see https://www.olimex.com/Products/OLinuXino/open-source-hardware
+These are open hardware boards, both based an the AllWinners A20 SoC.
+
+for more details about the boards see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/open-source-hardware
+ - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/
+ - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/
+
+The following defconfigs are available:
+ - olimex_a20_olinuxino_micro_defconfig
+   for the A20-OLinuXino-MICRO board using mainline kernel
+ - olimex_a20_olinuxino_lime_defconfig
+   for the A20-OLinuXino-LIME board using mainline kernel
+ - olimex_a20_olinuxino_lime_mali_defconfig
+   for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel
 
 The legacy linux-sunxi kernels are based on the vendor code drops.
 They are only useful when accelerated 3D graphics and multimedia support
@@ -20,11 +32,9 @@ the users who do not need fancy 3D graphics or video playback acceleration.
 How to build it
 ===============
 
-    $ make olimex_a20_olinuxino_lime_defconfig
-
-or
+Configure Buildroot:
 
-    $ make olimex_a20_olinuxino_lime_mali_defconfig
+    $ make <board>_defconfig
 
 Compile everything and build the rootfs image:
 
@@ -38,8 +48,9 @@ After building, you should get a tree like this:
     output/images/
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
-    +-- script.bin (mali)
-    +-- sun7i-a20-olinuxino-lime.dtb (mainline)
+    +-- script.bin (lime_mali)
+    +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
+    +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
     +-- u-boot.bin
     +-- u-boot-sunxi-with-spl.bin
     `-- zImage
@@ -98,5 +109,5 @@ Copy images on the SD card
 Finish
 ======
 
-Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
+Eject the SD card, insert it in the A20-OLinuXino board, and power it up.
 
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
new file mode 100644
index 0000000..23dd0f0
--- /dev/null
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -0,0 +1,46 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
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
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0.5"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino_MICRO"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.04"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Additional tools
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.9.1
