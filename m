From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:09:33 +0200
Subject: [Buildroot] [git commit] coreutils: bump to version 8.23
Message-ID: <20141024231057.9C756B0B42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9d25fdb30e002d7e22fddb87d0a6386f963bfc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file. patches 01 & 02 are now upstream so remove them.
Patch 01 isn't required any more (no posix_spawn usage).
Patch 02 is upstream.
Patch 03 retooled for 8.23 and renamed to 01.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... => coreutils-01-fix-for-dummy-man-usage.patch} |   20 +++------
 package/coreutils/coreutils-01-spawn-uclibc.patch  |   43 --------------------
 .../coreutils/coreutils-02-fix-timer-time-m4.patch |   36 ----------------
 package/coreutils/coreutils.hash                   |    2 +
 package/coreutils/coreutils.mk                     |    4 +-
 5 files changed, 11 insertions(+), 94 deletions(-)

diff --git a/package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch b/package/coreutils/coreutils-01-fix-for-dummy-man-usage.patch
similarity index 60%
rename from package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch
rename to package/coreutils/coreutils-01-fix-for-dummy-man-usage.patch
index b7e8260..960501e 100644
--- a/package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch
+++ b/package/coreutils/coreutils-01-fix-for-dummy-man-usage.patch
@@ -8,24 +8,18 @@ would appear when compiling.
 "dummy-man: too many non-option arguments"
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- man/local.mk |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+[Gustavo: update for 8.23]
 
-diff --git a/man/local.mk b/man/local.mk
-index 7cef5e3..dc0865f 100644
---- a/man/local.mk
-+++ b/man/local.mk
-@@ -189,8 +189,8 @@ man/yes.1:       src/yes
+diff -Nura coreutils-8.23.orig/man/local.mk coreutils-8.23/man/local.mk
+--- coreutils-8.23.orig/man/local.mk	2014-10-24 16:52:29.720555852 -0300
++++ coreutils-8.23/man/local.mk	2014-10-24 16:52:59.381391498 -0300
+@@ -101,8 +101,8 @@
  	  && $(run_help2man)						\
  		     --source='$(PACKAGE_STRING)'			\
  		     --include=$(srcdir)/man/$$name.x			\
--		     --output=$$t/$$name.1 $$t/$$name			\
+-		     --output=$$t/$$name.1 $$t/$$argv			\
  		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
-+		     --output=$$t/$$name.1 $$t/$$name			\
++		     --output=$$t/$$name.1 $$t/$$argv			\
  	  && sed \
  	       -e 's|$*\.td/||g' \
  	       -e '/For complete documentation/d' \
--- 
-1.7.9.5
-
diff --git a/package/coreutils/coreutils-01-spawn-uclibc.patch b/package/coreutils/coreutils-01-spawn-uclibc.patch
deleted file mode 100644
index a67921b..0000000
--- a/package/coreutils/coreutils-01-spawn-uclibc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 71cf16e435bf5db64abcf81a9dc6dc36ce37d58d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 14 Jan 2014 16:59:07 +0000
-Subject: [PATCH] spawn: fix link error on uclibc
-
-* m4/spawn_h.m4 (gl_HAVE_POSIX_SPAWN): use AC_SEARCH_LIBS,
-to incorporate -lrt if needed (on uclibc for example).
-* modules/posix_spawn: Reference the substituted LIB.
-
-Patch status: suggested by gnulib maintainer
-(http://article.gmane.org/gmane.comp.lib.gnulib.bugs/33610), not in upstream
-gnulib yet
-
-This issue should be fixed in coreutils version 8.23.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff --git a/m4/spawn_h.m4 b/m4/spawn_h.m4
-index 87fe122..3eb835c 100644
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
-1.7.7.6
-
diff --git a/package/coreutils/coreutils-02-fix-timer-time-m4.patch b/package/coreutils/coreutils-02-fix-timer-time-m4.patch
deleted file mode 100644
index 3b4d81b..0000000
--- a/package/coreutils/coreutils-02-fix-timer-time-m4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix thread detection with uClibc in timer_time.m4
-
-The timer_time.m4 gl_TIMER_TIME function determines which libraries
-need to be linked to get access to the timer function, generally -lrt
-for Linux systems. On platforms where threads are used, librt
-typically uses thread functions from libpthread.
-
-However, the test to determine whether the platform has thread or not
-is incorrect: it assumes that if the C library is uClibc, then threads
-are not available. This is actually not true: uClibc has configurable
-thread support, and when thread support is available, librt calls
-libpthread functions.
-
-This is important when static linking is used, because otherwise only
--lrt is used at link time, which fails because librt calls undefined
-thread functions. Both -lrt and -lpthread must be passed.
-
-This problem is fixed by making the uClibc thread detection a bit
-smarter, thanks to the usage of the __HAS_NO_THREADS__ macro defined
-in <bits/uClibc_config.h>, which itself is included by <features.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/m4/timer_time.m4
-===================================================================
---- a/m4/timer_time.m4
-+++ b/m4/timer_time.m4
-@@ -28,7 +28,7 @@
- #include <features.h>
- #ifdef __GNU_LIBRARY__
-  #if ((__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2) || (__GLIBC__ > 2)) \
--     && !defined __UCLIBC__
-+     && !(__UCLIBC__ && __HAS_NO_THREADS__)
-   Thread emulation available
-  #endif
- #endif
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
new file mode 100644
index 0000000..760b146
--- /dev/null
+++ b/package/coreutils/coreutils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d	coreutils-8.23.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index b627021..54c7892 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.22
+COREUTILS_VERSION = 8.23
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
 COREUTILS_LICENSE_FILES = COPYING
 
-# patching gnulib .m4 file
+# coreutils-01-fix-for-dummy-man-usage.patch triggers autoreconf on build
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
