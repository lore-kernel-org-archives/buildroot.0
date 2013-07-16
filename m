From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:28:03 +0200
Subject: [Buildroot] [git commit] arch/arm: add support for Thumb2
Message-ID: <20130716140823.4C1CD9A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85d0769ac5cb50527c5bbab4417262064971073f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, we were using the default ARM instruction set, as used by
the toolchain: the 32 bits ARM instruction set for the internal
backend, and for external toolchain, whatever default was chosen when
the toolchain was generated.

This commit adds support for the Thumb2 instruction set. To do so, it:

 * provides a menuconfig choice between ARM and Thumb2. The choice is
   only shown when Thumb2 is supported, i.e on ARMv7-A CPUs.

 * passes the --with-mode={arm,thumb} option when building gcc in the
   internal backend. This tells the compiler which type of
   instructions it should generate.

 * passes the m{arm,thumb} option in the external toolchain
   wrapper. ARM and Thumb2 code can freely be mixed together, so the
   fact that the C library has been built either ARM or Thumb2 and
   that the rest of the code is built Thumb2 or ARM is not a problem.

[Peter: fix empty BR2_GCC_TARGET_MODE check]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in                                     |    6 +++
 arch/Config.in.arm                                 |   36 ++++++++++++++++++++
 package/gcc/gcc.mk                                 |    5 +++
 toolchain/toolchain-external/ext-tool.mk           |    5 +++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 5 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c2dc9e8..c2147a4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -207,6 +207,12 @@ config BR2_GCC_TARGET_FPU
 config BR2_GCC_TARGET_FLOAT_ABI
 	string
 
+# The value of this option will be passed as --with-mode=<value> when
+# building gcc (internal backend) or -m<value> in the toolchain
+# wrapper (external toolchain)
+config BR2_GCC_TARGET_MODE
+	string
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2b493c0..94c32c9 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,9 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_HAS_THUMB2
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
@@ -65,22 +68,27 @@ config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV3
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_fa526
 	bool "fa526/626"
 config BR2_pj4
@@ -275,6 +283,30 @@ config BR2_ARM_FPU_NEON_VFPV4
 
 endchoice
 
+choice
+	prompt "ARM instruction set"
+	depends on BR2_ARM_CPU_HAS_THUMB2
+
+config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
+	bool "ARM"
+	help
+	  This option instructs the compiler to generate regular ARM
+	  instructions, that are all 32 bits wide.
+
+config BR2_ARM_INSTRUCTIONS_THUMB2
+	bool "Thumb2"
+	help
+	  This option instructions the compiler to generate Thumb2
+	  instructions, which allows to mix 16 bits instructions and
+	  32 bits instructions. This generally provides a much smaller
+	  compiled binary size.
+
+endchoice
+
+config BR2_ARM_INSTRUCTIONS_ARM
+	def_bool y
+	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
+
 config BR2_ARCH
 	default "arm"	if BR2_arm
 	default "armeb"	if BR2_armeb
@@ -344,3 +376,7 @@ config BR2_GCC_TARGET_FLOAT_ABI
 	default "soft"		if BR2_ARM_SOFT_FLOAT
 	default "softfp"	if !BR2_ARM_SOFT_FLOAT && BR2_ARM_EABI
 	default "hard"		if !BR2_ARM_SOFT_FLOAT && BR2_ARM_EABIHF
+
+config BR2_GCC_TARGET_MODE
+	default "arm"		if BR2_ARM_INSTRUCTIONS_ARM
+	default "thumb"		if BR2_ARM_INSTRUCTIONS_THUMB2
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index bfc41a4..ae2a363 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -177,6 +177,11 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 HOST_GCC_COMMON_CONF_OPT += --with-float=$(GCC_TARGET_FLOAT_ABI)
 endif
 
+GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
+ifneq ($(GCC_TARGET_MODE),)
+HOST_GCC_COMMON_CONF_OPT += --with-mode=$(GCC_TARGET_MODE)
+endif
+
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 HOST_GCC_COMMON_CONF_OPT += \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 67fc40d..b9ae68f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -147,6 +147,7 @@ CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 CC_TARGET_FPU_:=$(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+CC_TARGET_MODE_:=$(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
@@ -178,6 +179,10 @@ ifneq ($(CC_TARGET_FLOAT_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
 endif
+ifneq ($(CC_TARGET_MODE_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
+endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index afca6fa..460f255 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -47,6 +47,9 @@ static char *predef_args[] = {
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
+#ifdef BR_MODE
+	"-m" BR_MODE,
+#endif
 #ifdef BR_64
 	"-m64",
 #endif
