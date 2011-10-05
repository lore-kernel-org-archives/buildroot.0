From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 20:20:53 +0200
Subject: [Buildroot] [git commit] xdata_xcursor-themes: add dependency on
	host xapp_xcursorgen
Message-ID: <20111005183705.8FAF18E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aeaa5e9422955c53b7c904a987a475ca0ec04369
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in bug #3331, xdata_xcursor_themes needs the xcursorgen
application installed on the host. This commit adds this dependency,
together with the needed host libraries required for xapp_cursorgen to
build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    3 +++
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    3 +++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    3 +++
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    3 +++
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    1 +
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    1 +
 7 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 55ddcdc..75c1135 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -10,4 +10,7 @@ XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_AUTORECONF = NO
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
+HOST_XAPP_XCURSORGEN_DEPENDENCIES = host-libpng host-xlib_libX11 host-xlib_libXcursor
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index fe5c0da..b62b51c 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -9,6 +9,6 @@ XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_AUTORECONF = NO
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
-XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor
+XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index ffe1b4d..6f3a776 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -11,4 +11,7 @@ XLIB_LIBXCURSOR_AUTORECONF = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
+HOST_XLIB_LIBXCURSOR_DEPENDENCIES = host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender host-xproto_xproto
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2450bce..72cd848 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -11,4 +11,7 @@ XLIB_LIBXFIXES_AUTORECONF = NO
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
+HOST_XLIB_LIBXFIXES_DEPENDENCIES = host-xproto_fixesproto host-xlib_libX11 host-xproto_xextproto host-xproto_xproto
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 3649503..5778135 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -12,4 +12,7 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
+HOST_XLIB_LIBXRENDER_DEPENDENCIES = host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index d569de8..a91e6cb 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -12,3 +12,4 @@ XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 7960517..dac3424 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -12,3 +12,4 @@ XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
