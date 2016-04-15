From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 20:24:09 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: use host loaders to update the
	cache
Message-ID: <20160415183007.EEE407F8A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b1128589345d7ff9bda3861bf98e26da820a14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately gdk-pixbuf-query-loaders doesn't understand cross loaders
to update the cache, hence we can't use the host variant against target
loaders since it will output an effectively empty cache, causing runtime
failure of libgtk when finding icons.
So make host-gdk-pixbuf functionally equivalent to the target gdk-pixbuf
so we can run gdk-pixbuf-query-loaders against the host plugins and just
strip the host directory to make it runtime-compatible (like was done
before for the target directory).

This is still better than trying to update at runtime, since that would
require a writable loaders.cache file in tmpfs or rw filesystem, not to
mention the associated additional startup time.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 03594d8..36eed60 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -14,6 +14,7 @@ GDK_PIXBUF_INSTALL_STAGING = YES
 GDK_PIXBUF_DEPENDENCIES = \
 	host-gdk-pixbuf host-libglib2 host-pkgconf \
 	libglib2 $(if $(BR2_ENABLE_LOCALE),,libiconv)
+HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
 GDK_PIXBUF_CONF_ENV = \
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
@@ -28,17 +29,21 @@ GDK_PIXBUF_DEPENDENCIES += libpng
 endif
 
 ifneq ($(BR2_PACKAGE_JPEG),y)
+HOST_GDK_PIXBUF_CONF_OPTS += --without-libjpeg
 GDK_PIXBUF_CONF_OPTS += --without-libjpeg
 else
 GDK_PIXBUF_DEPENDENCIES += jpeg
+HOST_GDK_PIXBUF_DEPENDENCIES += host-libjpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF),y)
 GDK_PIXBUF_CONF_OPTS += --without-libtiff
+HOST_GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
-GDK_PIXBUF_DEPENDENCIES += tiff host-pkgconf
+GDK_PIXBUF_DEPENDENCIES += tiff
 GDK_PIXBUF_CONF_ENV += \
 	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
+HOST_GDK_PIXBUF_DEPENDENCIES += host-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
@@ -49,14 +54,14 @@ endif
 # gdk-pixbuf requires the loaders.cache file populated to work properly
 # Rather than doing so at runtime, since the fs can be read-only, do so
 # here after building and installing to target.
-# And since the cache file will contain absolute target directory names
-# we need to sanitize (strip) them.
+# And since the cache file will contain absolute host directory names we
+# need to sanitize (strip) them.
 ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
-	GDK_PIXBUF_MODULEDIR=$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
+	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/usr/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-	$(SED) "s,$(TARGET_DIR),,g" \
+	$(SED) "s,$(HOST_DIR),,g" \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
@@ -69,11 +74,4 @@ endef
 GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_DISABLE_TESTS
 
 $(eval $(autotools-package))
-
-HOST_GDK_PIXBUF_CONF_OPTS = \
-	--without-libjpeg \
-	--without-libtiff
-
-HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
-
 $(eval $(host-autotools-package))
