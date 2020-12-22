From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 21 Dec 2020 19:04:05 -0500
Subject: [Buildroot] Configuring OpenGL
In-Reply-To: <20201221101354.3685cbee@gmx.net>
References: <CAJ6EmCejgFnDSza2xbcWgJrjrY1Wc7pz1AZLCna4TneuZd0gyw@mail.gmail.com>
 <20201221101354.3685cbee@gmx.net>
Message-ID: <CAJ6EmCfAmfum2Fm9DgNyeoz6cvkj9rJbYJYnxoX1dz4MOvge-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for the comprehensive info on how-to!  I do have a question on the
hardware info:

> For example Raspberry Pi hardware there are two options, use
> rpi-userland (the old way/32-bit only) or mesa3d/v3d/vc4 (the
> new way 32-bit/64-bit)...

My client's system is the TI Sitara board (Beaglebone-X15).  I tried
selecting ti-sgx-km, but it failed to build.  I think the version of Linux
supported by the board I'm using is outdated vs the version of Linux
expected to compile this option.  The dev-board we started with uses
Linux 4.9.147-ti-rt-r121.  We are using a local linux-custom version, but I
am afraid to migrate to a newer version of the kernel.  You know how it
goes with hardware vendors!  Any suggestions?

Thanks!
Patricia


On Mon, Dec 21, 2020 at 4:13 AM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Patricia,
>
> On Sun, 20 Dec 2020 19:01:53 -0500, Patricia Holden <pholden@nklabs.com>
> wrote:
>
> > I know this topic has been visited a couple times, but I did not see my
> > particular problem in the threads.  I am trying to add a package that
> > requires QT5 components and Gstreamer.  In order to add QT5, openGL is
> > required.
> >
> > Buildroot version I am using is  buildroot-2020-02.
> >
> > I went into the menuconfig->Libraries->Graphics after looking at
> > package/Config.in to find out where I would enable it.  When I got into
> the
> > Graphics libraries, openGL was not an option anywhere in the list.
> >
> > My question is:  What do I need to do to enable opengl in the menuconfig
> so
> > that I can get my package built and into target?
>
> It depends on your platform and/or graphics hardware. In short your need
> an OpenGL provider.
>
> For the long/technical answer take a look at package/qt5/qt5base/Config.in:
>
>  138 comment "OpenGL support needs an OpenGL-capable backend"
>  139         depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
>  140
>  141 config BR2_PACKAGE_QT5BASE_OPENGL
>  142         bool "OpenGL support"
>  143         depends on BR2_PACKAGE_QT5_GL_AVAILABLE
>  144         help
>  145           This option enables OpenGL support.
>
> and package/qt5/Config.in:
>
>   1 config BR2_PACKAGE_QT5_GL_AVAILABLE
>   2         bool
>   3         default y
>   4         depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
>   5
>
> So grep for BR2_PACKAGE_HAS_LIBGL or BR2_PACKAGE_HAS_LIBGLES providers:
>
>         $ git grep "select BR2_PACKAGE_HAS_LIBGL"
> package/freescale-imx/gpu-amd-bin-mx51/Config.in:       select
> BR2_PACKAGE_HAS_LIBGLES
> package/freescale-imx/imx-gpu-viv/Config.in:    select
> BR2_PACKAGE_HAS_LIBGLES
> package/gcnano-binaries/Config.in:      select BR2_PACKAGE_HAS_LIBGLES
> package/mali-t76x/Config.in:    select BR2_PACKAGE_HAS_LIBGLES
> package/mesa3d/Config.in:       select BR2_PACKAGE_HAS_LIBGL
> package/mesa3d/Config.in:       select BR2_PACKAGE_HAS_LIBGLES
> package/nvidia-driver/Config.in:        select BR2_PACKAGE_HAS_LIBGL
> package/nvidia-driver/Config.in:        select BR2_PACKAGE_HAS_LIBGLES
> package/rpi-userland/Config.in: select BR2_PACKAGE_HAS_LIBGLES
> package/sunxi-mali-mainline/Config.in:  select BR2_PACKAGE_HAS_LIBGLES
> package/ti-gfx/Config.in:       select BR2_PACKAGE_HAS_LIBGLES
> package/ti-sgx-um/Config.in:    select BR2_PACKAGE_HAS_LIBGLES
>
>         $ git grep "select BR2_PACKAGE_HAS_LIBGLES" | cat
> package/freescale-imx/gpu-amd-bin-mx51/Config.in:       select
> BR2_PACKAGE_HAS_LIBGLES
> package/freescale-imx/imx-gpu-viv/Config.in:    select
> BR2_PACKAGE_HAS_LIBGLES
> package/gcnano-binaries/Config.in:      select BR2_PACKAGE_HAS_LIBGLES
> package/mali-t76x/Config.in:    select BR2_PACKAGE_HAS_LIBGLES
> package/mesa3d/Config.in:       select BR2_PACKAGE_HAS_LIBGLES
> package/nvidia-driver/Config.in:        select BR2_PACKAGE_HAS_LIBGLES
> package/rpi-userland/Config.in: select BR2_PACKAGE_HAS_LIBGLES
> package/sunxi-mali-mainline/Config.in:  select BR2_PACKAGE_HAS_LIBGLES
> package/ti-gfx/Config.in:       select BR2_PACKAGE_HAS_LIBGLES
> package/ti-sgx-um/Config.in:    select BR2_PACKAGE_HAS_LIBGLES
>
>
> For example Raspberry Pi hardware there are two options, use
> rpi-userland (the old way/32-bit only) or mesa3d/v3d/vc4 (the
> new way 32-bit/64-bit)...
>
> Regards,
> Peter
>
> >
> > Thanks!
> > Patricia
> >
>
>

-- 
Patricia A. Holden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201221/4714dc53/attachment.html>
