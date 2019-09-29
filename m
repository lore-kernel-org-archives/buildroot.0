From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 17:34:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: Fix PATH_MAX detection by
 including sys/param.h if available
Message-ID: <20190929153436.22933-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes subversion build error.

Fixes:
http://autobuild.buildroot.net/results/d42/d42be423c1c6fe7e7c419976ff35a04e18dfb8dd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/0002-sys-param-h.patch | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/apr/0002-sys-param-h.patch

diff --git a/package/apr/0002-sys-param-h.patch b/package/apr/0002-sys-param-h.patch
new file mode 100644
index 0000000000..49f963c4d5
--- /dev/null
+++ b/package/apr/0002-sys-param-h.patch
@@ -0,0 +1,39 @@
+Fix PATH_MAX detection by including sys/param.h if available
+
+Patch sent upstream:
+https://bz.apache.org/bugzilla/show_bug.cgi?id=63782
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr apr-1.7.0.orig/configure.in apr-1.7.0/configure.in
+--- apr-1.7.0.orig/configure.in	2019-04-01 19:40:46.000000000 +0200
++++ apr-1.7.0/configure.in	2019-09-29 17:03:41.803326791 +0200
+@@ -1586,6 +1586,7 @@
+ AC_SUBST(stringh)
+ AC_SUBST(stringsh)
+ AC_SUBST(sys_ioctlh)
++AC_SUBST(sys_paramh)
+ AC_SUBST(sys_sendfileh)
+ AC_SUBST(sys_signalh)
+ AC_SUBST(sys_socketh)
+diff -uNr apr-1.7.0.orig/include/apr.h.in apr-1.7.0/include/apr.h.in
+--- apr-1.7.0.orig/include/apr.h.in	2019-03-22 14:30:31.000000000 +0100
++++ apr-1.7.0/include/apr.h.in	2019-09-29 17:04:54.203815469 +0200
+@@ -95,6 +95,7 @@
+ #define APR_HAVE_STRINGS_H       @stringsh@
+ #define APR_HAVE_INTTYPES_H      @inttypesh@
+ #define APR_HAVE_SYS_IOCTL_H     @sys_ioctlh@
++#define APR_HAVE_SYS_PARAM_H     @sys_paramh@
+ #define APR_HAVE_SYS_SENDFILE_H  @sys_sendfileh@
+ #define APR_HAVE_SYS_SIGNAL_H    @sys_signalh@
+ #define APR_HAVE_SYS_SOCKET_H    @sys_socketh@
+@@ -206,6 +207,9 @@
+ #include <sys/syslimits.h>
+ #endif
+ #endif
++#if APR_HAVE_SYS_PARAM_H
++#include <sys/param.h>
++#endif
+ 
+ /* __APPLE__ is now the official pre-defined macro for macOS */
+ #ifdef __APPLE__
-- 
2.20.1
