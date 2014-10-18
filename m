From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:45:02 +0200
Subject: [Buildroot] [RFC/PATCH v3 10/11] package/kodi-audioencoder-vorbis:
	New package
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-vorbis/Config.in         |    8 +++++++
 .../kodi-audioencoder-vorbis.mk                    |   24 ++++++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 33 insertions(+)
 create mode 100644 package/kodi-audioencoder-vorbis/Config.in
 create mode 100644 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk

diff --git a/package/kodi-audioencoder-vorbis/Config.in b/package/kodi-audioencoder-vorbis/Config.in
new file mode 100644
index 0000000..c3630a7
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS
+	bool "kodi-audioencoder-vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  An audioencoder addon for XBMC
+
+	  https://github.com/xbmc/audioencoder.vorbis
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
new file mode 100644
index 0000000..c65143f
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# kodi-audioencoder-vorbis
+#
+################################################################################
+
+KODI_AUDIOENCODER_VORBIS_VERSION = a73ef7e2b889d3d60d13175bc4ca44c36546d695
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
+KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
+
+KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = libogg libvorbis
+# This really is a runtime dependency, but we need Kodi to be installed
+# first, since we'll install files in Kodi's directories _after_ Kodi has
+# installed its own files
+KODI_AUDIOENCODER_VORBIS_DEPENDENCIES += kodi
+
+KODI_AUDIOENCODER_VORBIS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBIS_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBISENC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 54869e5..bfab51d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -239,6 +239,7 @@ comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
+source "package/kodi-audioencoder-vorbis/Config.in"
 
 comment "Kodi PVR addons"
 
-- 
1.7.10.4
