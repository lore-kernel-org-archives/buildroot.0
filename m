From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:46:04 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: be explicit about udev
	usage
Message-ID: <20160221114650.109E08042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2160eb681c3e62b74483a17daede8ae4a71e9e91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: udev was already handled as an optional dependency, Bernd's
patch only made it explicit by using
--enable-libudev/--disable-libudev.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 36661cc..06b0b84 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -29,7 +29,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
-	$(if $(BR2_PACKAGE_HAS_UDEV),udev) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
@@ -79,6 +78,13 @@ else
 PULSEAUDIO_CONF_OPTS += --without-soxr
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PULSEAUDIO_CONF_OPTS += --enable-libudev
+PULSEAUDIO_DEPENDENCIES += udev
+else
+PULSEAUDIO_CONF_OPTS += --disable-libudev
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
