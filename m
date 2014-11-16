From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:27 +0100
Subject: [Buildroot] [RFC/PATCH v6 14/17] package/kodi-audioencoder-flac:
	New package
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/Config.in              |    9 +++++++++
 .../kodi-audioencoder-flac/kodi-audioencoder-flac.mk  |   17 +++++++++++++++++
 package/kodi/Config.in                                |   10 +++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 package/kodi-audioencoder-flac/Config.in
 create mode 100644 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk

diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi-audioencoder-flac/Config.in
new file mode 100644
index 0000000..ec8cb96
--- /dev/null
+++ b/package/kodi-audioencoder-flac/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_FLAC
+	bool "kodi-audioencoder-flac"
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.flac
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
new file mode 100644
index 0000000..90651a0
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audioencoder-flac
+#
+################################################################################
+
+KODI_AUDIOENCODER_FLAC_VERSION = ef5d3098e37a0fa9bbc48c4f51408cca0ba6222b
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg
+KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
+	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c153fed..6cddbf5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -240,7 +240,15 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 	help
 	  Enable support for optical drives
 
-comment "Kodi addons"
+if BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi audioencoder addons"
+
+source "package/kodi-audioencoder-flac/Config.in"
+
+endif # BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi PVR addons"
 
 source "package/kodi-addon-xvdr/Config.in"
 source "package/kodi-pvr-addons/Config.in"
-- 
1.7.10.4
