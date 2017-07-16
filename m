From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:45:22 +0200
Subject: [Buildroot] [git commit] arch/mips: add support for MIPS32 FP mode
Message-ID: <20170716144456.3BEAA80236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a0a0a976bc1094719556065ab5e982c6ca27563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS32 support different FP modes (32,xx,64), so give the user the
opportunity to choose between them. That will cause host-gcc to be built
using the --with-fp-32=[32|xx|64] configure option. Also the
-mfp[32|xx|64] gcc option will be added to TARGET_CFLAGS and to the
toolchain wrapper.

FP mode option shouldn't be used for soft-float, so we add logic in the
toolchain wrapper if -msoft-float is among the arguments in order to not
append the -fp[[32|xx|64] option, otherwise the compilation may fail.

Information about FP modes here:

- https://sourceware.org/binutils/docs/as/MIPS-Options.html
- https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in                                     |  3 +++
 arch/Config.in.mips                                | 24 ++++++++++++++++++++++
 package/gcc/gcc.mk                                 |  7 +++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  5 +++++
 toolchain/toolchain-wrapper.c                      | 14 +++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e921879..f385745 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -267,6 +267,9 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_NAN
 	string
 
+config BR2_GCC_TARGET_FP32_MODE
+	string
+
 config BR2_GCC_TARGET_CPU
 	string
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index ee1b438..7dd6965 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -134,6 +134,30 @@ config BR2_MIPS_SOFT_FLOAT
 	  floating point functions, then everything will need to be
 	  compiled with soft floating point support (-msoft-float).
 
+choice
+	prompt "FP mode"
+	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
+	default BR2_MIPS_FP32_MODE_XX
+	help
+	  FP mode to be used
+
+config BR2_MIPS_FP32_MODE_32
+	bool "32"
+	depends on !BR2_MIPS_CPU_MIPS32R6
+
+config BR2_MIPS_FP32_MODE_XX
+	bool "xx"
+
+config BR2_MIPS_FP32_MODE_64
+	bool "64"
+	depends on !BR2_MIPS_CPU_MIPS32
+endchoice
+
+config BR2_GCC_TARGET_FP32_MODE
+	default "32"	if BR2_MIPS_FP32_MODE_32
+	default "xx"	if BR2_MIPS_FP32_MODE_XX
+	default "64"	if BR2_MIPS_FP32_MODE_64
+
 config BR2_MIPS_NAN_LEGACY
 	bool
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 7a62f4f..67d3343 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -213,6 +213,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
 endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_FP32_MODE)),)
+HOST_GCC_COMMON_CONF_OPTS += --with-fp-32=$(BR2_GCC_TARGET_FP32_MODE)
+endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -264,6 +267,7 @@ endif
 HOST_GCC_COMMON_WRAPPER_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 HOST_GCC_COMMON_WRAPPER_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 HOST_GCC_COMMON_WRAPPER_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 HOST_GCC_COMMON_WRAPPER_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 HOST_GCC_COMMON_WRAPPER_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -280,6 +284,9 @@ endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_NAN),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(HOST_GCC_COMMON_WRAPPER_TARGET_NAN)"'
 endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE)"'
+endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 7dacbbc..3263199 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -155,6 +155,7 @@ endif
 CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 CC_TARGET_NAN_ := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+CC_TARGET_FP32_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -181,6 +182,10 @@ ifneq ($(CC_TARGET_NAN_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mnan=$(CC_TARGET_NAN_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(CC_TARGET_NAN_)"'
 endif
+ifneq ($(CC_TARGET_FP32_MODE_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfp$(CC_TARGET_FP32_MODE_)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(CC_TARGET_FP32_MODE_)"'
+endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 977d642..dd77c11 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -254,6 +254,20 @@ int main(int argc, char **argv)
 		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
 #endif
 
+#ifdef BR_FP32_MODE
+	/* add fp32 mode if soft-float is not args or hard-float overrides soft-float */
+	int add_fp32_mode = 1;
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-msoft-float"))
+			add_fp32_mode = 0;
+		else if (!strcmp(argv[i], "-mhard-float"))
+			add_fp32_mode = 1;
+	}
+
+	if (add_fp32_mode == 1)
+		*cur++ = "-mfp" BR_FP32_MODE;
+#endif
+
 #if defined(BR_ARCH) || \
     defined(BR_CPU)
 	/* Add our -march/cpu flags, but only if none of
