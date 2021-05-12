From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:36:37 +0000
Subject: [Buildroot] [PATCH v5 05/10] configs/qemu_aarch64_virt_defconfig:
 build with EDK2 firmware
Message-ID: <nuTj64JGLPGdAPDpUsm0IUejiqgeoQxDMDdmsWLHqfw@cp3-web-012.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build and boot the QEMU Aarch64 Virt machine with ATF, EDK2, GRUB2
and a minimal kernel configuration.

Compared to booting with a stand-alone kernel this configuration
provides for better emulation of the boot process.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/qemu/aarch64-virt/assemble-flash-images | 12 ++++++++
 board/qemu/aarch64-virt/genimage.cfg          | 30 +++++++++++++++++++
 board/qemu/aarch64-virt/grub.cfg              |  6 ++++
 board/qemu/aarch64-virt/readme.txt            |  2 +-
 configs/qemu_aarch64_virt_defconfig           | 25 ++++++++++++++--
 5 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100755 board/qemu/aarch64-virt/assemble-flash-images
 create mode 100644 board/qemu/aarch64-virt/genimage.cfg
 create mode 100644 board/qemu/aarch64-virt/grub.cfg

diff --git a/board/qemu/aarch64-virt/assemble-flash-images b/board/qemu/aarch64-virt/assemble-flash-images
new file mode 100755
index 0000000000..c472604e2d
--- /dev/null
+++ b/board/qemu/aarch64-virt/assemble-flash-images
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/
+
+# BL1 and FIP needs to be concatenated into a single flash device.
+rm -rf ${BINARIES_DIR}/flash.bin
+dd if=${BINARIES_DIR}/bl1.bin of=${BINARIES_DIR}/flash.bin bs=4096 conv=notrunc
+dd if=${BINARIES_DIR}/fip.bin of=${BINARIES_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
diff --git a/board/qemu/aarch64-virt/genimage.cfg b/board/qemu/aarch64-virt/genimage.cfg
new file mode 100644
index 0000000000..285b308d90
--- /dev/null
+++ b/board/qemu/aarch64-virt/genimage.cfg
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
diff --git a/board/qemu/aarch64-virt/grub.cfg b/board/qemu/aarch64-virt/grub.cfg
new file mode 100644
index 0000000000..ab88da91b9
--- /dev/null
+++ b/board/qemu/aarch64-virt/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
+}
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index db35a3a7a8..8d3b1ba197 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig
+  qemu-system-aarch64 -M virt,secure=on,gic-version=3 -cpu cortex-a53 -smp 1 -nographic -bios output/images/flash.bin -drive file=output/images/disk.img,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index aa00ddf831..3588aed318 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -2,6 +2,9 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
 
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -12,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-virt/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-virt/genimage.cfg"
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
@@ -26,6 +29,24 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
+# UEFI firmware
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_ARM64_EFI=y
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
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2
