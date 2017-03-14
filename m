From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:55:04 +0100
Subject: [Buildroot] [git commit] configs/qemu: update xtensa linux to 4.9
Message-ID: <20170314205508.7275581D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3bf9fc7cab97eac5f0e77456e86826970e506b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux configs are missing memmap= option that is required for xtfpga
boards configured w/o device tree starting with linux-4.9. Add it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-4.8-nommu.config => linux-4.9-nommu.config}            | 3 ++-
 board/qemu/xtensa-lx60/{linux-4.8.config => linux-4.9.config}     | 2 +-
 configs/qemu_xtensa_lx60_defconfig                                | 8 ++++----
 configs/qemu_xtensa_lx60_nommu_defconfig                          | 8 ++++----
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/board/qemu/xtensa-lx60/linux-4.8-nommu.config b/board/qemu/xtensa-lx60/linux-4.9-nommu.config
similarity index 92%
rename from board/qemu/xtensa-lx60/linux-4.8-nommu.config
rename to board/qemu/xtensa-lx60/linux-4.9-nommu.config
index 29f6fa4..10f7ee1 100644
--- a/board/qemu/xtensa-lx60/linux-4.8-nommu.config
+++ b/board/qemu/xtensa-lx60/linux-4.9-nommu.config
@@ -6,10 +6,11 @@ CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
 # CONFIG_XTENSA_VARIANT_MMU is not set
 CONFIG_XTENSA_UNALIGNED_USER=y
 CONFIG_PREEMPT=y
+CONFIG_KERNEL_LOAD_ADDRESS=0x00003000
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8"
+CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8 memmap=0x04000000 at 0"
 CONFIG_DEFAULT_MEM_START=0x00000000
 CONFIG_BINFMT_FLAT=y
 CONFIG_NET=y
diff --git a/board/qemu/xtensa-lx60/linux-4.8.config b/board/qemu/xtensa-lx60/linux-4.9.config
similarity index 94%
rename from board/qemu/xtensa-lx60/linux-4.8.config
rename to board/qemu/xtensa-lx60/linux-4.9.config
index 2d8e58d..625b860 100644
--- a/board/qemu/xtensa-lx60/linux-4.8.config
+++ b/board/qemu/xtensa-lx60/linux-4.9.config
@@ -5,7 +5,7 @@ CONFIG_XTENSA_VARIANT_DC233C=y
 CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,38400"
+CONFIG_CMDLINE="console=ttyS0,38400 memmap=0x04000000 at 0"
 # CONFIG_COMPACTION is not set
 # CONFIG_BOUNCE is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 54d844d..db06e90 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 256cbee..55714a1 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
