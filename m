From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:10:40 +0000
Subject: [Buildroot] [PATCH 6/8] configs/qemu_aarch64_sbsa_sbbr_defconfig:
 new config for SBBR on QEMU SBSA
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-7-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for the SBSA reference machine under QEMU that
builds firmware that is close to SBBR compliance. It consists of ATF that load
EDK2 as BL33 which in turn will load the kernel as EFI stub in ACPI mode.

This patch is also introducing a generic SBSA board called aarch64_sbsa that can
be shared between SBSA platforms.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/aarch64-sbsa/genimage-sbsa.cfg     | 25 ++++++++++++++
 board/aarch64-sbsa/linux.config          |  1 +
 board/aarch64-sbsa/post-image.sh         | 22 ++++++++++++
 board/aarch64-sbsa/readme.txt            | 28 +++++++++++++++
 configs/qemu_aarch64_sbsa_sbbr_defconfig | 44 ++++++++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 board/aarch64-sbsa/genimage-sbsa.cfg
 create mode 100644 board/aarch64-sbsa/linux.config
 create mode 100755 board/aarch64-sbsa/post-image.sh
 create mode 100644 board/aarch64-sbsa/readme.txt
 create mode 100644 configs/qemu_aarch64_sbsa_sbbr_defconfig

diff --git a/board/aarch64-sbsa/genimage-sbsa.cfg b/board/aarch64-sbsa/genimage-sbsa.cfg
new file mode 100644
index 0000000000..23280c39a0
--- /dev/null
+++ b/board/aarch64-sbsa/genimage-sbsa.cfg
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
diff --git a/board/aarch64-sbsa/linux.config b/board/aarch64-sbsa/linux.config
new file mode 100644
index 0000000000..03d553a18d
--- /dev/null
+++ b/board/aarch64-sbsa/linux.config
@@ -0,0 +1 @@
+CONFIG_CMDLINE="root=/dev/vda2 rootwait console=ttyAMA0"
diff --git a/board/aarch64-sbsa/post-image.sh b/board/aarch64-sbsa/post-image.sh
new file mode 100755
index 0000000000..a9a1eeb227
--- /dev/null
+++ b/board/aarch64-sbsa/post-image.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
+
+# Set up the kernel executable according to the UEFI standard.
+mkdir -p ${EFI_DIR} && \
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
+
+function resize_or_link_flash {
+  if [ -n "${3}" ]; then
+    dd if=/dev/zero of="${BINARIES_DIR}/${2}" bs=1M count=${3} && \
+    dd if="${BINARIES_DIR}/${1}" of="${BINARIES_DIR}/${2}" conv=notrunc || exit 1
+  else
+    ln -srf "${BINARIES_DIR}/${1}" "${BINARIES_DIR}/${2}" || exit 1
+  fi
+}
+
+if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu_sbsa\"$" ${BR2_CONFIG}; then
+  resize_or_link_flash "SBSA_FLASH0.fd" "secureflash.bin" "256"
+  resize_or_link_flash "SBSA_FLASH1.fd" "flash0.bin" "256"
+fi
diff --git a/board/aarch64-sbsa/readme.txt b/board/aarch64-sbsa/readme.txt
new file mode 100644
index 0000000000..84fe1d3652
--- /dev/null
+++ b/board/aarch64-sbsa/readme.txt
@@ -0,0 +1,28 @@
+The aarch64-sbsa board is generic and will work for platforms that are
+compliant with the Server Base System Architecture (SBSA) specification.
+An SBSA platform will need configuration that build firmware compliant with
+the Server Base Boot Requirement (SBBR) specification.
+
+This SBSA board expect SBBR firmware to be packaged in two binaries:
+
+1. secureflash.bin: The BL1 stage that will be loaded into secure memory
+2. flash0.bin: Remaining firmware image packages loaded into non-secure memory
+
+The following configurations currently provide SBBR firmware:
+
+- qemu_aarch64_sbsa_sbbr_defconfig: An implementation of SBBR for QEMU SBSA
+
+Building and booting under QEMU SBSA
+====================================
+
+$ make qemu_aarch64_sbsa_sbbr_defconfig
+$ make
+$ qemu-system-aarch64 \
+	-M sbsa-ref \
+	-cpu cortex-a57 \
+	-smp 4 \
+	-m 1024 \
+	-nographic \
+	-drive file=output/images/secureflash.bin,if=pflash,format=raw \
+	-drive file=output/images/flash0.bin,if=pflash,format=raw \
+	-hda output/images/disk.img
diff --git a/configs/qemu_aarch64_sbsa_sbbr_defconfig b/configs/qemu_aarch64_sbsa_sbbr_defconfig
new file mode 100644
index 0000000000..05d662fd17
--- /dev/null
+++ b/configs/qemu_aarch64_sbsa_sbbr_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_aarch64=y
+
+# Toolchain, required for eudev and grub
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+## Required tools to create bootable media
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-sbsa/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-sbsa/genimage-sbsa.cfg"
+
+# Linux headers same as kernel, a 4.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aarch64-sbsa/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
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
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
