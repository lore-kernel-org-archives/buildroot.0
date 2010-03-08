From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-xgi to 1.5.1
Message-ID: <20100308133639.8F8A5776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6ae1bae243bff46dc6b7d9b6dcdb1f0e82a1c6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix building of this package.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |    2 +-
 .../xdriver_xf86-video-xgi-cross-compile.patch     |   24 ++++++++++++++++++++
 .../xdriver_xf86-video-xgi.mk                      |    4 +-
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
index 1db1efd..d6c3355 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-xgi 1.5.0
+	  xf86-video-xgi 1.5.1
 	  XGI based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
new file mode 100644
index 0000000..fc7903c
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
@@ -0,0 +1,24 @@
+--- xdriver_xf86-video-xgi-1.5.1/configure.ac.orig	2009-09-07 08:03:18.000000000 +0300
++++ xdriver_xf86-video-xgi-1.5.1/configure.ac	2010-02-03 23:58:40.507035914 +0200
+@@ -78,12 +78,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "x$DRI" = xauto; then
+-        AC_CHECK_FILE([${sdkdir}/dri.h],
++        if test "$cross_compiling" = "no" ; then
++                AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/sarea.h],
++                AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
++                AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++        else
++                have_dri_h="yes"
++                have_sarea_h="yes"
++                have_dristruct_h="yes"
++        fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 163a71d..38883e2 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.0
+XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.1
 XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGI_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_XGI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
