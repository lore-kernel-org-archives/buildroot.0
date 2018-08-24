From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:23:45 +0200
Subject: [Buildroot] [git commit branch/next] gst1-plugins-good: add
 optional dependency on jack2
Message-ID: <20180824211745.2C0B48E6C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688bfafec31c4b10aae9b2edebb77d95ac0cc9cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Jack2 audio server is part of buildroot, but the jack gst plugins are
disabled completely in gst1-plugins-good, whether or not jack2 is
selected. This changes the logic so that if the build system
determines that the jack2 audio server is selected, then the jack
plugins are enabled. If the plugins are enabled, then jack2 is also
added as a dependency to gst1-plugins-good.

Signed-off-by: Brad Love <brad@nextdimension.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index c1ed039bc7..21a7668c65 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -25,13 +25,19 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-	--disable-jack \
 	--disable-libdv \
 	--disable-dv1394 \
 	--disable-shout2
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-jack
+GST1_PLUGINS_GOOD_DEPENDENCIES += jack2
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-jack
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --with-libv4l2
 GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
