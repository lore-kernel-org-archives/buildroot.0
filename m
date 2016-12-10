From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 14:50:57 +0100
Subject: [Buildroot] [git commit] mimic: new package
Message-ID: <20161210135233.A9D94818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=486219ff2352658a7720600c753e831e06d71e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
[Thomas:
 - Rewrap Config.in help text
 - Use "depends on" rather than "select" for the audio backend options
 - Slightly simplify some of the prompts for the audio backend selection
 - Remove MIMIC_INSTALL_STAGING = NO, that's the default
 - Use += when assigning MIMIC_DEPENDENCIES
 - Remove double quotes when setting --with-audio=.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/mimic/Config.in  | 37 +++++++++++++++++++++++++++++++++++++
 package/mimic/mimic.hash |  2 ++
 package/mimic/mimic.mk   | 29 +++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c14575c..26fa01b 100644
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
index 0000000..6cd4c20
--- /dev/null
+++ b/package/mimic/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_MIMIC
+	bool "mimic"
+        help
+          Mimic is a fast, lightweight Text-to-speech engine developed
+          by Mycroft A.I. and VocaliD, based on Carnegie Mellon
+          University's Flite (Festival-Lite) software. Mimic takes in
+          text and reads it out loud to create a high quality voice.
+
+          https://github.com/MycroftAI/mimic
+
+if BR2_PACKAGE_MIMIC
+
+choice
+	prompt "audio backend"
+	default BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
+	bool "none"
+	help
+	  With no backend, mimic will only be able to produce .wav
+	  files.
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA
+	bool "alsa"
+	depends on BR2_PACKAGE_ALSA_LIB
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO
+	bool "alsa via portaudio"
+	depends on BR2_PACKAGE_PORTAUDIO
+
+config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_PACKAGE_PULSEAUDIO
+
+endchoice
+
+endif # BR2_PACKAGE_MIMIC
diff --git a/package/mimic/mimic.hash b/package/mimic/mimic.hash
new file mode 100644
index 0000000..39d0165
--- /dev/null
+++ b/package/mimic/mimic.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
new file mode 100644
index 0000000..66fe9a9
--- /dev/null
+++ b/package/mimic/mimic.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# mimic
+#
+################################################################################
+
+MIMIC_VERSION = 1.1.0
+MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
+MIMIC_LICENSE = MIT
+MIMIC_LICENSE_FILES = LICENSE
+
+MIMIC_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
+MIMIC_AUDIO_BACKEND = alsa
+MIMIC_DEPENDENCIES += alsa-lib
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
+MIMIC_AUDIO_BACKEND = portaudio
+MIMIC_DEPENDENCIES += portaudio
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
+MIMIC_AUDIO_BACKEND = pulseaudio
+MIMIC_DEPENDENCIES += pulseaudio
+else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE),y)
+MIMIC_AUDIO_BACKEND = none
+endif
+
+MIMIC_CONF_OPTS += --with-audio=$(MIMIC_AUDIO_BACKEND)
+
+$(eval $(autotools-package))
