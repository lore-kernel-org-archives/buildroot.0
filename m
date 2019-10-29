From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:27:08 +0100
Subject: [Buildroot] [PATCH 4/5] pkcs11-helper: new package
In-Reply-To: <20191028212414.123964-4-aduskett@gmail.com>
References: <20191028212414.123964-1-aduskett@gmail.com>
 <20191028212414.123964-4-aduskett@gmail.com>
Message-ID: <6df5a2ae-9a24-5e9f-be14-d5b6db05b2ba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 22:24, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> pkcs11-helper is a library that simplifies the interaction with PKCS#11
> providers for end-user applications. Pkcs11-helper allows using multiple
> PKCS#11 providers at the same time, enumerating available token
> certificates, or selecting a certificate directly by serialized id, handling
> card removal and card insert events, handling card re-insert to a different
> slot, supporting session expiration and much more all using a simple API.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

[snip]
> +config BR2_PACKAGE_PKCS11_HELPER
> +	bool "pkcs11-helper"
> +	help
> +	  pkcs11-helper is a library that simplifies the interaction
> +	  with PKCS#11 providers for end-user applications.
> +
> +	  pkcs11-helper allows using multiple PKCS#11 providers at the
> +	  same time, enumerating available token certificates, or
> +	  selecting a certificate directly by serialized id, handling
> +	  card removal and card insert events, handling card re-insert
> +	  to a different slot, supporting session expiration and much
> +	  more all using a simple API.
> +
> +	  pkcs11-helper is not designed to manage card content, since
> +	  object attributes are usually vendor specific, and 99% of
> +	  application need to access existing objects in order to
> +	  perform signature and decryption.
> +
> +	  https://github.com/OpenSC/pkcs11-helper
> +
> +if BR2_PACKAGE_PKCS11_HELPER
> +
> +config BR2_PACKAGE_PKCS11_HELPER_GNUTLS_ENGINE
> +	bool "gnutls engine support"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GNUTLS

 As usual, bikeshedding over the Config.in options :-)

 AFAIU, pkcs11-helper can be of limited use on its own (dumping info about
tokens, presumably it automatically connects to pcscd if available). So a crypto
engine is not strictly needed. But, again AFAIU, it's real use is to serve as a
plugin for the various crypto libraries so they can use the token. Is that correct?

 So, I would think that the logic is that you first select your crypto
provider(s) (possibly implicitly through a package that uses a crypto provider),
and then you add the pkcs11 "plugin" to it. So to me it seems more logical to
use depends on gnutls than select.

 But then, I wonder if it even makes sense to make it optional. Does it cost a
lot of code size to add an engine if that particular crypto library is anyway built?

 I may be all wrong about this though.

 I've not marked this as Changes Requested since it may be OK as is.

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
> +
> +endif
> diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
> new file mode 100644
> index 0000000000..28ef74b410
> --- /dev/null
> +++ b/package/pkcs11-helper/pkcs11-helper.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  fbcec9dd15a71d6ef22b09f63934c66d7d0292fefbaf3a60703ee4a9a73bf6a5  pkcs11-helper-pkcs11-helper-1.25.1.tar.gz
> +sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
> diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
> new file mode 100644
> index 0000000000..07a0c046ad
> --- /dev/null
> +++ b/package/pkcs11-helper/pkcs11-helper.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# pkcs11-helper
> +#
> +################################################################################
> +
> +PKCS11_HELPER_VERSION = pkcs11-helper-1.25.1

 This is like the v prefix: we want version as 1.25.1 and the pkcs11-helper-
prefix in the _SITE variable.

> +PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,$(PKCS11_HELPER_VERSION))
> +PKCS11_HELPER_LICENSE = GPL-2.0

 COPYING says that it is GPL-2.0 OR BSD-3-Clause.

 It also mentions the OpenSSL and gnutls etc. licenses, but I don't think those
sources are included so that's just wrong.

> +PKCS11_HELPER_LICENSE_FILES = COPYING

 You also need to include COPYING.BSD and COPYING.GPL.


> +PKCS11_HELPER_AUTORECONF = YES
> +PKCS11_HELPER_INSTALL_STAGING = YES
> +
> +PKCS11_HELPER_CONF_OPTS = \
> +	--disable-crypto-engine-polarssl \

 Weird... polarssl is just mbedtls...

> +	--disable-crypto-engine-cryptoapi \

 cryptoapi... Is that the kernel AF_CRYPTO interface? That should always be
supported then...

> +	--disable-dependency-tracking

 We don't usually specify that.

 Regards,
 Arnout

> +
> +ifeq ($(BR2_PACKAGE_PKCS11_HELPER_GNUTLS_ENGINE),y)
> +PKCS11_HELPER_DEPENDENCIES += gnutls
> +PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-gnutls
> +else
> +PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-gnutls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PKCS11_HELPER_NSS_ENGINE),y)
> +PKCS11_HELPER_DEPENDENCIES += libnss
> +PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-nss
> +else
> +PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-nss
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PKCS11_HELPER_MBEDTLS_ENGINE),y)
> +PKCS11_HELPER_DEPENDENCIES += mbedtls
> +PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-mbedtls
> +else
> +PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-mbedtls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PKCS11_HELPER_OPENSSL_ENGINE),y)
> +PKCS11_HELPER_DEPENDENCIES += openssl
> +PKCS11_HELPER_CONF_OPTS += \
> +	--enable-openssl \
> +	--enable-crypto-engine-openssl
> +else
> +PKCS11_HELPER_CONF_OPTS += \
> +	--disable-openssl \
> +	--disable-crypto-engine-openssl
> +endif
> +
> +$(eval $(autotools-package))
> 
