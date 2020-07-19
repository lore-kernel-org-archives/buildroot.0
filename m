From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:11:02 +0000
Subject: [Buildroot] [PATCH 7/8] configs/qemu_aarch64_virt_sbbr_defconfig:
 new config for SBBR on Virt
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-8-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for QEMU Virt set up similar to a SBSA machine
that builds firmware that is close to SBBR compliance. It consists of ATF that
load EDK2 as BL33 which in turn will load the kernel as EFI stub in ACPI mode.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/aarch64-sbsa/post-image.sh         |  4 +++
 board/aarch64-sbsa/readme.txt            | 17 +++++++++
 configs/qemu_aarch64_virt_sbbr_defconfig | 46 ++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 configs/qemu_aarch64_virt_sbbr_defconfig

diff --git a/board/aarch64-sbsa/post-image.sh b/board/aarch64-sbsa/post-image.sh
index a9a1eeb227..a9fdd486d7 100755
--- a/board/aarch64-sbsa/post-image.sh
+++ b/board/aarch64-sbsa/post-image.sh
@@ -19,4 +19,8 @@ function resize_or_link_flash {
 if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu_sbsa\"$" ${BR2_CONFIG}; then
   resize_or_link_flash "SBSA_FLASH0.fd" "secureflash.bin" "256"
   resize_or_link_flash "SBSA_FLASH1.fd" "flash0.bin" "256"
+
+elif grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu\"$" ${BR2_CONFIG}; then
+  resize_or_link_flash "bl1.bin" "secureflash.bin" "64"
+  resize_or_link_flash "fip.bin" "flash0.bin" "64"
 fi
diff --git a/board/aarch64-sbsa/readme.txt b/board/aarch64-sbsa/readme.txt
index 84fe1d3652..8ccf1a81ee 100644
--- a/board/aarch64-sbsa/readme.txt
+++ b/board/aarch64-sbsa/readme.txt
@@ -11,6 +11,7 @@ This SBSA board expect SBBR firmware to be packaged in two binaries:
 The following configurations currently provide SBBR firmware:
 
 - qemu_aarch64_sbsa_sbbr_defconfig: An implementation of SBBR for QEMU SBSA
+- qemu_aarch64_virt_sbbr_defconfig: An implementation of SBBR for QEMU Virt
 
 Building and booting under QEMU SBSA
 ====================================
@@ -26,3 +27,19 @@ $ qemu-system-aarch64 \
 	-drive file=output/images/secureflash.bin,if=pflash,format=raw \
 	-drive file=output/images/flash0.bin,if=pflash,format=raw \
 	-hda output/images/disk.img
+
+Building and booting under QEMU Virt
+====================================
+
+$ make qemu_aarch64_virt_sbbr_defconfig
+$ make
+$ qemu-system-aarch64 \
+	-M virt,secure=on,gic-version=3 \
+	-cpu cortex-a57 \
+	-smp 4 \
+	-m 1024 \
+	-nographic \
+	-drive file=output/images/secureflash.bin,if=pflash,format=raw \
+	-drive file=output/images/flash0.bin,if=pflash,format=raw \
+	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+	-device virtio-blk-device,drive=hd0
diff --git a/configs/qemu_aarch64_virt_sbbr_defconfig b/configs/qemu_aarch64_virt_sbbr_defconfig
new file mode 100644
index 0000000000..857722a5f5
--- /dev/null
+++ b/configs/qemu_aarch64_virt_sbbr_defconfig
@@ -0,0 +1,46 @@
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
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
