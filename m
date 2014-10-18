From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:45:00 +0200
Subject: [Buildroot] [RFC/PATCH v3 08/11] kodi-audioencoder-flac: New package
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/Config.in           |    8 +++++++
 .../kodi-audioencoder-flac.mk                      |   23 ++++++++++++++++++++
 package/kodi/Config.in                             |    6 ++++-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/kodi-audioencoder-flac/Config.in
 create mode 100644 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk

diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi-audioencoder-flac/Config.in
new file mode 100644
index 0000000..a6cf2d8
--- /dev/null
+++ b/package/kodi-audioencoder-flac/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_FLAC
+	bool "kodi-audioencoder-flac"
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	help
+	  An audioencoder addon for XBMC
+
+	  https://github.com/xbmc/audioencoder.flac
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
new file mode 100644
index 0000000..92cbe3b
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# kodi-audioencoder-flac
+#
+################################################################################
+
+KODI_AUDIOENCODER_FLAC_VERSION = 84bdf32418df4611aac8b2f48ca205153ded239f
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
+
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac libogg
+# This really is a runtime dependency, but we need Kodi to be installed
+# first, since we'll install files in Kodi's directories _after_ Kodi has
+# installed its own files
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES += kodi
+
+KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc \
+	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2dcd8b3..a2dc0d4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -235,7 +235,11 @@ config BR2_PACKAGE_KODI_WAVPACK
 	  Enable WAV input support.
 	  Select this if you want to play back WV files.
 
-comment "Kodi addons"
+comment "Kodi audioencoder addons"
+
+source "package/kodi-audioencoder-flac/Config.in"
+
+comment "Kodi PVR addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
 source "package/xbmc-pvr-addons/Config.in"
-- 
1.7.10.4
