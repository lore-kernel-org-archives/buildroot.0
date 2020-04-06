From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 07:29:46 +0200
Subject: [Buildroot] [PATCH v4] package/cog: add option for platform DRM.
In-Reply-To: <20200405014959.GD324638@momiji>
References: <20200312194700.2836-1-cturner@igalia.com>
 <20200402113455.4391-1-cturner@igalia.com>
 <20200404234630.712aca1d@windsurf.home>
 <20200405014959.GD324638@momiji>
Message-ID: <20200406072946.67b7d5a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

Thanks for the feedback.

On Sun, 5 Apr 2020 01:49:59 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> > > +	select BR2_PACKAGE_LIBXKBCOMMON  
> > 
> > Why do we have this new dependency? I thought so far the FDO backend
> > was the default, so I assume it was the one used until now, and it
> > build with libxkbcommon.  
> 
> The dependency was needed already before, but I think we were just being
> lucky that it was being pulled in by some other dependency (probably by the
> Wayland package) and that's why things have been working without listing it
> here explicitly.

If the dependency was already required, then it would be good to have a
preliminary patch that adds it, before adding the DRM platform option.

> > Also, if the FDO backend is currently enabled by default, and you make
> > it optional, you should have a "default y" on this option to keep
> > backward compatibility.  
> 
> Sounds sensible.
> 
> > Another question: what happens if neither FDO nor DRM backends are
> > enabled?  
> 
> There is a fallback mode in Cog which is used for simple WPE backends like
> WPEBackend-rdk [1] if the ?--platform=?? option is not passed in the command
> line.

OK, so we don't need to enforce that one of the two backends is enabled.

> > > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > > index d0e5b79c38..339187126a 100644
> > > --- a/package/cog/cog.mk
> > > +++ b/package/cog/cog.mk
> > > @@ -8,13 +8,25 @@ COG_VERSION = 0.4.0
> > >  COG_SITE = https://wpewebkit.org/releases
> > >  COG_SOURCE = cog-$(COG_VERSION).tar.xz
> > >  COG_INSTALL_STAGING = YES
> > > -COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
> > > +COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland wayland-protocols  
> > 
> > Why are you dropping the wayland and wayland-protocols dependencies?
> > Overall, it makes sense because cog does not depends/select wayland or
> > wayland-protocols. Ditto for wpebackend-fdo.  
> 
> We need those, but only when BR2_PACKAGE_COG_PLATFORM_FDO is enabled.

Then the Config.in should have a "select" for those, and they should be
added to <pkg>_DEPENDENCIES only when BR_PACKAGE_COG_PLATFORM_FDO is
enabled. Should also be a separate preliminary patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
