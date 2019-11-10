From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Nov 2019 19:48:13 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/cage: new package
In-Reply-To: <d20f39f0-3085-00f4-4a58-41956a779bbb@mind.be>
References: <20190613000836.41302-1-aperez@igalia.com>
 <20190613000836.41302-3-aperez@igalia.com>
 <d20f39f0-3085-00f4-4a58-41956a779bbb@mind.be>
Message-ID: <20191110194813.GB289317@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Thanks for the thorough review ? I am finally getting round to applying the
suggested changes. Also, v3 of the patch set will include wlroots 0.8.1,
which has been released in the meantime.

I also have a couple of comments inline below.

On Fri, 2 Aug 2019 00:01:49 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
 
> On 13/06/2019 02:08, Adrian Perez de Castro wrote:
> > Cage is a "kiosk" Wayland compositor, which shows a single maximized
> > application at a time and limits user interaction to that application.
> > 
> > https://www.hjdskes.nl/projects/cage/
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > 
> > ---
> > Changes v1 -> v2:
> >   - Reviewed dependencies (as per Thomas' suggestions)
> >   - Switched to Cage 0.1.1, which does not require patching to build
> >     with wlroots 0.6.0
> > 
> > ---
> >  package/Config.in      |  1 +
> >  package/cage/Config.in | 32 ++++++++++++++++++++++++++++++++
> >  package/cage/cage.hash |  5 +++++
> >  package/cage/cage.mk   | 19 +++++++++++++++++++
> >  4 files changed, 57 insertions(+)
> >  create mode 100644 package/cage/Config.in
> >  create mode 100644 package/cage/cage.hash
> >  create mode 100644 package/cage/cage.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index a7d70b6b48..bb7c97d3fd 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -329,6 +329,7 @@ comment "QT libraries and helper libraries"
> >  	source "package/quazip/Config.in"
> >  	source "package/qwt/Config.in"
> >  endif
> > +	source "package/cage/Config.in"
> >  	source "package/tekui/Config.in"
> >  	source "package/weston/Config.in"
> >  	source "package/x11r7/Config.in"
> > diff --git a/package/cage/Config.in b/package/cage/Config.in
> > new file mode 100644
> > index 0000000000..e1f428a701
> > --- /dev/null
> > +++ b/package/cage/Config.in
> > @@ -0,0 +1,32 @@
> > +config BR2_PACKAGE_CAGE
> > +	bool "cage"
> > +	depends on !BR2_STATIC_LIBS # wlroots
> 
>  Not so important, but we usually do # wlroots -> wayland

I'll add the ?-> foo? part, to me it makes clearer where the dependency
came from :)

> > +	depends on BR2_INSTALL_LIBSTDCPP # wlroots
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # wlroots
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # wlroots
> > +	depends on BR2_ENABLE_LOCALE # wlroots
> > +	depends on BR2_PACKAGE_HAS_UDEV # wlroots
> > +	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
> > +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
> > +	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
> 
>  You didn't update these after updating wlroots...
> 
> > +	select BR2_PACKAGE_WLROOTS
> > +	help
> > +	  Kiosk compositor for Wayland, which displays a single
> > +	  maximized application at a time.
> > +
> > +	  https://www.hjdskes.nl/projects/cage/
> > +
> > +if BR2_PACKAGE_CAGE
> > +
> > +config BR2_PACKAGE_CAGE_XWAYLAND
> > +	bool "XWayland support"
> > +	depends on BR2_PACKAGE_XORG7 # wlroots
> > +	depends on BR2_PACKAGE_WLROOTS_XWAYLAND
> 
>  I forgot to mention for wlroots: does it make sense to make Xwayland support
> optional? If you have Xorg enabled and you also select a wayland compositor,
> you're bound to want xwayland, no? And I can't imagine that it would add much to
> the build size anyway.

The difference in code size is a few tens of kilobytes on 64-bit ARM. That's
peanuts compared with the size of X.org itself, so I think you are right and
XWayland support can be automatically enabled in wlroots (and Cage) if the
BR2_PACKAGE_XORG7=y symbol is defined.

> > +	help
> > +	  Enable support for running X11 applications through XWayland
> > +
> > +comment "XWayland supports needs X.org and support in wlroots enabled"
> > +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_WLROOTS_XWAYLAND
> > +
> > +endif
> > diff --git a/package/cage/cage.hash b/package/cage/cage.hash
> > new file mode 100644
> > index 0000000000..166932bc15
> > --- /dev/null
> > +++ b/package/cage/cage.hash
> > @@ -0,0 +1,5 @@
> > +# Generated locally
> 
>  Same story about checking .asc.
> 
> > +sha256 63efbe96cf307381f2bedf9b80153343e255970a70d612515da7dc325dd49478  v0.1.1.tar.gz
> > +
> > +# Hashes for license files:
> > +sha256 1fd28695090b961ed2846627365489228d84f784bff60a90e933febcedaeb65d  LICENSE
> > diff --git a/package/cage/cage.mk b/package/cage/cage.mk
> > new file mode 100644
> > index 0000000000..db7369276a
> > --- /dev/null
> > +++ b/package/cage/cage.mk
> > @@ -0,0 +1,19 @@
> > +################################################################################
> > +#
> > +# cage
> > +#
> > +################################################################################
> > +
> > +CAGE_VERSION = 0.1.1
> > +CAGE_SITE = https://github.com/Hjdskes/cage/archive
> 
>  Same story about using github helper.

It won't be needed anymore for wlroots, as proper (uploded) tarballs are
available in the GitHub releases for the newer releases. Let's use the
helper for Cage anyway, of course!

Cheers,
?Adri?n

>  Regards,
>  Arnout
> 
> > +CAGE_SOURCE = v$(CAGE_VERSION).tar.gz
> > +CAGE_LICENSE = MIT
> > +CAGE_DEPENDENCIES = host-pkgconf wlroots
> > +
> > +ifeq ($(BR2_PACKAGE_CAGE_XWAYLAND),y)
> > +CAGE_CONF_OPTS = -Dxwayland=true
> > +else
> > +CAGE_CONF_OPTS = -Dxwayland=false
> > +endif
> > +
> > +$(eval $(meson-package))
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191110/ff2426b4/attachment.asc>
