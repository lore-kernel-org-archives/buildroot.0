From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-mach64 to 6.8.2
Message-ID: <20100308133629.79F47776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1bd0f20d5c3475cdf8bc78581a00c2a8ff7d64ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    2 +-
 .../xdriver_xf86-video-mach64-cross-compile.patch  |   27 ++++++++++++++++++++
 .../xdriver_xf86-video-mach64.mk                   |    4 +-
 3 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 4454a2f..6be86d9 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-mach64 6.8.0
+	  xf86-video-mach64 6.8.2
 	  mach64 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
new file mode 100644
index 0000000..d276176
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
@@ -0,0 +1,27 @@
+--- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
++++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
+@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-	AC_CHECK_FILE([${sdkdir}/dri.h],
++ 	if test "$cross_compiling" = "no" ; then
++		AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/sarea.h],
++		AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/dristruct.h],
++		AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/damage.h],
++		AC_CHECK_FILE([${sdkdir}/damage.h],
+                       [have_damage_h="yes"], [have_damage_h="no"])
++ 	else
++ 		have_dri_h="yes"
++ 		have_sarea_h="yes"
++ 		have_dristruct_h="yes"
++ 	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index a28d671..9992cf0 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.8.0
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.8.2
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_MACH64_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
