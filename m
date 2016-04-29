From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 15:26:53 -0300
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
	efi}_defconfig: new samples
Message-ID: <1461954413-10854-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two new sample defconfigs oriented towards real PC targets.

It adds two variants for BIOS and EFI boot strategy.

On the build side we enable eudev to autoload relevant kernel
modules/support when necessary.

It adds a bunch of drivers and extra filesystem support which is by no
means extensive/complete, mostly geared towards the hardware i've got at
hand to test with.
This is accomplished by adding on top of the Qemu x86_64 kernel sample
config.

Build connman since by using eudev network interfaces get renamed on
boot thus complicating any form of automatic and friendly bringup.
It also makes Wi-Fi configuration/support easier.

In principle these base defconfigs should work just fine for other
storage media != pendrive like sata or ssd disk, however driver support
isn't there quite yet, and pendrive is mostly supported by usb storage
plus the usual usb host controller drivers.

Tested on old Lenovo laptop (BIOS) and Asus Zenbook (EFI).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/pc/genimage-bios.cfg       | 24 +++++++++++++++
 board/pc/genimage-efi.cfg        | 31 +++++++++++++++++++
 board/pc/linux-extras.config     | 42 ++++++++++++++++++++++++++
 board/pc/post-image.sh           | 35 ++++++++++++++++++++++
 board/pc/readme.txt              | 35 ++++++++++++++++++++++
 configs/pc_x86_64_bios_defconfig | 62 ++++++++++++++++++++++++++++++++++++++
 configs/pc_x86_64_efi_defconfig  | 65 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 294 insertions(+)
 create mode 100644 board/pc/genimage-bios.cfg
 create mode 100644 board/pc/genimage-efi.cfg
 create mode 100644 board/pc/linux-extras.config
 create mode 100755 board/pc/post-image.sh
 create mode 100644 board/pc/readme.txt
 create mode 100644 configs/pc_x86_64_bios_defconfig
 create mode 100644 configs/pc_x86_64_efi_defconfig

diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
new file mode 100644
index 0000000..c669499
--- /dev/null
+++ b/board/pc/genimage-bios.cfg
@@ -0,0 +1,24 @@
+image disk.img {
+
+  hdimage {
+  }
+
+  partition boot {
+    in-partition-table = "no"
+    image = "boot.img"
+    offset = 0
+    size = 512
+  }
+
+  partition grub {
+    in-partition-table = "no"
+    image = "grub.img"
+    offset = 512
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+
+}
diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
new file mode 100644
index 0000000..ec96d73
--- /dev/null
+++ b/board/pc/genimage-efi.cfg
@@ -0,0 +1,31 @@
+image efi-part.vfat {
+  vfat {
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
+    }
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file bzImage {
+      image = "bzImage"
+    }
+  }
+  size = 16M
+}
+
+image disk.img {
+
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xEF
+    image = "efi-part.vfat"
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+
+}
diff --git a/board/pc/linux-extras.config b/board/pc/linux-extras.config
new file mode 100644
index 0000000..3d8cc33
--- /dev/null
+++ b/board/pc/linux-extras.config
@@ -0,0 +1,42 @@
+# Filesystem support
+CONFIG_FUSE_FS=y
+CONFIG_SQUASHFS=y
+
+# Ethernet drivers
+CONFIG_ATL2=m
+CONFIG_ATL1=m
+CONFIG_ATL1E=m
+CONFIG_ATL1C=m
+CONFIG_ALX=m
+CONFIG_E100=m
+CONFIG_E1000=m
+CONFIG_E1000E=m
+CONFIG_IGB=m
+CONFIG_R8169=m
+
+# Video drivers
+CONFIG_DRM_I915=y
+CONFIG_FB_VESA=y
+
+# Wireless drivers
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_ATH_CARDS=m
+CONFIG_ATH9K=m
+CONFIG_ATH9K_HTC=m
+CONFIG_CARL9170=m
+CONFIG_ATH10K=m
+CONFIG_ATH10K_PCI=m
+CONFIG_IWL4965=m
+CONFIG_IWL3945=m
+CONFIG_IWLWIFI=m
+CONFIG_RT2X00=m
+CONFIG_RT2800PCI=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+# CONFIG_RTL_CARDS is not set
+CONFIG_RTL8XXXU=m
diff --git a/board/pc/post-image.sh b/board/pc/post-image.sh
new file mode 100755
index 0000000..3b51409
--- /dev/null
+++ b/board/pc/post-image.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+# Detect boot strategy, EFI or BIOS
+if [ -f ${BINARIES_DIR}/efi-part/startup.nsh ]; then
+  BOOT_TYPE=efi
+  # grub.cfg needs customization for EFI since the root partition is
+  # number 2, and bzImage is in the EFI partition (1)
+  cat >${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg <<__EOF__
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=/dev/sda2 rootwait console=tty1
+}
+__EOF__
+else
+  BOOT_TYPE=bios
+  # Copy grub 1st stage to binaries, required for genimage
+  cp -f ${HOST_DIR}/usr/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
+fi
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOOT_TYPE}.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+       --rootpath "${TARGET_DIR}"     \
+       --tmppath "${GENIMAGE_TMP}"    \
+       --inputpath "${BINARIES_DIR}"  \
+       --outputpath "${BINARIES_DIR}" \
+       --config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
new file mode 100644
index 0000000..970e8a6
--- /dev/null
+++ b/board/pc/readme.txt
@@ -0,0 +1,35 @@
+Bare PC sample config
+=====================
+
+1. Build
+
+  First select the appropiate target you want.
+  For BIOS-based boot strategy:
+
+  $ make pc_x86_64_bios_defconfig
+
+  Or for EFI:
+
+  $ make pc_x86_64_efi_defconfig
+
+  Add any additional packages required and build:
+
+  $ make
+
+2. Write the pendrive
+
+  The build process will create a pendrive image in output/images.
+  Write the image to a pendrive:
+
+  $ dd if=output/images/sdcard.img of=/dev/sdc; sync
+
+  Once it's done insert it into the target PC and boot.
+
+  Remember that if said PC has another boot device you might need to
+  select this alternative for it to boot.
+
+  In the case of EFI boot you might need to disable Secure Boot from
+  the setup as well.
+
+3. Enjoy
+
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
new file mode 100644
index 0000000..c3a1a35
--- /dev/null
+++ b/configs/pc_x86_64_bios_defconfig
@@ -0,0 +1,62 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Required tools to create bootable media
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+
+# Packages
+#
+# Use connman so that networking setup is simpler, via connmanctl tool
+# acpid is for seamless power button support
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_PACKAGE_CONNMAN_WIFI=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
new file mode 100644
index 0000000..3152115
--- /dev/null
+++ b/configs/pc_x86_64_efi_defconfig
@@ -0,0 +1,65 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Required tools to create bootable media
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+
+# Packages
+#
+# Use connman so that networking setup is simpler, via connmanctl tool
+# acpid is for seamless power button support
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_PACKAGE_CONNMAN_WIFI=y
-- 
2.7.3
