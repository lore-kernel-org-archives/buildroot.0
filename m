From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Mar 2020 20:19:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: disable introspection
Message-ID: <20200311191918.2488-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build will fail if host-gobject-introspection is built before
host-gdk-pixbuf:

Writing a loaders.cache file to use when running examples before installing gdk-pixbuf.
Couldn't find include 'GModule-2.0.gir' (search path: '['/home/fabrice/buildroot/output/host/share', '/usr/share/gnome/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/fabrice/buildroot/output/host/share/gir-1.0', '/usr/share/gir-1.0']')

So disable introspection on target and host variant

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 33de2e3d3a..59e0d5f454 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -23,7 +23,10 @@ GDK_PIXBUF_CONF_ENV = \
 HOST_GDK_PIXBUF_CONF_ENV = \
 	gio_can_sniff=no
 
-GDK_PIXBUF_CONF_OPTS = --disable-glibtest
+GDK_PIXBUF_CONF_OPTS = \
+	--disable-glibtest \
+	--disable-introspection
+HOST_GDK_PIXBUF_CONF_OPTS = --disable-introspection
 
 ifneq ($(BR2_PACKAGE_LIBPNG),y)
 GDK_PIXBUF_CONF_OPTS += --without-libpng
-- 
2.25.1
