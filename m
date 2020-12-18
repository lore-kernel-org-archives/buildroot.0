From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:27:57 +0000
Subject: [Buildroot] [PATCH v3 09/11]
 configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-10-hi@senzilla.io>
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

Revision 3:

 * Changed flash device setup to work with QEMU 5.0
---
 board/qemu/aarch64-virt-efi/genimage.cfg   | 24 +++++++++++
 board/qemu/aarch64-virt-efi/linux.fragment |  1 +
 board/qemu/aarch64-virt-efi/post-image.sh  | 15 +++++++
 board/qemu/aarch64-virt-efi/readme.txt     | 27 +++++++++++++
 configs/qemu_aarch64_virt_efi_defconfig    | 46 ++++++++++++++++++++++
 5 files changed, 113 insertions(+)
 create mode 100644 board/qemu/aarch64-virt-efi/genimage.cfg
 create mode 100644 board/qemu/aarch64-virt-efi/linux.fragment
 create mode 100755 board/qemu/aarch64-virt-efi/post-image.sh
 create mode 100644 board/qemu/aarch64-virt-efi/readme.txt
 create mode 100644 configs/qemu_aarch64_virt_efi_defconfig

diff --git a/board/qemu/aarch64-virt-efi/genimage.cfg b/board/qemu/aarch64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000..f653b1f35d
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/genimage.cfg
@@ -0,0 +1,24 @@
+image efi-part.vfat {
+  vfat {
+    file EFI {
+      image = "efi-part/EFI"
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
diff --git a/board/qemu/aarch64-virt-efi/linux.fragment b/board/qemu/aarch64-virt-efi/linux.fragment
new file mode 100644
index 0000000000..03d553a18d
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/linux.fragment
@@ -0,0 +1 @@
+CONFIG_CMDLINE="root=/dev/vda2 rootwait console=ttyAMA0"
diff --git a/board/qemu/aarch64-virt-efi/post-image.sh b/board/qemu/aarch64-virt-efi/post-image.sh
new file mode 100755
index 0000000000..82eb05798d
--- /dev/null
+++ b/board/qemu/aarch64-virt-efi/post-image.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
+
+# Set up the kernel executable according to the UEFI standard.
+mkdir -p ${EFI_DIR}
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
+
+# The QEMU virt machine expects the BIOS flash device to be 64M.
+rm -rf ${BINARIES_DIR}/flash.bin
+dd if=${BINARIES_DIR}/bl1.bin of=${BINARIES_DIR}/flash.bin bs=4096 conv=notrunc
+dd if=${BINARIES_DIR}/fip.bin of=${BINARIES_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
diff --git a/board/qemu/aarch64-virt-efi/readme.txt b/board/qemu/aarch64-virt-efi/readme.txt
new file mode 100644
index 0000000000..35fc257855
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
+	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+	-device virtio-blk-device,drive=hd0
diff --git a/configs/qemu_aarch64_virt_efi_defconfig b/configs/qemu_aarch64_virt_efi_defconfig
new file mode 100644
index 0000000000..e1d3bcda4b
--- /dev/null
+++ b/configs/qemu_aarch64_virt_efi_defconfig
@@ -0,0 +1,46 @@
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
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-virt-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-virt-efi/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.53"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-virt-efi/linux.fragment"
+
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
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
2.25.1
