From: Mark Corbin <mark.corbin@embecosm.com>
Date: Fri, 31 Aug 2018 10:11:54 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
Message-ID: <20180831091154.22530-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables a riscv64 system to be built with a Buildroot generated
toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).

This configuration has been used to successfully build a qemu-bootable
riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 Makefile                                |   1 +
 arch/Config.in                          |  15 ++++
 arch/Config.in.riscv                    | 104 ++++++++++++++++++++++++
 arch/arch.mk.riscv                      |  24 ++++++
 package/binutils/Config.in.host         |   3 +
 toolchain/toolchain-buildroot/Config.in |  12 ++-
 6 files changed, 156 insertions(+), 3 deletions(-)
 create mode 100644 arch/Config.in.riscv
 create mode 100644 arch/arch.mk.riscv

diff --git a/Makefile b/Makefile
index 413ec921cd..2d67d5bc94 100644
--- a/Makefile
+++ b/Makefile
@@ -433,6 +433,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64.*/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
+	-e s/riscv.*/riscv/ \
 	-e s/sh.*/sh/ \
 	-e s/microblazeel/microblaze/)
 
diff --git a/arch/Config.in b/arch/Config.in
index 7d1aeb2174..44e250e480 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -198,6 +198,17 @@ config BR2_powerpc64le
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
+config BR2_riscv64
+	bool "RISCV64"
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	help
+	  RISC-V is an open, free Instruction Set Architecture created
+	  by the UC Berkeley Architecture Research group and supported
+	  and promoted by RISC-V Foundation.
+	  https://riscv.org/
+	  https://en.wikipedia.org/wiki/RISC-V
+
 config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
@@ -423,6 +434,10 @@ if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
+if BR2_riscv64
+source "arch/Config.in.riscv"
+endif
+
 if BR2_sh
 source "arch/Config.in.sh"
 endif
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
new file mode 100644
index 0000000000..0bee422581
--- /dev/null
+++ b/arch/Config.in.riscv
@@ -0,0 +1,104 @@
+# RISC-V CPU ISA extensions.
+
+config BR2_RISCV_ISA_RVI
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+
+config BR2_RISCV_ISA_RVM
+	bool
+
+config BR2_RISCV_ISA_RVA
+	bool
+
+config BR2_RISCV_ISA_RVF
+	bool
+
+config BR2_RISCV_ISA_RVD
+	bool
+
+config BR2_RISCV_ISA_RVC
+	bool
+
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_riscv_g
+
+config BR2_riscv_g
+	bool "General purpose (G)"
+	select BR2_RISCV_ISA_RVI
+	select BR2_RISCV_ISA_RVM
+	select BR2_RISCV_ISA_RVA
+	select BR2_RISCV_ISA_RVF
+	select BR2_RISCV_ISA_RVD
+	help
+	  General purpose (G) is equivalent to IMAFD.
+
+config BR2_riscv_custom
+	bool "Custom architecture"
+	select BR2_RISCV_ISA_RVI
+
+endchoice
+
+if BR2_riscv_custom
+
+comment "Instruction Set Extensions"
+
+config BR2_RISCV_ISA_CUSTOM_RVM
+	bool "Integer Multiplication and Division (M)"
+	select BR2_RISCV_ISA_RVM
+
+config BR2_RISCV_ISA_CUSTOM_RVA
+	bool "Atomic Instructions (A)"
+	select BR2_RISCV_ISA_RVA
+
+config BR2_RISCV_ISA_CUSTOM_RVF
+	bool "Single-precision Floating-point (F)"
+	select BR2_RISCV_ISA_RVF
+
+config BR2_RISCV_ISA_CUSTOM_RVD
+	bool "Double-precision Floating-point (D)"
+	depends on BR2_RISCV_ISA_RVF
+	select BR2_RISCV_ISA_RVD
+
+config BR2_RISCV_ISA_CUSTOM_RVC
+	bool "Compressed Instructions (C)"
+	select BR2_RISCV_ISA_RVC
+endif
+
+
+choice
+	prompt "Target ABI"
+	default BR2_RISCV_ABI_LP64
+
+config BR2_RISCV_ABI_LP64
+	bool "lp64"
+	depends on BR2_ARCH_IS_64
+
+config BR2_RISCV_ABI_LP64F
+	bool "lp64f"
+	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+
+config BR2_RISCV_ABI_LP64D
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
+endchoice
+
+config BR2_ARCH
+	default "riscv64"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ARCH
+#	Instruction set extension characters are appended by arch/arch.mk.riscv
+	default "rv64i"
+
+config BR2_GCC_TARGET_ABI
+	default "lp64" if BR2_RISCV_ABI_LP64
+	default "lp64f" if BR2_RISCV_ABI_LP64F
+	default "lp64d" if BR2_RISCV_ABI_LP64D
+
+config BR2_READELF_ARCH_NAME
+	default "RISC-V"
+
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
new file mode 100644
index 0000000000..ad2e26903b
--- /dev/null
+++ b/arch/arch.mk.riscv
@@ -0,0 +1,24 @@
+#
+# Append the appropriate RISC-V ISA extensions to the
+# BR2_GCC_TARGET_ARCH variable.
+#
+
+BR2_RISCV_GCC_ARCH = $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+
+ifeq ($(BR2_RISCV_ISA_RVM),y)
+BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)m
+endif
+ifeq ($(BR2_RISCV_ISA_RVA),y)
+BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)a
+endif
+ifeq ($(BR2_RISCV_ISA_RVF),y)
+BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)f
+endif
+ifeq ($(BR2_RISCV_ISA_RVD),y)
+BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)d
+endif
+ifeq ($(BR2_RISCV_ISA_RVC),y)
+BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)c
+endif
+
+BR2_GCC_TARGET_ARCH := $(patsubst %,"%",$(BR2_RISCV_GCC_ARCH))
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 21dc84e498..747bac57ed 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -6,15 +6,18 @@ choice
 	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
 	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_2_30_X if BR2_riscv64
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
 	depends on !BR2_arc
+	depends on !BR2_riscv64
 
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
+	depends on !BR2_riscv64
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 75e8191f46..6798448bda 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64 || BR2_riscv64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
@@ -46,14 +46,16 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
-		   BR2_microblaze  || BR2_nios2      || BR2_archs38
+		   BR2_riscv64     || BR2_sh         || BR2_sparc64     || \
+		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
+		   BR2_archs38
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv64
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -77,6 +79,10 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 	depends on BR2_MIPS_NAN_2008
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+comment "glibc needs ISA extension A on riscv64"
+	depends on BR2_riscv64
+	depends on !BR2_RISCV_ISA_RVA
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-- 
2.17.1
