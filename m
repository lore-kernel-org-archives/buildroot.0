From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:55 +0100
Subject: [Buildroot] [PATCH 06/10] package/mediastreamer: add optional
	support for libvpx
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libvpx was compiled before, mediastreamer will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libmediastreamer_voip.so.3.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libmediastreamer_base.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libvpx.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mediastreamer/mediastreamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index cf25196..81f5b50 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -27,6 +27,13 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+MEDIASTREAMER_CONF_OPTS += --enable-vp8
+MEDIASTREAMER_DEPENDENCIES += libvpx
+else
+MEDIASTREAMER_CONF_OPTS += --disable-vp8
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 MEDIASTREAMER_CONF_OPTS += --enable-opus
 MEDIASTREAMER_DEPENDENCIES += opus
-- 
2.7.0
