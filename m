From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:15 +0100
Subject: [Buildroot] [PATCH 11/14] package/pulseaudio: add optional support
	for libsoxr
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libsoxr was compiled before, pulseaudio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/pulseaudio | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpulsecore-8.0.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpulse.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libspeexdsp.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libsoxr.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pulseaudio/pulseaudio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index cd8d0f9..36661cc 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -72,6 +72,13 @@ else
 PULSEAUDIO_CONF_OPTS += --disable-gtk3
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+PULSEAUDIO_CONF_OPTS += --with-soxr
+PULSEAUDIO_DEPENDENCIES += libsoxr
+else
+PULSEAUDIO_CONF_OPTS += --without-soxr
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
-- 
2.7.0
