From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:43:10 +0000
Subject: [Buildroot] [PATCH v4 06/10] configs/qemu_aarch64_sbsa_defconfig:
 new config for QEMU sbsa-ref
Message-ID: <Z9iNUXrUAMThOadKFwRuahfxRG9iic9FRPGkCxl3PE@cp3-web-016.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for the SBSA reference machine under
QEMU that is intended for developing and testing firmware. It consists
of ATF that load EDK2 as BL33 which in turn will load the kernel in EFI
stub mode with ACPI.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

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

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/qemu/aarch64-sbsa/assemble-flash-images | 18 ++++++++
 board/qemu/aarch64-sbsa/genimage.cfg          | 27 ++++++++++++
 board/qemu/aarch64-sbsa/readme.txt            | 26 +++++++++++
 board/qemu/aarch64-sbsa/startup.nsh           |  1 +
 configs/qemu_aarch64_sbsa_defconfig           | 43 +++++++++++++++++++
 5 files changed, 115 insertions(+)
 create mode 100755 board/qemu/aarch64-sbsa/assemble-flash-images
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100644 board/qemu/aarch64-sbsa/startup.nsh
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig

diff --git a/board/qemu/aarch64-sbsa/assemble-flash-images b/board/qemu/aarch64-sbsa/assemble-flash-images
new file mode 100755
index 0000000000..6060a835dc
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/assemble-flash-images
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+EFI_PART=${BINARIES_DIR}/efi-part
+EFI_DIR=${EFI_PART}/EFI/BOOT
+
+# Create the EFI system partition with startup script and kernel
+# executable according to the UEFI standard.
+rm -rf ${EFI_DIR}
+mkdir -p ${EFI_DIR}
+cp ${BOARD_DIR}/startup.nsh ${EFI_PART}/
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
+
+# The QEMU sbsa machine expects flash devices to be 256M.
+truncate -s 256M ${BINARIES_DIR}/SBSA_FLASH0.fd
+truncate -s 256M ${BINARIES_DIR}/SBSA_FLASH1.fd
diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
new file mode 100644
index 0000000000..7c37d6a7dd
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -0,0 +1,27 @@
+image efi-part.vfat {
+  vfat {
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
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
diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
new file mode 100644
index 0000000000..cb5679ccde
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -0,0 +1,26 @@
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
+  output/host/bin/qemu-system-aarch64 \
+    -M sbsa-ref \
+    -cpu cortex-a57 \
+    -smp 4 \
+    -m 1024 \
+    -nographic \
+    -pflash output/images/SBSA_FLASH0.fd \
+    -pflash output/images/SBSA_FLASH1.fd \
+    -hda output/images/disk.img
diff --git a/board/qemu/aarch64-sbsa/startup.nsh b/board/qemu/aarch64-sbsa/startup.nsh
new file mode 100644
index 0000000000..1e8f81f9ef
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/startup.nsh
@@ -0,0 +1 @@
+FS0:\EFI\BOOT\bootaa64.efi root=/dev/sda2 console=ttyAMA0
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
new file mode 100644
index 0000000000..eb9aa13be7
--- /dev/null
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -0,0 +1,43 @@
+# Architecture
+BR2_aarch64=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.2"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# UEFI firmware
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
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
+# host-qemu for testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.24.3 (Apple Git-128)
