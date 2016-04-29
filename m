From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 29 Apr 2016 10:12:12 +0200
Subject: [Buildroot] [PATCH 1/3] gnuradio: add gr-audio support
Message-ID: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-audio is a gnuradio module to use audio card as sink or source.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/gnuradio/Config.in   |  6 ++++++
 package/gnuradio/gnuradio.mk | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 603532c..3cbc9b2 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -32,6 +32,12 @@ config BR2_PACKAGE_GNURADIO
 
 if BR2_PACKAGE_GNURADIO
 
+config BR2_PACKAGE_GNURADIO_AUDIO
+	bool "gr-audio"
+	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO
+	help
+	  Add audio source/sink to GNU Radio
+
 config BR2_PACKAGE_GNURADIO_BLOCKS
 	bool "blocks support"
 	help
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 46d1f4f..8f771fc 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -52,6 +52,18 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_AUDIO),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+GNURADIO_DEPENDENCIES += alsa-lib
+endif
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GNURADIO_DEPENDENCIES += portaudio
+endif
+GNURADIO_CONF_OPTS += -DENABLE_GR_AUDIO=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_AUDIO=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
 else
-- 
2.7.3
