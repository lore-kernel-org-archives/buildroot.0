From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 10:24:55 -0700
Subject: [Buildroot] [PATCH 2/5] package/gssdp: add optional dependency for
 gobject-introspection
In-Reply-To: <20200315172459.881615-1-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
Message-ID: <20200315172459.881615-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set -Dintrospection=true in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.24.1
