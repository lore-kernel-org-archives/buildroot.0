From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:25:38 +0200
Subject: [Buildroot] [git commit] configs: add
	qemu_xtensa_lx60_nommu_defconfig
Message-ID: <20160418192629.71BFC7FBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20e738bc3f938bf3c71752b4f78ccc28c274d531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add noMMU configuration running on dc233c MMUv3 core with identity
memory map.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/xtensa-lx60/linux-4.4-nommu.config | 37 +++++++++++++++++++++++++++
 configs/qemu_xtensa_lx60_nommu_defconfig      | 34 ++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/board/qemu/xtensa-lx60/linux-4.4-nommu.config b/board/qemu/xtensa-lx60/linux-4.4-nommu.config
new file mode 100644
index 0000000..29f6fa4
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-4.4-nommu.config
@@ -0,0 +1,37 @@
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_CUSTOM=y
+CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
+# CONFIG_XTENSA_VARIANT_MMU is not set
+CONFIG_XTENSA_UNALIGNED_USER=y
+CONFIG_PREEMPT=y
+# CONFIG_PCI is not set
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8"
+CONFIG_DEFAULT_MEM_START=0x00000000
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_DNS_RESOLVER=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_MARVELL_PHY=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
+CONFIG_FANOTIFY=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
new file mode 100644
index 0000000..4af346a
--- /dev/null
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -0,0 +1,34 @@
+# Architecture
+BR2_xtensa=y
+BR2_XTENSA_CUSTOM=y
+BR2_XTENSA_CUSTOM_NAME="dc233c"
+BR2_XTENSA_CORE_NAME="lx60"
+BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
+
+# Toolchain
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.4-nommu.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
