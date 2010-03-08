From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-intel to 2.9.1
Message-ID: <20100308133619.54689776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7f26cbb479151a9232d3bd7f0b506c953d48ce2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    3 +-
 ...iver_xf86-video-intel-2.4.2-cross-compile.patch |   26 --------------------
 ...iver_xf86-video-intel-2.9.1-cross-compile.patch |   25 +++++++++++++++++++
 .../xdriver_xf86-video-intel.mk                    |    4 +-
 4 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 3de2845..80678d5 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	help
-	  xf86-video-intel 2.1.1
+	  xf86-video-intel 2.9.1
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
deleted file mode 100644
index ecf1571..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-diff -ruN xf86-video-intel-2.4.2/configure.ac xf86-video-intel-2.4.2-patched/configure.ac
---- xf86-video-intel-2.4.2/configure.ac	2008-08-26 03:28:31.000000000 +0200
-+++ xf86-video-intel-2.4.2-patched/configure.ac	2009-07-27 13:39:49.000000000 +0200
-@@ -91,6 +91,7 @@
- # Checks for header files.
- AC_HEADER_STDC
- 
-+if test "$cross_compiling" = "no" ; then
- if test x$DRI != xno; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-@@ -111,6 +112,14 @@
-                 DRI="no"
-         fi
- fi
-+else
-+if test x$DRI != xno; then
-+	have_dri_h="yes"
-+	have_sarea_h="yes"
-+	have_dristruct_h="yes"
-+	DRI="yes"
-+fi
-+fi
- AC_MSG_RESULT([$DRI])
- 
- save_CFLAGS="$CFLAGS"
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
new file mode 100644
index 0000000..76a33eb
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
@@ -0,0 +1,25 @@
+--- xdriver_xf86-video-intel-2.9.1/configure.ac.orig	2010-01-28 11:18:27.526329157 +0200
++++ xdriver_xf86-video-intel-2.9.1/configure.ac	2010-01-28 11:21:38.065198735 +0200
+@@ -114,6 +114,7 @@ save_CFLAGS="$CFLAGS"
+ CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
+ CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
+ AC_MSG_CHECKING([whether to include DRI support])
++if test "$cross_compiling" = "no" ; then
+ if test x$DRI != xno; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+@@ -132,6 +133,14 @@ if test x$DRI = xauto; then
+                 DRI="no"
+         fi
+ fi
++else
++if test x$DRI != xno; then
++	have_dri_h="yes"
++	have_sarea_h="yes"
++	have_dristruct_h="yes"
++	DRI="yes"
++fi
++fi
+ AC_MSG_RESULT([$DRI])
+ CFLAGS="$save_CFLAGS $DEBUGFLAGS"
+ 
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 829cc3a..6bec2d6 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.4.2
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.9.1
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto xproto_dri2proto
 XDRIVER_XF86_VIDEO_INTEL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
-- 
1.6.3.3
