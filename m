From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 16:05:44 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
	optional support for libv4l
Message-ID: <20160221172737.1EE5B817CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d04534d5aabfec8c5195c9e28c8530323ce7fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libv4l was compiled before, gst1-plugins-good will use it as
optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/gstreamer-1.0/libgstvideo4linux2.so | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libv4l2.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
