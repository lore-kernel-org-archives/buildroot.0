From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:58:51 +0100
Subject: [Buildroot] [git commit] configs: at91sam9x5ek: new additional
	defconfigs
Message-ID: <20170307205856.6378F8024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ece884a7042a1cfeb733c786714866087ad24d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit:

 - Adds a development rootfs defconfig for the at91sam9x5ek board for
   NAND-based configurations.

 - Adds SD-card based configurations for the at91sam9x5ek board, both a
   minimal one and development one.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
[Thomas: add at91sam9x5ek_mmc_defconfig to have all four combinations:
NAND minimal, NAND development, SD minimal, SD development.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                             |   3 +
 board/atmel/at91sam9x5ek_mmc/genimage.cfg  |  34 ++++++++++
 board/atmel/at91sam9x5ek_mmc/post-image.sh |  20 ++++++
 configs/at91sam9x5ek_dev_defconfig         |  99 ++++++++++++++++++++++++++++
 configs/at91sam9x5ek_mmc_defconfig         |  41 ++++++++++++
 configs/at91sam9x5ek_mmc_dev_defconfig     | 102 +++++++++++++++++++++++++++++
 6 files changed, 299 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 560b540..1954eaa 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -66,6 +66,9 @@ at91sam9g20dfc_defconfig: *defconfig
 at91sam9g45m10ek_defconfig: *defconfig
 at91sam9rlek_defconfig: *defconfig
 at91sam9x5ek_defconfig: *defconfig
+at91sam9x5ek_dev_defconfig: *defconfig
+at91sam9x5ek_mmc_defconfig: *defconfig
+at91sam9x5ek_mmc_dev_defconfig: *defconfig
 atmel_sama5d2_xplained_mmc_defconfig: *defconfig
 atmel_sama5d2_xplained_mmc_dev_defconfig: *defconfig
 atmel_sama5d3_xplained_defconfig: *defconfig
diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
new file mode 100644
index 0000000..46c2dc9
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -0,0 +1,34 @@
+# Image for SD card boot on Atmel at91sam9x5ek boards
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91sam9g15ek.dtb",
+			"at91sam9g25ek.dtb",
+			"at91sam9g35ek.dtb",
+			"at91sam9x25ek.dtb",
+			"at91sam9x35ek.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
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
diff --git a/board/atmel/at91sam9x5ek_mmc/post-image.sh b/board/atmel/at91sam9x5ek_mmc/post-image.sh
new file mode 100755
index 0000000..b560fd3
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_mmc/post-image.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+echo --rootpath "${TARGET_DIR}"
+echo --tmppath "${GENIMAGE_TMP}"
+echo --inputpath "${BINARIES_DIR}"
+echo --outputpath "${BINARIES_DIR}"
+echo --config "${GENIMAGE_CFG}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
new file mode 100644
index 0000000..279ce3d
--- /dev/null
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -0,0 +1,99 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Needed for some packages
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+# Needed for gdb
+BR2_PTHREAD_DEBUG=y
+# Needed for some packages
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System Configuration
+# Needed for usb-utils
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
+
+# Packages
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_FFMPEG=y
+BR2_PACKAGE_FFMPEG_GPL=y
+BR2_PACKAGE_FFMPEG_SWSCALE=y
+BR2_PACKAGE_MPG123=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_DEVMEM2=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_I2C_TOOLS=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WGET=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_VIM=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+
+# Bootloaders
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_nandflash"
+
+# Host packages
+BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
new file mode 100644
index 0000000..c1c4d67
--- /dev/null
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -0,0 +1,41 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# Creation of the SD card image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/at91sam9x5ek_mmc/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloaders
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
+
+# Host packages
+# Needed to generate the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
new file mode 100644
index 0000000..103b457
--- /dev/null
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -0,0 +1,102 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Needed for some packages
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+# Needed for gdb
+BR2_PTHREAD_DEBUG=y
+# Needed for some packages
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System Configuration
+# Needed for usb-utils
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+# Creation of the SD card image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/at91sam9x5ek_mmc/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
+
+# Packages
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_FFMPEG=y
+BR2_PACKAGE_FFMPEG_GPL=y
+BR2_PACKAGE_FFMPEG_SWSCALE=y
+BR2_PACKAGE_MPG123=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_DEVMEM2=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_I2C_TOOLS=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WGET=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_VIM=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloaders
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
+
+# Host packages
+# Needed to generate the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
