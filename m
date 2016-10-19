From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Oct 2016 11:17:13 +0100
Subject: [Buildroot] [PATCH 1/2] MIPS: add support for XBurst cores
Message-ID: <20161019101714.21506-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- There isn't any matching -march option for this core family, so we
  need to stick with the generic mips32r2.
- Add an option to the toolchain wrapper to avoid an FPU bug.
- Add an option to the toolchain wrapper to use the MXU SIMD extension.
  This is currently not supported on upstream gcc and binutils, but the
  Codescape MTI toolchain does support it.

Related: http://www.ingenic.com/en/?xburst.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips            | 5 +++++
 toolchain/toolchain-wrapper.c  | 6 ++++++
 toolchain/toolchain-wrapper.mk | 9 +++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index f7bfa21..fec1b94 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -59,6 +59,10 @@ config BR2_mips_p5600
 	bool "P5600"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+config BR2_mips_xburst
+	bool "XBurst"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R2
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -132,6 +136,7 @@ config BR2_GCC_TARGET_ARCH
 	default "m5100"		if BR2_mips_m5100
 	default "m5101"		if BR2_mips_m5101
 	default "p5600"		if BR2_mips_p5600
+	default "mips32r2"	if BR2_mips_xburst
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 925d013..188afa1 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -66,6 +66,12 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
+#ifdef BR_NO_FUSED_MADD
+	"-mno-fused-madd",
+#endif
+#ifdef BR_MXU
+	"-Wa,-mmxu",
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..5ba9d4c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -26,6 +26,15 @@ ifeq ($(BR2_x86_x1000),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
 endif
 
+ifeq ($(BR2_mips_xburst),y)
+# Avoid FPU bug on XBurst CPUs
+TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
+# Enable XBurst Media Extension Unit (MXU)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_MXU
+endif
+endif
+
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
-- 
2.10.1
