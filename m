From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:35 +0200
Subject: [Buildroot] [RFC/PATCH v4 11/12] package/kodi-audioencoder-vorbis:
	New package
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-vorbis/Config.in           |    9 +++++++++
 .../kodi-audioencoder-vorbis.mk                      |   18 ++++++++++++++++++
 package/kodi/Config.in                               |    1 +
 3 files changed, 28 insertions(+)
 create mode 100644 package/kodi-audioencoder-vorbis/Config.in
 create mode 100644 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk

diff --git a/package/kodi-audioencoder-vorbis/Config.in b/package/kodi-audioencoder-vorbis/Config.in
new file mode 100644
index 0000000..7a78e35
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS
+	bool "kodi-audioencoder-vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for XBMC
+
+	  https://github.com/xbmc/audioencoder.vorbis
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
new file mode 100644
index 0000000..160d909
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -0,0 +1,18 @@
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
+KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis
+KODI_AUDIOENCODER_VORBIS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBIS_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DVORBISENC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 11b88a5..3111f4e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -246,6 +246,7 @@ comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
+source "package/kodi-audioencoder-vorbis/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
-- 
1.7.10.4
