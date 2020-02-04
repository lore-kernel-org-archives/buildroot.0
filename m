From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 4 Feb 2020 23:40:48 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add v3d driver
 support
In-Reply-To: <20200204221427.GE6335@scaer>
References: <20200204144412.6666-1-ps.report@gmx.net>
 <20200204144412.6666-2-ps.report@gmx.net>
 <20200204205516.GB6335@scaer> <20200204224540.23f620c0@gmx.net>
 <20200204230027.014f4603@gmx.net> <20200204221427.GE6335@scaer>
Message-ID: <20200204234048.69648d1e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue, 4 Feb 2020 23:14:27 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-02-04 23:00 +0100, Peter Seiderer spake thusly:
> > On Tue, 4 Feb 2020 22:45:40 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> > > On Tue, 4 Feb 2020 21:55:16 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > > On 2020-02-04 15:44 +0100, Peter Seiderer spake thusly:
> > > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [--SNIP--]
> > > > > +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> > > > > +	bool "Gallium v3d driver"
> > > > > +	depends on BR2_arm || BR2_aarch64
> > > > > +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> > > > > +	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> > > > > +	select )
> > > > > +	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> > > > > +	help
> > > > > +	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
> > > >
> > > > I don't understand why you added that '(needs kmsro and vc4)': the
> > > > corresponding config entries are properly selected above, and thus
> > > > this part of the help text is of no use for the user, and tend to in
> > >
> > > kmsro/vc4 would mean BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO (not mixed up
> > > with the selected BR2_PACKAGE_MESA3D_GALLIUM_KMSRO) and
> > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 (not mixed up with the selected
> > > BR2_PACKAGE_LIBDRM_VC4)...and all three mesa3d options (v3d, vc4, kmsro)
> > > are needed to get a functional RPi4-64bit graphic output (see e.g. [1]:
> > > The VC4 interface is via /dev/drm/card1. The V3D interface is via /dev/drm/card0.
> > > All drawing commands go to V3D (aka card0). All screen resolution and configuration
> > > commands go to VC4 (aka card1))...
>
> Slo it means the code you provided is not complete! Why do you not
> select the requried options?
>
>     select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO

Because none of the other drivers does so...

>     select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4

Because I do not know if all use-cases need a mesa3d-vc4 driver
(my use case definitely ;-) )...

>
> We don't want to let the user resolve the dependencies manually. This is
> what the config options are for.

All freedom for the empowered users ;-)

>
> Currently, with the code you provided, this means that the following
> defconfig would not generate a mesa3d that provperly supports the rpi4
> (if I understood things correctly):
>
>     BR2_arm=y
>     BR2_cortex_a7=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_INIT_NONE=y
>     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>     BR2_SYSTEM_BIN_SH_NONE=y
>     # BR2_PACKAGE_BUSYBOX is not set
>     BR2_PACKAGE_MESA3D=y
>     BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
>     # BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
>     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>     # BR2_TARGET_ROOTFS_TAR is not set

Yes...

>
> This is definitely not nice at all... :-(

Yes, not all possible buildroot configs lead to an usable system...
My reasoning was that the help text hint should be enough...

Regards,
Peter

>
> Could you please fix that up?
>
> Regards,
> Yann E. MORIN.
>
> > > > fact be very confusing. But since this is the same mess with the other
> > > > options around, I left it. It would be nice to clean them away, though.
> > > >
> > > > > +	  It requires a recent enough mainline/raspberrypi kernel with
> > > > > +	  drm v3d (CONFIG_DRM_V3D, CONFIG_DRM_VC4) support enabled.
> > > >
> > > > "recent enough" is of no use to the user: some woudl consider 4.0 to be
> > > > recent, some would consider 5.0 to be old. Sol I replaced that with the
> > > > exact version v3d was merged in mainline linux, that is 4.18.
> > >
> > > Thanks for looking up at which kernel version CONFIG_DRM_V3D was added...,
> > > wanted to emphasize that both mainline and raspberrypi linux kernel
> > > are supported (some years ago only the mainline kernel supported DRM_VC4
> > > and/or 64-bit Rpi)...
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://forum.qt.io/topic/107764/drm-kms-configuration-for-raspberry-pi-4
> > >
> > > >
> > > > Regards,
> > > > Yann E. MORIN.
> > > >
> > > > > +
> > > > >  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> > > > >  	bool "Gallium vc4 driver"
> > > > >  	depends on BR2_arm || BR2_aarch64
> > > > > diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> > > > > index c7e5be55a0..1a18cf3c58 100644
> > > > > --- a/package/mesa3d/mesa3d.mk
> > > > > +++ b/package/mesa3d/mesa3d.mk
> > > > > @@ -84,6 +84,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
> > > > >  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
> > > > >  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
> > > > >  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
> > > > > +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
> > > > >  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
> > > > >  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
> > > > >  # DRI Drivers
> > > > > @@ -162,6 +163,8 @@ endif
> > > > >  MESA3D_PLATFORMS = surfaceless
> > > > >  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> > > > >  MESA3D_PLATFORMS += drm
> > > > > +else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D),y)
> > > > > +MESA3D_PLATFORMS += drm
> > > > >  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
> > > > >  MESA3D_PLATFORMS += drm
> > > > >  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
> > > > > --
> > > > > 2.25.0
> > > > >
> > > > > _______________________________________________
> > > > > buildroot mailing list
> > > > > buildroot at busybox.net
> > > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > >
> > >
> >
>
