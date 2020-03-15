From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:47:40 +0100
Subject: [Buildroot] [git commit] package/gdk-pixbuf: disable introspection
Message-ID: <20200315143545.A24AB88074@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04aca0c5b9d27995bc27ccd5d091eb5b160f1b09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build will fail if host-gobject-introspection is built before
host-gdk-pixbuf:

Writing a loaders.cache file to use when running examples before installing gdk-pixbuf.
Couldn't find include 'GModule-2.0.gir' (search path: '['/home/fabrice/buildroot/output/host/share', '/usr/share/gnome/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/fabrice/buildroot/output/host/share/gir-1.0', '/usr/share/gir-1.0']')

So disable introspection on target and host variant

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
