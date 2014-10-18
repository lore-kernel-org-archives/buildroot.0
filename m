From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:45:01 +0200
Subject: [Buildroot] [RFC/PATCH v3 09/11] package/kodi-audioencoder-lame:
	New package
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-lame/Config.in           |    7 +++++++
 .../kodi-audioencoder-lame.mk                      |   22 ++++++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 30 insertions(+)
 create mode 100644 package/kodi-audioencoder-lame/Config.in
 create mode 100644 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk

diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi-audioencoder-lame/Config.in
new file mode 100644
index 0000000..be00296
--- /dev/null
+++ b/package/kodi-audioencoder-lame/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_LAME
+	bool "kodi-audioencoder-lame"
+	select BR2_PACKAGE_LAME
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.lame
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
new file mode 100644
index 0000000..0ffa718
--- /dev/null
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# kodi-audioencoder-lame
+#
+################################################################################
+
+KODI_AUDIOENCODER_LAME_VERSION = 90fb99b8f3c876b5f3d8ecd4ea29aa1ef2dabc89
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
+KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
+
+KODI_AUDIOENCODER_LAME_DEPENDENCIES = lame
+# This really is a runtime dependency, but we need Kodi to be installed
+# first, since we'll install files in Kodi's directories _after_ Kodi has
+# installed its own files
+KODI_AUDIOENCODER_LAME_DEPENDENCIES += kodi
+
+KODI_AUDIOENCODER_LAME_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc \
+	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a2dc0d4..54869e5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,6 +238,7 @@ config BR2_PACKAGE_KODI_WAVPACK
 comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
+source "package/kodi-audioencoder-lame/Config.in"
 
 comment "Kodi PVR addons"
 
-- 
1.7.10.4
