From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Aug 2017 07:28:48 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
	-mfused-madd
Message-ID: <20170811052847.GA32348@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC deprecated -mfused-madd, -ffp-contract=off should
be used for Xburst workaround.
uClibc compilations will fail, because a gcc warning
is emitted while checking for TLS support in the compiler.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-wrapper.c  | 4 ++--
 toolchain/toolchain-wrapper.mk | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index dd77c11..44cdcf3 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -69,8 +69,8 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
-#ifdef BR_NO_FUSED_MADD
-	"-mno-fused-madd",
+#ifdef BR_FP_CONTRACT_OFF
+	"-ffp-contract=off",
 #endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 7f72a0c..ecf67a4 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -27,8 +27,9 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
 endif
 
 # Avoid FPU bug on XBurst CPUs
+# -mfused-madd is deprecated, use -ffp-contract instead
 ifeq ($(BR2_mips_xburst),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
+TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
 endif
 
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
-- 
2.1.4
