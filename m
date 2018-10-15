From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Oct 2018 11:46:42 -0500
Subject: [Buildroot] [PATCH 1/3] package/gst-dsp: remove package
Message-ID: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The suit of TI OMAP3 dsp tools/libraries are being removed as the
upstream projects are no longer active.

The gst-dsp package used the tidsp-binaries package.

Suggest using Buildroot 2018.02.6 LTS if the feature is still
required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

This patchset was started after an update was proposed to the TI DSP
related packages to fix upstream homepage URLS. It seems the upstream
stablized for this DSP feature set primarily for OMAP3 and then the
technology has not been moving forward with newer processors.
---
 Config.in.legacy                       |  6 ++++++
 package/gstreamer/Config.in            |  1 -
 package/gstreamer/gst-dsp/Config.in    |  8 --------
 package/gstreamer/gst-dsp/gst-dsp.hash |  2 --
 package/gstreamer/gst-dsp/gst-dsp.mk   | 20 --------------------
 5 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 package/gstreamer/gst-dsp/Config.in
 delete mode 100644 package/gstreamer/gst-dsp/gst-dsp.hash
 delete mode 100644 package/gstreamer/gst-dsp/gst-dsp.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c862532..acf578b 100644
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
index c6292f4..e922437 100644
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
index 102cf69..0000000
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
index 3bccfc1..0000000
--- a/package/gstreamer/gst-dsp/gst-dsp.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 45437a038979916de74e78a2cc7a0b01ba3982d0848e1e483a054c9cf0ce5883  gst-dsp-v0.10.2.tar.gz
diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
deleted file mode 100644
index dedffb9..0000000
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
-- 
1.9.1
