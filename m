From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 5 Apr 2020 01:49:59 +0300
Subject: [Buildroot] [PATCH v4] package/cog: add option for platform DRM.
In-Reply-To: <20200404234630.712aca1d@windsurf.home>
References: <20200312194700.2836-1-cturner@igalia.com>
 <20200402113455.4391-1-cturner@igalia.com>
 <20200404234630.712aca1d@windsurf.home>
Message-ID: <20200405014959.GD324638@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am adding a few comments to Thomas' questions below.

On Sat, 4 Apr 2020 23:46:30 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 
> On Thu,  2 Apr 2020 12:34:55 +0100
> Charlie Turner <cturner@igalia.com> wrote:
> 
> > diff --git a/package/cog/Config.in b/package/cog/Config.in
> > index b25991d4ae..6a7c5668a5 100644
> > --- a/package/cog/Config.in
> > +++ b/package/cog/Config.in
> > @@ -7,7 +7,9 @@ config BR2_PACKAGE_COG
> >  	depends on BR2_PACKAGE_WPEWEBKIT
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> >  	depends on BR2_USE_MMU # dbus
> > +
> 
> Why this new empty line?
> 
> >  	select BR2_PACKAGE_DBUS
> > +
> 
> Ditto?
> 
> >  	help
> >  	  Single "window" launcher for the WebKit WPE port, and
> >  	  helper library for implementing WPE launcher. It does
> > @@ -26,4 +28,30 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
> >  	  string is used, there is no default and the URI to open
> >  	  must be always specified in the command line.
> >  
> > +config BR2_PACKAGE_COG_PLATFORM_FDO
> > +	bool "FreeDesktop.org backend"
> > +
> 
> Don't add these empty lines.
> 
> > +	select BR2_PACKAGE_LIBXKBCOMMON
> 
> Why do we have this new dependency? I thought so far the FDO backend
> was the default, so I assume it was the one used until now, and it
> build with libxkbcommon.

The dependency was needed already before, but I think we were just being
lucky that it was being pulled in by some other dependency (probably by the
Wayland package) and that's why things have been working without listing it
here explicitly.

> Also, if the FDO backend is currently enabled by default, and you make
> it optional, you should have a "default y" on this option to keep
> backward compatibility.

Sounds sensible.

> Another question: what happens if neither FDO nor DRM backends are
> enabled?

There is a fallback mode in Cog which is used for simple WPE backends like
WPEBackend-rdk [1] if the ?--platform=?? option is not passed in the command
line.
 
> > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > index d0e5b79c38..339187126a 100644
> > --- a/package/cog/cog.mk
> > +++ b/package/cog/cog.mk
> > @@ -8,13 +8,25 @@ COG_VERSION = 0.4.0
> >  COG_SITE = https://wpewebkit.org/releases
> >  COG_SOURCE = cog-$(COG_VERSION).tar.xz
> >  COG_INSTALL_STAGING = YES
> > -COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
> > +COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland wayland-protocols
> 
> Why are you dropping the wayland and wayland-protocols dependencies?
> Overall, it makes sense because cog does not depends/select wayland or
> wayland-protocols. Ditto for wpebackend-fdo.

We need those, but only when BR2_PACKAGE_COG_PLATFORM_FDO is enabled.

Cheers,
?Adri?n

---
[1] https://github.com/WebPlatformForEmbedded/WPEBackend-rdk
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200405/5671cbc6/attachment.asc>
