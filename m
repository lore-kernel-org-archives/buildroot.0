From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Dec 2013 02:17:33 +0100
Subject: [Buildroot] [PATCH] cairo: Build with GLESv2 and VG backends if
	possible
Message-ID: <1387243053-5281-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
---
 package/cairo/cairo.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 347bb75..aa03a27 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -54,6 +54,20 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+	CAIRO_CONF_OPT += --enable-glesv2
+	CAIRO_DEPENDENCIES += libgles
+else
+	CAIRO_CONF_OPT += --disable-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
+	CAIRO_CONF_OPT += --enable-vg
+	CAIRO_DEPENDENCIES += libopenvg
+else
+	CAIRO_CONF_OPT += --disable-vg
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
 	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
-- 
1.8.5.1
