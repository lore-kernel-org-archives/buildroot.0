From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2020 22:24:19 +0200
Subject: [Buildroot] [git commit] package/gupnp: needs host-vala for
 introspection
Message-ID: <20200331210021.CE2C881641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44473d33dddc6b85c56a2c289df0af81d3d30636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introspection support in gupnp is handled by way of vala tools and
vala bindings.

Even though host-vala is already a transitive dependency via gssdp,
add it to gupnp for correctness sake; also explicitly enable the
generation of the vala API, since it is required for introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gupnp/gupnp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 66a6e76574..dfe25e16c5 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -15,10 +15,10 @@ GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 GUPNP_CONF_OPTS = -Dexamples=false
 
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
