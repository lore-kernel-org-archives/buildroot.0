From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 15:59:43 +0300
Subject: [Buildroot] [PATCH 3/4] bluez5_utils: allow enabling formerly
	experimental plugins
In-Reply-To: <cover.1493643541.git.baruch@tkos.co.il>
References: <cover.1493643541.git.baruch@tkos.co.il>
Message-ID: <1dc2f9ce76c1cb1c4be2e05509b816445a31fec4.1493643541.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Disregard to increase just minor version BlueZ 5.44 is drastically different in
a way what plugins that used to be enabled by the --enable-experimental
configure option, now have their own option.

Extend Buildroot package to cover these plugins.

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bluez5_utils/Config.in       | 15 +++++++++++++++
 package/bluez5_utils/bluez5_utils.mk | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index f8e3540ec5e9..181003b42c9b 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -61,6 +61,21 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	help
 	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
 
+config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
+	bool "build health plugin"
+	help
+	  Build BlueZ 5.x health plugin
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_NFC
+	bool "build nfc plugin"
+	help
+	  Build BlueZ 5.x nfc plugin
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_SAP
+	bool "build sap plugin"
+	help
+	  Build BlueZ 5.x sap plugin
+
 config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index fac79580024f..431783997d7f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -38,6 +38,27 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+# enable health plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-health
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-health
+endif
+
+# enable nfc plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_NFC),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-nfc
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-nfc
+endif
+
+# enable sap plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SAP),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-sap
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-sap
+endif
+
 # enable sixaxis plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
-- 
2.11.0
