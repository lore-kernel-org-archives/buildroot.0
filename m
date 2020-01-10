From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 10 Jan 2020 12:15:26 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix arm32 neon build failure
Message-ID: <20200110111526.26486-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnss assumes that every arm 32 supports neon, but this is not true, so
add pending patch [1] to check if arm 32 supports neon and fix build
failure.

[1]: https://bugzilla.mozilla.org/show_bug.cgi?id=1608327

Fixes:
http://autobuild.buildroot.net/results/d3d/d3d5da5d0f3c495376cd0f3d63b846ff16d429d9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...freebl-arm-NEON-code-use-on-tier3-pl.patch | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 package/libnss/0003-Bug-1608327-Fix-freebl-arm-NEON-code-use-on-tier3-pl.patch

diff --git a/package/libnss/0003-Bug-1608327-Fix-freebl-arm-NEON-code-use-on-tier3-pl.patch b/package/libnss/0003-Bug-1608327-Fix-freebl-arm-NEON-code-use-on-tier3-pl.patch
new file mode 100644
index 0000000000..06bd6a167c
--- /dev/null
+++ b/package/libnss/0003-Bug-1608327-Fix-freebl-arm-NEON-code-use-on-tier3-pl.patch
@@ -0,0 +1,169 @@
+From 0efcc6d793ede00d0e62250e1252c9c1040a6dda Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 10 Jan 2020 12:00:48 +0100
+Subject: [PATCH] Bug 1608327 - Fix freebl arm NEON code use on tier3
+ platforms.
+
+Despite the code having runtime detection of NEON and crypto extensions,
+the optimized code using those instructions is disabled at build time on
+platforms where the compiler doesn't enable NEON by default of with the
+flags it's given for the caller code.
+
+In the case of gcm, this goes as far as causing a build error.
+
+What is needed is for the optimized code to be enabled in every case,
+letting the caller code choose whether to use that code based on the
+existing runtime checks.
+
+But this can't be simply done either, because those optimized parts of
+the code need to be built with NEON enabled, unconditionally, but that
+is not compatible with platforms using the softfloat ABI. For those,
+we need to use the softfp ABI, which is compatible. However, the softfp
+ABI is not compatible with the hardfp ABI, so we also can't
+unconditionally use the softfp ABI, so we do so only when the compiler
+targets the softfloat ABI, which confusingly enough is advertized via
+the SOFTFP define.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/Makefile         |  8 ++++++--
+ nss/lib/freebl/aes-armv8.c      |  2 +-
+ nss/lib/freebl/freebl.gyp       | 17 +++++++++++++----
+ nss/lib/freebl/gcm-arm32-neon.c |  4 ++--
+ nss/lib/freebl/gcm.c            |  7 ++-----
+ nss/lib/freebl/rijndael.c       |  3 +--
+ 6 files changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 0e230d8c5..1a930dca6 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -781,8 +781,12 @@ $(OBJDIR)/$(PROG_PREFIX)intel-gcm-wrap$(OBJ_SUFFIX): CFLAGS += -mssse3
+ endif
+ 
+ ifeq ($(CPU_ARCH),arm)
+-$(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8
+-$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon
++# When the compiler uses the softfloat ABI, we want to use the compatible softfp ABI when
++# enabling NEON for these objects.
++# Confusingly, __SOFTFP__ is the name of the define for the softfloat ABI, not for the softfp ABI.
++USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
++$(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
++$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ endif
+ ifeq ($(CPU_ARCH),aarch64)
+ $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
+diff --git a/nss/lib/freebl/aes-armv8.c b/nss/lib/freebl/aes-armv8.c
+index 8213272f5..7be39ede8 100644
+--- a/nss/lib/freebl/aes-armv8.c
++++ b/nss/lib/freebl/aes-armv8.c
+@@ -8,7 +8,7 @@
+ #if ((defined(__clang__) ||                                         \
+       (defined(__GNUC__) && defined(__GNUC_MINOR__) &&              \
+        (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8)))) && \
+-     (defined(__ARM_NEON) || defined(__ARM_NEON__)))
++     defined(IS_LITTLE_ENDIAN))
+ 
+ #ifndef __ARM_FEATURE_CRYPTO
+ #error "Compiler option is invalid"
+diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
+index 5d247742d..2b8182ef8 100644
+--- a/nss/lib/freebl/freebl.gyp
++++ b/nss/lib/freebl/freebl.gyp
+@@ -126,10 +126,12 @@
+         '<(DEPTH)/exports.gyp:nss_exports'
+       ],
+       'cflags': [
+-        '-mfpu=neon'
++        '-mfpu=neon',
++        '<@(softfp_cflags)',
+       ],
+       'cflags_mozilla': [
+-        '-mfpu=neon'
++        '-mfpu=neon',
++        '<@(softfp_cflags)',
+       ]
+     },
+     {
+@@ -179,11 +181,13 @@
+         [ 'target_arch=="arm"', {
+           'cflags': [
+             '-march=armv8-a',
+-            '-mfpu=crypto-neon-fp-armv8'
++            '-mfpu=crypto-neon-fp-armv8',
++            '<@(softfp_cflags)',
+           ],
+           'cflags_mozilla': [
+             '-march=armv8-a',
+-            '-mfpu=crypto-neon-fp-armv8'
++            '-mfpu=crypto-neon-fp-armv8',
++            '<@(softfp_cflags)',
+           ],
+         }, 'target_arch=="arm64" or target_arch=="aarch64"', {
+           'cflags': [
+@@ -533,6 +537,11 @@
+       }, {
+         'have_int128_support%': 0,
+       }],
++      [ 'target_arch=="arm"', {
++        # When the compiler uses the softfloat ABI, we want to use the compatible softfp ABI when enabling NEON for these objects.
++        # Confusingly, __SOFTFP__ is the name of the define for the softfloat ABI, not for the softfp ABI.
++        'softfp_cflags': '<!(${CC:-cc} -o - -E -dM - ${CFLAGS} < /dev/null | grep __SOFTFP__ > /dev/null && echo -mfloat-abi=softfp || true)',
++      }],
+     ],
+   }
+ }
+diff --git a/nss/lib/freebl/gcm-arm32-neon.c b/nss/lib/freebl/gcm-arm32-neon.c
+index 97eb82ec6..be0424770 100644
+--- a/nss/lib/freebl/gcm-arm32-neon.c
++++ b/nss/lib/freebl/gcm-arm32-neon.c
+@@ -11,7 +11,7 @@
+ #include "secerr.h"
+ #include "prtypes.h"
+ 
+-#if defined(__ARM_NEON__) || defined(__ARM_NEON)
++#if defined(IS_LITTLE_ENDIAN)
+ 
+ #include <arm_neon.h>
+ 
+@@ -199,4 +199,4 @@ gcm_HashZeroX_hw(gcmHashContext *ghash)
+     return SECSuccess;
+ }
+ 
+-#endif /* __ARM_NEON__ || __ARM_NEON */
++#endif /* IS_LITTLE_ENDIAN */
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
+index 080e641ea..2a42f74c0 100644
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -21,11 +21,8 @@
+ #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
+     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+ #define USE_ARM_GCM
+-#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
+-    (defined(__ARM_NEON__) || defined(__ARM_NEON))
+-/* We don't test on big endian platform, so disable this on big endian.
+- * Also, we don't check whether compiler support NEON well, so this uses
+- * that compiler uses -mfpu=neon only. */
++#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN)
++/* We don't test on big endian platform, so disable this on big endian. */
+ #define USE_ARM_GCM
+ #endif
+ 
+diff --git a/nss/lib/freebl/rijndael.c b/nss/lib/freebl/rijndael.c
+index 40364fce0..2e8bab87f 100644
+--- a/nss/lib/freebl/rijndael.c
++++ b/nss/lib/freebl/rijndael.c
+@@ -20,8 +20,7 @@
+ #include "gcm.h"
+ #include "mpi.h"
+ 
+-#if (!defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)) || \
+-    (defined(__arm__) && !defined(__ARM_NEON) && !defined(__ARM_NEON__))
++#if !defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)
+ // not test yet on big endian platform of arm
+ #undef USE_HW_AES
+ #endif
+-- 
+2.20.1
+
-- 
2.20.1
