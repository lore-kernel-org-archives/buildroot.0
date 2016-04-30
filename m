From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:50:46 +0200
Subject: [Buildroot] [git commit] board: add qemu coldfire support
Message-ID: <20160430165403.8DB2180285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=644d020b65842fccda158d415359ef24666d2706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add kernel config and defconfig for Qemu Coldfire.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/m68k-mcf5208/linux-4.5.config | 21 +++++++++++++++++++++
 board/qemu/m68k-mcf5208/readme.txt       |  7 +++++++
 configs/qemu_m68k_mcf5208_defconfig      | 30 ++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/board/qemu/m68k-mcf5208/linux-4.5.config b/board/qemu/m68k-mcf5208/linux-4.5.config
new file mode 100644
index 0000000..bf30bf4
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/linux-4.5.config
@@ -0,0 +1,21 @@
+CONFIG_M68K=y
+CONFIG_COLDFIRE=y
+# CONFIG_MMU is not set
+CONFIG_M520x=y
+CONFIG_CLOCK_SET=y
+CONFIG_CLOCK_FREQ=66666666
+CONFIG_CLOCK_DIV=1
+CONFIG_M5208EVB=y
+CONFIG_FREESCALE=y
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x0
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40020000
+CONFIG_4KSTACKS=y
+CONFIG_RAMKERNEL=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
new file mode 100644
index 0000000..cb75f46
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.5.0.
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
new file mode 100644
index 0000000..1020740
--- /dev/null
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_m68k=y
+BR2_m68k_cf5208=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.5.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# use minimal busybox with hush
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# mdev does not work correctly
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
