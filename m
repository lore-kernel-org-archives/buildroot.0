From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 21 Nov 2017 16:27:06 +0100
Subject: [Buildroot] [PATCH][next] gst1-imx: fix v4l2 plugins disable options
Message-ID: <20171121152706.17883-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest bump to v0.13.0 didn't take care of the following commit:
7bfbf71 v4l2: Rename to v4l2video and add switches to enable/disable
 sink/source

Updating options to match the new naming of the V4L2 plugins.

Fixes http://autobuild.buildroot.net/results/5c404a2a28a4052056e5c9a7edda40641fe55f9e

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

Also, there are new options for the g2d pango plugin that should be
taken care of. I unfortunaly do not have time to do it right now,
Alexandre can you have a look?

Note that this won't break the build, it is just that the user can't
control the build of g2dpango plugin.

Thanks,
Gary
---
 package/gstreamer1/gst1-imx/Config.in   |  6 ++++++
 package/gstreamer1/gst1-imx/gst1-imx.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 9f792d1c82..9b977bdde8 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -84,4 +84,10 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 	help
 	  Elements for V4L2 capture
 
+config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
+	bool "imxv4l2videosink"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  Elements for V4L2 output
+
 endif
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index c621c360f4..a8fe6fe041 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -83,10 +83,17 @@ GST1_IMX_CONF_OPTS += --disable-vpu
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC),y)
-# There's no --enable-v4l2src option
+# There's no --enable-imxv4l2videosrc option
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
 else
-GST1_IMX_CONF_OPTS += --disable-v4l2src
+GST1_IMX_CONF_OPTS += --disable-imxv4l2videosrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK),y)
+# There's no --enable-imxv4l2videosink option
+GST1_IMX_DEPENDENCIES += gst1-plugins-bad
+else
+GST1_IMX_CONF_OPTS += --disable-imxv4l2videosink
 endif
 
 $(eval $(waf-package))
-- 
2.15.0
