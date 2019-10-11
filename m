From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 11 Oct 2019 17:57:25 +0200
Subject: [Buildroot] [PATCH] configs/licheepi_zero_dock: new defconfig
Message-ID: <1570809445-2578-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Licheepi zero dock version is different in several ways from the
standard version and it needs a different dtb to run.
This patch adds the dock variant and the correct bootscript to generate
a supported image.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 board/licheepi/boot-dock.cmd         |  4 +++
 configs/licheepi_zero_dock_defconfig | 50 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 board/licheepi/boot-dock.cmd
 create mode 100644 configs/licheepi_zero_dock_defconfig

diff --git a/board/licheepi/boot-dock.cmd b/board/licheepi/boot-dock.cmd
new file mode 100644
index 0000000..383b347
--- /dev/null
+++ b/board/licheepi/boot-dock.cmd
@@ -0,0 +1,4 @@
+setenv bootargs console=ttyS0,115200 panic=5 console=tty0 rootwait root=/dev/mmcblk0p2 earlyprintk rw
+load mmc 0:1 0x41000000 zImage
+load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb
+bootz 0x41000000 - 0x41800000
diff --git a/configs/licheepi_zero_dock_defconfig b/configs/licheepi_zero_dock_defconfig
new file mode 100644
index 0000000..671e89d
--- /dev/null
+++ b/configs/licheepi_zero_dock_defconfig
@@ -0,0 +1,50 @@
+# Target options
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero-dock"
+
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+
+# Filesystem images
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/licheepi/boot-dock.cmd"
+
+# Required host utilities for building an SDCard image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
