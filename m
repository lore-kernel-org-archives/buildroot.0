From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 10:24:57 -0700
Subject: [Buildroot] [PATCH 4/5] package/gupnp-dlna: add optional dependency
 for gobject-introspection
In-Reply-To: <20200315172459.881615-1-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
Message-ID: <20200315172459.881615-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set --enable-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 85d30b7cd2..6ce20c15fd 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -16,9 +16,15 @@ GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
 GUPNP_DLNA_CONF_OPTS = \
-	--disable-introspection \
 	--disable-legacy-gstreamer-metadata-backend
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_DEPENDENCIES += gobject-introspection
+else
+GUPNP_DLNA_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
-- 
2.24.1
