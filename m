From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 22 Jun 2017 18:11:32 +0100
Subject: [Buildroot] [PATCH v2 1/2] infra: add support for MIPS NaN
Message-ID: <20170622171133.58513-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS supports two different NaN encondings, legacy and 2008. Information
about MIPS NaN encodings can be found here:

  https://sourceware.org/binutils/docs/as/MIPS-NaN-Encodings.html

NaN legacy is the only option available for R2 cores and older.
NaN 2008 is the only option available for R6 cores.
R5 cores can have either NaN legacy or NaN 2008, depending on the
implementation. So, if the user selects a generic R5 target architecture
variant, we show a choice menu with both options available. For well
known R5 cores we directly select the NaN enconding they use.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Define config symbol in arch/Config.in
 - Change string "NAN" to "NaN"
---
 arch/Config.in                                     |  3 ++
 arch/Config.in.mips                                | 32 ++++++++++++++++++++++
 package/gcc/gcc.mk                                 |  7 +++++
 .../toolchain-external/pkg-toolchain-external.mk   |  5 ++++
 toolchain/toolchain-wrapper.c                      |  3 ++
 5 files changed, 50 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 50377a9af..e921879d0 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -264,6 +264,9 @@ config BR2_GCC_TARGET_ARCH
 config BR2_GCC_TARGET_ABI
 	string
 
+config BR2_GCC_TARGET_NAN
+	string
+
 config BR2_GCC_TARGET_CPU
 	string
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 4e9ad12ad..a9c27a0e8 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -51,6 +51,7 @@ config BR2_mips_m5150
 	bool "M5150"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+	select BR2_MIPS_NAN_2008
 config BR2_mips_m6250
 	bool "M6250"
 	depends on !BR2_ARCH_IS_64
@@ -59,6 +60,7 @@ config BR2_mips_p5600
 	bool "P5600"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+	select BR2_MIPS_NAN_2008
 config BR2_mips_xburst
 	bool "XBurst"
 	depends on !BR2_ARCH_IS_64
@@ -126,6 +128,36 @@ config BR2_MIPS_SOFT_FLOAT
 	  floating point functions, then everything will need to be
 	  compiled with soft floating point support (-msoft-float).
 
+config BR2_MIPS_NAN_LEGACY
+	bool
+	default y		if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64 || BR2_MIPS_CPU_MIPS64R2
+
+config BR2_MIPS_NAN_2008
+	bool
+	default y		if BR2_MIPS_CPU_MIPS32R6 || BR2_MIPS_CPU_MIPS64R6
+
+choice
+	prompt "Target NaN"
+	depends on BR2_mips_32r5 || BR2_mips_64r5
+	default BR2_MIPS_ENABLE_NAN_2008
+
+	help
+	  NaN encoding to be used
+
+config BR2_MIPS_ENABLE_NAN_LEGACY
+	bool "legacy"
+	select BR2_MIPS_NAN_LEGACY
+
+config BR2_MIPS_ENABLE_NAN_2008
+	bool "2008"
+	depends on !BR2_MIPS_SOFT_FLOAT
+	select BR2_MIPS_NAN_2008
+endchoice
+
+config BR2_GCC_TARGET_NAN
+	default "legacy"	if BR2_MIPS_NAN_LEGACY
+	default "2008"		if BR2_MIPS_NAN_2008
+
 config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b52f9456b..c0249cd50 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -204,6 +204,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
+HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
+endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -254,6 +257,7 @@ HOST_GCC_COMMON_WRAPPER_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_
 endif
 HOST_GCC_COMMON_WRAPPER_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 HOST_GCC_COMMON_WRAPPER_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+HOST_GCC_COMMON_WRAPPER_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
 HOST_GCC_COMMON_WRAPPER_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 HOST_GCC_COMMON_WRAPPER_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -267,6 +271,9 @@ endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_ABI),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_ABI)"'
 endif
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_NAN),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(HOST_GCC_COMMON_WRAPPER_TARGET_NAN)"'
+endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 826934505..29c0aade1 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -156,6 +156,7 @@ CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVIS
 endif
 CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_NAN_ := $(call qstrip,$(BR2_GCC_TARGET_NAN))
 CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
@@ -178,6 +179,10 @@ ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+ifneq ($(CC_TARGET_NAN_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mnan=$(CC_TARGET_NAN_)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(CC_TARGET_NAN_)"'
+endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 100aa181c..28066e425 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -51,6 +51,9 @@ static char *predef_args[] = {
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
+#ifdef BR_NAN
+	"-mnan=" BR_NAN,
+#endif
 #ifdef BR_FPU
 	"-mfpu=" BR_FPU,
 #endif
-- 
2.13.0
