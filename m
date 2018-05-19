From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:46:54 +0200
Subject: [Buildroot] [git commit branch/next] ltp-testsuite: Bump to version
 20180515
Message-ID: <20180519204557.014577FB85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0d4e6091d76683be04e5bea537497b576c8a809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Dropped patch applied by upstream + LTP_TESTSUITE_AUTORECONF = YES which
this patch required and thus not needed any more.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-numa-v2-detection-for-cross-compilation.patch | 37 ----------------------
 package/ltp-testsuite/ltp-testsuite.hash           |  4 +--
 package/ltp-testsuite/ltp-testsuite.mk             |  5 +--
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch b/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
deleted file mode 100644
index 6ad1db046e..0000000000
--- a/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 01c134f30be755a43af12a4ae2c31177d04be790 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 29 Jan 2018 10:31:40 +0100
-Subject: [PATCH] numa: Fix numa v2 detection for cross compilation
-
-Changed to AC_COMPILE_IFELSE as AC_RUN_IFELSE cannot be run while
-cross compiling.
-
-Bug found by Buildroot project.
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Reported-by: Baruch Siach <baruch@tkos.co.il>
----
- m4/ltp-numa.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
-index fc3383e97..633f54c18 100644
---- a/m4/ltp-numa.m4
-+++ b/m4/ltp-numa.m4
-@@ -28,11 +28,11 @@ AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
- 	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
- 
- 	if test "x$have_numa_headers" != "xno"; then
--		AC_RUN_IFELSE([AC_LANG_PROGRAM([
-+		AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <numa.h>
- 		], [
- #if LIBNUMA_API_VERSION < 2
--exit(1);
-+# error Required numa headers >= 2
- #endif
- 		])], [have_numa_headers_v2=yes])
- 	fi
--- 
-2.16.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index d75d204385..93ab41d3b7 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20180118/ltp-full-20180118.tar.xz.sha1
-sha1 2e643f1e29cd89efc8059729f60237a427fd409e  ltp-full-20180118.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20180515/ltp-full-20180515.tar.xz.sha1
+sha1 db424d391987ff62664662210ef98cd42c7cc6b5  ltp-full-20180515.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f5ea4344ed..b536dbd369 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20180118
+LTP_TESTSUITE_VERSION = 20180515
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
@@ -57,9 +57,6 @@ LTP_TESTSUITE_CONF_ENV += \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
-# Required by patch 0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
-LTP_TESTSUITE_AUTORECONF = YES
-
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
