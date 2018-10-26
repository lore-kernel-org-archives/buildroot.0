From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 13:56:55 +0200
Subject: [Buildroot] [git commit] package/gst-dsp: remove package
Message-ID: <20181026115738.D6CD289000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=915429073771efb2d9b1213b4c0871cd9f254fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The suit of TI OMAP3 dsp tools/libraries are being removed as the
upstream projects are no longer active.

The gst-dsp package used the tidsp-binaries package.

Suggest using Buildroot 2018.02.x LTS if the feature is still
required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                       |  6 ++++++
 package/gstreamer/Config.in            |  1 -
 package/gstreamer/gst-dsp/Config.in    |  8 --------
 package/gstreamer/gst-dsp/gst-dsp.hash |  2 --
 package/gstreamer/gst-dsp/gst-dsp.mk   | 20 --------------------
 5 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c862532af2..acf578bae5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_GST_DSP
+	bool "gst-dsp package removed"
+	select BR2_LEGACY
+	help
+	  The gst-dsp package was removed.
+
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils package removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
index c6292f4a7e..e922437f22 100644
--- a/package/gstreamer/Config.in
+++ b/package/gstreamer/Config.in
@@ -7,7 +7,6 @@ source "package/gstreamer/gst-plugins-good/Config.in"
 source "package/gstreamer/gst-plugins-bad/Config.in"
 source "package/gstreamer/gst-plugins-ugly/Config.in"
 source "package/gstreamer/gst-ffmpeg/Config.in"
-source "package/gstreamer/gst-dsp/Config.in"
 source "package/gstreamer/gst-fsl-plugins/Config.in"
 source "package/gstreamer/gst-omapfb/Config.in"
 source "package/gstreamer/gst-plugin-x170/Config.in"
diff --git a/package/gstreamer/gst-dsp/Config.in b/package/gstreamer/gst-dsp/Config.in
deleted file mode 100644
index 102cf69b45..0000000000
--- a/package/gstreamer/gst-dsp/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_GST_DSP
-	bool "gst-dsp"
-	depends on BR2_cortex_a8
-	select BR2_PACKAGE_TIDSP_BINARIES
-	help
-	  GStreamer plug-in to access TI OMAP3 DSP algorithms.
-
-	  http://code.google.com/p/gst-dsp/
diff --git a/package/gstreamer/gst-dsp/gst-dsp.hash b/package/gstreamer/gst-dsp/gst-dsp.hash
deleted file mode 100644
index 3bccfc1c3a..0000000000
--- a/package/gstreamer/gst-dsp/gst-dsp.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 45437a038979916de74e78a2cc7a0b01ba3982d0848e1e483a054c9cf0ce5883  gst-dsp-v0.10.2.tar.gz
diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
deleted file mode 100644
index dedffb9822..0000000000
--- a/package/gstreamer/gst-dsp/gst-dsp.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# gst-dsp
-#
-################################################################################
-
-GST_DSP_VERSION = v0.10.2
-GST_DSP_SITE = $(call github,felipec,gst-dsp,$(GST_DSP_VERSION))
-
-define GST_DSP_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-endef
-
-define GST_DSP_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkgconf
-
-$(eval $(generic-package))
