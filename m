From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 30 Mar 2015 12:12:23 +0200
Subject: [Buildroot] [PATCH v4] gst1-imx: add package
Message-ID: <1427710343-23255-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

Open-source GStreamer 1.0 plugins for i.MX6 platforms.
More info at https://github.com/Freescale/gstreamer-imx

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Modifications v3->v4:
- Bump version to 0.10.1

Modifications v2->v3:
- Change package name from gst1-plugins-imx to gst1-imx
- Remove commands unnecessary parentheses
- Modify package comment to clarify it is only working on i.MX6

Modifications v1->v2:
- Use of github helper macro
- Modify package comment with Peter S. original patch
- Add comment for eglibc dependency (due to GPU libs)
- Remove comments on package dependencies

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

Thanks,
Gary
---
 package/gstreamer1/Config.in            |  1 +
 package/gstreamer1/gst1-imx/Config.in   | 25 ++++++++++++++++
 package/gstreamer1/gst1-imx/gst1-imx.mk | 52 +++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 package/gstreamer1/gst1-imx/Config.in
 create mode 100644 package/gstreamer1/gst1-imx/gst1-imx.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 5f08faf..ea35ecc 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -6,6 +6,7 @@ source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
new file mode 100644
index 0000000..6bdbb6c
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -0,0 +1,25 @@
+comment "gst1-imx needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+# Required by gpu-viv-bin-mx6q
+comment "gst1-imx needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_GST1_IMX
+	bool "gst1-imx"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
+	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+	depends on BR2_PACKAGE_LIBFSLVPUWRAP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
+	  i.MX6 platforms, with emphasis on video en/decoding using the VPU
+	  engine.
+
+	  This software supports only the i.MX6 SoC family and requires a
+	  kernel that includes the i.MX6 specific headers to be built.
+
+	  The software as a whole is currently in beta stage.
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
new file mode 100644
index 0000000..516babf
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# gst1-imx
+#
+################################################################################
+
+GST1_IMX_VERSION = 0.10.1
+GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
+
+GST1_IMX_LICENSE = LGPLv2+
+GST1_IMX_LICENSE_FILES = LICENSE
+
+GST1_IMX_INSTALL_STAGING = YES
+
+GST1_IMX_DEPENDENCIES += host-pkgconf host-python \
+	gpu-viv-bin-mx6q gstreamer1 gst1-plugins-base libfslvpuwrap
+
+# needs access to imx-specific kernel headers
+GST1_IMX_DEPENDENCIES += linux
+GST1_IMX_CONF_OPTS += --prefix="/usr" \
+	--kernel-headers="$(LINUX_DIR)/include"
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GST1_IMX_DEPENDENCIES += xlib_libX11
+GST1_IMX_CONF_OPTS += --egl-platform=x11
+else
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+GST1_IMX_DEPENDENCIES += wayland
+GST1_IMX_CONF_OPTS += --egl-platform=wayland
+else
+GST1_IMX_CONF_OPTS += --egl-platform=fb
+endif
+endif
+
+define GST1_IMX_CONFIGURE_CMDS
+	cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
+endef
+
+define GST1_IMX_BUILD_CMDS
+	cd $(@D); \
+		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
+endef
+
+define GST1_IMX_INSTALL_TARGET_CMDS
+	cd $(@D); \
+		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
