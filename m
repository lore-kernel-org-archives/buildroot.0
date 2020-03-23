From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 23 Mar 2020 10:58:13 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200323175813.3903868-1-aduskett@gmail.com>
References: <20200323175813.3903868-1-aduskett@gmail.com>
Message-ID: <20200323175813.3903868-2-aduskett@gmail.com>
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
with no way to disable them.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Depend on gst plugins (Fabrice Fontaine)
  - Add host-vala to the dependencies.
  - Move the goi check inside of the gst1_plugins_base check.

 package/gupnp-dlna/gupnp-dlna.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 85d30b7cd2..4eecc0754e 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -16,12 +16,18 @@ GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
 GUPNP_DLNA_CONF_OPTS = \
-	--disable-introspection \
 	--disable-legacy-gstreamer-metadata-backend
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+# vala bindings are created with the .gir files.
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_DEPENDENCIES += gobject-introspection host-vala
+else
+GUPNP_DLNA_CONF_OPTS += --disable-introspection
+endif
 else
 GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
 endif
-- 
2.25.1
