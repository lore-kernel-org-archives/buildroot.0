From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:37:34 +0200
Subject: [Buildroot] [PATCH v2] pkcs11-helper: new package
In-Reply-To: <20191030005604.81615-2-aduskett@gmail.com>
References: <20191030005604.81615-1-aduskett@gmail.com>
 <20191030005604.81615-2-aduskett@gmail.com>
Message-ID: <20200412233734.29ae1f7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title was not correct, should have been:

	package/pkcs11-helper: new package

On Tue, 29 Oct 2019 17:56:03 -0700
aduskett at gmail.com wrote:

> +config BR2_PACKAGE_PKCS11_HELPER_GNUTLS_ENGINE
> +	bool "gnutls engine support"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GNUTLS
> +
> +comment "gnutls support needs a toolchain w/ wchar, dynamic library"
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_PKCS11_HELPER_MBEDTLS_ENGINE
> +	bool "mbedtls engine support"
> +	select BR2_PACKAGE_MBEDTLS
> +
> +config BR2_PACKAGE_PKCS11_HELPER_NSS_ENGINE
> +	bool "nss engine support"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBNSS
> +
> +comment "nss support needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_PKCS11_HELPER_OPENSSL_ENGINE
> +	bool "openssl engine support"
> +	select BR2_PACKAGE_OPENSSL

I have dropped all those sub-options, and replaced them by automatic
detection in the .mk file: we enable the crypto backends depending on
which packages are available.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
