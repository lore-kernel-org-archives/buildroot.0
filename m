From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 30 Aug 2018 23:31:55 -0300
Subject: [Buildroot] [PATCH/next] configs/pc: add a configuration to build a
 UEFI+GPT image
Message-ID: <20180831023155.26475-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is ane example of how to craft a disk image with GPT partitioning
instead of MBR. This is achieved by means of a post-image script which
uses mkdosfs+mcopy+sfdisk, since genimage is unable to deal with GPT.

The script was kept as simple as possible to make it easy to understand
and adapt for other purposes.

The root filesystem location is passed to the kernel by a partition
UUID, so the it is possible to boot on QEMU, directly from the disk
image, or dump the image to a physical device.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 board/pc/post-image-efi-gpt.sh      | 62 ++++++++++++++++++++++++++++
 board/pc/readme.txt                 |  6 ++-
 configs/pc_x86_64_efi_gpt_defconfig | 64 +++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100755 board/pc/post-image-efi-gpt.sh
 create mode 100644 configs/pc_x86_64_efi_gpt_defconfig

diff --git a/board/pc/post-image-efi-gpt.sh b/board/pc/post-image-efi-gpt.sh
new file mode 100755
index 0000000000..d2acd8f852
--- /dev/null
+++ b/board/pc/post-image-efi-gpt.sh
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+set -e
+
+cd ${BINARIES_DIR}
+
+# GPT partition type UUIDs
+esp_type=c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+linux_type=44479540-f297-41b2-9af7-d131d5f0458a
+
+# Partition UUIDs
+efi_part_uuid=$(uuidgen)
+root_part_uuid=$(uuidgen)
+
+# Boot partition offset and size, in 512-byte sectors
+efi_part_start=64
+efi_part_size=32768
+
+# Rootfs partition offset and size, in 512-byte sectors
+root_part_start=$(( efi_part_start + efi_part_size ))
+root_part_size=$(( $(stat -c %s rootfs.ext2) / 512 ))
+
+first_lba=34
+last_lba=$(( root_part_start + root_part_size ))
+
+# Disk image size in 512-byte sectors
+image_size=$(( last_lba + first_lba ))
+
+cat > efi-part/EFI/BOOT/grub.cfg <<EOF
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=PARTUUID=$root_part_uuid rootwait console=tty1
+}
+EOF
+
+# Create EFI system partition
+rm -f efi-part.vfat
+dd if=/dev/zero of=efi-part.vfat bs=512 count=0 seek=$efi_part_size
+mkdosfs  efi-part.vfat
+mcopy -bsp -i efi-part.vfat efi-part/startup.nsh ::startup.nsh
+mcopy -bsp -i efi-part.vfat efi-part/EFI ::EFI
+mcopy -bsp -i efi-part.vfat bzImage ::bzImage
+
+rm -f disk.img
+dd if=/dev/zero of=disk.img bs=512 count=0 seek=$image_size
+
+sfdisk disk.img <<EOF
+label: gpt
+label-id: $(uuidgen)
+device: /dev/foobar0
+unit: sectors
+first-lba: $first_lba
+last-lba: $last_lba
+
+/dev/foobar0p1 : start=$efi_part_start,  size=$efi_part_size,  type=$esp_type,   uuid=$efi_part_uuid,  name="efi-part.vfat"
+/dev/foobar0p2 : start=$root_part_start, size=$root_part_size, type=$linux_type, uuid=$root_part_uuid, name="rootfs.ext2"
+EOF
+
+dd if=efi-part.vfat of=disk.img bs=512 count=$efi_part_size seek=$efi_part_start conv=notrunc
+dd if=rootfs.ext2   of=disk.img bs=512 count=$root_part_size seek=$root_part_start conv=notrunc
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index ca3b5123c1..73d8c24838 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -9,10 +9,14 @@ Bare PC sample config
 
   $ make pc_x86_64_bios_defconfig
 
-  Or for EFI:
+  For EFI-based boot strategy on a MBR-partitioned disk:
 
   $ make pc_x86_64_efi_defconfig
 
+  Or for EFI-based boot strategy on a GPT-partitioned disk:
+
+  $ make pc_x86_64_efi_gpt_defconfig
+
   Add any additional packages required and build:
 
   $ make
diff --git a/configs/pc_x86_64_efi_gpt_defconfig b/configs/pc_x86_64_efi_gpt_defconfig
new file mode 100644
index 0000000000..8be19a75c9
--- /dev/null
+++ b/configs/pc_x86_64_efi_gpt_defconfig
@@ -0,0 +1,64 @@
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
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi-gpt.sh"
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.8"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
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
2.17.1
