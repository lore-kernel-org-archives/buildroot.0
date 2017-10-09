From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  9 Oct 2017 17:12:28 -0300
Subject: [Buildroot] [PATCH v2] configs/imx6-sabresd: Add VPU decoding
	support
Message-ID: <1507579948-22128-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Mainline kernel is able to decode video via the coda driver.

Add support for it and also add some explanation on how VPU decoding
can be tested with Gstreamer.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Add instructions in the readme file (Thomas)

 board/freescale/imx6-sabresd/linux_qt5.fragment |  1 +
 board/freescale/imx6-sabresd/readme.txt         | 21 +++++++++++++++++++++
 configs/imx6-sabresd_qt5_defconfig              | 20 ++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/board/freescale/imx6-sabresd/linux_qt5.fragment b/board/freescale/imx6-sabresd/linux_qt5.fragment
index ffa5f63..d4f26b1 100644
--- a/board/freescale/imx6-sabresd/linux_qt5.fragment
+++ b/board/freescale/imx6-sabresd/linux_qt5.fragment
@@ -2,3 +2,4 @@
 # ondemand governor with a mainline kernel.
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+CONFIG_VIDEO_CODA=m
diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index 2943f8b..f09ff5c 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -86,4 +86,25 @@ Running gl2mark benchmark:
 
 # glmark2-es2-drm
 
+Testing video playback on the i.MX6 Sabre SD board
+==================================================
+
+As the mx6sabresd has two display outputs (LVDS and HDMI), it is necessary to
+know what is the connector that corresponds to the HDMI output.
+
+This information can be found by running:
+
+# modetest
+
+And search for the HDMI connector number. In our case it shows up as 37.
+
+In the mx6sabresd prompt run the following Gstreamer pipeline:
+
+# gst-launch-1.0 filesrc location=/root/trailer_1080p_h264_mp3.avi ! avidemux ! \
+h264parse ! v4l2video1dec capture-io-mode=dmabuf ! kmssink connector-id=37    \
+name=imx-drm sync=0
+
+(The video used on this example was retrieved from:
+http://linode.boundarydevices.com/videos/trailer_1080p_h264_mp3.avi)
+
 Enjoy!
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 832e326..a056b87 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -75,3 +75,23 @@ BR2_PACKAGE_QT5BASE_GIF=y
 BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_PACKAGE_QT5CINEX=y
 BR2_PACKAGE_QT5CINEX_HD=y
+
+# NXP firmware package
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# libdrm tests
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+
+# gstreamer-1.0
+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE=y
+BR2_PACKAGE_GST1_PLUGINS_BAD=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
+
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.7.4
