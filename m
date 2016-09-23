From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 23 Sep 2016 14:58:35 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <1af982ba-faf7-9cd7-73ae-c32e45286f34@mind.be>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
 <1af982ba-faf7-9cd7-73ae-c32e45286f34@mind.be>
Message-ID: <20160923125835.mr63ylhk25qb3gt2@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On Thu, Sep 22, 2016 at 11:51:00PM +0200, Arnout Vandecappelle wrote:
> <snip>
> >> > Instead of doing "depends on" everywhere, can we use "select" in
> >> > the
> >> > cases where the dependencies of the package to select are not
> >> > too
> >> > crazy ?
> > Well in most cases it isn't possible, here are some details:
> > - BR2_PACKAGE_IMX_GPU_VIV and BR2_PACKAGE_IMX_GPU_VIV_G2D depends
> > on
> >   BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q which isn't selectable.
> > - We can't select BR2_LINUX_KERNEL since it needs to be a i.MX
> > kernel.
> > - BR2_PACKAGE_LIBIMXVPUAPI depends on the i.MX SoC being used which
> >   cannot be selectable (MX5 or MX6)
> 
> The logical thing to do would be to select BR2_PACKAGE_IMX_GPU_VIV
> and depend
> on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q. The kernel you obviously
> can't
> select. And for libimxvpuapi you can depend on
> BR2_PACKAGE_FREESCALE_IMX_HAS_VPU. That way, the dependencies are all
> gathered
> in the freescale-imx menu. And looking at it that way, you will see
> that they
> are actually architecture dependencies, so no need for comments.

I think we can't, here is what I've tried for the EGL/G2D plugins:

config BR2_PACKAGE_GST1_IMX_EGLVISINK
	bool "imxeglvivsink"
	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
	select BR2_PACKAGE_IMX_GPU_VIV
	help
	  Elements leveraging the 3D GPU

comment "imxeglvivsink only works with i.MX6 3D GPU"
	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

config BR2_PACKAGE_GST1_IMX_G2D
	bool "imxg2d"
	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
	select BR2_PACKAGE_IMX_GPU_VIV
	select BR2_PACKAGE_IMX_GPU_VIV_G2D
	help
	  Elements leveraging the 2D GPU

comment "imxg2d only works with i.MX6 2D GPU"
	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

The above gives:
package/mesa3d/Config.in:173:error: recursive dependency detected!
package/mesa3d/Config.in:173:	symbol BR2_PACKAGE_MESA3D_OPENGL_EGL is
selected by BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
package/mesa3d/Config.in:92:	symbol
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL depends on BR2_PACKAGE_MESA3D
package/mesa3d/Config.in:1:	symbol BR2_PACKAGE_MESA3D is selected by
BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
package/x11r7/xdriver_xf86-video-imx-viv/Config.in:1:	symbol
BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV depends on
BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
package/freescale-imx/imx-gpu-viv/Config.in:34:	symbol
BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is part of choice <choice>
package/freescale-imx/imx-gpu-viv/Config.in:27:	choice <choice> contains
symbol <choice>
package/freescale-imx/imx-gpu-viv/Config.in:27:	choice <choice> contains
symbol BR2_PACKAGE_IMX_GPU_VIV
package/freescale-imx/imx-gpu-viv/Config.in:5:	symbol
BR2_PACKAGE_IMX_GPU_VIV is selected by BR2_PACKAGE_GST1_IMX_EGLVISINK
package/gstreamer1/gst1-imx/Config.in:18:	symbol
BR2_PACKAGE_GST1_IMX_EGLVISINK depends on BR2_PACKAGE_GSTREAMER1
package/gstreamer1/gstreamer1/Config.in:5:	symbol
BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
package/webkitgtk/Config.in:57:	symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
depends on BR2_PACKAGE_WEBKITGTK
package/webkitgtk/Config.in:20:	symbol BR2_PACKAGE_WEBKITGTK is selected
by BR2_PACKAGE_MIDORI
package/midori/Config.in:6:	symbol BR2_PACKAGE_MIDORI depends on
BR2_PACKAGE_LIBGTK3
package/libgtk3/Config.in:13:	symbol BR2_PACKAGE_LIBGTK3 depends on
BR2_PACKAGE_HAS_LIBEGL_WAYLAND
package/opengl/libegl/Config.in:4:	symbol
BR2_PACKAGE_HAS_LIBEGL_WAYLAND is selected by
BR2_PACKAGE_MESA3D_OPENGL_EGL

Any thoughts? I think the issue comes with the graphics backend
selection (X11 or FB). Since I'm no Kconfig expert, I'd rather stick to
the depends option.

> > I guess I can select IMX_CODEC though, I'll add that to the V2.
> 
> IMX_CODEC also depends on BR2_PACKAGE_FREESCALE_IMX, which you can't
> select
> (because otherwise the platform choice would get some random incorrect
> value).

Same, we actually can't select BR2_PACKAGE_FREESCALE_IMX, we get the
same recursive dependency issue.

What about we stick with the depends for now?

My V2 will take care of the dependencies inside the 'ifeq' statements in
gst1-imx.mk. BTW, doing it as suggested kind of makes the code redundant
since several plugins might have the same dependency, like:

ifeq ($(BR2_PACKAGE_GST1_IMX_MP3ENCODER),y)
# There's no --enable-mp3encoder option
GST1_IMX_DEPENDENCIES += imx-codec
else
GST1_IMX_CONF_OPTS += --disable-mp3encoder
endif

ifeq ($(BR2_PACKAGE_GST1_IMX_UNIAUDIODEC),y)
# There's no --enable-uniaudiodec option
GST1_IMX_DEPENDENCIES += imx-codec
else
GST1_IMX_CONF_OPTS += --disable-uniaudiodec
endif

Is that ok? I know it doesn't bring any issue, just look a little
redundant.

Regards,
Gary
