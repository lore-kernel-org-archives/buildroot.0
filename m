From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 29 Jun 2016 12:05:35 +0100
Subject: [Buildroot] [PATCH 6/8] Add qemu_mipsel_32r6_malta_defconfig
In-Reply-To: <1467198337-47064-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467198337-47064-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467198337-47064-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 board/qemu/mipsel-32r6-malta/linux-4.6.config      | 30 +++++++++++++++++++++
 board/qemu/mipsel-32r6-malta/readme.txt            |  7 +++++
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 25 +++++++++++++++++
 configs/qemu_mipsel_32r6_malta_defconfig           | 31 ++++++++++++++++++++++
 4 files changed, 93 insertions(+)
 create mode 100644 board/qemu/mipsel-32r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mipsel-32r6-malta/readme.txt
 create mode 100644 board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
 create mode 100644 configs/qemu_mipsel_32r6_malta_defconfig

diff --git a/board/qemu/mipsel-32r6-malta/linux-4.6.config b/board/qemu/mipsel-32r6-malta/linux-4.6.config
new file mode 100644
index 0000000..d559676
--- /dev/null
+++ b/board/qemu/mipsel-32r6-malta/linux-4.6.config
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
diff --git a/board/qemu/mipsel-32r6-malta/readme.txt b/board/qemu/mipsel-32r6-malta/readme.txt
new file mode 100644
index 0000000..e29115f
--- /dev/null
+++ b/board/qemu/mipsel-32r6-malta/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -net nic,model=pcnet -net user -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.6.0
diff --git a/board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch b/board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
new file mode 100644
index 0000000..6741b7f
--- /dev/null
+++ b/board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
@@ -0,0 +1,25 @@
+diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
+index bf792e2..fc7c1f0 100644
+--- a/arch/mips/kernel/signal.c
++++ b/arch/mips/kernel/signal.c
+@@ -195,6 +195,9 @@ static int restore_msa_extcontext(void __user *buf, unsigned int size)
+ 	unsigned int csr;
+ 	int i, err;
+ 
++	if (!config_enabled(CONFIG_CPU_HAS_MSA))
++		return SIGSYS;
++
+ 	if (size != sizeof(*msa))
+ 		return -EINVAL;
+ 
+@@ -398,8 +401,8 @@ int protected_restore_fp_context(void __user *sc)
+ 	}
+ 
+ fp_done:
+-	if (used & USED_EXTCONTEXT)
+-		err |= restore_extcontext(sc_to_extcontext(sc));
++	if (!err && (used & USED_EXTCONTEXT))
++		err = restore_extcontext(sc_to_extcontext(sc));
+ 
+ 	return err ?: sig;
+ }
diff --git a/configs/qemu_mipsel_32r6_malta_defconfig b/configs/qemu_mipsel_32r6_malta_defconfig
new file mode 100644
index 0000000..157d427
--- /dev/null
+++ b/configs/qemu_mipsel_32r6_malta_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_mipsel=y
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-32r6-malta/linux-4.6.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+# kernel patch needed to compile with GCC 6.x
+BR2_LINUX_KERNEL_PATCH="board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch"
+
+# Compiler
+# linux >= 4.4 uses -mcompact-branches which is only available since GCC 6.x
+BR2_GCC_VERSION_6_X=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.7.3
