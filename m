From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 14:36:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cog: add option for platform
 DRM.
In-Reply-To: <b1c360d0310f33edddef7a9da4a9e1789190a5d7.camel@igalia.com>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200311103044.11422-1-cturner@igalia.com>
 <20200312120325.6e338f57@windsurf>
 <b1c360d0310f33edddef7a9da4a9e1789190a5d7.camel@igalia.com>
Message-ID: <20200312143613.178e96ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Thu, 12 Mar 2020 13:11:49 +0000
Charles Turner <cturner@igalia.com> wrote:

> The libdrm package heavily depends on the target hardware for what
> dependencies it has. In my case the dependencies of libdrm are simply
> BR2_aarch64 || BR2_arm because I'm using the VC4 driver on the
> Raspberry Pi, but in general how can I replicate the "depends on" in
> cog, and should I really do that?

cog only needs libdrm itself to build, which specific DRM driver is
needed is up to the user to figure out and we will certainly not
replicate all the DRM drivers dependencies to the cog package.

The other packages that use libdrm mostly "select BR2_PACKAGE_LIBDRM".

> Cog also selects dbus, but I note that dbus' dependencies are not
> replicated in Cog's .mk file either (e.g expat). Could select on not
> auto-update the dependencies of the selecting package with the selected
> package?

BR2_PACKAGE_EXPAT is selected by BR2_PACKAGE_DBUS, so this is not
something you need to propagate to cog.

What needs to be propagated to cog are the "depends on" that
BR2_PACKAGE_DBUS has on other options. And this is already done
correctly. See BR2_PACKAGE_DBUS:

config BR2_PACKAGE_DBUS
        bool "dbus"
        depends on BR2_TOOLCHAIN_HAS_THREADS
        # uses fork()
        depends on BR2_USE_MMU

We have depends on BR2_USE_MMU and depends on
BR2_TOOLCHAIN_HAS_THREADS. And cog has:

config BR2_PACKAGE_COG
        bool "cog"
        depends on BR2_PACKAGE_WPEWEBKIT
        depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
        depends on BR2_USE_MMU # dbus

So we're good.

It seems like you're not familiar with how kconfig behaves. A "select"
is stronger than a "depends on", so for example if you have:

config A
	bool

config B
	bool
	depends on A

config C
	bool
	select B

Then it is possible to enable C, which will select B, without A being
enabled, which of course is incorrect. This is known bug/limitation of
kconfig, which we work around in Buildroot by propagating "depends on"
dependencies this way:

config A
	bool

config B
	bool
	depends on A

config C
	bool
	depends on A # b
	select B


> It looks like the bug I would be fixing by moving to select from
> depends on is compilation order.

No. Whatever you put in Config.in file has absolutely no impact
whatsoever on compilation order. The build order is defined by the
<pkg>_DEPENDENCIES variable in the .mk file.


> > > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > > index d0e5b79c38..4697fdf6ed 100644
> > > --- a/package/cog/cog.mk
> > > +++ b/package/cog/cog.mk
> > > @@ -14,7 +14,13 @@ COG_LICENSE_FILES = COPYING
> > >  COG_CONF_OPTS = \
> > >  	-DCOG_BUILD_PROGRAMS=ON \
> > >  	-DCOG_PLATFORM_FDO=ON \
> > > -	-DCOG_PLATFORM_DRM=OFF \  
> > 
> > So, now that a second "platform" is supported, do we want the "fdo"
> > platform to be always unconditionally enabled ? What is the "fdo"
> > platform compared to the "drm" platform ?  
> 
> I didn't think too hard about keeping it default enabled. When I
> started this work the DRM platform was experimental and FDO was very
> much a default. I am not a developer of Cog nor an expert in the
> graphics stack, but how I think about FDO is that all the logic of how
> an image is painted to the screen is handled inside Cog using
> components from the FreeDesktop.org stack (hence the name FDO). With
> DRM Cog just hands painting off to the framebuffer with DRM/KMS.
> However, the FDO "platform" does seem to be required by the DRM
> "platform", there appears to be dmabuf related functionality provided
> by the FDO backend that is needed in the DRM platform as well. The
> naming and organization here is very unfortunate.

If the DRM platform does need the FDO platform, then indeed what you
have done in keeping the FDO platform unconditionally enabled is fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
