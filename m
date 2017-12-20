From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 18:43:17 +0100
Subject: [Buildroot] [git commit] board: Add SoPine support
Message-ID: <20171220175918.4F41C835AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83d7a37be17420facad04134b61c919e591906f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for SoPine board
with below features:
- U-Boot 2017.11
- Linux 4.14
- Default packages from buildroot

Cc: TL Lim <tllim@pine64.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                   |  1 +
 DEVELOPERS                       |  1 +
 board/pine64/sopine/boot.cmd     |  6 +++++
 board/pine64/sopine/genimage.cfg | 39 +++++++++++++++++++++++++++++++++
 board/pine64/sopine/readme.txt   | 38 ++++++++++++++++++++++++++++++++
 configs/pine64_sopine_defconfig  | 47 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 132 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a39389c..820a070 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -171,6 +171,7 @@ pandaboard_defconfig: *defconfig
 pc_x86_64_bios_defconfig: *defconfig
 pc_x86_64_efi_defconfig: *defconfig
 pine64_defconfig: *defconfig
+pine64_sopine_defconfig: *defconfig
 qemu_aarch64_virt_defconfig: *defconfig
 qemu_arm_versatile_defconfig: *defconfig
 qemu_arm_versatile_nommu_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index d90c30d..74dd62f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -776,6 +776,7 @@ F:	board/pine64/
 F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
 F:	configs/pine64_defconfig
+F:	configs/pine64_sopine_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
diff --git a/board/pine64/sopine/boot.cmd b/board/pine64/sopine/boot.cmd
new file mode 100644
index 0000000..2eab642
--- /dev/null
+++ b/board/pine64/sopine/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-sopine-baseboard.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/pine64/sopine/genimage.cfg b/board/pine64/sopine/genimage.cfg
new file mode 100644
index 0000000..02ebe7a
--- /dev/null
+++ b/board/pine64/sopine/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-sopine-baseboard.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "sunxi-spl.bin"
+		offset = 8192
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 40K
+		size = 1M # 1MB - 40K
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
+	}
+}
diff --git a/board/pine64/sopine/readme.txt b/board/pine64/sopine/readme.txt
new file mode 100644
index 0000000..08cb380
--- /dev/null
+++ b/board/pine64/sopine/readme.txt
@@ -0,0 +1,38 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the SoPine. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+SoPINE link:
+https://www.pine64.org/?page_id=1491
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/SoPine
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make pine64_sopine_defconfig
+
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
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
+  $ sudo sync
+
+Insert the micro SDcard in your SoPine and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
new file mode 100644
index 0000000..b076681
--- /dev/null
+++ b/configs/pine64_sopine_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sopine_baseboard"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-sopine-baseboard"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64 SOPINE"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/sopine/genimage.cfg"
