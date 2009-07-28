From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 16:18:10 +0200
Subject: [Buildroot] [git commit] xorg: bump version of xutil/macros to 1.2.2
Message-ID: <20090729054333.6E595763CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=930f3db16724f95ebcf641d2887bb773f296c295
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump is required by the bump of xlib_libXt from 1.0.5 to
1.0.6 (1.0.6 requires at least xutil/macros 1.2).

The linuxdoc patch is removed, since it has been merged upstream, at
http://cgit.freedesktop.org/xorg/util/macros/commit/?id=e20c503d24e5ccf03035aa0f6d833d235d2179df

The other patch exposing STAGING_DIR is kept, as it is Buildroot
specific. It has just been updated to resolve conflicts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xutil_util-macros-1.1.6-linuxdoc.patch         |   15 ---------------
 .../xutil_util-macros-1.1.6.patch                  |    8 --------
 .../xutil_util-macros-1.2.2.patch                  |   16 ++++++++++++++++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 4 files changed, 17 insertions(+), 24 deletions(-)
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch
 create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch

diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch
deleted file mode 100644
index 26c83aa..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- util-macros-1.1.6/xorg-macros.m4.in.orig	2007-06-08 22:23:00.000000000 +0200
-+++ util-macros-1.1.6/xorg-macros.m4.in	2007-06-08 22:26:41.000000000 +0200
-@@ -194,7 +194,11 @@
- XORG_SGML_PATH=$prefix/share/sgml
- HAVE_DEFS_ENT=
- 
--AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
-+if test "$cross_compiling" = no; then
-+   AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
-+else
-+   HAVE_DEFS_ENT=no
-+fi
- 
- AC_PATH_PROG(LINUXDOC, linuxdoc)
- AC_PATH_PROG(PS2PDF, ps2pdf)
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch
deleted file mode 100644
index 3b70e7c..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- util-macros-1.1.6/xorg-macros.m4.in.orig	2007-06-10 11:34:17.000000000 +0200
-+++ util-macros-1.1.6/xorg-macros.m4.in	2007-06-10 11:34:20.000000000 +0200
-@@ -423,3 +423,5 @@
- AM_CONDITIONAL(MAKE_LINT_LIB, [test x$make_lint_lib != xno])
- 
- ]) # XORG_LINT_LIBRARY
-+
-+AC_SUBST(STAGING_DIR)
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch
new file mode 100644
index 0000000..649db52
--- /dev/null
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch
@@ -0,0 +1,16 @@
+---
+ xorg-macros.m4.in |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: xutil_util-macros-1.2.2/xorg-macros.m4.in
+===================================================================
+--- xutil_util-macros-1.2.2.orig/xorg-macros.m4.in
++++ xutil_util-macros-1.2.2/xorg-macros.m4.in
+@@ -459,3 +459,6 @@
+ fi
+ AC_SUBST(CWARNFLAGS)
+ ]) # XORG_CWARNFLAGS
++
++# Buildroot stuff
++AC_SUBST(STAGING_DIR)
+\ No newline at end of file
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 9cc2a45..ca1890e 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.1.6
+XUTIL_UTIL_MACROS_VERSION = 1.2.2
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_AUTORECONF = NO
-- 
1.6.3.3
