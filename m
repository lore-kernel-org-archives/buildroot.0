From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:13:41 +0100
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime_legacy:
 remove defconfig
Message-ID: <20190315221544.327F981481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8637d1a274faa46af28ae6e478046ef71c6b9cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old 3.4 Linux kernel used by this defconfig doesn't build with gcc
7.x.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 -
 board/olimex/a20_olinuxino/boot-legacy.cmd         |  5 --
 board/olimex/a20_olinuxino/post-build.sh           |  5 --
 board/olimex/a20_olinuxino/readme.txt              |  7 ---
 configs/olimex_a20_olinuxino_lime_legacy_defconfig | 56 ----------------------
 5 files changed, 74 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0bec55c19f..28feeef2ef 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -186,7 +186,6 @@ olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
 olimex_a13_olinuxino_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_lime2_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_lime_defconfig: { extends: .defconfig }
-olimex_a20_olinuxino_lime_legacy_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_micro_defconfig: { extends: .defconfig }
 olimex_a64_olinuxino_defconfig: { extends: .defconfig }
 olimex_imx233_olinuxino_defconfig: { extends: .defconfig }
diff --git a/board/olimex/a20_olinuxino/boot-legacy.cmd b/board/olimex/a20_olinuxino/boot-legacy.cmd
deleted file mode 100644
index 9fa5d65418..0000000000
--- a/board/olimex/a20_olinuxino/boot-legacy.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootm_boot_mode sec
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve=16 consoleblank=0 ${extra}
-ext4load mmc 0 0x43000000 /boot/script.bin
-ext4load mmc 0 0x48000000 /boot/zImage
-bootz 0x48000000
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
index 7a8a427466..d3f612f811 100755
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ b/board/olimex/a20_olinuxino/post-build.sh
@@ -1,8 +1,3 @@
 #!/bin/sh
 
 cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
-
-if [ -e $BINARIES_DIR/script.bin ]; then
-	# mali requires a legacy kernel
-	cp $BINARIES_DIR/script.bin $TARGET_DIR/boot/script.bin
-fi
diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 57ee23d147..504483b513 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -16,15 +16,9 @@ The following defconfigs are available:
    for the A20-OLinuXino-MICRO board using mainline kernel
  - olimex_a20_olinuxino_lime_defconfig
    for the A20-OLinuXino-LIME board using mainline kernel
- - olimex_a20_olinuxino_lime_legacy_defconfig
-   for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel
  - olimex_a20_olinuxino_lime2_defconfig
    for the A20-OLinuXino-LIME2 board using mainline kernel
 
-The legacy linux-sunxi kernels are based on the vendor code drops.
-They are only useful when accelerated 3D graphics and multimedia support
-is strictly necessary.
-
 The Mainline Kernel is already a much better choice for a headless server.
 And also the mainline kernel works fine even for a basic Linux desktop
 system running on top of a simple framebuffer, which may be good enough for
@@ -51,7 +45,6 @@ After building, you should get a tree like this:
     output/images/
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
-    +-- script.bin (lime_legacy)
     +-- sdcard.img
     +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
     +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
diff --git a/configs/olimex_a20_olinuxino_lime_legacy_defconfig b/configs/olimex_a20_olinuxino_lime_legacy_defconfig
deleted file mode 100644
index 2c33f05e56..0000000000
--- a/configs/olimex_a20_olinuxino_lime_legacy_defconfig
+++ /dev/null
@@ -1,56 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_EABIHF=y
-
-# The old 3.4 kernel doesn't build with gcc >= 7.x
-BR2_GCC_VERSION_6_X=y
-
-# Linux headers same as kernel, a 3.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
-
-# System configuration
-BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
-BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
-
-# Kernel, based on Linux version 3.4.113
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,dan-and,linux-sunxi,fc385cc6dfa350382ecc94a520a716b57e654410)/linux-fc385cc6dfa350382ecc94a520a716b57e654410.tar.gz"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-
-# sunxi packages
-BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_BOARDS=y
-BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
-BR2_PACKAGE_SUNXI_MALI=y
-BR2_PACKAGE_SUNXI_MALI_DBG=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_BIN=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot-legacy.cmd"
-
-# Additional tools
-BR2_PACKAGE_HOST_GENIMAGE=y
