From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 21:43:56 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <20180507193850.GA15375@ned>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
 <20180507170256.2ef06b2f@windsurf> <20180507193850.GA15375@ned>
Message-ID: <20180507214356.3a087000@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 May 2018 21:38:50 +0200, Eric Le Bihan wrote:

> > Does this one really needs to be a per-package variable ? It's defined
> > with "=" so it doesn't even allow a package to customize this value
> > (but I don't think it would be necessary for packages to customize this
> > value anyway).
> >  
> > > +$(2)_NINJA_ENV		?=
> > > +$(2)_NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)  
> >
> > Same question for this one.  
> 
> I used variables for ninja executable path and options to avoid
> cluttering the *_CMDS parts. These are, indeed, not meant to be
> customized. So, I'll drop them.

You can use variables, but global ones, not per-package ones.

For example

NINJA = $(HOST_DIR)/bin/ninja
NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)

or something like that.

> > > +define $(2)_CONFIGURE_CMDS
> > > +	rm -rf $$($$(PKG)_SRCDIR)/build
> > > +	mkdir -p $$($$(PKG)_SRCDIR)/build
> > > +	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) meson \
> > > +		--prefix=/usr \
> > > +		--libdir=/usr/lib \
> > > +		--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
> > > +		--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> > > +		--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \  
> >
> > So meson is really not consistent, and some options are "--name=value",
> > and some others are "--name value" ?  
> 
> No. Both patterns are valid for any option. I'll use "--name=value" for
> consistency.

It would be great to use --name=value everywhere then, including in the
packages using the meson-package infrastructure. This should perhaps be
noted in the manual, when describing the <pkg>_CONF_OPTS variable.

> > DESTDIR=$$(HOST_DIR) is not correct for host installations, since you
> > already build for prefix=$(HOST_DIR).  
> 
> OK, I'll drop it.

OK. Did you test the host variant of the meson-package infrastructure ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
