From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 7 Jan 2017 09:48:03 +0100
Subject: [Buildroot] [PATCH] arch: add support for OpenRISC architecture
Message-ID: <20170107084803.GA6034@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a sample defconfig which can be used to create a system for Qemu.
Openrisc community is getting more active recently and tries
to add missing patches upstream to gcc/gdb.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 Makefile                                     |  1 +
 arch/Config.in                               | 11 +++++++++++
 arch/Config.in.or1k                          |  5 +++++
 board/qemu/or1k/linux-4.9.config             | 29 ++++++++++++++++++++++++++++
 board/qemu/or1k/patches/linux/kallsyms.patch | 24 +++++++++++++++++++++++
 board/qemu/or1k/patches/linux/ld-or1k.patch  | 12 ++++++++++++
 board/qemu/or1k/readme.txt                   |  9 +++++++++
 configs/qemu_or1k_defconfig                  | 22 +++++++++++++++++++++
 package/gcc/Config.in.host                   | 15 +++++++++++---
 package/gcc/gcc.hash                         |  2 ++
 package/gcc/gcc.mk                           |  6 ++++--
 package/uclibc/Config.in                     |  5 +++--
 toolchain/toolchain-buildroot/Config.in      |  8 ++++----
 13 files changed, 138 insertions(+), 11 deletions(-)
 create mode 100644 arch/Config.in.or1k
 create mode 100644 board/qemu/or1k/linux-4.9.config
 create mode 100644 board/qemu/or1k/patches/linux/kallsyms.patch
 create mode 100644 board/qemu/or1k/patches/linux/ld-or1k.patch
 create mode 100644 board/qemu/or1k/readme.txt
 create mode 100644 configs/qemu_or1k_defconfig

diff --git a/Makefile b/Makefile
index b80b9e1..b99996e 100644
--- a/Makefile
+++ b/Makefile
@@ -420,6 +420,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64.*/arm64/ \
 	-e s/bfin/blackfin/ \
+	-e s/or1k/openrisc/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64.*/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
diff --git a/arch/Config.in b/arch/Config.in
index d59cbd7..7149b2c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -159,6 +159,13 @@ config BR2_nios2
 	  http://www.altera.com/
 	  http://en.wikipedia.org/wiki/Nios_II
 
+config BR2_or1k
+	bool "OpenRISC"
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  OpenRISC is a free and open processor for embedded system.
+	  http://openrisc.io
+
 config BR2_powerpc
 	bool "PowerPC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -378,6 +385,10 @@ if BR2_nios2
 source "arch/Config.in.nios2"
 endif
 
+if BR2_or1k
+source "arch/Config.in.or1k"
+endif
+
 if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
