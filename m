From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:39:02 +0200
Subject: [Buildroot] [PATCH 1/1] libjwt: new package.
In-Reply-To: <20180811202925.3547-1-mikael@robomagi.com>
References: <20180811202925.3547-1-mikael@robomagi.com>
Message-ID: <20180812143902.5dde6618@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mikael,

First of all, thanks for your contribution!

On Sat, 11 Aug 2018 22:29:25 +0200, Mikael wrote:
> Signed-off-by: Mikael <mikael@robomagi.com>

Could you use your full first name + last name when contributing? This
is important for legal reasons.

> diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
> new file mode 100644
> index 0000000000..81e33e6d93
> --- /dev/null
> +++ b/package/libjwt/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBJWT
> +	bool "libjwt"
> +	depends on BR2_INSTALL_LIBSTDCPP

There is no C++ anywhere in this package, and none of the dependencies
require C++. To me, it seems like the CMakeLists.txt should be changed
from:

project (jwt)

to

project (jwt C)

which tells CMake that the project is using C only, and no C++.

> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_OPENSSL

Are you sure OpenSSL is mandatory ? I see a possibility to use GnuTLS
as well:

if (WITHOUT_OPENSSL)
	find_package (GnuTLS REQUIRED)
	set (FILES_TO_REMOVE ${CMAKE_CURRENT_SOURCE_DIR}/jwt-openssl.c)
	set (SSL_LIBRARY_INCLUDE_DIR ${GNUTLS_INCLUDE_DIR})
	set (SSL_LIBRARIES_DEBUG ${GNUTLS_LIBRARY})
	set (SSL_LIBRARIES_OPTIMIZED ${GNUTLS_LIBRARY})
else ()
	if (MSVC AND STATIC_RUNTIME)
		set (OPENSSL_MSVC_STATIC_RT TRUE)
	endif ()
	find_package (OpenSSL REQUIRED)
	set (FILES_TO_REMOVE ${CMAKE_CURRENT_SOURCE_DIR}/jwt-gnutls.c)
	set (SSL_LIBRARY_INCLUDE_DIR ${OPENSSL_INCLUDE_DIR})
	if (MSVC)
		set (SSL_LIBRARIES_DEBUG ${LIB_EAY_DEBUG} ${SSL_EAY_DEBUG})
		set (SSL_LIBRARIES_OPTIMIZED ${LIB_EAY_RELEASE} ${SSL_EAY_RELEASE})
	else ()
		set (SSL_LIBRARIES_DEBUG ${OPENSSL_CRYPTO_LIBRARY})
		set (SSL_LIBRARIES_OPTIMIZED ${OPENSSL_CRYPTO_LIBRARY})
	endif ()
endif ()

So perhaps, you could do:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS

And the in the .mk file, pass -DWITHOUT_OPENSSL= if GnuTLS is
available, but not OpenSSL:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBJWT_DEPENDENCIES += openssl
else
LIBJWT_DEPENDENCIES += gnutls
LIBJWT_CONF_OPTS += -DWITHOUT_OPENSSL=1
endif

> +	help
> +	  JSON Web Tokens are an open, industry standard RFC 7519
> +	  method for representing claims securely between two parties.
> +
> +	  https://github.com/benmcollins/libjwt
> +
> +comment "libjwt needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
> new file mode 100644
> index 0000000000..c8b7ed168a
> --- /dev/null
> +++ b/package/libjwt/libjwt.hash
> @@ -0,0 +1,2 @@
> +#Locally computed
> +sha256 cc694dfc3abe17d1f5cde4bf6714e39dc17f7cbad352a85ffb0fe6418c584076 libjwt-v1.9.0.tar.gz

Could you add the hash of the COPYING.LIB license file ?

> diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
> new file mode 100644
> index 0000000000..2007d6c541
> --- /dev/null
> +++ b/package/libjwt/libjwt.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libjwt
> +#
> +################################################################################
> +
> +LIBJWT_VERSION = v1.9.0
> +LIBJWT_SITE = $(call github,benmcollins,libjwt,$(LIBJWT_VERSION))
> +LIBJWT_INSTALL_STAGING = YES
> +LIBJWT_DEPENDENCIES = jansson openssl
> +LIBJWT_LICENSE = LGPL-3.0-only

We use LGPL-3.0 in this case (i.e we don't obey strictly to SPDX, we
probably should, but we don't yet, and we should have a single package
deviates from what we do in the rest of Buildroot).

> +LIBJWT_LICENSE_FILES = COPYING.LIB
> +
> +$(eval $(cmake-package))

Finally, could you test this package with "utils/test-pkg" ? I am
wondering if it builds properly in a static-only configuration.
utils/test-pkg will test this for you.

Could you take into account those comments, and send an updated
version ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
