From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Tue, 16 Jan 2018 19:50:16 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: use -ffp-contract=off on MIPS in
 the wrapper when needed
Message-ID: <1516128616-20127-1-git-send-email-johannes.schmitz1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix is necessary for to build for MIPS, for example for the MIPS
XBurst architecture used on ci20 boards.

GCC has replaced (no)mfused-madd with ffp-contract.
Find more details and a long discussion at
https://gcc.gnu.org/ml/gcc-patches/2015-06/msg00876.html

Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
---
 toolchain/toolchain-wrapper.c  | 10 ++++++++--
 toolchain/toolchain-wrapper.mk |  6 +++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 2928ea4..dd3a25e 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -79,8 +79,14 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
-#ifdef BR_NO_FUSED_MADD
-	"-mno-fused-madd",
+#ifdef BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	#ifdef BR_FP_CONTRACT_OFF
+		"-ffp-contract=off",
+	#endif
+#else
+	#ifdef BR_NO_FUSED_MADD
+		"-mno-fused-madd",
+	#endif
 #endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 7f72a0c..b7a4b9b 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -28,7 +28,11 @@ endif
 
 # Avoid FPU bug on XBurst CPUs
 ifeq ($(BR2_mips_xburst),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
+	ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
+		TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
+	else
+		TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
+	endif
 endif
 
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
-- 
2.7.4
