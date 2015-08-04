From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 20:05:23 +0200
Subject: [Buildroot] [git commit branch/next] board: add support for ARC
	AXS101 and AXS103 Software Development Platforms
Message-ID: <20150808105653.58CC77FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77e53b3d84b7dbb7d2746b1f361593a42e01c179
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The AXS10x Platform consists of a DesignWare AXC001 CPU
Card (with ARC 770D core) in case of AXS101 or AXC003 CPU Card
(typically with ARC HS38 core) in case of AXS103 mounted on an
ARC Software Development Platform Mainboard with DesignWare peripherals:
 * SD/MMC contoller
 * Gigabit network contoller
 * Serial ports (8250-compatible)
 * USB 2.0
 * SPI
 * I2C

It also houses HDMI output for external monitor connection.

For stand-alone usage of the board (with only keyboard, mouse and montor
attached) kernel console and getty made available on tty0 as well as on
serial port (ttyS3).

Note there're 2 prerequisites:
 [1] u-boot: 2015.07 - fix creation of .config
     http://patchwork.ozlabs.org/patch/502558/

 [2] binutils: fix buildng of Linux kernel for ARCv2 ISA
     http://patchwork.ozlabs.org/patch/503550/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/synopsys/axs10x/fs-overlay/etc/inittab |   38 ++++++++++++++++++++++++++
 configs/snps_axs101_defconfig                |   27 ++++++++++++++++++
 configs/snps_axs103_defconfig                |   28 +++++++++++++++++++
 3 files changed, 93 insertions(+), 0 deletions(-)

diff --git a/board/synopsys/axs10x/fs-overlay/etc/inittab b/board/synopsys/axs10x/fs-overlay/etc/inittab
new file mode 100644
index 0000000..43bacc6
--- /dev/null
+++ b/board/synopsys/axs10x/fs-overlay/etc/inittab
@@ -0,0 +1,38 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mkdir -p /dev/shm
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+
+# /sbin/getty invocation for tty0
+tty0::respawn:/sbin/getty 115200 tty0
+
+# Put a getty on the serial port
+console::respawn:/sbin/getty -L console 0 vt100
+
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+::shutdown:/etc/init.d/rcK
+::shutdown:/sbin/swapoff -a
+::shutdown:/bin/umount -a -r
diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
new file mode 100644
index 0000000..1f1acac
--- /dev/null
+++ b/configs/snps_axs101_defconfig
@@ -0,0 +1,27 @@
+# Architecture
+BR2_arcle=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="axs101"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+
+# Headers
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
+BR2_LINUX_KERNEL_DEFCONFIG="axs101"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
new file mode 100644
index 0000000..4efdfd1
--- /dev/null
+++ b/configs/snps_axs103_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="axs103"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+
+# Headers
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
+BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
