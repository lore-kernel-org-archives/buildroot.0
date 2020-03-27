From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 27 Mar 2020 11:30:00 -0700
Subject: [Buildroot] [PATCH v3 7/7] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200327183000.1005676-1-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
Message-ID: <20200327183000.1005676-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set --enable-introspection in
the configure options and add a dependency for both gobject-introspection and
host-vala.

Host-vala is necessary because the introspection includes vala bindings files
with no way to explicitly disable them.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 85d30b7cd2..845667ca53 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,15 +15,21 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = \
-	--disable-introspection \
-	--disable-legacy-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+# Gobject-introspection requires gstreamer .gir files.
+# Vala bindings are created with the .gir files.
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
+endif
 else
-GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS += \
+	--disable-gstreamer-metadata-backend \
+	--disable-introspection
 endif
 
 $(eval $(autotools-package))
-- 
2.25.1
