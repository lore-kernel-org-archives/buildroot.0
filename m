From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 19:14:30 +0200
Subject: [Buildroot] [PATCH] cairo: fix build issue with gcc 4.9
Message-ID: <1400433270-3386-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/277/277038de62d6262576a63b213374a33357a8333b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo-005-fix-gcc-49-build.patch | 38 ++++++++++++++++++++++++++
 package/cairo/cairo.mk                         |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 package/cairo/cairo-005-fix-gcc-49-build.patch

diff --git a/package/cairo/cairo-005-fix-gcc-49-build.patch b/package/cairo/cairo-005-fix-gcc-49-build.patch
new file mode 100644
index 0000000..112c9ea
--- /dev/null
+++ b/package/cairo/cairo-005-fix-gcc-49-build.patch
@@ -0,0 +1,38 @@
+Fix build with gcc 4.9
+
+cairo fails to build with gcc 4.9 due to a bad interaction of cairo
+modules with the LTO mechanism. The suggested workaround is to pass
+-ffat-lto-objects. See
+https://bugs.freedesktop.org/show_bug.cgi?id=77060 for the upstream
+bug report, and
+https://bugs.archlinux.org/task/40313?project=1&openedfrom=-1+week for
+the ArchLinux bug report.
+
+This patch passes -ffat-lto-objects when gcc understands this option,
+in order to provide compatibility with gcc versions older than 4.8,
+which did not provide this option, but are anyway unaffected by the
+issue.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -37,6 +37,16 @@
+ m4_include(build/configure.ac.pthread)  dnl checks for pthreads
+ AC_CACHE_SAVE
+ 
++old_cflags=$CFLAGS
++CFLAGS=-ffat-lto-objects
++AC_MSG_CHECKING([whether CC supports -ffat-lto-objects])
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
++    [AC_MSG_RESULT([yes])]
++    [LTO_CFLAGS=-ffat-lto-objects],
++    [AC_MSG_RESULT([no])]
++)
++CFLAGS="${old_CFLAGS} ${LTO_CFLAGS}"
++
+ dnl ===========================================================================
+ 
+ AC_CHECK_LIB(z, compress,
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 43238ca..789dfa7 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -10,6 +10,7 @@ CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
+CAIRO_AUTORECONF = YES
 
 CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
-- 
1.9.3