new file mode 100644
index 0000000..dba64a6
--- /dev/null
+++ b/arch/Config.in.or1k
@@ -0,0 +1,5 @@
+config BR2_ARCH
+	default "or1k"
+
+config BR2_ENDIAN
+	default "BIG"
diff --git a/board/qemu/or1k/linux-4.9.config b/board/qemu/or1k/linux-4.9.config
new file mode 100644
index 0000000..5ba03c3
--- /dev/null
+++ b/board/qemu/or1k/linux-4.9.config
@@ -0,0 +1,29 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+CONFIG_OPENRISC_BUILTIN_DTB="or1ksim"
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_ETHOC=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_USB_SUPPORT is not set
diff --git a/board/qemu/or1k/patches/linux/kallsyms.patch b/board/qemu/or1k/patches/linux/kallsyms.patch
new file mode 100644
index 0000000..fe6f9c0
--- /dev/null
+++ b/board/qemu/or1k/patches/linux/kallsyms.patch
@@ -0,0 +1,24 @@
+From: https://lkml.org/lkml/2016/12/31/13
+
+The build robot reports:
+
+   .tmp_kallsyms1.o: In function `kallsyms_relative_base':
+>> (.rodata+0x8a18): undefined reference to `_text'
+
+This is when using 'make alldefconfig'. Adding this _text symbol to mark
+the start of the kernel as in other architecture fixes this.
+
+Signed-off-by: Stafford Horne <shorne@gmail.com>
+
+diff -Nur linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.9/arch/openrisc/kernel/vmlinux.lds.S
+--- linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-12-11 20:17:54.000000000 +0100
++++ linux-4.9/arch/openrisc/kernel/vmlinux.lds.S	2017-01-01 12:13:43.039107518 +0100
+@@ -38,6 +38,8 @@
+         /* Read-only sections, merged into text segment: */
+         . = LOAD_BASE ;
+ 
++	_text = .;
++
+ 	/* _s_kernel_ro must be page aligned */
+ 	. = ALIGN(PAGE_SIZE);
+ 	_s_kernel_ro = .;
diff --git a/board/qemu/or1k/patches/linux/ld-or1k.patch b/board/qemu/or1k/patches/linux/ld-or1k.patch
new file mode 100644
index 0000000..264f916
--- /dev/null
+++ b/board/qemu/or1k/patches/linux/ld-or1k.patch
@@ -0,0 +1,12 @@
+diff -Nur linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S
+--- linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-03-10 00:35:58.000000000 +0100
++++ linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S	2016-03-16 09:21:07.933535532 +0100
+@@ -30,7 +30,7 @@
+ #include <asm/cache.h>
+ #include <asm-generic/vmlinux.lds.h>
+ 
+-OUTPUT_FORMAT("elf32-or32", "elf32-or32", "elf32-or32")
++OUTPUT_FORMAT("elf32-or1k", "elf32-or1k", "elf32-or1k")
+ jiffies = jiffies_64 + 4;
+ 
+ SECTIONS
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
new file mode 100644
index 0000000..53c66ad
--- /dev/null
+++ b/board/qemu/or1k/readme.txt
@@ -0,0 +1,9 @@
+Run the emulation with:
+
+ qemu-system-or32 -kernel output/images/vmlinux -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Ethernet support is not working, yet.
+
+Tested with QEMU 2.8.0.
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
new file mode 100644
index 0000000..111afc2
--- /dev/null
+++ b/configs/qemu_or1k_defconfig
@@ -0,0 +1,22 @@
+# Architecture
+BR2_or1k=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/qemu/or1k/patches"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4,9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.9.config"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d8fbc18..eb41aa4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,7 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_5_X
 	help
 	  Select the version of gcc you wish to use.
@@ -10,7 +11,7 @@ choice
 	config BR2_GCC_VERSION_4_8_X
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_arc \
+		depends on !BR2_microblaze && !BR2_arc && !BR2_or1k \
 			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
@@ -36,10 +37,16 @@ choice
 		depends on BR2_arc
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
+	config BR2_GCC_VERSION_OR1K
+		bool "gcc or1k (5.x)"
+		# Only supported architecture
+		depends on BR2_or1k
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_bfin
+		depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17 && !BR2_cortex_a72
 		# Unsupported MIPS cores
@@ -60,7 +67,7 @@ choice
 	config BR2_GCC_VERSION_5_X
 		bool "gcc 5.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_bfin
+		depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 		# Unsupported MIPS cores
@@ -75,6 +82,7 @@ choice
 		# Broken or unsupported architectures
 		depends on !BR2_arc
 		depends on !BR2_microblaze
+		depends on !BR2_or1k
 		# Unsupported MIPS cores
 		depends on !BR2_mips_m6250 && !BR2_mips_p6600
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
@@ -99,6 +107,7 @@ config BR2_GCC_VERSION
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.3.0"     if BR2_GCC_VERSION_6_X
 	default "arc-2016.09-release" if BR2_GCC_VERSION_ARC
+	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1988237..4376db4 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,5 @@ sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630e
 
 # Locally calculated (fetched from Github)
 sha512  faae6dc3f7843412068a52de5919797cd23e6ed1b8d140c230d0381f13fd38af67baaa4a09e581c03602127da3dd2fab6f9f5d7ac5d4270585bd079c673dda9a  gcc-arc-2016.09-release.tar.gz
+# Locally calculated (fetched from Github)
+sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 464e4c9..7b7a5cf 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,11 +13,13 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else ifeq ($(BR2_or1k),y)
+GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-endif
-
 GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
+endif
 
 #
 # Xtensa special hook
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a200154..4d5f629 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -57,12 +57,12 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on BR2_USE_MMU
-		depends on !BR2_m68k && !BR2_microblaze
+		depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
 
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
+		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NONE
 		bool "none"
@@ -106,6 +106,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "m68k"	   if BR2_m68k
 	default "microblaze"   if BR2_microblaze
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default "or1k"     if BR2_or1k
 	default "powerpc"  if BR2_powerpc
 	default "sh"	   if BR2_sh
 	default "sparc"	   if BR2_sparc
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c8436cc..d5f98a9 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -32,8 +32,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
-		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
+		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	help
-- 
2.1.4
