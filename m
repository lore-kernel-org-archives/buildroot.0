From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:43:18 +0000
Subject: [Buildroot] [PATCH v4 07/10]
 configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
Message-ID: <jqahuCL5ztVRAU41CvIY9SAbHfmhCqkZ0zBLtwpGaI@cp4-web-038.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for QEMU Virt that boots Linux with ATF
and the EDK2 EFI firmware without any additional bootloaders. ATF is
loading EDK2 in EL2 using the BL33 payload configuration.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 4:

 * Addressed review items by Yann E. MORIN
 * Renamed post-image.sh to assemble-flash-images
 * Updated to Linux LTS kernel 5.10
 * Added startup.nsh for auto-booting from the EFI shell

Revision 3:

 * Changed flash device setup to work with QEMU 5.0

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../aarch64-virt-efi/assemble-flash-images    | 19 ++++++++
 board/qemu/aarch64-virt-efi/genimage.cfg      | 27 +++++++++++
 board/qemu/aarch64-virt-efi/readme.txt        | 27 +++++++++++
 board/qemu/aarch64-virt-efi/startup.nsh       |  1 +
 configs/qemu_aarch64_virt_efi_defconfig       | 45 +++++++++++++++++++
 5 files changed, 119 insertions(+)
 create mode 100755 board/qemu/aarch64-virt-efi/assemble-flash-images
 create mode 100644 board/qemu/aarch64-virt-efi/genimage.cfg
 create mode 100644 board/qemu/aarch64-virt-efi/readme.txt
 create mode 100644 board/qemu/aarch64-virt-efi/startup.nsh
 create mode 100644 configs/qemu_aarch64_virt_efi_defconfig

diff --git a/board/qemu/aarch64-virt-efi/assemble-flash-images b/board/qemu/aarch64-virt-efi/assemble-flash-images
new file mode 100755
index 0000000000..f1f50f3cdf
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/assemble-flash-images
@@ -0,0 +1,19 @@
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
+# BL1 and FIP needs to be concatenated into a single flash device.
+rm -rf ${BINARIES_DIR}/flash.bin
+dd if=${BINARIES_DIR}/bl1.bin of=${BINARIES_DIR}/flash.bin bs=4096 conv=notrunc
+dd if=${BINARIES_DIR}/fip.bin of=${BINARIES_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
diff --git a/board/qemu/aarch64-virt-efi/genimage.cfg b/board/qemu/aarch64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000..7c37d6a7dd
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/genimage.cfg
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
diff --git a/board/qemu/aarch64-virt-efi/readme.txt b/board/qemu/aarch64-virt-efi/readme.txt
new file mode 100644
index 0000000000..3f3c9d7619
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/readme.txt
@@ -0,0 +1,27 @@
+Intro
+=====
+
+This board allows to build a minimal Linux system that boot directly
+with Arm Trusted Firmware, EDK2 (UEFI), ACPI and GICv3 without any
+additional bootloaders like GRUB2.
+
+Build
+=====
+
+  $ make qemu_aarch64_virt_efi_defconfig
+  $ make
+
+Emulation
+=========
+
+Run the emulation with:
+
+  output/host/bin/qemu-system-aarch64 \
+    -M virt,secure=on,gic-version=3 \
+    -cpu cortex-a57 \
+    -smp 4 \
+    -m 1024 \
+    -nographic \
+    -bios output/images/flash.bin \
+    -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+    -device virtio-blk-device,drive=hd0
diff --git a/board/qemu/aarch64-virt-efi/startup.nsh b/board/qemu/aarch64-virt-efi/startup.nsh
new file mode 100644
index 0000000000..b7a000f6f0
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/startup.nsh
@@ -0,0 +1 @@
+FS0:\EFI\BOOT\bootaa64.efi root=/dev/vda2 rootwait console=ttyAMA0
diff --git a/configs/qemu_aarch64_virt_efi_defconfig b/configs/qemu_aarch64_virt_efi_defconfig
new file mode 100644
index 0000000000..5d59d81dcb
--- /dev/null
+++ b/configs/qemu_aarch64_virt_efi_defconfig
@@ -0,0 +1,45 @@
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
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-virt-efi/genimage.cfg"
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
+BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="QEMU_USE_GIC_DRIVER=QEMU_GICV3"
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
