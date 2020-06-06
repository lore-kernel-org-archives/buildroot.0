From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Jun 2020 10:34:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdk-pixbuf: add
 gobject-introspection support
Message-ID: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix the following build failure when enabling introspection on
libgtk2:

Couldn't find include 'GdkPixbuf-2.0.gir' (search path: '['/tmp/instance-0/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '../gdk', '/tmp/instance-0/output-1/host/share', 'gir-1.0', '/tmp/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results//86c6f55e0bd1a0fe3b70c9e97193aaad94d72a7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 59e0d5f454..b7937a48e9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -23,11 +23,16 @@ GDK_PIXBUF_CONF_ENV = \
 HOST_GDK_PIXBUF_CONF_ENV = \
 	gio_can_sniff=no
 
-GDK_PIXBUF_CONF_OPTS = \
-	--disable-glibtest \
-	--disable-introspection
+GDK_PIXBUF_CONF_OPTS = --disable-glibtest
 HOST_GDK_PIXBUF_CONF_OPTS = --disable-introspection
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GDK_PIXBUF_CONF_OPTS += --enable-introspection
+GDK_PIXBUF_DEPENDENCIES += gobject-introspection
+else
+GDK_PIXBUF_CONF_OPTS += --disable-introspection
+endif
+
 ifneq ($(BR2_PACKAGE_LIBPNG),y)
 GDK_PIXBUF_CONF_OPTS += --without-libpng
 else
-- 
2.26.2
