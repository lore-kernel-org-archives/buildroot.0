From: Dave Skok <blanco.ether@gmail.com>
Date: Thu, 15 Aug 2013 10:12:19 -0400
Subject: [Buildroot] [PATCH 2/3] ola: new package
In-Reply-To: <a3673089a21b539b377ec10ae2660890d2c9a5f6.1376575789.git.blanco.ether@gmail.com>
References: <a3673089a21b539b377ec10ae2660890d2c9a5f6.1376575789.git.blanco.ether@gmail.com>
Message-ID: <54858166a46ac6fec0fd301ff48d4cbbcb6b1f4e.1376575789.git.blanco.ether@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ola/Config.in | 37 +++++++++++++++++++++----------------
 package/ola/ola.mk    | 50 ++++++++++++++++++++++++++++----------------------
 2 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 066fdd4..7a43bcf 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_OLA_EXAMPLES
 
 config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
-	depends on BR2_PACKAGE_OLA_BINDING_PYTHON
+	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	help
 	  Build OLA RDM tests.
 
@@ -60,24 +60,29 @@ endmenu
 
 menu "OLA Plugin selections"
 
+config BR2_PACKAGE_OLA_PLUGIN_E131
+	bool "acn E131"
+	default y
+	help
+	  Build ACN E131 plugin for OLA.
+
 config BR2_PACKAGE_OLA_PLUGIN_ARTNET
 	bool "artnet"
 	default y
 	help
 	  Build Artnet plugin for OLA.
 
+config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
+	bool "DMX4Linux"
+	help
+	  Build DMX4Linux plugin for OLA.
+
 config BR2_PACKAGE_OLA_PLUGIN_DUMMY
 	bool "dummy"
 	default y
 	help
 	  Build Dummy plugin for OLA.
 
-config BR2_PACKAGE_OLA_PLUGIN_E131
-	bool "acn E131"
-	default y
-	help
-	  Build ACN E131 plugin for OLA.
-
 config BR2_PACKAGE_OLA_PLUGIN_ESPNET
 	bool "espnet"
 	help
@@ -88,10 +93,10 @@ config BR2_PACKAGE_OLA_PLUGIN_KINET
 	help
 	  Build KiNet plugin for OLA.
 
-config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
-	bool "DMX4Linux"
+config BR2_PACKAGE_OLA_PLUGIN_MILINT
+	bool "milford Instruments"
 	help
-	  Build DMX4Linux plugin for OLA.
+	  Build Milford Instruments 1-463 plugin for OLA.
 
 config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
 	bool "pathport"
@@ -113,6 +118,12 @@ config BR2_PACKAGE_OLA_PLUGIN_KARATE
 	help
 	  Build Karate plugin for OLA.
 
+config BR2_PACKAGE_OLA_PLUGIN_OSC
+	bool "osc"
+	select BR2_PACKAGE_LIBLO
+	help
+	  Build Open sound control plugin for OLA.
+
 config BR2_PACKAGE_OLA_PLUGIN_SPI
 	bool "spi"
 	help
@@ -133,12 +144,6 @@ config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	help
 	  Build UsbPro plugin for OLA.
 
-config BR2_PACKAGE_OLA_PLUGIN_OSC
-	bool "osc"
-	select BR2_PACKAGE_LIBLO
-	help
-	  Build Open sound control plugin for OLA.
-
 endmenu
 
 endif
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 0a22401..5e3f506 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -65,22 +65,28 @@ endif
 
 ## OLA Plugin selections
 
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
+OLA_CONF_OPT += --enable-e131
+else
+OLA_CONF_OPT += --disable-e131
+endif
+
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
 OLA_CONF_OPT += --enable-artnet
 else
 OLA_CONF_OPT += --disable-artnet
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
-OLA_CONF_OPT += --enable-dummy
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
+OLA_CONF_OPT += --enable-opendmx
 else
-OLA_CONF_OPT += --disable-dummy
+OLA_CONF_OPT += --disable-opendmx
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
-OLA_CONF_OPT += --enable-e131
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
+OLA_CONF_OPT += --enable-dummy
 else
-OLA_CONF_OPT += --disable-e131
+OLA_CONF_OPT += --disable-dummy
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
@@ -89,16 +95,29 @@ else
 OLA_CONF_OPT += --disable-espnet
 endif
 
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
+OLA_CONF_OPT += --enable-karate
+else
+OLA_CONF_OPT += --disable-karate
+endif
+
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
 OLA_CONF_OPT += --enable-kinet
 else
 OLA_CONF_OPT += --disable-kinet
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
-OLA_CONF_OPT += --enable-opendmx
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
+OLA_CONF_OPT += --enable-osc
+OLA_DEPENDENCIES += liblo
 else
-OLA_CONF_OPT += --disable-opendmx
+OLA_CONF_OPT += --disable-osc
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
+OLA_CONF_OPT += --enable-milinst
+else
+OLA_CONF_OPT += --disable-milinst
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
@@ -119,12 +138,6 @@ else
 OLA_CONF_OPT += --disable-shownet
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
-OLA_CONF_OPT += --enable-karate
-else
-OLA_CONF_OPT += --disable-karate
-endif
-
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SPI),y)
 OLA_CONF_OPT += --enable-spi
 else
@@ -143,11 +156,4 @@ else
 OLA_CONF_OPT += --disable-usbpro
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
-OLA_CONF_OPT += --enable-osc
-OLA_DEPENDENCIES += liblo
-else
-OLA_CONF_OPT += --disable-osc
-endif
-
 $(eval $(autotools-package))
-- 
1.8.3.4
