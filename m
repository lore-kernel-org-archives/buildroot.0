From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 31 Mar 2018 17:21:29 +0200
Subject: [Buildroot] [PATCH/next] libpagekite: new package
In-Reply-To: <20180216152125.16975-1-arnout@mind.be>
References: <20180216152125.16975-1-arnout@mind.be>
Message-ID: <72f4fb60-aea2-28e0-8de0-efe33a71630a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

It seems you used libpcap package as a template :)

Le 16/02/2018 ? 16:21, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> libpagekite is a C implementation of the backend of the PageKite relay
> protocol. It allows external access to embedded devices without public
> IP address.
> 
> There is a bundled version of libev but we prefer to use the global
> libev library.
> 
> Although the configure script has a --without-openssl option, it
> doesn't actually build without openssl.
> 
> Patch 0001-configure.ac-fix-handling-of-with.patch is needed because
> we want to explicitly pass --with and --without options, even if they
> are the default. The way the AC_ARG_WITH macros were used, --with and
> --without both had the effect of enabling the option.
> 
> Patch 0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch is
> not needed for Buildroot, but it is part of the same upstream PR and
> would generate a conflict for the next patch.
> 
> Patch 0003-configure.ac-use-pkg-config-for-openssl.patch is needed to
> pass -lz (needed by openssl) in static compilation.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---

[...]

> diff --git a/package/libpagekite/Config.in b/package/libpagekite/Config.in
> new file mode 100644
> index 0000000000..418989f6f1
> --- /dev/null
> +++ b/package/libpagekite/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_LIBPAGEKITE
> +	bool "libpcap"

should be "libpagekite"

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain


> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_bfin # libev
> +	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  PageKite is a protocol for dynamic, tunneled reverse proxying
> +	  of arbitrary TCP byte streams. It is particularly well suited
> +	  for making a HTTP server on a device without a public IP
> +	  address visible to the wider Internet, but can also be used
> +	  for a variety of other things, including SSH access.
> +
> +	  libpagekite is a tight, fast implementation of the PageKite
> +	  protocol in C, suitable for high-performance or embedded
> +	  applications.
> +
> +	  In addition to the libpagekite library, this package installs
> +	  the pagekitec, sshkite and httpkite tools.
> +
> +	  https://pagekite.net
> +	  https://github.com/pagekite/libpagekite
> +
> +comment "libpagekite needs a toolchain with threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_bfin
> diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
> new file mode 100644
> index 0000000000..262adc7aab
> --- /dev/null
> +++ b/package/libpagekite/libpagekite.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated
> +sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-v0.91.171102.tar.gz
> +
> +# License files, locally calculated
> +sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
> +sha256  4a271d0bb6bb6e0bac880efddb46da73e6df3dcf0d9ca08a945a232f8ab882ef  doc/LICENSE-2.0.txt
> +sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPLv3.txt
> diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
> new file mode 100644
> index 0000000000..2c143ba022
> --- /dev/null
> +++ b/package/libpagekite/libpagekite.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# libpagekite
> +#
> +################################################################################
> +
> +LIBPAGEKITE_VERSION = v0.91.171102
> +LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,$(LIBPAGEKITE_VERSION))
> +
> +# pkrelay is AGPL-3.0+ but is not built
> +LIBPAGEKITE_LICENSE = Apache-2.0 or AGPL-3.0+
> +LIBPAGEKITE_LICENSE_FILES = doc/COPYING.md doc/LICENSE-2.0.txt doc/AGPLv3.txt
> +
> +LIBPAGEKITE_DEPENDENCIES = host-pkgconf libev openssl
> +LIBPAGEKITE_INSTALL_STAGING = YES
> +
> +# Sources from git, no configure included
> +# 0001-configure.ac-fix-handling-of-with-os-libev.patch touches configure.ac
> +LIBPAGEKITE_AUTORECONF = YES
> +
> +LIBPAGEKITE_CONF_OPTS = \
> +	--with-openssl \
> +	--without-tests \
> +	--with-os-libev \
> +	--without-java \
> +	--without-agpl-relay \
> +	--without-ds-logfmt
> +
> +$(eval $(autotools-package))
> 
