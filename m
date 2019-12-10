From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 10 Dec 2019 13:13:22 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on powerpc
 without <sys/auxv.h>
Message-ID: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix build failure on PowerPc without <sys/auxv.h>. The patch
inserts #if statements to include or note <sys/auxv.h> prior it exists.

Fixes:
http://autobuild.buildroot.net/results/8bf95bd8a0aec8c53889308ab1e00d0a94f53d57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...Fix-PowerPc-build-sys-auxv.h-failure.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch

diff --git a/package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
new file mode 100644
index 0000000000..c8f12d777a
--- /dev/null
+++ b/package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
@@ -0,0 +1,40 @@
+From efe0fd875c80ff6e3a05db6c5e15b07c173530a6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 10 Dec 2019 13:06:01 +0100
+Subject: [PATCH] Bug 1602743 - Fix PowerPc build sys/auxv.h failure
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/blinit.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/blinit.c b/nss/lib/freebl/blinit.c
+index 959109b60..f0654595d 100644
+--- a/nss/lib/freebl/blinit.c
++++ b/nss/lib/freebl/blinit.c
+@@ -357,7 +357,9 @@ ppc_crypto_support()
+ 
+ #if defined(__powerpc__)
+ 
++#if (__has_include(<sys/auxv.h>))
+ #include <sys/auxv.h>
++#endif
+ 
+ // Defines from cputable.h in Linux kernel - PPC, letting us build on older kernels
+ #ifndef PPC_FEATURE2_VEC_CRYPTO
+@@ -368,8 +370,11 @@ static void
+ CheckPPCSupport()
+ {
+     char *disable_hw_crypto = PR_GetEnvSecure("NSS_DISABLE_PPC_GHASH");
++    long hwcaps = 0;
+ 
+-    long hwcaps = getauxval(AT_HWCAP2);
++#if (__has_include(<sys/auxv.h>))
++    hwcaps = getauxval(AT_HWCAP2);
++#endif
+ 
+     ppc_crypto_support_ = hwcaps & PPC_FEATURE2_VEC_CRYPTO && disable_hw_crypto == NULL;
+ }
+-- 
+2.20.1
+
-- 
2.20.1
