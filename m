From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:49 +0200
Subject: [Buildroot] [PATCH 5/5] board: add support for Coldfire MCF5208EVB
	board emulated by Qemu
In-Reply-To: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c172f8c6a0b6b1a871f094a94eec2cbfd20390aa.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The support requires a slightly patched Qemu, and doesn't work nicely
yet: the kernel crashes when the first userspace programs exits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch |   25 +++++++
 board/qemu/m68k-mcf5208evb/linux-3.3.config        |   71 ++++++++++++++++++++
 .../qemu-mcfint-masking-support.patch              |   42 ++++++++++++
 board/qemu/m68k-mcf5208evb/readme.txt              |   14 ++++
 configs/qemu_m68k_mcf5208_evb_defconfig            |   14 ++++
 5 files changed, 166 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch
 create mode 100644 board/qemu/m68k-mcf5208evb/linux-3.3.config
 create mode 100644 board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch
 create mode 100644 board/qemu/m68k-mcf5208evb/readme.txt
 create mode 100644 configs/qemu_m68k_mcf5208_evb_defconfig

diff --git a/board/qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch b/board/qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch
new file mode 100644
index 0000000..70d935c
--- /dev/null
+++ b/board/qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch
@@ -0,0 +1,25 @@
+m68k: enabled software emulation of separate supervisor/user stack
+
+Recent Coldfires have separate supervisor and user stack pointers, but
+since older Coldfires didn't have that, the Linux kernel has a kind of
+emulation mechanism for those pointers.
+
+Apparently, according to the Kconfig.cpu file, the 5208 is supposed to
+support such separate pointers, but Qemu doesn't implement it. So we
+cheat a bit here and force the usage of emulated separate stack
+pointers.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
+index 8a9c767..b9ff29a 100644
+--- a/arch/m68k/Kconfig.cpu
++++ b/arch/m68k/Kconfig.cpu
+@@ -146,6 +146,7 @@ config M520x
+ 	depends on !MMU
+ 	select GENERIC_CLOCKEVENTS
+ 	select HAVE_CACHE_SPLIT
++	select COLDFIRE_SW_A7
+ 	help
+ 	   Freescale Coldfire 5207/5208 processor support.
+ 
diff --git a/board/qemu/m68k-mcf5208evb/linux-3.3.config b/board/qemu/m68k-mcf5208evb/linux-3.3.config
new file mode 100644
index 0000000..c20fb6f
--- /dev/null
+++ b/board/qemu/m68k-mcf5208evb/linux-3.3.config
@@ -0,0 +1,71 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="/home/thomas/projets/buildroot/output/images/rootfs.cpio"
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
+CONFIG_EXPERT=y
+# CONFIG_KALLSYMS is not set
+# CONFIG_HOTPLUG is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_MMU is not set
+CONFIG_M520x=y
+CONFIG_CLOCK_SET=y
+CONFIG_CLOCK_FREQ=166666666
+CONFIG_M5208EVB=y
+# CONFIG_4KSTACKS is not set
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x2000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40020000
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_UCLINUX=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_NETDEVICES=y
+CONFIG_FEC=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_SYSFS is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_DEBUG_INFO=y
+CONFIG_FRAME_POINTER=y
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+CONFIG_BOOTPARAM=y
+CONFIG_FULLDEBUG=y
diff --git a/board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch b/board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch
new file mode 100644
index 0000000..d0a779f
--- /dev/null
+++ b/board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch
@@ -0,0 +1,42 @@
+qemu: add support for interrupt masking/unmasking
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/hw/mcf_intc.c b/hw/mcf_intc.c
+index 0b498dd..3c8f54b 100644
+--- a/hw/mcf_intc.c
++++ b/hw/mcf_intc.c
+@@ -64,7 +64,11 @@ static uint64_t mcf_intc_read(void *opaque, target_phys_addr_t addr,
+     case 0x10:
+         return (uint32_t)(s->ifr >> 32);
+     case 0x14:
+-        return (uint32_t)s->ifr;
++      return (uint32_t)s->ifr;
++    /* Reading from SIMR and CIMR return 0 */
++    case 0x1c:
++    case 0x1d:
++      return 0;
+     case 0xe0: /* SWIACK.  */
+         return s->active_vector;
+     case 0xe1: case 0xe2: case 0xe3: case 0xe4:
+@@ -102,6 +106,20 @@ static void mcf_intc_write(void *opaque, target_phys_addr_t addr,
+     case 0x0c:
+         s->imr = (s->imr & 0xffffffff00000000ull) | (uint32_t)val;
+         break;
++    /* SIMR allows to easily mask interrupts */
++    case 0x1c:
++        if (val & 0x40)
++            s->imr = ~0ull;
++        else
++            s->imr |= (1 << (val & 0x3f));
++        break;
++    /* CIMR allows to easily unmask interrupts */
++    case 0x1d:
++        if (val & 0x40)
++            s->imr = 0ull;
++        else
++            s->imr &= ~(1 << (val & 0x3f));
++        break;
+     default:
+         hw_error("mcf_intc_write: Bad write offset %d\n", offset);
+         break;
diff --git a/board/qemu/m68k-mcf5208evb/readme.txt b/board/qemu/m68k-mcf5208evb/readme.txt
new file mode 100644
index 0000000..a110f80
--- /dev/null
+++ b/board/qemu/m68k-mcf5208evb/readme.txt
@@ -0,0 +1,14 @@
+Compile a Qemu with the
+board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch patch
+applied, which fixes problems in the interrupt controller emulation.
+
+To start the emulation, run:
+
+ qemu-system-m68k -M mcf5208evb -kernel output/images/vmlinux -serial stdio
+
+The filesystem is included as an initramfs inside the kernel image.
+
+At the moment, the boot process hangs when the first userspace process
+exits, with the kernel believing that someone is attempting to kill
+init.
+
diff --git a/configs/qemu_m68k_mcf5208_evb_defconfig b/configs/qemu_m68k_mcf5208_evb_defconfig
new file mode 100644
index 0000000..c8cf0c1
--- /dev/null
+++ b/configs/qemu_m68k_mcf5208_evb_defconfig
@@ -0,0 +1,14 @@
+BR2_m68k=y
+BR2_m68k_5208=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
+# BR2_USE_MMU is not set
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
+BR2_LINUX_KERNEL_PATCH="board/qemu/m68k-mcf5208evb/"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208evb/linux-3.3.config"
-- 
1.7.4.1
