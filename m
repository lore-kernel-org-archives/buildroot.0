From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:36:44 +0000
Subject: [Buildroot] [PATCH v5 06/10] configs/qemu_aarch64_sbsa_defconfig:
 new config for QEMU sbsa-ref
Message-ID: <WFWFy5zNlUeaYhPuZkesZ7fBDz0Tqvydccz3qL3AEv8@cp7-web-042.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for the SBSA reference machine under
QEMU that is intended for developing and testing firmware. It consists
of ATF that load EDK2 as BL33 which in turn will load GRUB2.

Included with the board files is a minimal kernel configuration, almost
identical to that of board/qemu/aarch64-virt/linux.config. The main
difference is the addition of ACPI which is preferred over DTB for
booting an UEFI system.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 5:

 * Replaced kernel EFI stub mode with GRUB2 for more convenience
 * The GRUB2 package handles the efi-part image
 * Simplified the post script
 * Removed the startup.nsh in favour of that provided by GRUB2
 * Added a minimal kernel configuration with ACPI support
 * Added section to board/qemu/aarch-sbsa/readme.txt about missing
   SeaBIOS dependency for Debian hosts

Revision 4:

 * The qemu-sbsa-ref machine is now able to boot the kernel. Adjusted
   readme.txt accordingly
 * Updated to Linux LTS kernel 5.10
 * Renamed post-image.sh to assemble-flash-images
 * Added startup.nsh for auto-booting from the EFI shell
 * Simplified resizing of the flash images with the truncate command

Revision 3:

 * post-image.sh cleanup
 * Added host-qemu to config for testing

Revision 2:

 * This board was renamed/moved to be specific for QEMU sbsa-ref
 * General simplification
 * Using set -e in the post-images.sh script
---
 board/qemu/aarch64-sbsa/assemble-flash-images | 11 +++
 board/qemu/aarch64-sbsa/genimage.cfg          | 30 ++++++++
 board/qemu/aarch64-sbsa/grub.cfg              |  6 ++
 board/qemu/aarch64-sbsa/linux.config          | 68 +++++++++++++++++++
 board/qemu/aarch64-sbsa/readme.txt            | 32 +++++++++
 configs/qemu_aarch64_sbsa_defconfig           | 49 +++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100755 board/qemu/aarch64-sbsa/assemble-flash-images
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/grub.cfg
 create mode 100644 board/qemu/aarch64-sbsa/linux.config
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig

diff --git a/board/qemu/aarch64-sbsa/assemble-flash-images b/board/qemu/aarch64-sbsa/assemble-flash-images
new file mode 100755
index 0000000000..abcc276b0b
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/assemble-flash-images
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+
+# The QEMU sbsa machine expects flash devices to be 256M.
+truncate -s 256M ${BINARIES_DIR}/SBSA_FLASH0.fd
+truncate -s 256M ${BINARIES_DIR}/SBSA_FLASH1.fd
diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
new file mode 100644
index 0000000000..285b308d90
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -0,0 +1,30 @@
+image efi-part.vfat {
+  vfat {
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
+    }
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file Image {
+      image = "Image"
+    }
+  }
+  size = 32M
+}
+
+image disk.img {
+  hdimage {
+    gpt = true
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
+}
diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
new file mode 100644
index 0000000000..cd486caf4c
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=/dev/sda2 rootwait console=ttyAMA0
+}
diff --git a/board/qemu/aarch64-sbsa/linux.config b/board/qemu/aarch64-sbsa/linux.config
new file mode 100644
index 0000000000..a60cce02ec
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/linux.config
@@ -0,0 +1,68 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_COMPAT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_ACPI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BINFMT_MISC=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=m
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS=y
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
new file mode 100644
index 0000000000..7935108ef1
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -0,0 +1,32 @@
+Intro
+=====
+
+The QEMU sbsa-ref machine is primarily meant for firmware development
+and testing according to ARM's SBSA and SBBR standards.
+
+Build
+=====
+
+  $ make qemu_aarch64_sbsa_defconfig
+  $ make
+
+Emulation
+=========
+
+Run the emulation with:
+
+  qemu-system-aarch64 \
+    -M sbsa-ref \
+    -cpu cortex-a53 \
+    -smp 4 \
+    -m 1024 \
+    -nographic \
+    -pflash output/images/SBSA_FLASH0.fd \
+    -pflash output/images/SBSA_FLASH1.fd \
+    -hda output/images/disk.img
+
+Note that if you want to run sbsa-ref emulation with QEMU provided by
+your distro (i.e., not host-qemu by Buildroot) then you may need to
+install the SeaBIOS package for some required drivers. On Debian:
+
+  # apt install seabios
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
new file mode 100644
index 0000000000..20ae393cd7
--- /dev/null
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -0,0 +1,49 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# UEFI firmware
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_ARM64_EFI=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+
+# Host tools for genimage
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2
