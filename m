From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 28 Jun 2017 15:15:30 +0100
Subject: [Buildroot] [PATCH v5 4/4] infra: add support for MIPS MSA
In-Reply-To: <20170628141530.46503-1-Vincent.Riera@imgtec.com>
References: <20170628141530.46503-1-Vincent.Riera@imgtec.com>
Message-ID: <20170628141530.46503-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for MIPS SIMD Architecture (MSA) extension. This
feature is available since MIPS release version 5 and is mutually
exclusive with the MIPS DSP extension.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v5:
 - Nothing. Patch introduced in v3.
---
 arch/Config.in.mips                                 | 21 +++++++++++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk    |  4 ++++
 toolchain/toolchain-wrapper.c                       |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 68f95a0ef..efb265f4b 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -29,6 +29,8 @@ config BR2_MIPS_CPU_HAS_DSP_R2
 	bool
 config BR2_MIPS_CPU_HAS_DSP_R3
 	bool
+config BR2_MIPS_CPU_HAS_MSA
+	bool
 
 # some cpu features are optional depending on the core
 config BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
@@ -37,6 +39,8 @@ config BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 	bool
 config BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
 	bool
+config BR2_MIPS_CPU_MAYBE_HAS_MSA
+	bool
 
 choice
 	prompt "Target Architecture Variant"
@@ -65,6 +69,7 @@ config BR2_mips_32r5
 	select BR2_MIPS_CPU_MIPS32R5
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_32r6
 	bool "Generic MIPS32R6"
 	depends on !BR2_ARCH_IS_64
@@ -72,6 +77,7 @@ config BR2_mips_32r6
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
@@ -93,6 +99,7 @@ config BR2_mips_p5600
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
 	select BR2_MIPS_NAN_2008
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_xburst
 	bool "XBurst"
 	depends on !BR2_ARCH_IS_64
@@ -122,6 +129,7 @@ config BR2_mips_64r5
 	select BR2_MIPS_CPU_MIPS64R5
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_64r6
 	bool "Generic MIPS64R6"
 	depends on BR2_ARCH_IS_64
@@ -129,14 +137,17 @@ config BR2_mips_64r6
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R1
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R2
 	select BR2_MIPS_CPU_MAYBE_HAS_DSP_R3
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_i6400
 	bool "I6400"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 endchoice
 
 
@@ -256,6 +267,16 @@ config BR2_GCC_TARGET_DSP
 	default "dspr2"		if BR2_MIPS_CPU_HAS_DSP_R2
 	default "dspr3"		if BR2_MIPS_CPU_HAS_DSP_R3
 
+config BR2_MIPS_ENABLE_MSA
+	bool "Enable MSA extension support"
+	depends on BR2_MIPS_CPU_MAYBE_HAS_MSA && BR2_MIPS_FP32_MODE_64
+	depends on !(BR2_MIPS_CPU_HAS_DSP_R1 || BR2_MIPS_CPU_HAS_DSP_R2 || BR2_MIPS_CPU_HAS_DSP_R3)
+	select BR2_MIPS_CPU_HAS_MSA
+	help
+	  For some CPU cores, the MSA extension is optional.
+	  Select this option if you are certain your particular
+	  implementation has MSA support and you want to use it.
+
 config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index ce3a48db8..28dca1690 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -189,6 +189,10 @@ ifneq ($(CC_TARGET_DSP_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_DSP_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_DSP='"$(CC_TARGET_DSP_)"'
 endif
+ifneq ($(BR2_MIPS_CPU_HAS_MSA),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mmsa
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MSA
+endif
 ifneq ($(CC_TARGET_FP32_MODE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfp$(CC_TARGET_FP32_MODE_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(CC_TARGET_FP32_MODE_)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 670e00884..3e001e6ea 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -57,6 +57,9 @@ static char *predef_args[] = {
 #ifdef BR_DSP
 	"-m" BR_DSP,
 #endif
+#ifdef BR_MSA
+	"-mmsa",
+#endif
 #ifdef BR_FPU
 	"-mfpu=" BR_FPU,
 #endif
-- 
2.13.0
