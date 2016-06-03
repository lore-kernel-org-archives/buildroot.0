From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 15:04:12 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: Add support for V4L2
	probed devices
Message-ID: <20160603130427.A3E8E81EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88437f6feb15b4db53ba10215141477052361e79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The V4L2 module of gst-plugins-good provides an extra option to allow
probing for extra devices at plugin load time. This will enable features
such as video conversion using the V4L2 M2M api

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 8 ++++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index a59033a..95318d9 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -279,6 +279,14 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 comment "v4l2 needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE
+	bool "v4l2-probe (m2m)"
+	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
+	help
+	  Enables the V4L2 probe at plugin load time. This enables
+	  support for v4l2 transform devices, such as m2m
+	  devices. These plugins are registered as v4l2videoNconvert
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_CAIRO
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 14bd4e8..969caa9 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -323,6 +323,12 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-gst_v4l2
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-v4l2-probe
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-v4l2-probe
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
 GST1_PLUGINS_GOOD_CONF_OPTS += \
