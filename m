From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:10:28 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix build with orc
Message-ID: <20130512201212.070049A163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c0d1949c69f24518de63921b00130e9ae1082c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script gets orcc from pkg-config, which sets it to /usr/bin/orcc
instead of $(HOST_DIR)/usr/bin/orcc. So set the path explicitly instead of
relying on pkg-config.

While we're at it, also add an explicit enable/disable to configure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

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
