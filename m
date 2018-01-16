From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Tue, 16 Jan 2018 19:53:07 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: use -ffp-contract=off on MIPS in
 the wrapper when needed
Message-ID: <1516128787-20711-1-git-send-email-johannes.schmitz1@gmail.com>
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
 toolchain/toolchain-wrapper.c  | 3 ---
 toolchain/toolchain-wrapper.mk | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 2928ea4..04b2631 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -79,9 +79,6 @@ static char *predef_args[] = {
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
-#ifdef BR_NO_FUSED_MADD
-	"-mno-fused-madd",
-#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 7f72a0c..7faa033 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -28,8 +28,12 @@ endif
 
 # Avoid FPU bug on XBurst CPUs
 ifeq ($(BR2_mips_xburst),y)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
+else
 TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
 endif
+endif
 
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
-- 
2.7.4
