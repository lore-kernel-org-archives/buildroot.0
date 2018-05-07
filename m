From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 8 May 2018 00:12:44 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <20180507214356.3a087000@windsurf>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
 <20180507170256.2ef06b2f@windsurf> <20180507193850.GA15375@ned>
 <20180507214356.3a087000@windsurf>
Message-ID: <20180507221244.GC15375@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-05-07 21:43:56, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 7 May 2018 21:38:50 +0200, Eric Le Bihan wrote:
>
> > > Does this one really needs to be a per-package variable ? It's defined
> > > with "=" so it doesn't even allow a package to customize this value
> > > (but I don't think it would be necessary for packages to customize this
> > > value anyway).
> > >
> > > > +$(2)_NINJA_ENV		?=
> > > > +$(2)_NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> > >
> > > Same question for this one.
> >
> > I used variables for ninja executable path and options to avoid
> > cluttering the *_CMDS parts. These are, indeed, not meant to be
> > customized. So, I'll drop them.
>
> You can use variables, but global ones, not per-package ones.
>
> For example
>
> NINJA = $(HOST_DIR)/bin/ninja
> NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
>
> or something like that.

OK.

> > > > +define $(2)_CONFIGURE_CMDS
> > > > +	rm -rf $$($$(PKG)_SRCDIR)/build
> > > > +	mkdir -p $$($$(PKG)_SRCDIR)/build
> > > > +	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) meson \
> > > > +		--prefix=/usr \
> > > > +		--libdir=/usr/lib \
> > > > +		--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
> > > > +		--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> > > > +		--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
> > >
> > > So meson is really not consistent, and some options are "--name=value",
> > > and some others are "--name value" ?
> >
> > No. Both patterns are valid for any option. I'll use "--name=value" for
> > consistency.
>
> It would be great to use --name=value everywhere then, including in the
> packages using the meson-package infrastructure. This should perhaps be
> noted in the manual, when describing the <pkg>_CONF_OPTS variable.

The --name=value pattern is used for options related to Meson behavior
and general project configuration, whereas the -Dname=value one is used
for project feature activation/customization. So <pkg>_CONF_OPTS should
most of the time contains elements using the latter (except when
overriding sysconfdir or such locations).

In case of boolean options, Meson assumes that "-Dbaz" means
"-Dbaz=true". Should the example in the infrastructure documentation
look like this:

```
ifeq ($(BR2_PACKAGE_BAZ),y)
FOO_CONF_OPTS += -Dbaz=true
FOO_DEPENDENCIES += baz
else
FOO_CONF_OPTS += -Dbaz=false
endif
```

Or like this:

```
ifeq ($(BR2_PACKAGE_BAZ),y)
FOO_CONF_OPTS += -Dbaz
FOO_DEPENDENCIES += baz
endif
```

> > > DESTDIR=$$(HOST_DIR) is not correct for host installations, since you
> > > already build for prefix=$(HOST_DIR).
> >
> > OK, I'll drop it.
>
> OK. Did you test the host variant of the meson-package infrastructure ?

Good advice! Testing the host variant of a custom library+executable
project brought out that Meson does not automically sets RPATH [1],
which makes support/scripts/check-host-rpath unhappy, and that it
defaults --libdir to "lib64" instead of "lib" [2]. So I'll fix the host
variant accordingly.

[1] http://mesonbuild.com/Reference-manual.html#executable
[2] http://mesonbuild.com/Reference-manual.html#get_option

Regards,

--
ELB
