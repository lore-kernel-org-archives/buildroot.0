From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:14 +0200
Subject: [Buildroot] [PATCH/RFC 21/27] package/kodi-audiodecoder-vgmstream:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-vgmstream/Config.in         |    7 +++++++
 .../kodi-audiodecoder-vgmstream.mk                    |   17 +++++++++++++++++
 package/kodi/Config.in                                |   13 +++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/kodi-audiodecoder-vgmstream/Config.in
 create mode 100644 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk

diff --git a/package/kodi-audiodecoder-vgmstream/Config.in b/package/kodi-audiodecoder-vgmstream/Config.in
new file mode 100644
index 0000000..ebf83df
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM
+	bool "kodi-audiodecoder-vgmstream"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VGM decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.vgmstream
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
new file mode 100644
index 0000000..acef3b0
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-vgmstream
+#
+################################################################################
+
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 0c3a51a229de22f667e33208791052e8c00962d2
+KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
+KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
+KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
+
+KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_VGMSTREAM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 62fae07..63771bf 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -285,4 +285,17 @@ source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
 
+config BR2_PACKAGE_KODI_AUDIO_DECODERS
+	bool "kodi-audio-decoders"
+	help
+	  A collection of additional audio decoders
+
+if BR2_PACKAGE_KODI_AUDIO_DECODERS
+
+comment "Kodi audio decoders"
+
+source "package/kodi-audiodecoder-vgmstream/Config.in"
+
+endif # BR2_PACKAGE_KODI_AUDIO_DECODERS
+
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
