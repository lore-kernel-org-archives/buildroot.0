From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 21:12:04 +0200
Subject: [Buildroot] [git commit] config: add defconfig for orangepi-r1
Message-ID: <20190505190727.9C7FA813E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7d82a318b1d3f34257dd5fc5f3d84a83d4c3c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Very similar to orangepi-zero, except that the board has a 16MB SPI flash, a
2nd ethernet port is provided through a Realtek RTL8152 and wifi is provided
through a Realtek RTL8189FTV (no mainline driver, not supported).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                 |  1 +
 DEVELOPERS                                     |  1 +
 board/orangepi/orangepi-r1/boot.cmd            |  8 ++++++
 board/orangepi/orangepi-r1/genimage.cfg        | 36 ++++++++++++++++++++++++
 board/orangepi/orangepi-r1/linux-extras.config | 11 ++++++++
 board/orangepi/orangepi-r1/readme.txt          | 29 ++++++++++++++++++++
 configs/orangepi_r1_defconfig                  | 38 ++++++++++++++++++++++++++
 7 files changed, 124 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 558676709f..374dbfe837 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -235,6 +235,7 @@ orangepi_pc_defconfig: { extends: .defconfig }
 orangepi_pc_plus_defconfig: { extends: .defconfig }
 orangepi_plus_defconfig: { extends: .defconfig }
 orangepi_prime_defconfig: { extends: .defconfig }
+orangepi_r1_defconfig: { extends: .defconfig }
 orangepi_win_defconfig: { extends: .defconfig }
 orangepi_zero_defconfig: { extends: .defconfig }
 orangepi_zero_plus2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 6ccb0afaf6..95ebfcbeea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1737,6 +1737,7 @@ F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
 F:	configs/openblocks_a6_defconfig
 F:	configs/orangepi_pc_defconfig
+F:	configs/orangepi_r1_defconfig
 F:	configs/pandaboard_defconfig
 F:	configs/roseapplepi_defconfig
 F:	configs/sheevaplug_defconfig
diff --git a/board/orangepi/orangepi-r1/boot.cmd b/board/orangepi/orangepi-r1/boot.cmd
new file mode 100644
index 0000000000..e927b01e82
--- /dev/null
+++ b/board/orangepi/orangepi-r1/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-r1.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
new file mode 100644
index 0000000000..01e2c0adc4
--- /dev/null
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi R1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h2-plus-orangepi-r1.dtb",
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
diff --git a/board/orangepi/orangepi-r1/linux-extras.config b/board/orangepi/orangepi-r1/linux-extras.config
new file mode 100644
index 0000000000..47ba88f670
--- /dev/null
+++ b/board/orangepi/orangepi-r1/linux-extras.config
@@ -0,0 +1,11 @@
+# spi nor
+CONFIG_MTD=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_M25P80=y
+
+# ondemand cpufreq governor
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+
+# USB ethernet
+CONFIG_USB_RTL8152=y
diff --git a/board/orangepi/orangepi-r1/readme.txt b/board/orangepi/orangepi-r1/readme.txt
new file mode 100644
index 0000000000..8266499366
--- /dev/null
+++ b/board/orangepi/orangepi-r1/readme.txt
@@ -0,0 +1,29 @@
+OrangePi R1
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi R1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_r1_defconfig
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
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
new file mode 100644
index 0000000000..34a400e78c
--- /dev/null
+++ b/configs/orangepi_r1_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.38"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-r1"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-r1/linux-extras.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_r1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-r1/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-r1/genimage.cfg"
+
+# spi flash support
+BR2_PACKAGE_MTD=y
