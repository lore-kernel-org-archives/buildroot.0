From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:13:30 +0200
Subject: [Buildroot] [PATCH v6 1/2] meson: add per package optional
 compiler/linker flags
In-Reply-To: <20190612163710.GE2647@scaer>
References: <20190423205302.14382-1-ps.report@gmx.net>
 <20190612163710.GE2647@scaer>
Message-ID: <20190622211330.10b68b47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Jun 2019 18:37:10 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > index 49e27f5527..70128f6bad 100644
> > --- a/package/meson/meson.mk
> > +++ b/package/meson/meson.mk
> > @@ -60,6 +60,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
> >  	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> >  	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> >  	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> > +	    -e "s%@PKG_TARGET_CFLAGS@%%g" \
> > +	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
> > +	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \  
> 
> Actually, if someone wants to use that file outside of Buildroot, and
> also happend to need to pass special C/LD/CXXFLAGS for their package,
> how are they expected to do so? Can't we just install it as a template
> too?

If we keep @PKG_TARGET_CFLAGS@, @PKG_TARGET_LDFLAGS@, etc. in the
cross-compilation.conf, then it is no longer usable as-is: users will
_have_ to fixup those @PKG_TARGET_foo@, even if they don't need to pass
additional CFLAGS to their package.

I think what Peter S. did here is the best we can do. A better solution
would be for Meson to support command line provided cflags/ldflags, but
that's not supported, and if it was supported, this whole patch
wouldn't be necessary.

> > +$(2)_MESON_SED_CFLAGS = $(if $($(2)_MESON_CFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_CFLAGS)`)
> > +$(2)_MESON_SED_LDFLAGS = $(if $($(2)_MESON_LDFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_LDFLAGS)`)
> > +$(2)_MESON_SED_CXXFLAGS = $(if $($(2)_MESON_CXXFLAGS),`printf '"%s"$(comma) ' $$($$(2)_MESON_CXXFLAGS)`)  
> 
> There are two things I am not too fond about those variables:
> 
> 1. for the other package infras, when a package wants to pass extra such
> flags, the package is responsible for carrying the original TARGET_CFLAGS
> (LD, CXX), and this is not automatic. With your path, this would make it
> automatic for meson, thus diverging from the usual practice.

I agree.

> It also precludes packages from actualyl overriding the default flags,
> like we currently have to do to override -ON for some packages under
> mucroblaze for example.

However, this example is not really great: for Microblaze we override
with -O0 by passing it after $(TARGET_CFLAGS), i.e we don't need to
tweak what's in $(TARGET_CFLAGS)

But even if your example is not the best, I agree with you, as it's
more consistent with what we do elsewhere, and potentially also
dropping/tweaking what's inside TARGET_CFLAGS for a given package,
which we do in a few places.

> 2. The naming is not nice to me: why do we need to have "MESON" in the
> variable name at all? Surely, fir the other infras, we just write things
> like:
>     FOO_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
> not:
>     FOO_AUTOTOOLS_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
>     FOO_CMAKE_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
>     etc...

That's true but in fact no other infra has <pkg>_CFLAGS or
<pkg>_LDFLAGS variables. These are entirely "internal" to each package,
which takes care to propagate them to <pkg>_CONF_ENV for autotools
packages, to some -DCMAKE_CFLAGS for cmake packages, etc.

So Meson would anyway stand out from the point of view that it will be
the only package infra that takes care of passing <pkg>_CFLAGS /
<pkg>_LDFLAGS.

But like the point above: despite this, I still agree with you that
<pkg>_CFLAGS is better. Maybe one day we'll make the autotools/cmake
infras also take care of passing <pkg>_CFLAGS/LDFLAGS.

So all in all, I agree with your review, except the very first point on
keeping the @PKG_TARGET_*@ templates.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
