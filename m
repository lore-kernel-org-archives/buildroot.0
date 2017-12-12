From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Dec 2017 20:52:50 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1.1
Message-ID: <20171212195250.29552-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove both patches (merged in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-pthread_setname_np-detection.patch    | 50 ----------------
 .../motion/0002-Check-for-pthread_getname_np.patch | 66 ----------------------
 package/motion/motion.hash                         |  2 +-
 package/motion/motion.mk                           |  2 +-
 4 files changed, 2 insertions(+), 118 deletions(-)
 delete mode 100644 package/motion/0001-Fix-pthread_setname_np-detection.patch
 delete mode 100644 package/motion/0002-Check-for-pthread_getname_np.patch

diff --git a/package/motion/0001-Fix-pthread_setname_np-detection.patch b/package/motion/0001-Fix-pthread_setname_np-detection.patch
deleted file mode 100644
index dc14232c2b..0000000000
--- a/package/motion/0001-Fix-pthread_setname_np-detection.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 505be2201377fa347a34b6cb4164c856b55e7484 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 Nov 2017 22:47:39 +0100
-Subject: [PATCH] Fix pthread_setname_np detection
-
-Commit 6617c6f2c8aad041d3428bea11206fd2e61763b1 replaced
-AC_LINK_IFELSE with AC_COMPILE_IFELSE. This has broken the
-pthread_setname_np detection as compilation will always succeed even if
-pthread_setname_np is not available (if the function is not found, a
-simple warning will be displayed in config.log).
-
-The correct fix is to put back AC_LINK_IFELSE with -pthread in LIBS
-otherwise compilation will fail on toolchain without pthread_setname_np.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1792b65..21efd2a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -128,17 +128,20 @@ fi
- if test x$THREADS = xyes; then
-   TEMP_LIBS="$TEMP_LIBS -pthread"
-   TEMP_CFLAGS="${TEMP_CFLAGS} -D_THREAD_SAFE"
--fi
- 
- ##############################################################################
- ###  Check for pthread_setname_np (nonstandard GNU extension)
- ##############################################################################
--AC_MSG_CHECKING([for pthread_setname_np])
--AC_COMPILE_IFELSE(
-+  AC_MSG_CHECKING([for pthread_setname_np])
-+  HOLD_LIBS="$LIBS"
-+  LIBS="$TEMP_LIBS"
-+  AC_LINK_IFELSE(
-     [AC_LANG_PROGRAM([#include <pthread.h>], [pthread_setname_np(pthread_self(), "name")])],
-     [AC_DEFINE([HAVE_PTHREAD_SETNAME_NP], [1], [Define if you have pthread_setname_np function.])
-     AC_MSG_RESULT([yes])],
-     [AC_MSG_RESULT([no])] )
-+  LIBS="$HOLD_LIBS"
-+fi
- 
- ##############################################################################
- ###  Check for JPG
--- 
-2.14.1
-
diff --git a/package/motion/0002-Check-for-pthread_getname_np.patch b/package/motion/0002-Check-for-pthread_getname_np.patch
deleted file mode 100644
index c6b5d6aa74..0000000000
--- a/package/motion/0002-Check-for-pthread_getname_np.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 4067b793689f740e86b2f070c63cc72860347ab5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 Nov 2017 22:53:03 +0100
-Subject: [PATCH] Check for pthread_getname_np
-
-On some toolchains (like musl), pthread_setname_np is available but not
-pthread_getname_np so add this check in configure.ac
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 11 +++++++++++
- logger.c     |  2 +-
- motion.c     |  2 +-
- 3 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 21efd2a..06b2990 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -140,6 +140,17 @@ if test x$THREADS = xyes; then
-     [AC_DEFINE([HAVE_PTHREAD_SETNAME_NP], [1], [Define if you have pthread_setname_np function.])
-     AC_MSG_RESULT([yes])],
-     [AC_MSG_RESULT([no])] )
-+
-+##############################################################################
-+###  Check for pthread_getname_np (nonstandard GNU extension)
-+##############################################################################
-+  AC_MSG_CHECKING([for pthread_getname_np])
-+  AC_LINK_IFELSE(
-+    [AC_LANG_PROGRAM([#include <pthread.h>], [pthread_getname_np(pthread_self(), NULL, 0)])],
-+    [AC_DEFINE([HAVE_PTHREAD_GETNAME_NP], [1], [Define if you have pthread_getname_np function.])
-+    AC_MSG_RESULT([yes])],
-+    [AC_MSG_RESULT([no])] )
-+
-   LIBS="$HOLD_LIBS"
- fi
- 
-diff --git a/logger.c b/logger.c
-index 01ea5a5..fd80d77 100644
---- a/logger.c
-+++ b/logger.c
-@@ -207,7 +207,7 @@ void motion_log(int level, unsigned int type, int errno_flag, const char *fmt, .
-     errno_save = errno;
- 
-     char threadname[32] = "unknown";
--#if ((!defined(BSD) && HAVE_PTHREAD_SETNAME_NP) || defined(__APPLE__))
-+#if ((!defined(BSD) && HAVE_PTHREAD_GETNAME_NP) || defined(__APPLE__))
-     pthread_getname_np(pthread_self(), threadname, sizeof(threadname));
- #endif
- 
-diff --git a/motion.c b/motion.c
-index 8570896..985d4b2 100644
---- a/motion.c
-+++ b/motion.c
-@@ -3772,7 +3772,7 @@ void util_threadname_set(const char *abbr, int threadnbr, const char *threadname
- 
- void util_threadname_get(char *threadname){
- 
--#if ((!defined(BSD) && HAVE_PTHREAD_SETNAME_NP) || defined(__APPLE__))
-+#if ((!defined(BSD) && HAVE_PTHREAD_GETNAME_NP) || defined(__APPLE__))
-     char currname[16];
-     pthread_getname_np(pthread_self(), currname, sizeof(currname));
-     snprintf(threadname, sizeof(currname), "%s",currname);
--- 
-2.14.1
-
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 40cb66b7e5..5b67755e8b 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	277029c80df0d37deefbbea6d15c66a9067d9166fe8f76eb5f90aa6e97aa9741	motion-release-4.1.tar.gz
+sha256	2074b935bdfe28f84c2c3233274b06908336778f303bb13530d4299c3f8aa4e2	motion-release-4.1.1.tar.gz
 sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 03144065cc..2ba16fc837 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = release-4.1
+MOTION_VERSION = release-4.1.1
 MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
-- 
2.14.1
