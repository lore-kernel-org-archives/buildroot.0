From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:39:37 +0100
Subject: [Buildroot] [git commit] cairo: do not depend on
	xserver-xorg_server, but on the right library
Message-ID: <20130112215437.0A622996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90c3150d5f4c732385f3fe0c25c8cddd150da685
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cairo is a X client library, so there is no reason for it to build
depend on the X.org server. What Cairo needs is the xlib_libX11
library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/Config.in |    1 +
 package/cairo/cairo.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 398e47f..4a2078e 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 59a032a..41e876a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -49,7 +49,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --with-x
-	CAIRO_DEPENDENCIES += xserver_xorg-server
+	CAIRO_DEPENDENCIES += xlib_libX11
 else
 	CAIRO_CONF_OPT += --disable-xlib --without-x
 endif
