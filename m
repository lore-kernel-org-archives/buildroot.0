From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:27:12 +0100
Subject: [Buildroot] [git commit] package/mediastreamer: add optional
	support for libupnp
Message-ID: <20160221202727.55F65817CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97e86eff5ae9fd4713a564e3168539068b856e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libupnp was compiled before, mediastreamer will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libmediastreamer_voip.so.3.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libmediastreamer_base.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libupnp.so.6]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/mediastreamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 79d8e75..047509e 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -20,6 +20,13 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+MEDIASTREAMER_CONF_OPTS += --enable-upnp
+MEDIASTREAMER_DEPENDENCIES += libupnp
+else
+MEDIASTREAMER_CONF_OPTS += --disable-upnp
+endif
+
 # portaudio backend needs speex as well
 ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX),yy)
 MEDIASTREAMER_CONF_OPTS += --enable-portaudio
