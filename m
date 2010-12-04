From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sat,  4 Dec 2010 15:44:00 +0100
Subject: [Buildroot] [PATCH] Add qemu sh4 configuration
Message-ID: <1291473840-571-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 ...-missing-consts-to-sys_execve-declaration.patch |   17 +++
 .../linux-sh-fix-kconfig-warning.patch             |   13 +++
 board/qemu/sh4/linux-2.6.36.config                 |  106 ++++++++++++++++++++
 board/qemu/sh4/readme.txt                          |   14 +++
 configs/sh4_defconfig                              |   11 ++
 5 files changed, 161 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/sh4/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
 create mode 100644 board/qemu/sh4/kernel-patches/linux-sh-fix-kconfig-warning.patch
 create mode 100644 board/qemu/sh4/linux-2.6.36.config
 create mode 100644 board/qemu/sh4/readme.txt
 create mode 100644 configs/sh4_defconfig

diff --git a/board/qemu/sh4/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch b/board/qemu/sh4/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
new file mode 100644
index 0000000..f702abe
--- /dev/null
+++ b/board/qemu/sh4/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
@@ -0,0 +1,17 @@
+diff --git a/arch/sh/include/asm/syscalls_32.h b/arch/sh/include/asm/syscalls_32.h
+index be201fd..454538a 100644
+--- a/arch/sh/include/asm/syscalls_32.h
++++ b/arch/sh/include/asm/syscalls_32.h
+@@ -19,8 +19,10 @@ asmlinkage int sys_clone(unsigned long clone_flags, unsigned long newsp,
+ asmlinkage int sys_vfork(unsigned long r4, unsigned long r5,
+ 			 unsigned long r6, unsigned long r7,
+ 			 struct pt_regs __regs);
+-asmlinkage int sys_execve(const char __user *ufilename, char __user * __user *uargv,
+-			  char __user * __user *uenvp, unsigned long r7,
++asmlinkage int sys_execve(const char __user *ufilename,
++			  const char __user *const __user *uargv,
++			  const char __user *const __user *uenvp,
++			  unsigned long r7,
+ 			  struct pt_regs __regs);
+ asmlinkage int sys_sigsuspend(old_sigset_t mask, unsigned long r5,
+ 			      unsigned long r6, unsigned long r7,
diff --git a/board/qemu/sh4/kernel-patches/linux-sh-fix-kconfig-warning.patch b/board/qemu/sh4/kernel-patches/linux-sh-fix-kconfig-warning.patch
new file mode 100644
index 0000000..0ac07f2
--- /dev/null
+++ b/board/qemu/sh4/kernel-patches/linux-sh-fix-kconfig-warning.patch
@@ -0,0 +1,13 @@
+diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
+index 33990fa..06645b6 100644
+--- a/arch/sh/Kconfig
++++ b/arch/sh/Kconfig
+@@ -45,7 +45,7 @@ config SUPERH32
+ 	select HAVE_ARCH_KGDB
+ 	select HAVE_HW_BREAKPOINT
+ 	select HAVE_MIXED_BREAKPOINTS_REGS
+-	select PERF_EVENTS if HAVE_HW_BREAKPOINT
++	select PERF_EVENTS
+ 	select ARCH_HIBERNATION_POSSIBLE if MMU
+ 
+ config SUPERH64
diff --git a/board/qemu/sh4/linux-2.6.36.config b/board/qemu/sh4/linux-2.6.36.config
new file mode 100644
index 0000000..638e4e0
--- /dev/null
+++ b/board/qemu/sh4/linux-2.6.36.config
@@ -0,0 +1,106 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_SLAB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_MODULES=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_SH_RTS7751R2D=y
+CONFIG_RTS7751R2D_PLUS=y
+CONFIG_HEARTBEAT=y
+CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_FW_LOADER=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_NET_PCI=y
+CONFIG_8139CP=y
+CONFIG_8139TOO=y
+# CONFIG_8139TOO_PIO is not set
+# CONFIG_WLAN is not set
+CONFIG_INPUT_FF_MEMLESS=m
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_SH_SCI_NR_UARTS=1
+CONFIG_SERIAL_SH_SCI_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_VIDEO_OUTPUT_CONTROL=m
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=m
+CONFIG_FB_SH_MOBILE_HDMI=m
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+# CONFIG_LOGO_SUPERH_MONO is not set
+# CONFIG_LOGO_SUPERH_VGA16 is not set
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_YMFPCI=m
+CONFIG_SOUND_PRIME=m
+CONFIG_HID_A4TECH=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_LOGITECH=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_PANTHERLORD=y
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SONY=y
+CONFIG_HID_SUNPLUS=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_LIBUSUAL=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_EXT2_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_MINIX_FS=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_DEBUG_FS=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRC_T10DIF=y
diff --git a/board/qemu/sh4/readme.txt b/board/qemu/sh4/readme.txt
new file mode 100644
index 0000000..7c9af6e
--- /dev/null
+++ b/board/qemu/sh4/readme.txt
@@ -0,0 +1,14 @@
+This little documentation explain how to build a kernel and a rootfs for qemu with sh4 architecture.
+
+1) Select qemu sh4 configuration and compile it :
+
+make sh4_defconfig
+make all
+
+2) Run qemu-system-sh4 with the kernel and rootfs previously generated
+
+It's recommanded to use a git release for qemu (stable version don't have a nice output).
+If you want to avoid building all target, you can use this option on qemu configure : --target-list=sh4-softmmu
+
+The command is :
+qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda console=ttySC1,115200 noiotrap
diff --git a/configs/sh4_defconfig b/configs/sh4_defconfig
new file mode 100644
index 0000000..0fa276f
--- /dev/null
+++ b/configs/sh4_defconfig
@@ -0,0 +1,11 @@
+BR2_sh=y
+BR2_WGET="wget --passive-ftp -nd"
+BR2_GIT="git clone"
+BR2_GCC_VERSION_4_5_X=y
+BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/board/qemu/sh4/kernel-patches/"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/qemu/sh4/linux-2.6.36.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.1
