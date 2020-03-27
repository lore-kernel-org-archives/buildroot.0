From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 27 Mar 2020 11:29:59 -0700
Subject: [Buildroot] [PATCH v3 6/7] package/gupnp: Depend on host-vala if
 gobject-introspection is selected.
In-Reply-To: <20200327183000.1005676-1-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
Message-ID: <20200327183000.1005676-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Because there is no way to select host-vala explicitly and some packages may
require the vala bindings, it is better to unconditionally build the vala
bindings into the .gir and .typelib files.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gupnp/gupnp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 612359ba55..c86eb6db2c 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -14,10 +14,10 @@ GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_CONF_OPTS += -Dintrospection=true
-GUPNP_DEPENDENCIES += gobject-introspection
+GUPNP_CONF_OPTS += -Dintrospection=true -Dvapi=true
+GUPNP_DEPENDENCIES += host-vala gobject-introspection
 else
-GUPNP_CONF_OPTS += -Dintrospection=false
+GUPNP_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
 $(eval $(meson-package))
-- 
2.25.1
