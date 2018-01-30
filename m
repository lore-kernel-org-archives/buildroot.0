From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:56:33 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: Add upstream patch to fix
 build numa detection
Message-ID: <20180130215635.97033880F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9ef70aa922335062d1b1f8953299d38e5e2f1ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This removes fix added in commit 3c937807a3 ("ltp-testsuite: disable numa tests")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-numa-v2-detection-for-cross-compilation.patch | 37 ++++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk             |  6 ++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch b/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
new file mode 100644
index 0000000000..6ad1db046e
--- /dev/null
+++ b/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
@@ -0,0 +1,37 @@
+From 01c134f30be755a43af12a4ae2c31177d04be790 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 29 Jan 2018 10:31:40 +0100
+Subject: [PATCH] numa: Fix numa v2 detection for cross compilation
+
+Changed to AC_COMPILE_IFELSE as AC_RUN_IFELSE cannot be run while
+cross compiling.
+
+Bug found by Buildroot project.
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Reported-by: Baruch Siach <baruch@tkos.co.il>
+---
+ m4/ltp-numa.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
+index fc3383e97..633f54c18 100644
+--- a/m4/ltp-numa.m4
++++ b/m4/ltp-numa.m4
+@@ -28,11 +28,11 @@ AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
+ 	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
+ 
+ 	if test "x$have_numa_headers" != "xno"; then
+-		AC_RUN_IFELSE([AC_LANG_PROGRAM([
++		AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <numa.h>
+ 		], [
+ #if LIBNUMA_API_VERSION < 2
+-exit(1);
++# error Required numa headers >= 2
+ #endif
+ 		])], [have_numa_headers_v2=yes])
+ 	fi
+-- 
+2.16.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 28dc24749e..5e0b35d12a 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -56,8 +56,10 @@ LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
-	SYSROOT="$(STAGING_DIR)" \
-	have_numa_headers=no
+	SYSROOT="$(STAGING_DIR)"
+
+# Required by patch 0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
+LTP_TESTSUITE_AUTORECONF = YES
 
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
