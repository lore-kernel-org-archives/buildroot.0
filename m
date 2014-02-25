From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Feb 2014 22:24:48 +0100
Subject: [Buildroot] [PATCH v2] gstreamer1-imx: new package
Message-ID: <1393363488-5547-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add gstreamer1-imx package (gstreamer-1.x equivalent to
gstreamer-0.10/gst-fsl-plugins package).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - rename package from gstreamer-imx to gstreamer1-imx (as suggested
    by Peter Korsgaard)
  - add check in comment to clear gstreamer-1.x/gstreamer1-imx vs.
    gst-fsl-plugins/gstreamer-0.10 (as suggested by Yann E. MORIN)
  - fix copy/paste errors in Config.in (s/gst-fsl-plugins/gstreamer1-imx/)
    and gstreamer1-imx.mk (s/GST_FSL_PLUGINS_DEPENDENCIES/GSTREAMER1_IMX_DEPENDENCIES/
    and remove 	superfluously GSTREAMER_IMX_WITHOUT_X11 usage
---
 package/gstreamer1/Config.in                       |  1 +
 package/gstreamer1/gstreamer1-imx/Config.in        | 21 +++++++++++++
 ...headers-include-path-to-src-v4l2src-compi.patch | 31 +++++++++++++++++++
 .../gstreamer1/gstreamer1-imx/gstreamer1-imx.mk    | 36 ++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/gstreamer1/gstreamer1-imx/Config.in
 create mode 100644 package/gstreamer1/gstreamer1-imx/gstreamer1-imx-0001-Add-kernel-headers-include-path-to-src-v4l2src-compi.patch
 create mode 100644 package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index fe0ad48..7c2fe99 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -8,4 +8,5 @@ source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+source "package/gstreamer1/gstreamer1-imx/Config.in"
 endif
diff --git a/package/gstreamer1/gstreamer1-imx/Config.in b/package/gstreamer1/gstreamer1-imx/Config.in
new file mode 100644
index 0000000..5753202
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-imx/Config.in
@@ -0,0 +1,21 @@
+comment "gstreamer1-imx needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_GSTREAMER1_IMX
+	bool "gstreamer1-imx"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_IMX_LIB
+	select BR2_PACKAGE_LIBFSLPARSER
+	select BR2_PACKAGE_LIBFSLCODEC
+	help
+	  GStreamer-1.x plugins for hardware-accelerated audio and video
+	  parsers and codecs on i.MX6 platform. It requires a kernel that
+	  includes the i.MX6 specific headers to be built.
+
+	  To use the VPU, its firmware blob must be installed as well. This
+	  can be found in the firmware-imx package in the "Hardware handling"
+	  menu.
+
+	  https://github.com/Freescale/gstreamer-imx
diff --git a/package/gstreamer1/gstreamer1-imx/gstreamer1-imx-0001-Add-kernel-headers-include-path-to-src-v4l2src-compi.patch b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx-0001-Add-kernel-headers-include-path-to-src-v4l2src-compi.patch
new file mode 100644
index 0000000..48e2c16
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx-0001-Add-kernel-headers-include-path-to-src-v4l2src-compi.patch
@@ -0,0 +1,31 @@
+From 107767b506de69692436205c04a002e5de0f7bee Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 22 Feb 2014 23:22:26 +0100
+Subject: [PATCH] Add kernel headers include path to src/v4l2src compile.
+
+Fixes buildroot compile with newer sysroot kernel headers
+(> 3.10 because of VIDIOC_DBG_G_CHIP_IDENT ioctl removale).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/v4l2src/wscript | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/v4l2src/wscript b/src/v4l2src/wscript
+index 0b8fbb1..3013ba7 100644
+--- a/src/v4l2src/wscript
++++ b/src/v4l2src/wscript
+@@ -2,7 +2,9 @@
+ 
+ 
+ def configure(conf):
+-	pass
++	import os
++	if conf.options.kernel_headers:
++		conf.env.append_value('INCLUDES', [os.path.abspath(os.path.expanduser(conf.options.kernel_headers))])
+ 
+ 
+ def build(bld):
+-- 
+1.8.1.4
+
diff --git a/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk
new file mode 100644
index 0000000..91dab48
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# gstreamer1-imx
+#
+################################################################################
+
+GSTREAMER1_IMX_VERSION = 0.9.3
+GSTREAMER1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GSTREAMER1_IMX_VERSION))
+
+GSTREAMER1_IMX_LICENSE = LGPLv2+
+GSTREAMER1_IMX_LICENSE_FILES = LICENSE
+
+GSTREAMER1_IMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libfslvpuwrap \
+	imx-lib libfslparser libfslcodec
+
+# needs access to imx-specific kernel headers
+GSTREAMER1_IMX_DEPENDENCIES += linux
+
+define GSTREAMER1_IMX_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./waf configure \
+		--prefix=/usr \
+		--kernel-headers=$(LINUX_DIR)/include \
+	)
+endef
+
+define GSTREAMER1_IMX_BUILD_CMDS
+       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
+endef
+
+define GSTREAMER1_IMX_INSTALL_TARGET_CMDS
+       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.4
