From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 21:45:56 +0200
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <20181207181314.24051-1-tpiepho@impinj.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
Message-ID: <20190404214556.10f7ef0d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trent,

On Fri, 7 Dec 2018 18:13:30 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> Library for using PKCS#11, which includes an engine for OpenSSL that
> lets it use PKCS#11 modules.  Which is really what this package is
> about, not that libp11 library itself, which has no users outside the of
> OpenSSL engine.
> 
> If p11-kit is enabled, configure the engine to use that as the default
> PKCS#11 module.  That module is a sort of multiplexer that allows
> multiple modules to be used at once, so it makes sense to use it even if
> there are other modules present, e.g. softhsm2, nssckbi, pkcs11-proxy,
> ykcs11, etc.
> 
> A host package is created too, with a host configuration option.  Since
> this a dynamically loaded module, there is no build time reason to
> select it from a host package.  It could be used by host openssl, to
> allow host rauc to sign a software update bundle using a key from a HSM
> with a PKCS#11 interface.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Thanks, I've applied after doing a number of changes, mainly to fix
build failures. See below.

> ---
>  package/Config.in             |  1 +
>  package/Config.in.host        |  1 +
>  package/libp11/Config.in      |  7 +++++++
>  package/libp11/Config.in.host |  6 ++++++
>  package/libp11/libp11.hash    |  3 +++
>  package/libp11/libp11.mk      | 21 +++++++++++++++++++++

An entry in the DEVELOPERS file was missing.


> diff --git a/package/libp11/Config.in b/package/libp11/Config.in
> new file mode 100644
> index 0000000000..0b9a739db3
> --- /dev/null
> +++ b/package/libp11/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBP11
> +	bool "libp11"

This lacked a:

	depends on !BR2_STATIC_LIBS

as libp11 requires dlopen(). This was detected by
using ./utils/test-pkg.

> diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
> new file mode 100644
> index 0000000000..9dc098870e
> --- /dev/null
> +++ b/package/libp11/libp11.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libp11
> +#
> +################################################################################
> +
> +LIBP11_VERSION = 0.4.9
> +LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
> +LIBP11_DEPENDENCIES = openssl

It also needs host-pkgconf, because pkg-config is used to detect
OpenSSL.

Then, even with this fixed, the package didn't build because it was
installing its OpenSSL modules in the wrong folder, as pkg-config
--variable enginesdir libcrypto returned a bogus value. I fixed that by
passing --with-enginesdir.

> +LIBP11_INSTALL_STAGING = YES
> +LIBP11_LICENSE = LGPLv2.1

I fixed the license information as well, as pointed out by Frank
Hunleth in a previous review.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
