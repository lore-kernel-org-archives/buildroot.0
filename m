From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jul 2014 11:58:57 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix build for kernel
	headers >= 3.10
In-Reply-To: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
References: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140726095857.GA3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-07-25 22:34 -0700, Gary Bisson spake thusly:
> This package couldn't build using a toolchain with kernel headers >=
> 3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
> videodev2.h, this ioctl should never be used.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below...

> diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
> new file mode 100644
> index 0000000..5635275
> --- /dev/null
> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
> @@ -0,0 +1,69 @@
> +From ce90794a3458af0aed43b8570cf44cd87900185d Mon Sep 17 00:00:00 2001
> +From: Gary Bisson <bisson.gary@gmail.com>
> +Date: Fri, 25 Jul 2014 16:44:53 -0700
> +Subject: [PATCH] Remove use of obsolete VIDIOC_DBG_G_CHIP_IDENT
> +
> +This ioctl should never be used in application as
> +stated in videodev2.h header.
> +Moreover, its use in this plugin was very limited.

Do not forget to send this to upstream gst-fsl-plugins. ;-)

Regards,
Yann E. MORIN.

> +Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> +---
> + src/misc/tvsrc/src/mfw_gst_tvsrc.c       | 8 --------
> + src/misc/v4l_source/src/mfw_gst_v4lsrc.c | 7 -------
> + 2 files changed, 15 deletions(-)
> +
> +diff --git a/src/misc/tvsrc/src/mfw_gst_tvsrc.c b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
> +index 67e0cd2..f495b6f 100755
> +--- a/src/misc/tvsrc/src/mfw_gst_tvsrc.c
> ++++ b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
> +@@ -450,7 +450,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
> +   struct v4l2_format fmt;
> +   struct v4l2_control ctrl;
> +   struct v4l2_streamparm parm;
> +-  struct v4l2_dbg_chip_ident chip;
> +   gint fd_v4l = 0;
> +   struct v4l2_mxc_offset off;
> +   gint in_width = 0, in_height = 0;
> +@@ -461,13 +460,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
> +     return 0;
> +   }
> + 
> +-  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
> +-    g_print ("VIDIOC_DBG_G_CHIP_IDENT failed.\n");
> +-  } else
> +-    g_print ("sensor chip is %s\n", chip.match.name);
> +-
> +-
> +-
> +   if (ioctl (fd_v4l, VIDIOC_G_STD, &id) < 0) {
> +     g_print ("VIDIOC_G_STD failed\n");
> +     close (fd_v4l);
> +diff --git a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
> +index 2c2e838..85e7ff0 100755
> +--- a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
> ++++ b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
> +@@ -464,7 +464,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
> +   struct v4l2_format fmt = {0};
> +   struct v4l2_control ctrl = {0};
> +   struct v4l2_streamparm parm = {0};
> +-  struct v4l2_dbg_chip_ident chip = {0};
> +   struct v4l2_frmsizeenum fszenum = {0};
> +   gint input;
> +   gint fd_v4l = 0;
> +@@ -476,12 +475,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
> +     return 0;
> +   }
> + 
> +-  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
> +-    GST_ERROR ("VIDIOC_DBG_G_CHIP_IDENT failed.");
> +-  } else
> +-    GST_INFO ("sensor chip is %s", chip.match.name);
> +-
> +-
> +   if (v4l_src->crop_pixel) {
> +     in_width = v4l_src->capture_width - (2 * v4l_src->crop_pixel);
> +     in_height = v4l_src->capture_height - (2 * v4l_src->crop_pixel);
> +-- 
> +2.0.1
> +
> -- 
> 2.0.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
