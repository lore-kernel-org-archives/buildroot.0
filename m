From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:05:02 +0200
Subject: [Buildroot] [git commit] libgtk3: build gtk-encode-symbolic-svg for
	host variant
Message-ID: <20160421200554.F372381E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d54567b60cd12836617e72cd44501b1352a1354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's required to create the symbolic icons (RGBA/transparent) which some
apps like to use, like connman-gtk.
The added patch avoids the need for a full host-libgtk3 build which would
require host-libepoxy, host-mesa3d and a ton other deps.
And pull in host-librsvg so that we have the rsvg gdk-pixbuf loader
(plugin), otherwise scalable (svg) icons will error when trying to be
processed, like those provided by adwaita-icon-theme.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...k-dependency-from-gtk-encode-symbolic-svg.patch | 105 +++++++++++++++++++++
 package/libgtk3/libgtk3.mk                         |  12 ++-
 2 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
new file mode 100644
index 0000000..cea4259
--- /dev/null
+++ b/package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
@@ -0,0 +1,105 @@
+From 4d09ff324419fe4e671233044e424378da53969b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 9 Jun 2015 14:20:30 +0300
+Subject: [PATCH] Remove Gdk-dependency from gtk-encode-symbolic-svg
+
+Building gtk-encode-symbolic-svg without building Gdk is useful
+as only the icon tools are needed on the native build: this makes
+native build much faster and requires much less dependencies.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: taken from yocto, upstream pending
+
+ gtk/encodesymbolic.c | 36 ++++++++++--------------------------
+ 1 file changed, 10 insertions(+), 26 deletions(-)
+
+diff --git a/gtk/encodesymbolic.c b/gtk/encodesymbolic.c
+index 9f7d015..1f07563 100644
+--- a/gtk/encodesymbolic.c
++++ b/gtk/encodesymbolic.c
+@@ -19,7 +19,6 @@
+ 
+ #include <glib.h>
+ #include <gdk-pixbuf/gdk-pixdata.h>
+-#include <gdk/gdk.h>
+ #include <glib/gi18n.h>
+ 
+ #ifdef HAVE_UNISTD_H
+@@ -43,30 +42,18 @@ static GdkPixbuf *
+ load_symbolic_svg (char *file_data, gsize file_len,
+                    int width,
+                    int height,
+-                   const GdkRGBA  *fg,
+-                   const GdkRGBA  *success_color,
+-                   const GdkRGBA  *warning_color,
+-                   const GdkRGBA  *error_color,
++                   const char *css_fg,
++                   const char *css_success,
++                   const char *css_warning,
++                   const char *css_error,
+                    GError        **error)
+ {
+   GInputStream *stream;
+   GdkPixbuf *pixbuf;
+-  gchar *css_fg;
+-  gchar *css_success;
+-  gchar *css_warning;
+-  gchar *css_error;
+   gchar *data;
+   gchar *svg_width, *svg_height;
+   gchar *escaped_file_data;
+ 
+-  css_fg = gdk_rgba_to_string (fg);
+-
+-  css_success = css_warning = css_error = NULL;
+-
+-  css_warning = gdk_rgba_to_string (warning_color);
+-  css_error = gdk_rgba_to_string (error_color);
+-  css_success = gdk_rgba_to_string (success_color);
+-
+   /* Fetch size from the original icon */
+   stream = g_memory_input_stream_new_from_data (file_data, file_len, NULL);
+   pixbuf = gdk_pixbuf_new_from_stream (stream, NULL, error);
+@@ -105,10 +92,6 @@ load_symbolic_svg (char *file_data, gsize file_len,
+                       "</svg>",
+                       NULL);
+   g_free (escaped_file_data);
+-  g_free (css_fg);
+-  g_free (css_warning);
+-  g_free (css_error);
+-  g_free (css_success);
+   g_free (svg_width);
+   g_free (svg_height);
+ 
+@@ -167,7 +150,8 @@ make_symbolic_pixbuf (char *file,
+                       GError        **error)
+ 
+ {
+-  GdkRGBA r = { 1,0,0,1}, g = {0,1,0,1};
++  const char r[] = "rgba(255,0,0,1)";
++  const char g[] = "rgba(0,255,0,1)";
+   GdkPixbuf *loaded;
+   GdkPixbuf *pixbuf;
+   int plane;
+@@ -196,10 +180,10 @@ make_symbolic_pixbuf (char *file,
+        * the "rest", as all color fractions should add up to 1.
+        */
+       loaded = load_symbolic_svg (file_data, file_len, width, height,
+-                                  &g,
+-                                  plane == 0 ? &r : &g,
+-                                  plane == 1 ? &r : &g,
+-                                  plane == 2 ? &r : &g,
++                                  g,
++                                  plane == 0 ? r : g,
++                                  plane == 1 ? r : g,
++                                  plane == 2 ? r : g,
+                                   error);
+       if (loaded == NULL)
+         return NULL;
+-- 
+2.1.4
+
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index aec4c44..7bd92ca 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -149,10 +149,12 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-libglib2 \
 	host-libpng \
 	host-gdk-pixbuf \
-	host-pkgconf
+	host-pkgconf \
+	host-librsvg
 
 HOST_LIBGTK3_CFLAGS = \
-	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gdk-pixbuf-2.0`
+	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gdk-pixbuf-2.0` \
+	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gio-2.0`
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
@@ -165,11 +167,17 @@ define HOST_LIBGTK3_BUILD_CMDS
 		$(@D)/gtk/updateiconcache.c \
 		$(HOST_LIBGTK3_CFLAGS) \
 		-o $(@D)/gtk/gtk-update-icon-cache
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/gtk/encodesymbolic.c \
+		$(HOST_LIBGTK3_CFLAGS) \
+		-o $(@D)/gtk/gtk-encode-symbolic-svg
 endef
 
 define HOST_LIBGTK3_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
 		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
+	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-encode-symbolic-svg \
+		$(HOST_DIR)/usr/bin/gtk-encode-symbolic-svg
 endef
 
 $(eval $(autotools-package))
