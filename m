From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 28 Jun 2017 15:15:29 +0100
Subject: [Buildroot] [PATCH v5 3/4] infra: add MIPS DSP support
In-Reply-To: <20170628141530.46503-1-Vincent.Riera@imgtec.com>
References: <20170628141530.46503-1-Vincent.Riera@imgtec.com>
Message-ID: <20170628141530.46503-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the MIPS DSP ASE. They come in three
versions, DSP (r1), DSPr2 and DSPr3. Each one of them is a superset of
the other, so selecting DSPr2 will imply DSP (r1) as well, and selecting
DSPr3 will imply both DSP (r1) and DSPr2 as well.

For generic target architecture variants we let the user choose between
the different compatible versions. For well known cores the user can
only choose the DSP version that specific core would implement, or none,
since implementing the DSP module in a core may be optional.

DSP (r1) and DSPr2 are available since MIPS release version 2.
DSPr3 is only available since MIPS release version 6.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v4 -> v5:
 - Add BR2_GCC_TARGET_DSP in arch/Config.in
Changes v1 -> v4:
 - Nothing. Patch introduced in v3.
---
 arch/Config.in                                     |  3 +
 arch/Config.in.mips                                | 69 ++++++++++++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  5 ++
 toolchain/toolchain-wrapper.c                      |  3 +
 4 files changed, 80 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f385745e4..1183e8fda 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -270,6 +270,9 @@ config BR2_GCC_TARGET_NAN
 config BR2_GCC_TARGET_FP32_MODE
 	string
 
+config BR2_GCC_TARGET_DSP
+	string
+
 config BR2_GCC_TARGET_CPU
 	string
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index b779fc7f5..68f95a0ef 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -22,6 +22,22 @@ config BR2_MIPS_CPU_MIPS64R6
 	bool
 	select BR2_MIPS_NAN_2008
 
+# mips cpu features
+config BR2_MIPS_CPU_HAS_DSP_R1
+	bool
+config BR2_MIPS_CPU_HAS_DSP_R2
+	bool
+config BR2_MIPS_CPU_HAS_DSP_R3
+	bool
+
+# some cpu features are optional depending on the core
+config BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	bool
+config BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	bool
+config BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -41,27 +57,37 @@ config BR2_mips_32r2
 	bool "Generic MIPS32R2"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_32r5
 	bool "Generic MIPS32R5"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_32r6
 	bool "Generic MIPS32R6"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R6
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
 config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_m5150
 	bool "M5150"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
 	select BR2_MIPS_NAN_2008
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_m6250
 	bool "M6250"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R6
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
 config BR2_mips_p5600
 	bool "P5600"
 	depends on !BR2_ARCH_IS_64
@@ -88,14 +114,21 @@ config BR2_mips_64r2
 	bool "Generic MIPS64R2"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R2
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_64r5
 	bool "Generic MIPS64R5"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R5
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 config BR2_mips_64r6
 	bool "Generic MIPS64R6"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
 config BR2_mips_i6400
 	bool "I6400"
 	depends on BR2_ARCH_IS_64
@@ -187,6 +220,42 @@ config BR2_GCC_TARGET_NAN
 	default "legacy"	if BR2_MIPS_NAN_LEGACY
 	default "2008"		if BR2_MIPS_NAN_2008
 
+choice
+	prompt "DSP support"
+	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2 || \
+		BR2_MIPS_CPU_MIPS32R5 || BR2_MIPS_CPU_MIPS64R5 || \
+		BR2_MIPS_CPU_MIPS32R6 || BR2_MIPS_CPU_MIPS64R6
+	default BR2_MIPS_ENABLE_DSP_NONE
+
+	help
+	  For some CPU cores, the DSP extension is optional.
+	  Select this option if you are certain your particular
+	  implementation has DSP support and you want to use it.
+	  
+config BR2_MIPS_ENABLE_DSP_NONE
+	bool "None"
+
+config BR2_MIPS_ENABLE_DSP_R1
+	bool "dsp"
+	depends on BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
+	select BR2_MIPS_CPU_HAS_DSP_R1
+
+config BR2_MIPS_ENABLE_DSP_R2
+	bool "dspr2"
+	depends on BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	select BR2_MIPS_CPU_HAS_DSP_R2
+
+config BR2_MIPS_ENABLE_DSP_R3
+	bool "dspr3"
+	depends on BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
+	select BR2_MIPS_CPU_HAS_DSP_R3
+endchoice
+
+config BR2_GCC_TARGET_DSP
+	default "dsp"		if BR2_MIPS_CPU_HAS_DSP_R1
+	default "dspr2"		if BR2_MIPS_CPU_HAS_DSP_R2
+	default "dspr3"		if BR2_MIPS_CPU_HAS_DSP_R3
+
 config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index ccb298bec..ce3a48db8 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -157,6 +157,7 @@ endif
 CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 CC_TARGET_NAN_ := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+CC_TARGET_DSP_ := $(call qstrip,$(BR2_GCC_TARGET_DSP))
 CC_TARGET_FP32_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
@@ -184,6 +185,10 @@ ifneq ($(CC_TARGET_NAN_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mnan=$(CC_TARGET_NAN_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(CC_TARGET_NAN_)"'
 endif
+ifneq ($(CC_TARGET_DSP_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_DSP_)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_DSP='"$(CC_TARGET_DSP_)"'
+endif
 ifneq ($(CC_TARGET_FP32_MODE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfp$(CC_TARGET_FP32_MODE_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(CC_TARGET_FP32_MODE_)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 761e72541..670e00884 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -54,6 +54,9 @@ static char *predef_args[] = {
 #ifdef BR_NAN
 	"-mnan=" BR_NAN,
 #endif
+#ifdef BR_DSP
+	"-m" BR_DSP,
+#endif
 #ifdef BR_FPU
 	"-mfpu=" BR_FPU,
 #endif
-- 
2.13.0
