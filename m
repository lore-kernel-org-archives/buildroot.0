From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:45:03 +0200
Subject: [Buildroot] [RFC/PATCH v3 11/11] package/kodi-audioencoder-wav: New
	package
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-wav/Config.in            |    6 ++++++
 .../kodi-audioencoder-flac.mk                      |   20 ++++++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 27 insertions(+)
 create mode 100644 package/kodi-audioencoder-wav/Config.in
 create mode 100644 package/kodi-audioencoder-wav/kodi-audioencoder-flac.mk

diff --git a/package/kodi-audioencoder-wav/Config.in b/package/kodi-audioencoder-wav/Config.in
new file mode 100644
index 0000000..64e1f27
--- /dev/null
+++ b/package/kodi-audioencoder-wav/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_WAV
+	bool "kodi-audioencoder-wav"
+	help
+	  An audioencoder addon for XBMC
+
+	  https://github.com/xbmc/audioencoder.wav
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-flac.mk
new file mode 100644
index 0000000..2b27532
--- /dev/null
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-flac.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# kodi-audioencoder-wav
+#
+################################################################################
+
+KODI_AUDIOENCODER_WAV_VERSION = b28ab95a89f6b2d7332692d4cf3653731342620f
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
+KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
+
+# This really is a runtime dependency, but we need Kodi to be installed
+# first, since we'll install files in Kodi's directories _after_ Kodi has
+# installed its own files
+KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
+
+KODI_AUDIOENCODER_WAV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bfab51d..a690431 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -240,6 +240,7 @@ comment "Kodi audioencoder addons"
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
 source "package/kodi-audioencoder-vorbis/Config.in"
+source "package/kodi-audioencoder-wav/Config.in"
 
 comment "Kodi PVR addons"
 
-- 
1.7.10.4
