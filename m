From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:40 +0100
Subject: [Buildroot] [PATCH 2/7] package/gstreamer1/gst1-plugins-good: add
	optional support for libv4l
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066125-28379-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libv4l was compiled before, gst1-plugins-good will use it as
optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/gstreamer-1.0/libgstvideo4linux2.so | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libv4l2.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 92ce029..6bf17c0 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -35,6 +35,13 @@ GST1_PLUGINS_GOOD_CONF_OPTS += \
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --with-libv4l2
+GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --without-libv4l2
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-orc
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
-- 
2.7.0
