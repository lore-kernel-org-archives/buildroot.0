From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xdriver_xf86-video-intel: bump
	version
Message-ID: <20100408201140.EB5098B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b72cb51e0b754550582e231ab04011adb341eafc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 ++++----
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    4 ++--
 ...ver_xf86-video-intel-2.10.0-cross-compile.patch |   11 +++++++++++
 .../xdriver_xf86-video-intel.mk                    |    6 ++++--
 4 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch

diff --git a/CHANGES b/CHANGES
index 43fbf6a..e7323a8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,10 +16,10 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xkeyboard-config, xlib_libX11, xlib_libXfont,
-	xlib_libXfontcache, xlib_libXxf86misc, xlib_libpciaccess,
-	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
-	xproto_xf86miscproto
+	wget, xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
+	xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
+	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
+	xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 80678d5..ddbf4ff 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_LIBDRM
 	help
-	  xf86-video-intel 2.9.1
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
new file mode 100644
index 0000000..0b020ac
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac.orig	2010-01-04 22:20:07.000000000 +0000
++++ b/configure.ac	2010-02-19 12:12:50.000000000 +0000
+@@ -103,7 +103,7 @@
+ CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+ CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+ AC_MSG_CHECKING([whether to include DRI support])
+-if test x$DRI != xno; then
++if test "$cross_compiling" = "no" -a test x$DRI != xno; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 6bec2d6..c77b61e 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.9.1
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto xproto_dri2proto
+XDRIVER_XF86_VIDEO_INTEL_LIBTOOL_PATCH = NO
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 XDRIVER_XF86_VIDEO_INTEL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
-- 
1.6.3.3
