From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:44:14 +0100
Subject: [Buildroot] [git commit] gst1-imx: add missing dependency for
 imxv4l2videosink plugin
Message-ID: <20171201225030.B493582629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=120e9ce4e550e9efaab24705081d2167ac1a075b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin source code uses V4L2_COLORSPACE_DEFAULT macro which was
defined in kernel 4.2, so make sure the toolchain headers match this
requirement.

Fixes:
http://autobuild.buildroot.net/results/48dd782161fa5e8860b5ea00a5d60207cb623108/
http://autobuild.buildroot.net/results/f970c782b5bfbcf66ff3ba200b060d3653ff2630/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 9b977bd..e23b193 100644
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
