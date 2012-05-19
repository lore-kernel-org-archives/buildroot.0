From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 01:57:09 +0200
Subject: [Buildroot] [git commit] package: add webrtc-audio-processing
	library
Message-ID: <20120531113258.EBF4D96E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bde151e5c147bf84ed98f54512d50c81e1f1587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional dependency to pulseaudio >= 2.0

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/webrtc-audio-processing/Config.in          |   11 +++++++++++
 .../webrtc-audio-processing.mk                     |   10 ++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 359ba47..360f04f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -288,6 +288,7 @@ source "package/portaudio/Config.in"
 source "package/speex/Config.in"
 source "package/taglib/Config.in"
 source "package/tremor/Config.in"
+source "package/webrtc-audio-processing/Config.in"
 endmenu
 
 menu "Compression and decompression"
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
new file mode 100644
index 0000000..e33fc57
--- /dev/null
+++ b/package/webrtc-audio-processing/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
+	bool "webrtc-audio-processing"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  AudioProcessing library based on Google's implementation of
+	  WebRTC.
+
+	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
+
+comment "webrtc-audio-processing requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
new file mode 100644
index 0000000..22ade1a
--- /dev/null
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -0,0 +1,10 @@
+WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
+WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
+WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
+WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+WEBRTC_AUDIO_PROCESSING_CONF_OPT += --with-ns-mode=fixed
+endif
+
+$(eval $(call AUTOTARGETS))
