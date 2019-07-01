From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:09:59 -0400
Subject: [Buildroot] [PATCH 1/6] package/gstreamer1/gstreamer1: Convert
 package type to meson
In-Reply-To: <20190701221004.99862-1-aduskett@gmail.com>
References: <20190701221004.99862-1-aduskett@gmail.com>
Message-ID: <20190701221004.99862-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Gstreamer 1.16.0 is the last version to support autotools, and will be removed
in the next version.

Other changes:
  - Valgrind is no longer an option, and is checked via headers. So this option
    is removed and instead changed to a package check and a dependency.

  - Add the following new meson-specific options:
  - -DDgtk_doc=disabled
  - -Dglib-asserts=disabled
  - -Dglib-checks=disabled

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 32 ++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 3378232c10..ff4074861e 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -12,18 +12,20 @@ GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GSTREAMER1_CONF_OPTS = \
-	--disable-examples \
-	--disable-tests \
-	--disable-failing-tests \
-	--disable-valgrind \
-	--disable-benchmarks \
-	--disable-introspection \
-	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
-	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
-	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
-	$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
-	$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
-	$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools)
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dbenchmarks=disabled \
+	-Dgtk_doc=disabled \
+	-Dintrospection=disabled \
+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled \
+	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),enabled,disabled) \
+	-Dtracer_hooks=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),true,false) \
+	-Doption-parsing=$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),true,false) \
+	-Dgst_debug=$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),true,false) \
+	-Dregistry=$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),true,false) \
+	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled)
 
 GSTREAMER1_DEPENDENCIES = \
 	host-bison \
@@ -32,4 +34,8 @@ GSTREAMER1_DEPENDENCIES = \
 	libglib2 \
 	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+GSTREAMER1_DEPENDENCIES += valgrind
+endif
+
+$(eval $(meson-package))
-- 
2.21.0
