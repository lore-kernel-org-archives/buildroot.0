From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] gst1-imx: bump to version 0.12.1
Message-ID: <20160615204849.D3FFC82033@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c20e0685ef9a87ffef798f87b83f57fbe1d20fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
* compositor: Rename ImxCompositor(Pad) to ImxVideoCompositor(Pad)
  This prevents conflicts if both the NXP plugins and the gstreamer-imx
  are installed in the same rootfs

* Add switches to wscript configuration to enable/disable plugins
  Until now, all plugins were built (unless their dependencies were
  missing). On some i.MX machines, some features are missing. For
  example, the i.MX7 has no VPU. To ensure deterministic builds, it is
  useful to selectively disable plugins in the build.

* ipu+pxp: : Fix deadlocks and incorrect logging in case of init error
  This was causing a freeze if for example one tries to use PxP elements
  on an i.MX6 Dual/Quad

* imxv4l2videosrc fixes and enhancements:
  * fixes to interlacing support (incl. workarounds for analog TV input)
  * remove format restriction in get_caps function
    this removes the limitation on I420 formats
  * simplified determination of fps (necessary due to driver limitations)

* eglvivsink: wayland: Do not commit before buffers are swapped
  This fixes eglSwapBuffer swaps with damaged frames

* Documentation additions
  Adds GPU memory leak notess to the FAQ

* vpu: encoder: Expose motion estimation range as property

* vpu: decoder: Drop output frame if its buffer cannot be allocated

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/cec4c47

Tested with the following commands on i.MX6Q (IPU):
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxeglvivsink

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.hash | 2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index 03e1729..ca47776 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 df34f080e24ac8f1619780aa5ad4e6ab1333f822cd2bf5fcb380b28c97248810  gst1-imx-0.12.0.tar.gz
+sha256 d8a7357bc575e22d0d19d6d7cf547bd69cad5fc47adb93f09ead41b0124353fa  gst1-imx-0.12.1.tar.gz
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 86922ed..8afd204 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.12.0
+GST1_IMX_VERSION = 0.12.1
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPLv2+
