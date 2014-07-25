From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 24 Jul 2014 23:42:16 -0700
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix includes for recent
	toolchains
Message-ID: <1406270536-17145-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build was failing starting with CodeSourcery 2013.11 due to
new v4l kernel headers.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Yann, all,
I know this patch will look bad as we already discussed the use of -I instead of -idirafter.
However it has been reported and verified that this package doesn't build using recent toolchain such as CodeSourcery 2013.11.
It seems to come from the fact that the kernel headers in the toolchain have been updated which brings some incompatibility.
Using -idirafter, the v4l header picked up is from the toolchain which is missing some older structures like v4l2_dbg_chip_ident.
The CPPFLAGS setup is now exactly the same as what is done in Yocto.
Let me know your thoughts.
Thanks,
Gary
---
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 1ae6596..b441233 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -24,7 +24,8 @@ GST_FSL_PLUGINS_CONF_ENV = \
 
 # needs access to imx-specific kernel headers
 GST_FSL_PLUGINS_DEPENDENCIES += linux
-GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"
+GST_FSL_PLUGINS_CONF_ENV += \
+	CPPFLAGS="-I$(LINUX_DIR)/include/uapi -I$(LINUX_DIR)/include"
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
-- 
2.0.1
