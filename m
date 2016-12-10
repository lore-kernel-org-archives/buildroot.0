From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 10 Dec 2016 09:21:54 -0300
Subject: [Buildroot] [PATCH] mimic: new package
Message-ID: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/Config.in        |  1 +
 package/mimic/Config.in  | 39 +++++++++++++++++++++++++++++++++++++++
 package/mimic/mimic.hash |  2 ++
 package/mimic/mimic.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/mimic/Config.in
 create mode 100644 package/mimic/mimic.hash
 create mode 100644 package/mimic/mimic.mk

diff --git a/package/Config.in b/package/Config.in
index c14575c4c44e..26fa01b00794 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,6 +22,7 @@ menu "Audio and video applications"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
 	source "package/madplay/Config.in"
+	source "package/mimic/Config.in"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
diff --git a/package/mimic/Config.in b/package/mimic/Config.in
new file mode 100644
index 000000000000..b4322a986401
--- /dev/null
+++ b/package/mimic/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_MIMIC
+	bool "mimic"
+        help
+          Mimic is a fast, lightweight Text-to-speech engine developed by
+          Mycroft A.I. and VocaliD, based on Carnegie Mellon University's
+          Flite (Festival-Lite) software. Mimic takes in text and reads it
+          out loud to create a high quality voice.
+
+          https://github.com/MycroftAI/mimic
+
+if BR2_PACKAGE_MIMIC
+
+choice
+	prompt "choose audio backend"
+	default BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
+	bool "No sound backend, only produce wav files"
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA
+	bool "alsa"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO
+	bool "alsa via portaudio"
+	select BR2_PACKAGE_PORTAUDIO
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_USE_MMU # pulseaudio
+	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
+	select BR2_PACKAGE_PULSEAUDIO
+
+endchoice
+
+endif # BR2_PACKAGE_MIMIC
diff --git a/package/mimic/mimic.hash b/package/mimic/mimic.hash
new file mode 100644
index 000000000000..39d016548a41
--- /dev/null
+++ b/package/mimic/mimic.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
new file mode 100644
index 000000000000..c5cc115af2ff
--- /dev/null
+++ b/package/mimic/mimic.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# mimic
+#
+################################################################################
+
+MIMIC_VERSION = 1.1.0
+MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
+MIMIC_INSTALL_STAGING = NO
+MIMIC_LICENSE = MIT
+MIMIC_LICENSE_FILES = LICENSE
+
+MIMIC_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
+MIMIC_AUDIO_BACKEND = alsa
+MIMIC_DEPENDENCIES = alsa-lib
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
+MIMIC_AUDIO_BACKEND = portaudio
+MIMIC_DEPENDENCIES = portaudio
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
+MIMIC_AUDIO_BACKEND = pulseaudio
+MIMIC_DEPENDENCIES = pulseaudio
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE),y)
+MIMIC_AUDIO_BACKEND = none
+endif
+
+MIMIC_CONF_OPTS += --with-audio="$(MIMIC_AUDIO_BACKEND)"
+
+$(eval $(autotools-package))
-- 
2.10.2
