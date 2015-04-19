From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:19 -0300
Subject: [Buildroot] [PATCH v3 04/11] cairo: add host variant
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required for host-pango, which in turn is required for host-librsvg and
at last midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 2c55338..098f249 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -74,6 +74,33 @@ CAIRO_CONF_OPTS = \
 
 CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
 
+# Just the bare minimum to make other host-* packages happy
+HOST_CAIRO_CONF_OPTS = \
+	--enable-trace=no \
+	--enable-interpreter=no \
+	--disable-directfb \
+	--enable-ft \
+	--disable-gobject \
+	--disable-glesv2 \
+	--disable-vg \
+	--disable-xlib \
+	--disable-xcb \
+	--without-x \
+	--disable-xlib-xrender \
+	--disable-ps \
+	--disable-pdf \
+	--enable-png \
+	--disable-script \
+	--disable-svg \
+	--disable-tee \
+	--disable-xml
+HOST_CAIRO_DEPENDENCIES = \
+	host-freetype \
+	host-fontconfig \
+	host-libpng \
+	host-pixman \
+	host-pkgconf
+
 # DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
 # DirectFB. Break circular dependency by disabling DirectFB support in Cairo
 # (which is experimental)
@@ -172,3 +199,4 @@ CAIRO_CONF_OPTS += --disable-xml
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.5
