From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:36:34 +0100
Subject: [Buildroot] [git commit] arch/Config.in.mips: add support for
	XBurst cores
Message-ID: <20161109203705.EFF7181664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=240564a6933d9300473b5ced02d2f6f2a2fa4cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Ingenic XBurst is a MIPS32R2 microprocessor.

It has a bug in the FPU that can generate incorrect results in certain
cases. The problem shows up when you have several fused madd
instructions in sequence with dependant operands.

Using the -mno-fused-madd option prevents gcc from emitting these
instructions. This patch adds changes to the toolchain wrapper to use
that option.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips            | 14 ++++++++++++++
 toolchain/toolchain-wrapper.c  |  3 +++
 toolchain/toolchain-wrapper.mk |  5 +++++
 3 files changed, 22 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 3662fed..1021a57 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -63,6 +63,19 @@ config BR2_mips_p5600
 	bool "P5600"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+config BR2_mips_xburst
+	bool "XBurst"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R2
+	help
+	  The Ingenic XBurst is a MIPS32R2 microprocessor. It has a
+	  bug in the FPU that can generate incorrect results in
+	  certain cases. The problem shows up when you have several
+	  fused madd instructions in sequence with dependant
+	  operands. This requires the -mno-fused-madd compiler option
+	  to be used in order to prevent emitting these instructions.
+
+	  See http://www.ingenic.com/en/?xburst.html
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -137,6 +150,7 @@ config BR2_GCC_TARGET_ARCH
 	default "m5101"		if BR2_mips_m5101
 	default "m6201"		if BR2_mips_m6201
 	default "p5600"		if BR2_mips_p5600
+	default "mips32r2"	if BR2_mips_xburst
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 925d013..d59629b 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -66,6 +66,9 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
+#ifdef BR_NO_FUSED_MADD
+	"-mno-fused-madd",
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index e7aa5fb..c7b5019 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -26,6 +26,11 @@ ifeq ($(BR2_x86_x1000),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
 endif
 
+# Avoid FPU bug on XBurst CPUs
+ifeq ($(BR2_mips_xburst),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
+endif
+
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
