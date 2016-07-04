From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:15:33 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: explicitly
	enable/disable WebRTC support
Message-ID: <20160704151611.0AC34816A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aa2e81fa68aa5a0dfd8ed78a4d47f49496e3363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, pulseaudio optionally depends on webrtc if it is enabled.

However, it is never explcitly enabled or disabled, although
pulseaudio's ./configure has --enable/disable-webrtc-aec.

Forcibly enable/disable webrtc support using those options.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
