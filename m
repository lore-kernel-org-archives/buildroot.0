From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 1 Jul 2016 10:27:22 +0100
Subject: [Buildroot] [PATCH v2 3/6] Add qemu_mips32r6_malta_defconfig
In-Reply-To: <1467365245-24123-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467365245-24123-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467365245-24123-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Use mips32r6 instead of mips_32r6 in the defconfig name.
 - Use mips32r6 instead of mips-32r6 in the board dir name.
 - Use kernel 4.6.3.
 - Drop the MSA patch since its included in 4.6.3.

 board/qemu/mips32r6-malta/linux-4.6.config | 30 ++++++++++++++++++++++++++++++
 board/qemu/mips32r6-malta/readme.txt       |  7 +++++++
 configs/qemu_mips32r6_malta_defconfig      | 29 +++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 board/qemu/mips32r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mips32r6-malta/readme.txt
 create mode 100644 configs/qemu_mips32r6_malta_defconfig

diff --git a/board/qemu/mips32r6-malta/linux-4.6.config b/board/qemu/mips32r6-malta/linux-4.6.config
new file mode 100644
index 0000000..d559676
--- /dev/null
+++ b/board/qemu/mips32r6-malta/linux-4.6.config
@@ -0,0 +1,30 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS32_R6=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
new file mode 100644
index 0000000..107c47d
--- /dev/null
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.6.0
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
new file mode 100644
index 0000000..4c53512
--- /dev/null
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_mips=y
+BR2_mips_32r6=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.6.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Compiler
+# linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
+BR2_GCC_VERSION_6_X=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.7.3
