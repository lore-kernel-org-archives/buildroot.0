From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 3 May 2019 20:10:11 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/pkg-meson: change to use
 <PKG>_BUILDDIR
In-Reply-To: <284679f5-39d0-f2b3-5443-9f78ee0bb112@mind.be>
References: <20190502201436.6163-1-ps.report@gmx.net>
 <284679f5-39d0-f2b3-5443-9f78ee0bb112@mind.be>
Message-ID: <20190503201011.494df9ae@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, 3 May 2019 10:34:47 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 02/05/2019 22:14, Peter Seiderer wrote:
> > Change to use <PKG>_BUILDDIR (and change from <PKG>_SRCDIR/build
> > to <PKG>_SRCDIR/buildroot-build as in package/pkg-cmake.mk).
>
>  Could you do a build-test of BR2_PACKAGE_SYSTEMD_BOOT=y ? I believe it will fail...

Thanks for the hint (one more time libdrm only is not sufficient for meson changes
test), it fails because of the build vs. buildroot-build change, will add an
additional change on the next patch iteration...

>
>  There may be others as well. You should check all meson packages if they refer
> to the build directory.

Checked, systemd is the only package affected...

>
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - suggested change by Arnout Vandecappelle
> >   - <PKG>_SRCDIR seems to contain already an trailing '/', so
> >     <PKG>_BUILDDIR gets an double '//' path seperator
>
> $(2)_SRCDIR                    = $$($(2)_DIR)/$$($(2)_SUBDIR)
>
>  _SUBDIR is usually empty.
>
>  You can't simply remove the / for the case where _SUBDIR is not empty.
>
>  If we really want to avoid it, we could change that into
>
>
> $(2)_SRCDIR                    = $$($(2)_DIR)$$(if $$($(2)_SUBDIR),/$$($(2)_SUBDIR))
>
> but I don't think it's worth it.

Will test it (and suggest an patch in case it works, it always catches my attention
when a // traverses the console)...

Regards,
Peter

>
>  Regards,
>  Arnout
>
> > ---
> >  package/pkg-meson.mk | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 886fcf7205..597c48b90a 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -49,6 +49,8 @@ $(2)_CONF_ENV		?=
> >  $(2)_CONF_OPTS		?=
> >  $(2)_NINJA_ENV		?=
> >
> > +$(2)_BUILDDIR		?= $$($(2)_SRCDIR)/buildroot-build
> > +
> >  #
> >  # Configure step. Only define it if not already defined by the package
> >  # .mk file. And take care of the differences between host and target
> > @@ -61,8 +63,8 @@ ifeq ($(4),target)
> >  #
> >  #
> >  define $(2)_CONFIGURE_CMDS
> > -	rm -rf $$($$(PKG)_SRCDIR)/build
> > -	mkdir -p $$($$(PKG)_SRCDIR)/build
> > +	rm -rf $$($$(PKG)_BUILDDIR)
> > +	mkdir -p $$($$(PKG)_BUILDDIR)
> >  	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
> >  	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
> >  	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
> > @@ -72,22 +74,22 @@ define $(2)_CONFIGURE_CMDS
> >  	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> >  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
> >  	    package/meson/cross-compilation.conf.in \
> > -	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> > +	    > $$($$(PKG)_BUILDDIR)/cross-compilation.conf
> >  	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
> >  		--prefix=/usr \
> >  		--libdir=lib \
> >  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> >  		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> > -		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> > +		--cross-file=$$($$(PKG)_BUILDDIR)/cross-compilation.conf \
> >  		$$($$(PKG)_CONF_OPTS) \
> > -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
> > +		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
> >  endef
> >  else
> >
> >  # Configure package for host
> >  define $(2)_CONFIGURE_CMDS
> > -	rm -rf $$($$(PKG)_SRCDIR)/build
> > -	mkdir -p $$($$(PKG)_SRCDIR)/build
> > +	rm -rf $$($$(PKG)_BUILDDIR)
> > +	mkdir -p $$($$(PKG)_BUILDDIR)
> >  	$$(HOST_CONFIGURE_OPTS) \
> >  	$$($$(PKG)_CONF_ENV) $$(MESON) \
> >  		--prefix=$$(HOST_DIR) \
> > @@ -97,7 +99,7 @@ define $(2)_CONFIGURE_CMDS
> >  		--default-library=shared \
> >  		--buildtype=release \
> >  		$$($$(PKG)_CONF_OPTS) \
> > -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
> > +		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> >  endif
> > @@ -112,12 +114,12 @@ ifndef $(2)_BUILD_CMDS
> >  ifeq ($(4),target)
> >  define $(2)_BUILD_CMDS
> >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> >  endef
> >  else
> >  define $(2)_BUILD_CMDS
> >  	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> >  endif
> > @@ -129,7 +131,7 @@ endif
> >  ifndef $(2)_INSTALL_CMDS
> >  define $(2)_INSTALL_CMDS
> >  	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
> >  endef
> >  endif
> >
> > @@ -140,7 +142,7 @@ endif
> >  ifndef $(2)_INSTALL_STAGING_CMDS
> >  define $(2)_INSTALL_STAGING_CMDS
> >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
> >  endef
> >  endif
> >
> > @@ -151,7 +153,7 @@ endif
> >  ifndef $(2)_INSTALL_TARGET_CMDS
> >  define $(2)_INSTALL_TARGET_CMDS
> >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
> >  endef
> >  endif
> >
> > --
> > 2.21.0
> >
