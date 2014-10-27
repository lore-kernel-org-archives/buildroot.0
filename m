From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:49:38 +0100
Subject: [Buildroot] [git commit] wget: bump to version 1.16
Message-ID: <20141027164941.D243BB112F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9faa850c158c075a5723c10802b866e169fc9f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file.
And drop autoreconf/gettextize/patch, it's upstream now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../wget-0001-spawn-fix-link-error-on-uclibc.patch |   40 --------------------
 package/wget/wget.hash                             |    2 +
 package/wget/wget.mk                               |    6 +--
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch b/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
deleted file mode 100644
index 54d6dfb..0000000
--- a/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5 Mon Sep 17 00:00:00 2001
-Message-Id: <d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5.1393836674.git.baruch@tkos.co.il>
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 14 Jan 2014 16:59:07 +0000
-Subject: [PATCH] spawn: fix link error on uclibc
-
-* m4/spawn_h.m4 (gl_HAVE_POSIX_SPAWN): use AC_SEARCH_LIBS,
-to incorporate -lrt if needed (on uclibc for example).
-* modules/posix_spawn: Reference the substituted LIB.
-
-Patch status: upstream (gnulib commit d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff --git a/m4/spawn_h.m4 b/m4/spawn_h.m4
-index 87fe12298471..3eb835c3c2a8 100644
---- a/m4/spawn_h.m4
-+++ b/m4/spawn_h.m4
-@@ -64,7 +64,15 @@ AC_DEFUN([gl_HAVE_POSIX_SPAWN],
-   dnl once only, before all statements that occur in other macros.
-   AC_REQUIRE([gl_SPAWN_H_DEFAULTS])
- 
--  AC_CHECK_FUNCS_ONCE([posix_spawn])
-+  LIB_POSIX_SPAWN=
-+  AC_SUBST([LIB_POSIX_SPAWN])
-+  gl_saved_libs=$LIBS
-+    AC_SEARCH_LIBS([posix_spawn], [rt],
-+                   [test "$ac_cv_search_posix_spawn" = "none required" ||
-+                    LIB_POSIX_SPAWN=$ac_cv_search_posix_spawn])
-+    AC_CHECK_FUNCS([posix_spawn])
-+  LIBS=$gl_saved_libs
-+
-   if test $ac_cv_func_posix_spawn != yes; then
-     HAVE_POSIX_SPAWN=0
-   fi
- 
--- 
-1.9.0
-
diff --git a/package/wget/wget.hash b/package/wget/wget.hash
new file mode 100644
index 0000000..8ef92bf
--- /dev/null
+++ b/package/wget/wget.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9261dd090a17687b6dc0682a257e90a926def15624b650e8f799af57e5c8b0e7	wget-1.16.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 9bfa4ba..e50981e 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.15
+WGET_VERSION = 1.16
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
 
-# patching gnulib .m4 file
-WGET_AUTORECONF = YES
-WGET_GETTEXTIZE = YES
-
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	WGET_DEPENDENCIES += busybox
