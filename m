From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 14:36:29 +0200
Subject: [Buildroot] [git commit] bluez5_utils: allow enabling formerly
	experimental plugins
Message-ID: <20170505123802.E889D828EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9af3ba604cb21ea735f243fe7196d2c560e10ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disregard to increase just minor version BlueZ 5.44 is drastically different in
a way what plugins that used to be enabled by the --enable-experimental
configure option, now have their own option.

Extend Buildroot package to cover these plugins.

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in       | 15 +++++++++++++++
 package/bluez5_utils/bluez5_utils.mk | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index f8e3540..181003b 100644
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
index fac7958..4317839 100644
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
