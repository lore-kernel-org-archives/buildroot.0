From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:07:44 +0000
Subject: [Buildroot] [PATCH v2 6/6] configs/qemu_aarch64_sbsa_defconfig: new
 config for QEMU sbsa-ref
Message-ID: <20200726100541.7710-7-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dick Olsson <hi@senzilla.io>

This introduces a configuration for the SBSA reference machine under QEMU that
is intended for developing and testing firmware. It consists of ATF that load
EDK2 as BL33 which in turn will load the kernel in EFI stub mode with ACPI.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

 * This board was renamed/moved to be specific for QEMU sbsa-ref
 * General simplification
 * Using set -e in the post-images.sh script
---
 board/qemu/aarch64-sbsa/genimage.cfg   | 25 ++++++++++++++++
 board/qemu/aarch64-sbsa/linux.fragment |  1 +
 board/qemu/aarch64-sbsa/post-image.sh  | 18 ++++++++++++
 board/qemu/aarch64-sbsa/readme.txt     | 34 ++++++++++++++++++++++
 configs/qemu_aarch64_sbsa_defconfig    | 40 ++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/linux.fragment
 create mode 100755 board/qemu/aarch64-sbsa/post-image.sh
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
new file mode 100644
index 0000000000..23280c39a0
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -0,0 +1,25 @@
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
+
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
diff --git a/board/qemu/aarch64-sbsa/linux.fragment b/board/qemu/aarch64-sbsa/linux.fragment
new file mode 100644
index 0000000000..03d553a18d
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/linux.fragment
@@ -0,0 +1 @@
+CONFIG_CMDLINE="root=/dev/vda2 rootwait console=ttyAMA0"
diff --git a/board/qemu/aarch64-sbsa/post-image.sh b/board/qemu/aarch64-sbsa/post-image.sh
new file mode 100755
index 0000000000..e69e2c9943
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/post-image.sh
@@ -0,0 +1,18 @@
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
+function resize_flash {
+  dd if=/dev/zero of="${BINARIES_DIR}/${2}" bs=1M count=256
+  dd if="${BINARIES_DIR}/${1}" of="${BINARIES_DIR}/${2}" conv=notrunc
+}
+
+resize_flash "SBSA_FLASH0.fd" "SBSA_FLASH0_RESIZED.fd"
+resize_flash "SBSA_FLASH1.fd" "SBSA_FLASH1_RESIZED.fd"
diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
new file mode 100644
index 0000000000..27558ef77a
--- /dev/null
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+The QEMU sbsa-ref machine is primarily meant for firmware development and
+testing. Thus, the Linux kernel is not necessarily meant to boot to userland.
+
+A successful boot should be considered:
+
+1. ARM Trusted Firmware (ATF) boots until BL31
+2. ATF loads EDK2 (UEFI) as BL33
+3. EDK2 loads the Linux kernel in EFI stub mode
+4. Linux begins to boot, exits boot services, begins loading the address map
+5. Freez
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
+    -cpu cortex-a57 \
+    -smp 4 \
+    -m 1024 \
+    -nographic \
+    -drive file=output/images/SBSA_FLASH0_RESIZED.fd,if=pflash,format=raw \
+    -drive file=output/images/SBSA_FLASH1_RESIZED.fd,if=pflash,format=raw \
+    -hda output/images/disk.img
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
new file mode 100644
index 0000000000..9e0e3eb76e
--- /dev/null
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -0,0 +1,40 @@
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
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.53"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-sbsa/linux.fragment"
+
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
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
-- 
2.20.1
