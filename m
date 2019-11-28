From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 29 Nov 2019 00:30:17 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-bad: remove
 rpi-userland extra include paths
Message-ID: <20191128233017.3437-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rpi-userland extra include paths where added with [2] including
a rpi-userland dependency for the dispmanx option.

The dispmanx option was moved to gst1-plugins-base with commit [3],
including the rpi-userland dependency, excluding the extra include
paths.

Tested gst1-plugins-base with dispmanx enabled compiles without
failures. It seems to be save to remove the extra includes from
gst1-plugins-bad.

Fixes (from meson-log.txt):

  Sanity check compile stderr:
  arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
  /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/IL:
  No such file or directory
  arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
  /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vcos/pthreads:
  No such file
  arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
  /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vmcs_host/linux:
  No such file

[1] https://bugs.busybox.net/show_bug.cgi?id=12366
[2] https://git.buildroot.net/buildroot/commit/?id=962ffda68cd9b0c4ab6055c97c14e762a5439571
[3] https://git.buildroot.net/buildroot/commit/?id=3f2aef56127fbe71378e6a2d55192a0835d962ab

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 856db88e49..b611b33eb3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -64,14 +64,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-# RPI has odd locations for several required headers.
-GST1_PLUGINS_BAD_CFLAGS=$(TARGET_CPPFLAGS) \
-	$(STAGING_DIR)/usr/include/IL \
-	$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
-- 
2.24.0
