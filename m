From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Jun 2020 00:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: add gobject-introspection
 support
Message-ID: <20200606223306.3374021-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsvg/librsvg.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 470910d94c..e124fdd5d3 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,7 +10,7 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
+LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
@@ -19,5 +19,12 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libgli
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBRSVG_CONF_OPTS += --enable-introspection
+LIBRSVG_DEPENDENCIES += gobject-introspection
+else
+LIBRSVG_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.26.2
