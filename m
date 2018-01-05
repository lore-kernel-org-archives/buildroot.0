From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Fri,  5 Jan 2018 17:38:25 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Fix toolchain to create proper
 builds for MIPS XBurst targets
Message-ID: <1515170305-25742-1-git-send-email-johannes.schmitz1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is need for example for ci20, -mfused-madd is deprecated, we
need to use -ffp-contract instead.

This is basically a resubmission of
https://patchwork.ozlabs.org/patch/800406/

Please consider accepting the original patch, otherwise buildroot is
basically broken for ci20 and similar platforms.

Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
---
 toolchain/toolchain-wrapper.c  | 4 ++--
 toolchain/toolchain-wrapper.mk | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 2928ea4..822bcdc 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -79,8 +79,8 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
-#ifdef BR_NO_FUSED_MADD
-	"-mno-fused-madd",
+#ifdef BR_FP_CONTRACT_OFF
+   "-ffp-contract=off",
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
2.7.4
