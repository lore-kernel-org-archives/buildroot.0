From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Mar 2016 18:17:49 -0300
Subject: [Buildroot] [PATCH] gdk-pixbuf: create loader cache at build time
Message-ID: <1458767869-14680-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create the gdk pixbuf loaders cache file at build time rather than run
time, since the root filesytem can be read-only.
We also didn't cater for systemd-based systems, so this solves two
issues at once.

The only side-effect is that we must now pull host-gdk-pixbuf into
target gdk-pixbuf dependencies, but generally users will have gdk-pixbuf
selected if they use libgtk2/3 which already pull in host-gdk-pixbuf.

And remove initscript correspondingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/S26gdk-pixbuf | 19 -------------------
 package/gdk-pixbuf/gdk-pixbuf.mk | 22 +++++++++++++++-------
 2 files changed, 15 insertions(+), 26 deletions(-)
 delete mode 100644 package/gdk-pixbuf/S26gdk-pixbuf

diff --git a/package/gdk-pixbuf/S26gdk-pixbuf b/package/gdk-pixbuf/S26gdk-pixbuf
deleted file mode 100644
index 82b7944..0000000
--- a/package/gdk-pixbuf/S26gdk-pixbuf
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-#
-# run gdk-pixbuf-query-loaders if needed
-
-FILE=/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-
-case "$1" in
-    start|"")
-	if [ ! -f "$FILE" ] ; then
-	    /usr/bin/gdk-pixbuf-query-loaders --update-cache
-	fi
-	;;
-    stop)
-	;;
-    *)
-	echo "Usage: $0 {start|stop}" >&2
-	exit 1
-	;;
-esac
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index be79e11..02c4aa9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -11,6 +11,9 @@ GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF
 GDK_PIXBUF_LICENSE = LGPLv2+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_INSTALL_STAGING = YES
+GDK_PIXBUF_DEPENDENCIES = \
+	host-gdk-pixbuf host-libglib2 host-pkgconf \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 GDK_PIXBUF_CONF_ENV = \
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
@@ -43,14 +46,19 @@ GDK_PIXBUF_CONF_OPTS += --with-x11
 GDK_PIXBUF_DEPENDENCIES += xlib_libX11
 endif
 
-GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
-	host-pkgconf libglib2
-
-define GDK_PIXBUF_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
-		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
+# gdk-pixbuf requires the loaders.cache file populated to work properly
+# Rather than doing so at runtime, since the fs can be read-only, do so
+# here after building and installing to target.
+# And since the cache file will contain absolute target directory names
+# we need to sanitize (strip) them.
+define GDK_PIXBUF_UPDATE_CACHE
+	GDK_PIXBUF_MODULEDIR=$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
+		$(HOST_DIR)/usr/bin/gdk-pixbuf-query-loaders \
+		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
+	$(SED) "s,$(TARGET_DIR),,g" \
+		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
+GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
 
 # Tests don't build correctly with uClibc
 define GDK_PIXBUF_DISABLE_TESTS
-- 
2.7.3
