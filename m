From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Jun 2016 06:03:02 +0200
Subject: [Buildroot] [PATCH v3 1/3] gcc: add hidden symbol for defaults
Message-ID: <20160603040302.GA31489@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some architectures, f.e. Blackfin doesn't support to
configure GCC with --with-cpu to set some CPU specific
default CFLAGS (-mcpu=foo). Use a hidden config symbol
to give a hint which architecture supports it, otherwise
add defaults to toolchain wrapper for internal toolchains.

Idea from Thomas Petazzoni.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v3:
  - new patch
---
 arch/Config.in     | 29 +++++++++++++++++++++++++++++
 package/gcc/gcc.mk | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index be37481..1fdd36a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -27,6 +27,7 @@ choice
 config BR2_arcle
 	bool "ARC (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -35,6 +36,7 @@ config BR2_arcle
 config BR2_arceb
 	bool "ARC (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -42,6 +44,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_GCC_TARGET_DEFAULTS
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
@@ -51,6 +54,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
+	select BR2_GCC_TARGET_DEFAULTS
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
@@ -62,6 +66,7 @@ config BR2_aarch64
 	bool "AArch64 (little endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -71,6 +76,7 @@ config BR2_aarch64_be
 	bool "AArch64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -88,12 +94,14 @@ config BR2_bfin
 config BR2_i386
 	bool "i386"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
 config BR2_m68k
 	bool "m68k"
+	select BR2_GCC_TARGET_DEFAULTS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -102,6 +110,7 @@ config BR2_m68k
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI bus
 	  based architecture (little endian)
@@ -111,6 +120,7 @@ config BR2_microblazeel
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB bus
 	  based architecture (non-AXI, big endian)
@@ -120,6 +130,7 @@ config BR2_microblazebe
 config BR2_mips
 	bool "MIPS (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -128,6 +139,7 @@ config BR2_mips
 config BR2_mipsel
 	bool "MIPS (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -137,6 +149,7 @@ config BR2_mips64
 	bool "MIPS64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -146,6 +159,7 @@ config BR2_mips64el
 	bool "MIPS64 (little endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -154,6 +168,7 @@ config BR2_mips64el
 config BR2_nios2
 	bool "Nios II"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  Nios II is a soft core processor from Altera Corporation.
 	  http://www.altera.com/
@@ -162,6 +177,7 @@ config BR2_nios2
 config BR2_powerpc
 	bool "PowerPC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -172,6 +188,7 @@ config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -182,6 +199,7 @@ config BR2_powerpc64le
 	bool "PowerPC64 (little endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Little endian.
@@ -191,6 +209,7 @@ config BR2_powerpc64le
 config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -201,6 +220,7 @@ config BR2_sh64
 	bool "SuperH64"
 	depends on BR2_DEPRECATED_SINCE_2015_05
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -210,6 +230,7 @@ config BR2_sh64
 config BR2_sparc
 	bool "SPARC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC instruction
 	  set architecture (ISA) developed by Sun Microsystems.
@@ -220,6 +241,7 @@ config BR2_sparc64
 	bool "SPARC64"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC instruction
 	  set architecture (ISA) developed by Sun Microsystems.
@@ -230,6 +252,7 @@ config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_GCC_TARGET_DEFAULTS
 	help
 	  x86-64 is an extension of the x86 instruction set (Intel i386
 	  architecture compatible microprocessor).
@@ -237,6 +260,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	select BR2_GCC_TARGET_DEFAULTS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
@@ -283,6 +307,11 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_GCC_TARGET_MODE
 	string
 
+# Must be selected if GCC for architecture supports --with-{arch,cpu,..}
+# to set default CFLAGS, otherwise values will be used by toolchain wrapper
+config BR2_GCC_TARGET_DEFAULTS
+	bool
+
 # Must be selected by binary formats that support shared libraries.
 config BR2_BINFMT_SUPPORTS_SHARED
 	bool
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46f05ff..a956c0b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -183,6 +183,7 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
 endif
 
 # Determine arch/tune/abi/cpu options
+ifeq ($(BR2_GCC_TARGET_DEFAULTS),y)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
@@ -211,6 +212,7 @@ GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
+endif
 
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
@@ -220,6 +222,37 @@ HOST_GCC_COMMON_CONF_OPTS += \
 endif
 
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+ifneq ($(BR2_GCC_TARGET_DEFAULTS),y)
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
+else
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+endif
+CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
+CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
+
+ifneq ($(CC_TARGET_ARCH_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
+endif
+ifneq ($(CC_TARGET_CPU_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+endif
+ifneq ($(CC_TARGET_ABI_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
+endif
+ifneq ($(CC_TARGET_FPU_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+endif
+ifneq ($(CC_TARGET_FLOAT_ABI_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
+endif
+ifneq ($(CC_TARGET_MODE_),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
+endif
+endif
 
 # For gcc-initial, we need to tell gcc that the C library will be
 # providing the ssp support, as it can't guess it since the C library
-- 
2.1.4
