From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jul 2016 00:32:51 +0200
Subject: [Buildroot] [PATCH 3/4] package/pulseaudio: add WebRTC optional
	dependency
In-Reply-To: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
References: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1467585172-10299-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebRTC is an optional pulseaudio dependency which require C++11
support in the toolchain. Also the autotool script provide
--enable/--disable option for this support, so use them in
pulseaudio.mk.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index bc95d91..9ef11bc 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -34,7 +34,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
-	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 ifeq ($(BR2_PACKAGE_GDBM),y)
@@ -88,6 +87,13 @@ else
 PULSEAUDIO_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
+PULSEAUDIO_CONF_OPTS += --enable-webrtc-aec
+PULSEAUDIO_DEPENDENCIES += webrtc-audio-processing
+else
+PULSEAUDIO_CONF_OPTS += --disable-webrtc-aec
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
-- 
2.5.5
