From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 22:48:02 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: Add option for building
	x264 plugin
Message-ID: <20160118214846.A8B3E80196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4ff495c8ee4db6847273ef18bd0d7e3088b56be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As x264 is packaged, we can also build the gstreamer plugin using it.
This commit adds the option in menuconfig and make sure it is built if
selected.

[Peter: split fix, add GPL tag, update help text and commit description]
Signed-off-by: Vincent Dehors <vincent.dehors@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in            |  6 ++++++
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index f33e258..fbcb128 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -67,6 +67,12 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	help
 	  LibMpeg2 decoder
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264
+	bool "x264"
+	select BR2_PACKAGE_X264
+	help
+	  x264 encoder
+
 # Note: to get descriptions use the following.
 # # find . -name 'plugin-*.xml' | xargs grep -m 1 description
 endif
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 0831539..64e7e92 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -19,8 +19,7 @@ GST1_PLUGINS_UGLY_CONF_OPTS += \
 	--disable-amrwb \
 	--disable-cdio \
 	--disable-sidplay \
-	--disable-twolame \
-	--disable-x264
+	--disable-twolame
 
 GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
@@ -90,6 +89,14 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264),y)
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-x264
+GST1_PLUGINS_UGLY_DEPENDENCIES += x264
+GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-x264
+endif
+
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_UGLY_LICENSE += GPLv2
