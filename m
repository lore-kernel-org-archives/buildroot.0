From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:16:50 +0100
Subject: [Buildroot] [git commit] package/gssdp: add optional dependency for
 gobject-introspection
Message-ID: <20200322103103.2CE9B83CEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b1ac288339479b7603b990a585050be96dd3f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, explicitly set -Dintrospection=true in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gssdp/gssdp.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 071ad00109..bab3cbe0f7 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -14,9 +14,15 @@ GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
 GSSDP_CONF_OPTS = \
 	-Dexamples=false \
-	-Dintrospection=false \
 	-Dvapi=false
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GSSDP_CONF_OPTS += -Dintrospection=true
+GSSDP_DEPENDENCIES += gobject-introspection
+else
+GSSDP_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 GSSDP_DEPENDENCIES += libgtk3
 GSSDP_CONF_OPTS += -Dsniffer=true
