From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 17:02:56 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
Message-ID: <20180507170256.2ef06b2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 12:57:35 +0200, Eric Le Bihan wrote:
> Add a new infrastructure to ease the development of packages that use Meson as
> their build system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Thanks for working on this!

> +define inner-meson-package
> +
> +$(2)_CONF_ENV		?=
> +$(2)_CONF_OPTS		?=
> +$(2)_NINJA		= $(HOST)/bin/ninja

Does this one really needs to be a per-package variable ? It's defined
with "=" so it doesn't even allow a package to customize this value
(but I don't think it would be necessary for packages to customize this
value anyway).

> +$(2)_NINJA_ENV		?=
> +$(2)_NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)

Same question for this one.

> +define $(2)_CONFIGURE_CMDS
> +	rm -rf $$($$(PKG)_SRCDIR)/build
> +	mkdir -p $$($$(PKG)_SRCDIR)/build
> +	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) meson \
> +		--prefix=/usr \
> +		--libdir=/usr/lib \
> +		--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
> +		--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> +		--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \

So meson is really not consistent, and some options are "--name=value",
and some others are "--name value" ?

> +#
> +# Host installation step. Only define it if not already defined by the
> +# package .mk file.
> +#
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(HOST_DIR) \

DESTDIR=$$(HOST_DIR) is not correct for host installations, since you
already build for prefix=$(HOST_DIR).

Other than those questions/issues, looks good to me overall.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
