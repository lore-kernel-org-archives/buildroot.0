From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:30:51 +0200
Subject: [Buildroot] [git commit] gst-fsl-plugins: fix build for kernel
	headers >= 3.10
Message-ID: <20140727083059.5D4CE9D05C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daf3708be46d7eb7e9352ee987f37e32eb00c6bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package couldn't build using a toolchain with kernel headers >=
3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
videodev2.h, this ioctl should never be used.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch |   69 ++++++++++++++++++++
 1 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
new file mode 100644
index 0000000..5635275
--- /dev/null
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
@@ -0,0 +1,69 @@
+From ce90794a3458af0aed43b8570cf44cd87900185d Mon Sep 17 00:00:00 2001
+From: Gary Bisson <bisson.gary@gmail.com>
+Date: Fri, 25 Jul 2014 16:44:53 -0700
+Subject: [PATCH] Remove use of obsolete VIDIOC_DBG_G_CHIP_IDENT
+
+This ioctl should never be used in application as
+stated in videodev2.h header.
+Moreover, its use in this plugin was very limited.
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+---
+ src/misc/tvsrc/src/mfw_gst_tvsrc.c       | 8 --------
+ src/misc/v4l_source/src/mfw_gst_v4lsrc.c | 7 -------
+ 2 files changed, 15 deletions(-)
+
+diff --git a/src/misc/tvsrc/src/mfw_gst_tvsrc.c b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
+index 67e0cd2..f495b6f 100755
+--- a/src/misc/tvsrc/src/mfw_gst_tvsrc.c
++++ b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
+@@ -450,7 +450,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
+   struct v4l2_format fmt;
+   struct v4l2_control ctrl;
+   struct v4l2_streamparm parm;
+-  struct v4l2_dbg_chip_ident chip;
+   gint fd_v4l = 0;
+   struct v4l2_mxc_offset off;
+   gint in_width = 0, in_height = 0;
+@@ -461,13 +460,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
+     return 0;
+   }
+ 
+-  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
+-    g_print ("VIDIOC_DBG_G_CHIP_IDENT failed.\n");
+-  } else
+-    g_print ("sensor chip is %s\n", chip.match.name);
+-
+-
+-
+   if (ioctl (fd_v4l, VIDIOC_G_STD, &id) < 0) {
+     g_print ("VIDIOC_G_STD failed\n");
+     close (fd_v4l);
+diff --git a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
+index 2c2e838..85e7ff0 100755
+--- a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
++++ b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
+@@ -464,7 +464,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
+   struct v4l2_format fmt = {0};
+   struct v4l2_control ctrl = {0};
+   struct v4l2_streamparm parm = {0};
+-  struct v4l2_dbg_chip_ident chip = {0};
+   struct v4l2_frmsizeenum fszenum = {0};
+   gint input;
+   gint fd_v4l = 0;
+@@ -476,12 +475,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
+     return 0;
+   }
+ 
+-  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
+-    GST_ERROR ("VIDIOC_DBG_G_CHIP_IDENT failed.");
+-  } else
+-    GST_INFO ("sensor chip is %s", chip.match.name);
+-
+-
+   if (v4l_src->crop_pixel) {
+     in_width = v4l_src->capture_width - (2 * v4l_src->crop_pixel);
+     in_height = v4l_src->capture_height - (2 * v4l_src->crop_pixel);
+-- 
+2.0.1
+
