From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Nov 2017 15:07:36 +0100
Subject: [Buildroot] [PATCH][NEXT v2] gst1-imx: add missing dependency for
 imxv4l2videosink plugin
Message-ID: <20171130140736.921-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The plugin source code uses V4L2_COLORSPACE_DEFAULT macro which was
defined in kernel 4.2, so make sure the toolchain headers match this
requirement.

Fixes:
http://autobuild.buildroot.net/results/48dd782161fa5e8860b5ea00a5d60207cb623108/
http://autobuild.buildroot.net/results/f970c782b5bfbcf66ff3ba200b060d3653ff2630/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changelog v2:
- Added missing comment in Config.in
---
 package/gstreamer1/gst1-imx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 9b977bdde8..e23b1933e9 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -87,7 +87,11 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
 	bool "imxv4l2videosink"
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
 	help
 	  Elements for V4L2 output
 
+comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 endif
-- 
2.15.0
