From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 21 Sep 2016 00:43:55 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160920210425.1ca82f17@free-electrons.com>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
Message-ID: <20160920224355.l76a3kggupuiugok@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, Sep 20, 2016 at 09:04:25PM +0200, Thomas Petazzoni wrote:
> Hello Gary,
> 
> On Fri, 16 Sep 2016 15:10:38 +0200, Gary Bisson wrote:
> > Also making each plugin dependencies clearer with comments.
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> >  package/gstreamer1/gst1-imx/Config.in   | 89 ++++++++++++++++++++++++++++-----
> >  package/gstreamer1/gst1-imx/gst1-imx.mk | 32 ++++++++++++
> >  2 files changed, 108 insertions(+), 13 deletions(-)
> 
> Thanks for the patch. I have a few questions/comments, see below.
> 
> 
> > +config BR2_PACKAGE_GST1_IMX_EGLVISINK
> > +	bool "imxeglvivsink"
> > +	depends on BR2_PACKAGE_IMX_GPU_VIV
> > +	help
> > +	  Elements leveraging the 3D GPU
> 
> Instead of doing "depends on" everywhere, can we use "select" in the
> cases where the dependencies of the package to select are not too
> crazy ?

Well in most cases it isn't possible, here are some details:
- BR2_PACKAGE_IMX_GPU_VIV and BR2_PACKAGE_IMX_GPU_VIV_G2D depends on
  BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q which isn't selectable.
- We can't select BR2_LINUX_KERNEL since it needs to be a i.MX kernel.
- BR2_PACKAGE_LIBIMXVPUAPI depends on the i.MX SoC being used which
  cannot be selectable (MX5 or MX6)

I guess I can select IMX_CODEC though, I'll add that to the V2.

> > +ifneq ($(BR2_PACKAGE_GST1_IMX_EGLVISINK),y)
> > +GST1_IMX_CONF_OPTS += --disable-eglvivsink
> > +endif
> 
> For all those options, please use the standard Buildroot way of
> expressing dependencies:
> 
> ifeq ($(BR2_PACKAGE_FOO),y)
> BAZ_CONF_OPTS += --enable-foo
> BAZ_DEPENDENCIES += foo
> else
> BAZ_CONF_OPTS += --disable-foo
> endif
> 
> i.e:
> 
>  1/ Add an explicit --enable-<foo> for each option

This was on purpose since the package only look for --disable-foo
options. All the plugins are enabled by default, see patch in package:
https://github.com/Freescale/gstreamer-imx/commit/989ab048

I can still do:
ifeq ($(BR2_PACKAGE_FOO),y)
else
BAZ_CONF_OPTS += --disable-foo
endif

But my opinion is that --enable-foo is misleading.

>  2/ Group the --enable/--disable passing with the addition of the
>     dependency

Ok.

Thanks for your feedback.

Regards,
Gary
