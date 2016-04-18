From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Apr 2016 13:05:19 +0300
Subject: [Buildroot] [PATCH] gst1-imx: make kernel dependency optional
Message-ID: <97bf649b600a5548cfd3c53575747a057f24e07e.1460973919.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i.MX specific kernel headers are not a hard dependency. Quoting README.md:

  Without [--kernel-headers], the [ipu.h] header is not found, and elements
  using the IPU will not be built.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gstreamer1/gst1-imx/Config.in   | 10 +++-------
 package/gstreamer1/gst1-imx/gst1-imx.mk |  9 ++++++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 0084483d1ec6..df0fcf3072d3 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -1,19 +1,15 @@
-comment "gst1-imx needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
-
 config BR2_PACKAGE_GST1_IMX
 	bool "gst1-imx"
-	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
 	  i.MX platforms, which make use of the i.MX multimedia capabilities.
 
-	  This software supports only the i.MX6 SoC family and requires a
-	  kernel that includes the i.MX6 specific headers to be built.
+	  This software supports only the i.MX6 SoC family.
 
-	  The IPU and PXP plugins are always built.
+	  The IPU and PXP plugins are built when an imx-specific kernel is
+	  enabled.
 	  The V4L2 plugin is built when BR2_PACKAGE_GST1_PLUGINS_BAD is enabled.
 	  The VPU plugin is built when BR2_PACKAGE_LIBIMXVPUAPI is enabled.
 	  The EGL plugin is built when BR2_PACKAGE_IMX_GPU_VIV is enabled.
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 650e097592a0..86922eddb657 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -18,10 +18,13 @@ GST1_IMX_DEPENDENCIES += \
 	gstreamer1 \
 	gst1-plugins-base
 
-# needs access to imx-specific kernel headers
+GST1_IMX_CONF_OPTS = --prefix="/usr"
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+# IPU and PXP need access to imx-specific kernel headers
 GST1_IMX_DEPENDENCIES += linux
-GST1_IMX_CONF_OPTS += --prefix="/usr" \
-	--kernel-headers="$(LINUX_DIR)/include"
+GST1_IMX_CONF_OPTS += --kernel-headers="$(LINUX_DIR)/include"
+endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
-- 
2.8.0.rc3
