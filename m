From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:43:36 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: add optional support
	for libsoxr
Message-ID: <20160221114649.C48EC8042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2658f92566625f86e2fdcfc2fb1508d28d6390bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libsoxr was compiled before, pulseaudio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/pulseaudio | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpulsecore-8.0.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpulse.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libspeexdsp.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libsoxr.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
