From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 15:23:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/cog: add option for platform
 DRM.
In-Reply-To: <394e9ef0dfd8d15ed2dcae67a3cd8cece69993aa.camel@igalia.com>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200310133614.5d8ed8d1@gmx.net>
 <394e9ef0dfd8d15ed2dcae67a3cd8cece69993aa.camel@igalia.com>
Message-ID: <20200310152302.23f620ba@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Tue, 10 Mar 2020 13:49:42 +0000, Charles Turner <cturner@igalia.com> wrote:

> Hi Peter,
>
> On Tue, 2020-03-10 at 13:36 +0100, Peter Seiderer wrote:
> > > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > > index d0e5b79c38..0bbc684436 100644
> > > --- a/package/cog/cog.mk
> > > +++ b/package/cog/cog.mk
> > > @@ -8,13 +8,17 @@ COG_VERSION = 0.4.0
> > >  COG_SITE = https://wpewebkit.org/releases
> > >  COG_SOURCE = cog-$(COG_VERSION).tar.xz
> > >  COG_INSTALL_STAGING = YES
> > > -COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
> > > +COG_DEPENDENCIES = dbus wayland wpewebkit wpebackend-fdo
> >
> > New option, unconditionally added new dependency on wayland?
>
> Perhaps I should place that in a separate patch. Cog does depend on
> wayland with wpewebkit, which is why I reflex-added it to the deps.
> It's already depended on from the wpewebkit dependency, but I didn't
> like relying on a separate packages dependency list for this package,
> especially when Cog can be build with webkitgtk instead, in which case
> it would not need the wayland dep (although I wonder if anyone has
> tested that in buildroot yet :-))

Thanks for explanation...

>
> From this reasoning, I will remove this added dependency on wayland.
>
> >
> > >  COG_LICENSE = MIT
> > >  COG_LICENSE_FILES = COPYING
> > >  COG_CONF_OPTS = \
> > >  	-DCOG_BUILD_PROGRAMS=ON \
> > >  	-DCOG_PLATFORM_FDO=ON \
> > > -	-DCOG_PLATFORM_DRM=OFF \
> > >  	-DCOG_HOME_URI='$(call
> > > qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
> > >
> > > +ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> > > +	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > > +	COG_DEPENDENCIES += libdrm libinput
> >
> > missing:
> >
> > #else
> > 	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>
> This is default off in CMake, which is why I removed it from the .mk
> file here.

Defaults can change, explicit setting preferred ;-)

Regards,
Peter

>
> B.R
> 	Charlie.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
