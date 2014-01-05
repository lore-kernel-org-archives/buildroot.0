From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 21:50:02 +0100
Subject: [Buildroot] [git commit] xapp_xdpyinfo: fix dependencies
Message-ID: <20140105230941.F08B39BE33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a97b5add2e10c019b23fb331360dcac71f7074d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the dependencies listed were optional or only indirectly needed
(E.G. the xproto ones), so don't select them.

Further more, the optional xcomposite and xinerama dependencies were missing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdpyinfo/Config.in        |    9 ---------
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk |   25 ++++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index 261a63f..6584ae1 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -2,15 +2,6 @@ config BR2_PACKAGE_XAPP_XDPYINFO
 	bool "xdpyinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXTST
-	select BR2_PACKAGE_XLIB_LIBXXF86DGA
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	help
 	  display information utility for X
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 2143988..dcfe77a 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -9,6 +9,29 @@ XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
 XAPP_XDPYINFO_LICENSE_FILES = COPYING
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
+XAPP_XDPYINFO_CONF_OPT = --without-xf86misc # not in BR
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXtst \
+	$(if $(BR2_PACKAGE_XLIB_LIBXI),xlib_libXi) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXXF86VM),xlib_libXxf86vm)
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86DGA),y)
+XAPP_XDPYINFO_DEPENDENCIES += xlib_libXxf86dga
+else
+XAPP_XDPYINFO_CONF_OPT += --without-dga
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
+XAPP_XDPYINFO_DEPENDENCIES += xlib_libdmx
+else
+XAPP_XDPYINFO_CONF_OPT += --without-dmx
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+XAPP_XDPYINFO_DEPENDENCIES += xlib_libXinerama
+else
+XAPP_XDPYINFO_CONF_OPT += --without-xinerama
+endif
 
 $(eval $(autotools-package))
