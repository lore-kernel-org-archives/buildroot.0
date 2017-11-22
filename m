From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:30:15 +0100
Subject: [Buildroot] [git commit] gst1-imx: fix v4l2 plugins disable options
Message-ID: <20171201205331.DABB47FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=599b3af68aac15969b0909d99bf0ba23ba305ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest bump to v0.13.0 didn't take care of the following upstream
commit:

  7bfbf71 v4l2: Rename to v4l2video and add switches to enable/disable sink/source

To address that, this commit:

 - Uses the new name of the v4l2 source configure script option

 - Introduce a new Config.in option to control the build of the v4l2
   sink support

Fixes:

  http://autobuild.buildroot.net/results/5c404a2a28a4052056e5c9a7edda40641fe55f9e

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/Config.in   |  6 ++++++
 package/gstreamer1/gst1-imx/gst1-imx.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 9f792d1..9b977bd 100644
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
index c621c36..a8fe6fe 100644
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
