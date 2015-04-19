From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:40:22 +0200
Subject: [Buildroot] [git commit] cairo: add host variant
Message-ID: <20150419124107.78F9D7FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f463cbfcde69d0c43025fd6fbd7ab64455db5c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required for host-pango, which in turn is required for host-librsvg and
at last midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

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
