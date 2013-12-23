From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 23 Dec 2013 10:09:24 +0800
Subject: [Buildroot] [PATCH] kmod: bump to version 16
Message-ID: <1387764564.32637.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kmod-0001-Add-configure-check-for-_Static_assert.patch is already merged in
upstream.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 ...01-Add-configure-check-for-_Static_assert.patch | 57 ----------------------
 package/kmod/kmod.mk                               |  5 +-
 2 files changed, 1 insertion(+), 61 deletions(-)
 delete mode 100644 package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch

diff --git a/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch b/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch
deleted file mode 100644
index 2def358..0000000
--- a/package/kmod/kmod-0001-Add-configure-check-for-_Static_assert.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d4a1e5daf0d50aa79ae0ed2f947f5657343cf2f7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 28 Aug 2013 17:31:40 +0200
-Subject: [PATCH] Add configure check for _Static_assert()
-
-Commit 8efede20ef ("Use _Static_assert") introduced the usage of
-_Static_assert(). However, _Static_assert() is a fairly new thing,
-since it was introduced only in gcc 4.6. In order to support older
-compilers, this patch adds a configure.in test that checks whether
-_Static_assert() is usable or not, and adjust the behavior of the
-assert_cc() macro accordingly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: submitted
-                 http://article.gmane.org/gmane.linux.kernel.modules/1136
----
- configure.ac    | 6 ++++++
- libkmod/macro.h | 4 ++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 40e54cf..cbe12f3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,6 +52,12 @@ AC_CHECK_MEMBERS([struct stat.st_mtim], [], [], [#include <sys/stat.h>])
- # Check kernel headers
- AC_CHECK_HEADERS_ONCE([linux/module.h])
- 
-+AC_MSG_CHECKING([whether _Static_assert() is supported])
-+AC_COMPILE_IFELSE(
-+	[AC_LANG_SOURCE([[_Static_assert(1, "Test");]])],
-+        [AC_DEFINE([HAVE_STATIC_ASSERT], [1], [Define is _Static_assert() is available])
-+	 AC_MSG_RESULT([yes])],
-+	[AC_MSG_RESULT([no])])
- 
- #####################################################################
- # --with-
-diff --git a/libkmod/macro.h b/libkmod/macro.h
-index c6ba855..5992026 100644
---- a/libkmod/macro.h
-+++ b/libkmod/macro.h
-@@ -21,8 +21,12 @@
- 
- #include <stddef.h>
- 
-+#if defined(HAVE_STATIC_ASSERT)
- #define assert_cc(expr) \
- 	_Static_assert((expr), #expr)
-+#else
-+#define assert_cc(expr)
-+#endif
- 
- #if HAVE_TYPEOF
- #define check_types_match(expr1, expr2)		\
--- 
-1.8.1.2
-
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 77fbe0b..ec1fef8 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-KMOD_VERSION = 15
+KMOD_VERSION = 16
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
-# Some patches are touching configure.ac
-KMOD_AUTORECONF = YES
-
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPLv2.1+
 KMOD_LICENSE_FILES = libkmod/COPYING
-- 
1.8.1.2
