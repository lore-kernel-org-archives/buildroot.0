From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 14:36:53 +0200
Subject: [Buildroot] [git commit] bluez5_utils: allow building the midi
	profile
Message-ID: <20170505123803.02A8C82890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfe6112780431aaa712373841ef03f0ae57b1a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The midi profile was introduced in BlueZ 5.44.

Cc: Marcin Bis <marcin@bis.org.pl>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in       | 7 +++++++
 package/bluez5_utils/bluez5_utils.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 181003b..bdb6682 100644
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
index 4317839..4a03234 100644
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
