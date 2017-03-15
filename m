From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 16 Mar 2017 00:50:14 +0200
Subject: [Buildroot] [PATCH v1] package/bluez5_utils: Allow user to enable
	disabled plugins
Message-ID: <20170315225014.6427-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disregard to increase just minor version BlueZ 5.44 is drastically different in
a way what tools and plugins are enabled and installed by default.

Extend Buildroot package to cover these changes.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/bluez5_utils/Config.in       | 28 +++++++++++++++++++++++++++-
 package/bluez5_utils/bluez5_utils.mk | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a7c0ee4ba..e99f0f69f 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -48,6 +48,11 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 comment "bluez5-utils client needs a glibc or musl toolchain"
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
+config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
+	bool "build deprecated tools"
+	help
+	  Build BlueZ 5.x deprecated tools (hciattach, gatttool, ...).
+
 config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	bool "install GATT tool"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
@@ -62,7 +67,28 @@ config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	bool "build experimental plugins"
 	help
-	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+	  Build BlueZ 5.x experimental plugins (PCSuite, ...).
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
+	bool "build health plugin"
+	help
+	  Build BlueZ 5.x health plugin
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI
+	bool "build midi plugin"
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Build BlueZ 5.x midi plugin
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
 
 config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4d31a187b..4eae3d01d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -38,6 +38,35 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+# enable health plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-health
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-health
+endif
+
+# enable midi plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-midi
+BLUEZ5_UTILS_DEPENDENCIES += alsa-lib
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-midi
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
@@ -45,6 +74,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
 endif
 
+# build deprecated tools
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-deprecated
+endif
+
 # install gatttool (For some reason upstream choose not to do it by default)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
-- 
2.11.0
