From: Charles Turner <cturner@igalia.com>
Date: Thu, 12 Mar 2020 13:11:49 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/cog: add option for platform
 DRM.
In-Reply-To: <20200312120325.6e338f57@windsurf>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200311103044.11422-1-cturner@igalia.com>
 <20200312120325.6e338f57@windsurf>
Message-ID: <b1c360d0310f33edddef7a9da4a9e1789190a5d7.camel@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for your review.

> > diff --git a/package/cog/Config.in b/package/cog/Config.in
> > index b25991d4ae..b260fa259c 100644
> > --- a/package/cog/Config.in
> > +++ b/package/cog/Config.in
> > @@ -26,4 +26,10 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
> >  	  string is used, there is no default and the URI to open
> >  	  must be always specified in the command line.
> >  
> > +config BR2_PACKAGE_COG_PLATFORM_DRM
> > +       bool "DRM backend"
> > +       depends on BR2_PACKAGE_LIBDRM
> 
> We typically don't use "depends on" for such dependencies, but a
> "select". That will require however that you replicate the "depends
> on"
> dependencies of BR2_PACKAGE_LIBDRM here.
> 

The libdrm package heavily depends on the target hardware for what
dependencies it has. In my case the dependencies of libdrm are simply
BR2_aarch64 || BR2_arm because I'm using the VC4 driver on the
Raspberry Pi, but in general how can I replicate the "depends on" in
cog, and should I really do that?

Cog also selects dbus, but I note that dbus' dependencies are not
replicated in Cog's .mk file either (e.g expat). Could select on not
auto-update the dependencies of the selecting package with the selected
package?

It looks like the bug I would be fixing by moving to select from
depends on is compilation order. I didn't realise that its possible cog
could get built before libdrm with only depends on (though unlikely for
other reasons), but I think select forces compilation order? I can run
some experiments later but its a bit of a costly test in terms of time,
couldn't convince myself either way from the Kconfig docs.

> Also, your .mk file adds a dependency on libinput, so you need a
> "select BR2_PACKAGE_LIBINPUT" here.

Done.

> 
> > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > index d0e5b79c38..4697fdf6ed 100644
> > --- a/package/cog/cog.mk
> > +++ b/package/cog/cog.mk
> > @@ -14,7 +14,13 @@ COG_LICENSE_FILES = COPYING
> >  COG_CONF_OPTS = \
> >  	-DCOG_BUILD_PROGRAMS=ON \
> >  	-DCOG_PLATFORM_FDO=ON \
> > -	-DCOG_PLATFORM_DRM=OFF \
> 
> So, now that a second "platform" is supported, do we want the "fdo"
> platform to be always unconditionally enabled ? What is the "fdo"
> platform compared to the "drm" platform ?

I didn't think too hard about keeping it default enabled. When I
started this work the DRM platform was experimental and FDO was very
much a default. I am not a developer of Cog nor an expert in the
graphics stack, but how I think about FDO is that all the logic of how
an image is painted to the screen is handled inside Cog using
components from the FreeDesktop.org stack (hence the name FDO). With
DRM Cog just hands painting off to the framebuffer with DRM/KMS.
However, the FDO "platform" does seem to be required by the DRM
"platform", there appears to be dmabuf related functionality provided
by the FDO backend that is needed in the DRM platform as well. The
naming and organization here is very unfortunate.

> 
> >  	-DCOG_HOME_URI='$(call
> > qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
> >  
> > +ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> > +	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > +	COG_DEPENDENCIES += libdrm libinput
> 
> Those lines should not be indented with one tab.

I removed the indent.

> 
> > +else
> > +	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
> 
> Ditto.

Done.

Best,
	Charlie.
