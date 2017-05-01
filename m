From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 15:59:44 +0300
Subject: [Buildroot] [PATCH 4/4] bluez5_utils: allow building the midi
	profile
In-Reply-To: <cover.1493643541.git.baruch@tkos.co.il>
References: <cover.1493643541.git.baruch@tkos.co.il>
Message-ID: <0addf96b96517bdab32c6171b5bd0db02e912861.1493643541.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The midi profile was introduced in BlueZ 5.44.

Cc: Marcin Bis <marcin@bis.org.pl>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bluez5_utils/Config.in       | 7 +++++++
 package/bluez5_utils/bluez5_utils.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 181003b42c9b..bdb6682c1645 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -66,6 +66,13 @@ config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
 	help
 	  Build BlueZ 5.x health plugin
 
+config BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI
+	bool "build midi profile"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+	help
+	  Build BlueZ 5.x midi plugin
+
 config BR2_PACKAGE_BLUEZ5_PLUGINS_NFC
 	bool "build nfc plugin"
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 431783997d7f..4a0323488113 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -45,6 +45,14 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-health
 endif
 
+# enable midi profile
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-midi
+BLUEZ5_UTILS_DEPENDENCIES += alsa-lib
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-midi
+endif
+
 # enable nfc plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_NFC),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-nfc
-- 
2.11.0
