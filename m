From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Jul 2017 21:37:03 +0200
Subject: [Buildroot] [PATCH 1/2] olimex_a20: refactor with U-Boot boot script
Message-ID: <20170701193704.12792-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/post-build.sh         | 10 +++-------
 configs/olimex_a20_olinuxino_lime2_defconfig     |  3 ++-
 configs/olimex_a20_olinuxino_lime_defconfig      |  3 ++-
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  3 ++-
 configs/olimex_a20_olinuxino_micro_defconfig     |  3 ++-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
index ac8d4df184..7a8a427466 100755
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ b/board/olimex/a20_olinuxino/post-build.sh
@@ -1,12 +1,8 @@
 #!/bin/sh
-# args from BR2_ROOTFS_POST_SCRIPT_ARGS
-# $2    path of boot.cmd
-# $3    output directory for boot.scr
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
-
-$MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
 
 if [ -e $BINARIES_DIR/script.bin ]; then
-	cp $BINARIES_DIR/script.bin $3/script.bin
+	# mali requires a legacy kernel
+	cp $BINARIES_DIR/script.bin $TARGET_DIR/boot/script.bin
 fi
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 807f41c5ce..c7526fe817 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -30,5 +30,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index c92b016f68..275b9b7687 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -40,7 +40,8 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index 6345635e0e..2aaf708962 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -47,7 +47,8 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot-mali.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 17fe6cf388..6472af480a 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -37,7 +37,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.11.0
