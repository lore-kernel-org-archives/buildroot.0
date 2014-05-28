From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 08:14:29 +0200
Subject: [Buildroot] [PATCH] dillo: new package
In-Reply-To: <1401230307-17697-1-git-send-email-ps.report@gmx.net>
References: <1401230307-17697-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140528081429.347da974@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed, 28 May 2014 00:38:27 +0200, Peter Seiderer wrote:

> diff --git a/package/dillo/Config.in b/package/dillo/Config.in
> new file mode 100644
> index 0000000..07198f1
> --- /dev/null
> +++ b/package/dillo/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_DILLO
> +	bool "dillo"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU # fltk fork()
> +	select BR2_PACKAGE_FLTK
> +

No need for this empty line here.

> +	help
> +	  Dillo is a multi-platform graphical web browser known
> +	  for its speed and small footprint. 
> +
> +	  Enable jpeg and png packages to gain full feature image
> +	  support.

I believe this comment is not really necessary: fltk selects libpng and
jpeg, so they will also be there.

> +	  Enable openssl package to gain https support.

However, this one is indeed useful.

> +	  http://www.dillo.org
> +
> +comment "dillo needs a toolchain w/ C++"
> +        depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
> +        depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
> new file mode 100644
> index 0000000..f15a02a
> --- /dev/null
> +++ b/package/dillo/dillo.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# dillo
> +#
> +################################################################################
> +
> +DILLO_VERSION = 3.0.4
> +DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
> +DILLO_SITE = http://www.dillo.org/download
> +DILLO_LICENSE = GPLv3+
> +DILLO_LICENSE_FILES = COPYING
> +
> +DILLO_DEPENDENCIES = fltk
> +
> +# set additional path for fltk-config and libpng-config
> +DILLO_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)

It's not that nice to add $(STAGING_DIR)/usr/bin to the path, as it
means that if there are target binaries in there, they will be picked
up in preference to host binaries, which might break things. Instead,
we prefer to explicitly point to fltk-config and libpng-config. For
libpng:

DILLO_CONF_ENV = \
	PNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config

For fltk, you'd need to patch configure.ac a bit to make it use a
variable like FLTK_CONFIG instead of hardcoding the use of fltk-config.
Or better, make it use AC_PATH_PROG(), like:

	AC_PATH_PROG(FLTK_CONFIG,fltk-config)

and then use $FLTK_CONFIG throughout the configure.ac, and pass
ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config

This patch could then be submitted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
