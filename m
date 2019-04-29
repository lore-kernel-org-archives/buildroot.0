From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 21:45:28 +0200
Subject: [Buildroot] [DRAFT v1 1/7] package/gstreamer1: convert to meson
 build
In-Reply-To: <20190429194534.25743-1-ps.report@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
Message-ID: <20190429194534.25743-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meson build provides no 'disable-valgrind' option but checks
for the availability of valgrind/valgrind.h, so add an optional
valgrind dependency instead.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 3378232c10..802b91de9c 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -12,24 +12,24 @@ GSTREAMER1_LICENSE_FILES = COPYING
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
+	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),enabled,disabled) \
+	-Dtracer_hooks=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),true,false) \
+	-Doption-parsing=$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),true,false) \
+	-Dgst_debug=$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),true,false) \
+	-Dregistry=$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),true,false) \
+	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled)

 GSTREAMER1_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-pkgconf \
 	libglib2 \
-	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
+	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
+	$(if $(BR2_PACKAGE_VALGRIND),valgrind)

-$(eval $(autotools-package))
+$(eval $(meson-package))
--
2.21.0
