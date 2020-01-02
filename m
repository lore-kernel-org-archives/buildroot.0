From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  2 Jan 2020 19:17:40 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix ppc 32-bit build failure
Message-ID: <20200102181740.116227-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS assumes that Altivec is supported on powerpc64 only, but in
Makefile it tries to build gcm-ppc.c(containing Altivec functions
calls), even if powerpc is not 64-bits. So add a patch to add a check if
architecture is a 64-bit to build gcm-ppc.

Fixes:
http://autobuild.buildroot.net/results/433/433a7db21654d67626c7a3e5f1272d6c3ce4fe6c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1606689
---
 ...1606689-Fix-ppc-32-bit-build-failure.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch

diff --git a/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch b/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch
new file mode 100644
index 0000000000..de30fa7002
--- /dev/null
+++ b/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch
@@ -0,0 +1,31 @@
+From fcac43d6a0af59926da7ad4a15a37255887cdfa2 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 2 Jan 2020 18:55:50 +0100
+Subject: [PATCH] Bug 1606689 - Fix ppc 32-bit build failure
+
+NSS assumes that only 64-bit powerpc support Altivec instructions to be
+used in gcm-ppc.c, so align Makefile condition to build gcm-ppc.c only
+if USE_64 is defined.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 00518d7f8..0e230d8c5 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -264,8 +264,8 @@ ifeq ($(CPU_ARCH),arm)
+     MPI_SRCS += mpi_arm.c
+ endif
+ ifeq ($(CPU_ARCH),ppc)
+-    EXTRA_SRCS += gcm-ppc.c
+ ifdef USE_64
++    EXTRA_SRCS += gcm-ppc.c
+     DEFINES += -DNSS_NO_INIT_SUPPORT
+ endif # USE_64
+ endif # ppc
+-- 
+2.20.1
+
-- 
2.20.1
