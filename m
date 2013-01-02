From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:54 +0100
Subject: [Buildroot] [PATCH 19/20] xdriver_xf86-video-xgixp: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0c1af9f9ba63e23a9b2f470f9f7be59572cc5312.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |   11 ---------
 .../xdriver_xf86-video-xgixp-cross-compile.patch   |   24 --------------------
 .../xdriver_xf86-video-xgixp.mk                    |   13 -----------
 3 files changed, 48 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk

diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
deleted file mode 100644
index 8d466f4..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
-	bool "xf86-video-xgixp"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  XGIXP based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
deleted file mode 100644
index 9736252..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xdriver_xf86-video-xgixp-1.7.99.4/configure.ac.orig	2009-09-07 08:09:14.000000000 +0300
-+++ xdriver_xf86-video-xgixp-1.7.99.4/configure.ac	2010-02-04 00:12:22.159108635 +0200
-@@ -63,12 +63,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- # Checks for header files.
- AC_HEADER_STDC
- 
--AC_CHECK_FILE([${sdkdir}/dri.h],
-+if test "$cross_compiling" = "no" ; then
-+        AC_CHECK_FILE([${sdkdir}/dri.h],
-               [have_dri_h="yes"], [have_dri_h="no"])
--AC_CHECK_FILE([${sdkdir}/sarea.h],
-+        AC_CHECK_FILE([${sdkdir}/sarea.h],
-               [have_sarea_h="yes"], [have_sarea_h="no"])
--AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+        AC_CHECK_FILE([${sdkdir}/dristruct.h],
-               [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+else
-+        have_dri_h="yes"
-+        have_sarea_h="yes"
-+        have_dristruct_h="yes"
-+fi
- 
- AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
- 
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
deleted file mode 100644
index 4a9a2a2..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-xgixp -- XGIXP video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.8.0
-XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
