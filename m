From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:53 +0100
Subject: [Buildroot] [PATCH 04/10] package/mediastreamer: add optional
	support for libupnp
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libupnp was compiled before, mediastreamer will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libmediastreamer_voip.so.3.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libmediastreamer_base.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libupnp.so.6]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.7.0
