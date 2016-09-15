From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Sep 2016 22:11:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] php: fix pthread detection
Message-ID: <1473970319-110534-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix pthread detection so safety option (--enable-maintainer-zts) will be
available

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Do not update configure through sed but fix issue in a dedicated
   upstreamable patch

 ...x-pthreads-detection-when-cross-compiling.patch | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 package/php/0008-Fix-pthreads-detection-when-cross-compiling.patch

diff --git a/package/php/0008-Fix-pthreads-detection-when-cross-compiling.patch b/package/php/0008-Fix-pthreads-detection-when-cross-compiling.patch
new file mode 100644
index 0000000..f9d07a8
--- /dev/null
+++ b/package/php/0008-Fix-pthreads-detection-when-cross-compiling.patch
@@ -0,0 +1,124 @@
+From 68f855bda8d7e33dd0a99bef06f7cb50ea8746b7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 13 Sep 2016 20:12:48 +0200
+Subject: [PATCH 1/1] Fix pthreads detection when cross-compiling
+
+pthreads are not working when cross-compiling, indeed configure
+sets pthreads_working to no if cross_compiling is detected.
+This behavior is implemented in PTHREADS_CHECK. This function call
+AC_CACHE_CHECK twice to retrieve ac_cv_pthreads_cflags and
+ac_cv_pthreads_lib.
+In these calls, the function PTHREADS_CHECK_COMPILE will call AC_TRY_RUN
+function which will update the global pthreads_working variable.
+This is not compliant with autoconf AC_CACHE_CHECK rules which specify
+that "The commands-to-set-it must have no side effects except for
+setting the variable cache-id".
+
+So, this patch replaces pthread_working assignments with assignments on
+a new local pthread_checked variable. Value of ptreads_working is
+computed outside AC_CACHE_CHECK function depending on value of
+ac_cv_pthreads_cflags and ac_cv_pthreads_lib.
+
+Moreover, AC_TRY_RUN call is replaced by AC_TRY_LINK which will work
+when cross-compiling.
+
+Without this modification, thread safety option (--enable-maintainer-zts)
+can not be enabled on embedded buildsystems such as buildroot.
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ TSRM/threads.m4 | 54 ++++++++++++++++++++++++++----------------------------
+ 1 file changed, 26 insertions(+), 28 deletions(-)
+
+diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
+index 38494ce..7ef9202 100644
+--- a/TSRM/threads.m4
++++ b/TSRM/threads.m4
+@@ -66,9 +66,10 @@ dnl
+ dnl Check whether the current setup can use POSIX threads calls
+ dnl
+ AC_DEFUN([PTHREADS_CHECK_COMPILE], [
+-AC_TRY_RUN( [
++AC_TRY_LINK( [
+ #include <pthread.h>
+ #include <stddef.h>
++  ], [
+ 
+ void *thread_routine(void *data) {
+     return data;
+@@ -81,17 +82,10 @@ int main() {
+     pthread_mutexattr_init(&mattr);
+     return pthread_create(&thd, NULL, thread_routine, &data);
+ } ], [
+-  pthreads_working=yes
+-  ], [
+-  pthreads_working=no
++  pthreads_checked=yes
+   ], [
+-  dnl For cross compiling running this test is of no use. NetWare supports pthreads
+-  pthreads_working=no
+-  case $host_alias in
+-  *netware*)
+-    pthreads_working=yes
+-  esac
+-]
++  pthreads_checked=no
++  ]
+ ) ] )dnl
+ dnl
+ dnl PTHREADS_CHECK()
+@@ -129,30 +123,34 @@ else
+       CFLAGS="$CFLAGS $flag"
+       PTHREADS_CHECK_COMPILE
+       CFLAGS=$ac_save
+-      if test "$pthreads_working" = "yes"; then
++      if test "$pthreads_checked" = "yes"; then
+         ac_cv_pthreads_cflags=$flag
+         break
+       fi
+     done
+   fi
+-fi
+-])
++  ])
+ 
+-AC_CACHE_CHECK(for pthreads_lib, ac_cv_pthreads_lib,[
+-ac_cv_pthreads_lib=
+-if test "$pthreads_working" != "yes"; then
+-  for lib in pthread pthreads c_r; do
+-    ac_save=$LIBS
+-    LIBS="$LIBS -l$lib"
+-    PTHREADS_CHECK_COMPILE
+-    LIBS=$ac_save
+-    if test "$pthreads_working" = "yes"; then
+-      ac_cv_pthreads_lib=$lib
+-      break
+-    fi
+-  done
++  AC_CACHE_CHECK(for pthreads_lib, ac_cv_pthreads_lib,[
++  ac_cv_pthreads_lib=
++  if test "$pthreads_working" != "yes"; then
++   for lib in pthread pthreads c_r; do
++      ac_save=$LIBS
++      LIBS="$LIBS -l$lib"
++      PTHREADS_CHECK_COMPILE
++      LIBS=$ac_save
++      if test "$pthreads_checked" = "yes"; then
++        ac_cv_pthreads_lib=$lib
++        break
++      fi
++    done
++  fi
++  ])
++
++  if test "x$ac_cv_pthreads_cflags" != "x" -o "x$ac_cv_pthreads_lib" != "x"; then
++    pthreads_working="yes"
++  fi
+ fi
+-])
+ 
+ if test "$pthreads_working" = "yes"; then
+   threads_result="POSIX-Threads found"
+-- 
+2.5.0
+
-- 
2.5.0
