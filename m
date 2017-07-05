From: Chakra Divi <2chakrass@gmail.com>
Date: Wed,  5 Jul 2017 21:34:15 +0530
Subject: [Buildroot] [PATCH v3] board: Add nanopi-m1 Support
Message-ID: <1499270655-2781-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for nanopi-m1 board
with below features
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
Changes for v2:
- created a new vendor folder friendlyarm
- moved nanopi-m1 board changes to friendlyarm
- modified kernel version from 4.11 to 4.11.5
- used genimage.sh instead of post-image.sh
- deleted nanopi folder

Changes for v3:
- Modified defconfig to use BR2_TARGET_UBOOT_BOOT_SCRIPT
- Deleted post-build.sh

 .gitlab-ci.yml                           |   26 +-----------------
 DEVELOPERS                               |    2 ++
 board/friendlyarm/nanopi-m1/boot.cmd     |    8 ++++++
 board/friendlyarm/nanopi-m1/genimage.cfg |   36 +++++++++++++++++++++++++
 board/friendlyarm/nanopi-m1/readme.txt   |   29 ++++++++++++++++++++
 configs/nanopi_m1_defconfig              |   43 ++++++++++++++++++++++++++++++
 6 files changed, 119 insertions(+), 25 deletions(-)
 create mode 100644 board/friendlyarm/nanopi-m1/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-m1/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-m1/readme.txt
 create mode 100644 configs/nanopi_m1_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ae7e5d..bbc5bb8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,6 +127,7 @@ mx53loco_defconfig: *defconfig
 mx6cubox_defconfig: *defconfig
 mx6sx_udoo_neo_defconfig: *defconfig
 mx6udoo_defconfig: *defconfig
+nanopi_m1_defconfig: *defconfig
 nanopi_neo_defconfig: *defconfig
 nexbox_a95x_defconfig: *defconfig
 nitrogen6sx_defconfig: *defconfig
@@ -205,28 +206,3 @@ zynq_microzed_defconfig: *defconfig
 zynq_zc706_defconfig: *defconfig
 zynq_zed_defconfig: *defconfig
 zynq_zybo_defconfig: *defconfig
-tests.core.test_post_scripts.TestPostScripts: *runtime_test
-tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
-tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
-tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
-tests.core.test_timezone.TestNoTimezone: *runtime_test
-tests.fs.test_ext.TestExt2: *runtime_test
-tests.fs.test_ext.TestExt2r1: *runtime_test
-tests.fs.test_ext.TestExt3: *runtime_test
-tests.fs.test_ext.TestExt4: *runtime_test
-tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
-tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
-tests.fs.test_iso9660.TestIso9660GrubExternal: *runtime_test
-tests.fs.test_iso9660.TestIso9660GrubInternal: *runtime_test
-tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
-tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
-tests.fs.test_jffs2.TestJffs2: *runtime_test
-tests.fs.test_squashfs.TestSquashfs: *runtime_test
-tests.fs.test_ubi.TestUbi: *runtime_test
-tests.fs.test_yaffs2.TestYaffs2: *runtime_test
-tests.package.test_dropbear.TestDropbear: *runtime_test
-tests.package.test_python.TestPythonBase: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: *runtime_test
diff --git a/DEVELOPERS b/DEVELOPERS
index 9539d3e..ffc8a23 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,8 +343,10 @@ F:	package/libsvg/
 F:	package/libsvg-cairo/
 
 N:	Chakra Divi <chakra@openedev.com>
+F:	board/friendlyarm/nanopi-m1
 F:	board/olimex/a13_olinuxino
 F:	board/orangepi/orangepi-plus
+F:	configs/nanopi_m1_defconfig	
 F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
diff --git a/board/friendlyarm/nanopi-m1/boot.cmd b/board/friendlyarm/nanopi-m1/boot.cmd
new file mode 100644
index 0000000..b4d612e
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-m1.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-m1/genimage.cfg b/board/friendlyarm/nanopi-m1/genimage.cfg
new file mode 100644
index 0000000..23c9c7d
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the NanoPi M1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-m1.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
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
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/friendlyarm/nanopi-m1/readme.txt b/board/friendlyarm/nanopi-m1/readme.txt
new file mode 100644
index 0000000..8b10e4b
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/readme.txt
@@ -0,0 +1,29 @@
+NanoPi M1
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi M1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nanopi_m1_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
new file mode 100644
index 0000000..d00a9b8
--- /dev/null
+++ b/configs/nanopi_m1_defconfig
@@ -0,0 +1,43 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1/genimage.cfg"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.7.9.5
