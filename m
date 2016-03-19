From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Mar 2016 18:27:55 +0100
Subject: [Buildroot] [PATCH 2/2] qemu-m68k: add new board
Message-ID: <20160319172755.GA20286@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ethernet is not working, but at least you get a shell and
can test applications for m68k.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/m68k-q800/linux-4.5.config | 26 ++++++++++++++++++++++++++
 board/qemu/m68k-q800/readme.txt       |  8 ++++++++
 configs/qemu_m68k_q800_defconfig      | 25 +++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 board/qemu/m68k-q800/linux-4.5.config
 create mode 100644 board/qemu/m68k-q800/readme.txt
 create mode 100644 configs/qemu_m68k_q800_defconfig

diff --git a/board/qemu/m68k-q800/linux-4.5.config b/board/qemu/m68k-q800/linux-4.5.config
new file mode 100644
index 0000000..44eb70e
--- /dev/null
+++ b/board/qemu/m68k-q800/linux-4.5.config
@@ -0,0 +1,26 @@
+CONFIG_M68K=y
+CONFIG_M68040=y
+CONFIG_M68KFPU_EMU=y
+CONFIG_MAC=y
+CONFIG_MACINTOSH_DRIVERS=y
+CONFIG_ADB=y
+CONFIG_ADB_MACII=y
+CONFIG_TTY=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_MACSONIC=y
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+CONFIG_SCSI_LOWLEVEL=y
+CONFIG_SCSI_MAC_ESP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/m68k-q800/readme.txt b/board/qemu/m68k-q800/readme.txt
new file mode 100644
index 0000000..78267a3
--- /dev/null
+++ b/board/qemu/m68k-q800/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+ qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/sda console=ttyS0"
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.4.0 from https://github.com/vivier/qemu-m68k
+You need following branch: q800-v2.4.0
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
new file mode 100644
index 0000000..2dbc3e3
--- /dev/null
+++ b/configs/qemu_m68k_q800_defconfig
@@ -0,0 +1,25 @@
+# Architecture
+BR2_m68k=y
+BR2_m68k_68040=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
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
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.5.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.1.4
