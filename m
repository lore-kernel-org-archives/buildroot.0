From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 23:42:41 +0200
Subject: [Buildroot] [git commit] arch: add support for RISC-V 64-bit
 (riscv64) architecture
Message-ID: <20180925194643.C154F88CAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b3d52b4008abacc4ea4867e0fe4e68ed32b1920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables a riscv64 system to be built with a Buildroot generated
toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).

This configuration has been used to successfully build a qemu-bootable
riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
[Thomas:
 - simplify arch.mk.riscv by directly setting GCC_TARGET_ARCH
 - simplify glibc.mk changes by using GLIBC_CONF_ENV.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                              |   4 ++
 Makefile                                |   1 +
 arch/Config.in                          |  15 +++++
 arch/Config.in.riscv                    | 102 ++++++++++++++++++++++++++++++++
 arch/arch.mk.riscv                      |  28 +++++++++
 package/binutils/Config.in.host         |   2 +
 package/glibc/glibc.mk                  |   6 ++
 package/linux-headers/Config.in.host    |   5 ++
 toolchain/toolchain-buildroot/Config.in |   6 +-
 9 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 84129553c5..199ad9248e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1298,6 +1298,10 @@ F:	package/lynx/
 N:	Mario Rugiero <mrugiero@gmail.com>
 F:	package/ratpoison/
 
+N:	Mark Corbin <mark.corbin@embecosm.com>
+F:	arch/arch.mk.riscv
+F:	arch/Config.in.riscv
+
 N:	Markos Chandras <markos.chandras@imgtec.com>
 F:	package/harfbuzz/
 F:	package/libsecret/
diff --git a/Makefile b/Makefile
index 600b5245f0..82dd76ea76 100644
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
index 7d1aeb2174..8bd57fe1cc 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -198,6 +198,17 @@ config BR2_powerpc64le
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
+config BR2_riscv
+	bool "RISCV"
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
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
 
+if BR2_riscv
+source "arch/Config.in.riscv"
+endif
+
 if BR2_sh
 source "arch/Config.in.sh"
 endif
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
new file mode 100644
index 0000000000..4361890bf4
--- /dev/null
+++ b/arch/Config.in.riscv
@@ -0,0 +1,102 @@
+# RISC-V CPU ISA extensions.
+
+config BR2_RISCV_ISA_RVI
+	bool
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
+	select BR2_RISCV_ISA_CUSTOM_RVA
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
+config BR2_RISCV_64
+	bool
+	default y
+	select BR2_ARCH_IS_64
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
+	default "riscv64" if BR2_ARCH_IS_64
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ABI
+	default "lp64" if BR2_RISCV_ABI_LP64
+	default "lp64f" if BR2_RISCV_ABI_LP64F
+	default "lp64d" if BR2_RISCV_ABI_LP64D
+
+config BR2_READELF_ARCH_NAME
+	default "RISC-V"
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
new file mode 100644
index 0000000000..022d1a6809
--- /dev/null
+++ b/arch/arch.mk.riscv
@@ -0,0 +1,28 @@
+#
+# Configure the GCC_TARGET_ARCH variable and append the
+# appropriate RISC-V ISA extensions.
+#
+
+ifeq ($(BR2_riscv),y)
+
+ifeq ($(BR2_ARCH_IS_64),y)
+GCC_TARGET_ARCH := rv64i
+endif
+
+ifeq ($(BR2_RISCV_ISA_RVM),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)m
+endif
+ifeq ($(BR2_RISCV_ISA_RVA),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)a
+endif
+ifeq ($(BR2_RISCV_ISA_RVF),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)f
+endif
+ifeq ($(BR2_RISCV_ISA_RVD),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)d
+endif
+ifeq ($(BR2_RISCV_ISA_RVC),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
+endif
+
+endif
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 21dc84e498..c8c02bca77 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,9 +12,11 @@ choice
 config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
 	depends on !BR2_arc
+	depends on !BR2_riscv
 
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
+	depends on !BR2_riscv
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4e50f5aa0c..c8ade7c28b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -76,6 +76,12 @@ GLIBC_CONF_ENV = \
 	libc_cv_forced_unwind=yes \
 	libc_cv_ssp=no
 
+# Override the default library locations of /lib64/<abi> and
+# /usr/lib64/<abi>/ for RISC-V.
+ifeq ($(BR2_riscv),y)
+GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b12ea6986c..68b9ef16fc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -29,22 +29,27 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 config BR2_KERNEL_HEADERS_3_2
 	bool "Linux 3.2.x kernel headers"
 	depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
+	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 config BR2_KERNEL_HEADERS_4_1
 	bool "Linux 4.1.x kernel headers"
+	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 
 config BR2_KERNEL_HEADERS_4_4
 	bool "Linux 4.4.x kernel headers"
+	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
+	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
+	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
 config BR2_KERNEL_HEADERS_4_16
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 75e8191f46..7d9428c70e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,14 +46,16 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
-		   BR2_microblaze  || BR2_nios2      || BR2_archs38
+		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
+		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
+		   BR2_archs38
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
