From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jan 2013 11:40:54 +0100
Subject: [Buildroot] [PATCH v2 2/2] cairo: add missing dependency on
	xlib_libXext
In-Reply-To: <1358592054-2428-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358592054-2428-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358592054-2428-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The X.org backend of Cairo now requires xlib_libXext. See
http://permalink.gmane.org/gmane.comp.lib.cairo/23385.

Fixes:

 http://autobuild.buildroot.org/results/795404665ec74a7ac929fdf8caf1397c9c54d80d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 * Added a select on XLIB_LIBXEXT, as requested by Peter.
---
 package/cairo/Config.in |    1 +
 package/cairo/cairo.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 89bd315..9a177a7 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ab0615c..83c82c0 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -51,7 +51,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
-	CAIRO_DEPENDENCIES += xlib_libX11
+	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
 	CAIRO_CONF_OPT += --disable-xlib --disable-xcb --without-x
 endif
-- 
1.7.9.5
