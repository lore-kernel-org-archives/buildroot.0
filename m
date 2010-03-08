From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-xgixp to 1.7.99.4
Message-ID: <20100308133639.E16AA776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d68ac1dc4d5c0319dcfafab51982ce92db07e07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    2 +-
 .../xdriver_xf86-video-xgixp-cross-compile.patch   |   24 ++++++++++++++++++++
 .../xdriver_xf86-video-xgixp.mk                    |    4 +-
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
index a42a803..e4c7f8e 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-xgixp 1.7.99.3
+	  xf86-video-xgixp 1.7.99.4
 	  XGIXP based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
new file mode 100644
index 0000000..9736252
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
@@ -0,0 +1,24 @@
+--- xdriver_xf86-video-xgixp-1.7.99.4/configure.ac.orig	2009-09-07 08:09:14.000000000 +0300
++++ xdriver_xf86-video-xgixp-1.7.99.4/configure.ac	2010-02-04 00:12:22.159108635 +0200
+@@ -63,12 +63,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ # Checks for header files.
+ AC_HEADER_STDC
+ 
+-AC_CHECK_FILE([${sdkdir}/dri.h],
++if test "$cross_compiling" = "no" ; then
++        AC_CHECK_FILE([${sdkdir}/dri.h],
+               [have_dri_h="yes"], [have_dri_h="no"])
+-AC_CHECK_FILE([${sdkdir}/sarea.h],
++        AC_CHECK_FILE([${sdkdir}/sarea.h],
+               [have_sarea_h="yes"], [have_sarea_h="no"])
+-AC_CHECK_FILE([${sdkdir}/dristruct.h],
++        AC_CHECK_FILE([${sdkdir}/dristruct.h],
+               [have_dristruct_h="yes"], [have_dristruct_h="no"])
++else
++        have_dri_h="yes"
++        have_sarea_h="yes"
++        have_dristruct_h="yes"
++fi
+ 
+ AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
+ 
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index f8e99b4..eec0378 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.7.99.3
+XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.7.99.4
 XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_XGIXP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
