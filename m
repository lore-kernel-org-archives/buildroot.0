From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:16 +0100
Subject: [Buildroot] [PATCH 12/14] package/pulseaudio: add optional support
	for udev
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When udev was compiled before, pulseaudio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/pulse-8.0/modules/module-alsa-sink.so | grep NEEDED
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libudev.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pulseaudio/pulseaudio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 36661cc..fbac516 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -79,6 +79,13 @@ else
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
-- 
2.7.0
