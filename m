From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 10:24:56 -0700
Subject: [Buildroot] [PATCH 3/5] package/gupnp: add optional dependency for
 gobject-introspection
In-Reply-To: <20200315172459.881615-1-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
Message-ID: <20200315172459.881615-3-aduskett@gmail.com>
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
 package/gupnp/gupnp.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 27486b09fa..75bbfa8d1d 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -12,6 +12,12 @@ GUPNP_LICENSE = LGPL-2.0+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
-GUPNP_CONF_OPTS = --disable-introspection
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_CONF_OPTS += --enable-introspection
+GUPNP_DEPENDENCIES += gobject-introspection
+else
+GUPNP_CONF_OPTS += --disable-introspection
+endif
 
 $(eval $(autotools-package))
-- 
2.24.1
