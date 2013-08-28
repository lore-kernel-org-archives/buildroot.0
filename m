From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 23:59:26 +0200
Subject: [Buildroot] [git commit] kmod: fix build failure on gcc < 4.6
	caused by _Static_assert()
Message-ID: <20130828220011.7351D9B5D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10f1903f4fe60a17944016b4f4fcb094e46c7a68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit introduces a patch to kmod that ensures _Static_assert()
is only used if available. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...01-Add-configure-check-for-_Static_assert.patch |   57 ++++++++++++++++++++
 package/kmod/kmod.mk                               |    3 +
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch b/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch
new file mode 100644
index 0000000..2def358
--- /dev/null
+++ b/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch
@@ -0,0 +1,57 @@
+From d4a1e5daf0d50aa79ae0ed2f947f5657343cf2f7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 28 Aug 2013 17:31:40 +0200
+Subject: [PATCH] Add configure check for _Static_assert()
+
+Commit 8efede20ef ("Use _Static_assert") introduced the usage of
+_Static_assert(). However, _Static_assert() is a fairly new thing,
+since it was introduced only in gcc 4.6. In order to support older
+compilers, this patch adds a configure.in test that checks whether
+_Static_assert() is usable or not, and adjust the behavior of the
+assert_cc() macro accordingly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: submitted
+                 http://article.gmane.org/gmane.linux.kernel.modules/1136
+---
+ configure.ac    | 6 ++++++
+ libkmod/macro.h | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 40e54cf..cbe12f3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,12 @@ AC_CHECK_MEMBERS([struct stat.st_mtim], [], [], [#include <sys/stat.h>])
+ # Check kernel headers
+ AC_CHECK_HEADERS_ONCE([linux/module.h])
+ 
++AC_MSG_CHECKING([whether _Static_assert() is supported])
++AC_COMPILE_IFELSE(
++	[AC_LANG_SOURCE([[_Static_assert(1, "Test");]])],
++        [AC_DEFINE([HAVE_STATIC_ASSERT], [1], [Define is _Static_assert() is available])
++	 AC_MSG_RESULT([yes])],
++	[AC_MSG_RESULT([no])])
+ 
+ #####################################################################
+ # --with-
+diff --git a/libkmod/macro.h b/libkmod/macro.h
+index c6ba855..5992026 100644
+--- a/libkmod/macro.h
++++ b/libkmod/macro.h
+@@ -21,8 +21,12 @@
+ 
+ #include <stddef.h>
+ 
++#if defined(HAVE_STATIC_ASSERT)
+ #define assert_cc(expr) \
+ 	_Static_assert((expr), #expr)
++#else
++#define assert_cc(expr)
++#endif
+ 
+ #if HAVE_TYPEOF
+ #define check_types_match(expr1, expr2)		\
+-- 
+1.8.1.2
+
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 72a24af..c5826cf 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -10,6 +10,9 @@ KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
+# Some patches are touching configure.in
+KMOD_AUTORECONF = YES
+
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPLv2.1+
 KMOD_LICENSE_FILES = libkmod/COPYING
