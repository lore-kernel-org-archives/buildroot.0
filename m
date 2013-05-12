From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 22:05:22 +0200
Subject: [Buildroot] [PATCH] pulseaudio: fix build with orc
Message-ID: <1368389122-23651-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The configure script gets orcc from pkg-config, which sets it to /usr/bin/orcc
instead of $(HOST_DIR)/usr/bin/orcc. So set the path explicitly instead of
relying on pkg-config.

While we're at it, also add an explicit enable/disable to configure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Ideally, this should be fixed in orc-0.4.pc, but I'm not sure what would
be the best way.
---
 package/multimedia/pulseaudio/pulseaudio.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index aa67592..b39d99e 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -28,7 +28,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UDEV),udev) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
-	$(if $(BR2_PACKAGE_ORC),orc) \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
@@ -38,6 +37,14 @@ PULSEAUDIO_DEPENDENCIES = \
 PULSEAUDIO_AUTORECONF = YES
 PULSEAUDIO_DEPENDENCIES += libglib2
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+PULSEAUDIO_DEPENDENCIES += orc
+PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
+PULSEAUDIO_CONF_OPT += --enable-orc
+else
+PULSEAUDIO_CONF_OPT += --disable-orc
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
-- 
1.8.2.1
