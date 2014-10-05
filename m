From: Gary Bisson <bisson.gary@gmail.com>
Date: Sun,  5 Oct 2014 14:47:08 -0700
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
Message-ID: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Open-source GStreamer 1.0 plugins for i.MX platforms.
More info at https://github.com/Freescale/gstreamer-imx

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---

This patch has been tested using an i.MX6Q SabreLite (nitrogen6x config) along
with the usual Tears of Steel movie in 1080p:
http://media.xiph.org/mango/tears_of_steel_1080p.webm

Below are the commands used to test the different sinks:

$ gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
$ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
matroskademux ! imxvpudec ! imxipusink
$ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
matroskademux ! imxvpudec ! imxeglvivsink

The toolchain used was the Sourcery CodeBench 2014.05. The video above also
requires the following extra configuration in order to demux the content:
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA=y 

I'm not fond of all the dependencies of this  package but I couldn't seem to
find a way to do it differently. A try has been made to select the Vivante
package automatically but it requires doing a select of
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q which doesn't work. Let me know
if you'd like another mechanism to be able to select this plugin.

Thanks,
Gary

 package/gstreamer1/Config.in                       |  1 +
 package/gstreamer1/gst1-plugins-imx/Config.in      | 35 +++++++++++++
 .../gst1-plugins-imx/gst1-plugins-imx.mk           | 57 ++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-imx/Config.in
 create mode 100644 package/gstreamer1/gst1-plugins-imx/gst1-plugins-imx.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index fe0ad48..d43e4a6 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -6,6 +6,7 @@ source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-plugins-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-plugins-imx/Config.in b/package/gstreamer1/gst1-plugins-imx/Config.in
new file mode 100644
index 0000000..7c8a467
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-imx/Config.in
@@ -0,0 +1,35 @@
+comment "gst1-plugins-imx needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+comment "gst1-plugins-imx needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "gst1-plugins-imx requires Freescale VPU wrapper libraries"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_LIBFSLVPUWRAP
+
+comment "gst1-plugins-imx requires Freescale GPU libraries for i.MX6"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_LIBFSLVPUWRAP
+	depends on !BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+
+config BR2_PACKAGE_GST1_PLUGINS_IMX
+	bool "gst1-plugins-imx"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+	depends on BR2_PACKAGE_LIBFSLVPUWRAP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
+	  i.MX platform, with emphasis on video en/decoding using the i.MX
+	  VPU engine.
+
+	  Currently, this software has been tested only with the i.MX6 SoC
+	  family.
+
+	  The software as a whole is currently in beta stage.
+
+	  More info at https://github.com/Freescale/gstreamer-imx
diff --git a/package/gstreamer1/gst1-plugins-imx/gst1-plugins-imx.mk b/package/gstreamer1/gst1-plugins-imx/gst1-plugins-imx.mk
new file mode 100644
index 0000000..64a1b5b
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-imx/gst1-plugins-imx.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# gst1-plugins-imx
+#
+################################################################################
+
+GST1_PLUGINS_IMX_VERSION = 0.9.9
+GST1_PLUGINS_IMX_SITE = https://github.com/Freescale/gstreamer-imx.git
+GST1_PLUGINS_IMX_SITE_METHOD = git
+
+GST1_PLUGINS_IMX_LICENSE = LGPLv2+
+GST1_PLUGINS_IMX_LICENSE_FILES = LICENSE
+
+GST1_PLUGINS_IMX_INSTALL_STAGING = YES
+
+GST1_PLUGINS_IMX_DEPENDENCIES += host-pkgconf host-python \
+	gpu-viv-bin-mx6q gstreamer1 gst1-plugins-base libfslvpuwrap
+
+# needs access to imx-specific kernel headers
+GST1_PLUGINS_IMX_DEPENDENCIES += linux
+GST1_PLUGINS_IMX_CONF_OPTS += --prefix="/usr" \
+	--kernel-headers="$(LINUX_DIR)/include"
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GST1_PLUGINS_IMX_DEPENDENCIES += xlib_libX11
+GST1_PLUGINS_IMX_CONF_OPTS += --egl-platform=x11
+else
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+GST1_PLUGINS_IMX_DEPENDENCIES += wayland
+GST1_PLUGINS_IMX_CONF_OPTS += --egl-platform=wayland
+else
+GST1_PLUGINS_IMX_CONF_OPTS += --egl-platform=fb
+endif
+endif
+
+define GST1_PLUGINS_IMX_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS)	\
+		$(HOST_DIR)/usr/bin/python2 ./waf configure \
+		$(GST1_PLUGINS_IMX_CONF_OPTS) \
+	)
+endef
+
+define GST1_PLUGINS_IMX_BUILD_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS) \
+	)
+endef
+
+define GST1_PLUGINS_IMX_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+		install \
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
