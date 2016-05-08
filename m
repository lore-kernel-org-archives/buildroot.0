From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 May 2016 11:03:45 +0200
Subject: [Buildroot] [PATCH 4/4] board: add blackfin gdb simulator support
Message-ID: <20160508090345.GA32614@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this config you can bootup a Linux kernel
in GDB simulator and test Blackfin kernel and
userland.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/gdb/bfin-bf512/linux-4.4.config | 87 +++++++++++++++++++++++++++++++++++
 board/gdb/bfin-bf512/readme.txt       | 11 +++++
 board/gdb/post-build.sh               |  4 ++
 configs/gdb_bfin_bf512_defconfig      | 37 +++++++++++++++
 system/device_table_dev.txt           |  1 +
 5 files changed, 140 insertions(+)
 create mode 100644 board/gdb/bfin-bf512/linux-4.4.config
 create mode 100644 board/gdb/bfin-bf512/readme.txt
 create mode 100755 board/gdb/post-build.sh
 create mode 100644 configs/gdb_bfin_bf512_defconfig

diff --git a/board/gdb/bfin-bf512/linux-4.4.config b/board/gdb/bfin-bf512/linux-4.4.config
new file mode 100644
index 0000000..bc2a907
--- /dev/null
+++ b/board/gdb/bfin-bf512/linux-4.4.config
@@ -0,0 +1,87 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_UID16 is not set
+# CONFIG_SGETMASK_SYSCALL is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+# CONFIG_BLOCK is not set
+CONFIG_BF512=y
+# CONFIG_SET_GENERIC_CLOCKEVENTS is not set
+# CONFIG_I_ENTRY_L1 is not set
+# CONFIG_EXCPT_IRQ_SYSC_L1 is not set
+# CONFIG_DO_IRQ_L1 is not set
+# CONFIG_CORE_TIMER_IRQ_L1 is not set
+# CONFIG_IDLE_L1 is not set
+# CONFIG_SCHEDULE_L1 is not set
+# CONFIG_ARITHMETIC_OPS_L1 is not set
+# CONFIG_ACCESS_OK_L1 is not set
+# CONFIG_MEMSET_L1 is not set
+# CONFIG_MEMCPY_L1 is not set
+# CONFIG_STRCMP_L1 is not set
+# CONFIG_STRNCMP_L1 is not set
+# CONFIG_STRCPY_L1 is not set
+# CONFIG_STRNCPY_L1 is not set
+# CONFIG_SYS_BFIN_SPINLOCK_L1 is not set
+# CONFIG_CACHELINE_ALIGNED_L1 is not set
+# CONFIG_DCACHE_FLUSH_L1 is not set
+# CONFIG_APP_STACK_L1 is not set
+# CONFIG_BFIN_INS_LOWOVERHEAD is not set
+# CONFIG_BFIN_ICACHE is not set
+# CONFIG_BFIN_DCACHE is not set
+# CONFIG_C_AMCKEN is not set
+CONFIG_BINFMT_ELF_FDPIC=y
+CONFIG_BINFMT_FLAT=y
+# CONFIG_COREDUMP is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_BFIN=y
+CONFIG_SERIAL_BFIN_CONSOLE=y
+CONFIG_SERIAL_BFIN_UART0=y
+CONFIG_SERIAL_BFIN_UART1=y
+# CONFIG_BFIN_OTP is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MANDATORY_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="utf-8"
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+# CONFIG_DEBUG_VERBOSE is not set
+# CONFIG_DEBUG_HUNT_FOR_ZERO is not set
+# CONFIG_DEBUG_BFIN_HWTRACE_ON is not set
+CONFIG_EARLY_PRINTK=y
+# CONFIG_ACCESS_CHECK is not set
+# CONFIG_CRC32 is not set
diff --git a/board/gdb/bfin-bf512/readme.txt b/board/gdb/bfin-bf512/readme.txt
new file mode 100644
index 0000000..a56b5bc
--- /dev/null
+++ b/board/gdb/bfin-bf512/readme.txt
@@ -0,0 +1,11 @@
+Run the simulation with GDB for FDPIC:
+
+ ./output/host/usr/bin/bfin-buildroot-linux-uclibc-run --env operating --model bf512 output/images/vmlinux
+
+Run the simulation with GDB for FLAT:
+
+ ./output/host/usr/bin/bfin-buildroot-uclinux-uclibc-run --env operating --model bf512 output/images/vmlinux
+
+The login prompt will appear in the terminal that started GDB.
+
+Tested with GDB 7.9
diff --git a/board/gdb/post-build.sh b/board/gdb/post-build.sh
new file mode 100755
index 0000000..8933d50
--- /dev/null
+++ b/board/gdb/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# no simulated network devices at the moment
+rm -f ${TARGET_DIR}/etc/init.d/S40network
+rm -rf ${TARGET_DIR}/etc/network/
diff --git a/configs/gdb_bfin_bf512_defconfig b/configs/gdb_bfin_bf512_defconfig
new file mode 100644
index 0000000..582350e
--- /dev/null
+++ b/configs/gdb_bfin_bf512_defconfig
@@ -0,0 +1,37 @@
+# Architecture
+BR2_bfin=y
+BR2_bf512=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/gdb/post-build.sh"
+
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gdb/bfin-bf512/linux-4.4.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyBF0"
+
+# use minimal busybox with hush
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# ldconfig does not build
+# BR2_UCLIBC_INSTALL_UTILS is not set
+
+# compile gdb sim
+BR2_PACKAGE_HOST_GDB=y
+# BR2_PACKAGE_HOST_GDB_TUI is not set
+# BR2_PACKAGE_HOST_GDB_PYTHON is not set
+BR2_PACKAGE_HOST_GDB_SIM=y
+
diff --git a/system/device_table_dev.txt b/system/device_table_dev.txt
index c4257a6..4f0b637 100644
--- a/system/device_table_dev.txt
+++ b/system/device_table_dev.txt
@@ -31,6 +31,7 @@
 /dev/ttyAM	c	666	0	0	204	16	0	1	3
 /dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttyBF	c	666	0	0	204	64	0	1	2
 /dev/ttySAC	c	666	0	0	204	64	0	1	4
 /dev/ttySC	c	666	0	0	204	8	0	1	8
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
-- 
2.1.4
