From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 09:37:50 +0100
Subject: [Buildroot] [git commit branch/next] motion: fix build on musl
Message-ID: <20171124083035.B423581522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10f5da59ed7aa6012586e94c0e7c615b2bc09c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some toolchains (musl) have pthread_setname_np but not pthread_getname_np.
The first patch fixes check on pthread_setname_np and the second one add
a check for pthread_getname_np

Fixes:

  http://autobuild.buildroot.net/results/65534775c5977e2424c5f5c63c46f9d0f39d7e1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-pthread_setname_np-detection.patch    | 50 ++++++++++++++++
 .../motion/0002-Check-for-pthread_getname_np.patch | 66 ++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/package/motion/0001-Fix-pthread_setname_np-detection.patch b/package/motion/0001-Fix-pthread_setname_np-detection.patch
new file mode 100644
index 0000000..dc14232
--- /dev/null
+++ b/package/motion/0001-Fix-pthread_setname_np-detection.patch
@@ -0,0 +1,50 @@
+From 505be2201377fa347a34b6cb4164c856b55e7484 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Nov 2017 22:47:39 +0100
+Subject: [PATCH] Fix pthread_setname_np detection
+
+Commit 6617c6f2c8aad041d3428bea11206fd2e61763b1 replaced
+AC_LINK_IFELSE with AC_COMPILE_IFELSE. This has broken the
+pthread_setname_np detection as compilation will always succeed even if
+pthread_setname_np is not available (if the function is not found, a
+simple warning will be displayed in config.log).
+
+The correct fix is to put back AC_LINK_IFELSE with -pthread in LIBS
+otherwise compilation will fail on toolchain without pthread_setname_np.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1792b65..21efd2a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,17 +128,20 @@ fi
+ if test x$THREADS = xyes; then
+   TEMP_LIBS="$TEMP_LIBS -pthread"
+   TEMP_CFLAGS="${TEMP_CFLAGS} -D_THREAD_SAFE"
+-fi
+ 
+ ##############################################################################
+ ###  Check for pthread_setname_np (nonstandard GNU extension)
+ ##############################################################################
+-AC_MSG_CHECKING([for pthread_setname_np])
+-AC_COMPILE_IFELSE(
++  AC_MSG_CHECKING([for pthread_setname_np])
++  HOLD_LIBS="$LIBS"
++  LIBS="$TEMP_LIBS"
++  AC_LINK_IFELSE(
+     [AC_LANG_PROGRAM([#include <pthread.h>], [pthread_setname_np(pthread_self(), "name")])],
+     [AC_DEFINE([HAVE_PTHREAD_SETNAME_NP], [1], [Define if you have pthread_setname_np function.])
+     AC_MSG_RESULT([yes])],
+     [AC_MSG_RESULT([no])] )
++  LIBS="$HOLD_LIBS"
++fi
+ 
+ ##############################################################################
+ ###  Check for JPG
+-- 
+2.14.1
+
diff --git a/package/motion/0002-Check-for-pthread_getname_np.patch b/package/motion/0002-Check-for-pthread_getname_np.patch
new file mode 100644
index 0000000..c6b5d6a
--- /dev/null
+++ b/package/motion/0002-Check-for-pthread_getname_np.patch
@@ -0,0 +1,66 @@
+From 4067b793689f740e86b2f070c63cc72860347ab5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Nov 2017 22:53:03 +0100
+Subject: [PATCH] Check for pthread_getname_np
+
+On some toolchains (like musl), pthread_setname_np is available but not
+pthread_getname_np so add this check in configure.ac
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 11 +++++++++++
+ logger.c     |  2 +-
+ motion.c     |  2 +-
+ 3 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 21efd2a..06b2990 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -140,6 +140,17 @@ if test x$THREADS = xyes; then
+     [AC_DEFINE([HAVE_PTHREAD_SETNAME_NP], [1], [Define if you have pthread_setname_np function.])
+     AC_MSG_RESULT([yes])],
+     [AC_MSG_RESULT([no])] )
++
++##############################################################################
++###  Check for pthread_getname_np (nonstandard GNU extension)
++##############################################################################
++  AC_MSG_CHECKING([for pthread_getname_np])
++  AC_LINK_IFELSE(
++    [AC_LANG_PROGRAM([#include <pthread.h>], [pthread_getname_np(pthread_self(), NULL, 0)])],
++    [AC_DEFINE([HAVE_PTHREAD_GETNAME_NP], [1], [Define if you have pthread_getname_np function.])
++    AC_MSG_RESULT([yes])],
++    [AC_MSG_RESULT([no])] )
++
+   LIBS="$HOLD_LIBS"
+ fi
+ 
+diff --git a/logger.c b/logger.c
+index 01ea5a5..fd80d77 100644
+--- a/logger.c
++++ b/logger.c
+@@ -207,7 +207,7 @@ void motion_log(int level, unsigned int type, int errno_flag, const char *fmt, .
+     errno_save = errno;
+ 
+     char threadname[32] = "unknown";
+-#if ((!defined(BSD) && HAVE_PTHREAD_SETNAME_NP) || defined(__APPLE__))
++#if ((!defined(BSD) && HAVE_PTHREAD_GETNAME_NP) || defined(__APPLE__))
+     pthread_getname_np(pthread_self(), threadname, sizeof(threadname));
+ #endif
+ 
+diff --git a/motion.c b/motion.c
+index 8570896..985d4b2 100644
+--- a/motion.c
++++ b/motion.c
+@@ -3772,7 +3772,7 @@ void util_threadname_set(const char *abbr, int threadnbr, const char *threadname
+ 
+ void util_threadname_get(char *threadname){
+ 
+-#if ((!defined(BSD) && HAVE_PTHREAD_SETNAME_NP) || defined(__APPLE__))
++#if ((!defined(BSD) && HAVE_PTHREAD_GETNAME_NP) || defined(__APPLE__))
+     char currname[16];
+     pthread_getname_np(pthread_self(), currname, sizeof(currname));
+     snprintf(threadname, sizeof(currname), "%s",currname);
+-- 
+2.14.1
+
