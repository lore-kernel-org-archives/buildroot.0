From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jan 2018 11:41:46 +0100
Subject: [Buildroot] [PATCH 06/16] xdriver_xf86-video-imx-viv: bump to
 version 6.2.2.p0
In-Reply-To: <CAAMH-ysZ8A=d8dWUApLk0BtQs5iHB1hX46BJJ-KcZEeO5LOZjw@mail.gmail.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-7-gary.bisson@boundarydevices.com>
 <20180103215058.6ec3d6b6@windsurf.lan>
 <CAAMH-ysZ8A=d8dWUApLk0BtQs5iHB1hX46BJJ-KcZEeO5LOZjw@mail.gmail.com>
Message-ID: <20180104114146.3983f8e0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Jan 2018 11:32:47 +0100, Gary Bisson wrote:

> >> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> >> index c3746a100f..5a0257305c 100644
> >> --- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> >> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> >> @@ -1,6 +1,7 @@
> >>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
> >>       bool "xf86-video-imx-viv"
> >>       depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> >> +     depends on BR2_PACKAGE_IMX_GPU_G2D  
> >
> > Perhaps a "select BR2_PACKAGE_IMX_GPU_G2D" would be better.  
> 
> Well, this part of the i.MX packages is messy, you can't select much
> without having recursive dependency.
> 
> Here if I try your suggestion I get:
> package/x11r7/xdriver_xf86-video-imx-viv/Config.in:1:error: recursive
> dependency detected!
> package/x11r7/xdriver_xf86-video-imx-viv/Config.in:1: symbol
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV depends on
> BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> package/freescale-imx/imx-gpu-viv/Config.in:34: symbol
> BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is part of choice <choice>
> package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice>
> contains symbol <choice>
> package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice>
> contains symbol BR2_PACKAGE_IMX_GPU_VIV
> package/freescale-imx/imx-gpu-viv/Config.in:5: symbol
> BR2_PACKAGE_IMX_GPU_VIV is selected by BR2_PACKAGE_IMX_GPU_G2D
> package/freescale-imx/imx-gpu-g2d/Config.in:5: symbol
> BR2_PACKAGE_IMX_GPU_G2D is selected by
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
> 
> So using depends is the easy path, let me know if you'd like more
> investigation on that.
> 
> Also, since G2D will be provided by a different package for the i.MX8,
> my plan is to later have a virtual/g2d and depend on it.
> 
> Then depending on the platform it will either be imx-gpu-g2d or imx-dpu-g2d.

OK. Let's stick with a "depends on" for now then. I'm not sure the
switch to a virtual package will require a "depends on". Normally you
can indeed only "depends on" a virtual package. But for this specific
case, we can have a virtual package that automatically selects the
right implementation depending on the selected platform, so this
virtual-package could be selected (like we can select jpeg or zlib or
openssl).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
