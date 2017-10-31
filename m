From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Oct 2017 18:29:09 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/libssh2: Update to newest
	version
In-Reply-To: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171031162909.64j2yytf4e6yfs7d@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Tue, Oct 31, 2017 at 10:53:37AM -0500, Sam Voss wrote:
> Update libssh2 to use the newest version from git. This caused a
> transition from released version number to hash as it has not been
> version rev'd in over a year (see issue
> https://github.com/libssh2/libssh2/issues/220 for bump request).
> 
> This brings in changes to the autoconf to correctly pick the crypto
> library.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> --

[...]

> diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
> index 6b1cced..f0df7a2 100644
> --- a/package/libssh2/libssh2.hash
> +++ b/package/libssh2/libssh2.hash
> @@ -1,3 +1,2 @@
>  # Locally calculated after checking pgp signature

The pgp signature part is no longer true.

> -# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
> -sha256	39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4	libssh2-1.8.0.tar.gz
> +sha256 e73d55cd512863aa6423c6e137039e3e1bcbf5ba87f130e7441132c2c78a5425 libssh2-616fd4d1b3e4a55de67c48819fefca83132126b5.tar.gz
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index dedb890..84f2113 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -4,32 +4,33 @@
>  #
>  ################################################################################
>  
> -LIBSSH2_VERSION = 1.8.0
> -LIBSSH2_SITE = http://www.libssh2.org/download
> +LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
> +LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
>  LIBSSH2_LICENSE = BSD
>  LIBSSH2_LICENSE_FILES = COPYING
>  LIBSSH2_INSTALL_STAGING = YES
>  LIBSSH2_CONF_OPTS = --disable-examples-build
>  
> +# autoreconf must be ran when building off git, as it has not been ran at hash
> +LIBSSH2_AUTORECONF = YES
> +
>  # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
> -# Config.in. Favour mbedtls.
> +# Config.in.

This change belongs to the next patch.

>  ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
> -LIBSSH2_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
> -	--without-openssl --without-libgcrypt
> -LIBSSH2_CONF_ENV += ac_cv_libgcrypt=no
> +LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
> +	--with-crypto=mbedtls
>  else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  LIBSSH2_DEPENDENCIES += libgcrypt
> -LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
> -	--without-openssl --without-mbedtls
> +LIBSSH2_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
> +	--with-crypto=libgcrypt
>  # configure.ac forgets to link to dependent libraries of gcrypt breaking static
>  # linking
>  LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
>  else
>  LIBSSH2_DEPENDENCIES += openssl
> -LIBSSH2_CONF_OPTS += --with-openssl \
> -	--with-libssl-prefix=$(STAGING_DIR)/usr \
> -	--without-libgcrypt --without-mbedtls
> +LIBSSH2_CONF_OPTS += --with-libssl-prefix=$(STAGING_DIR)/usr \
> +	--with-crypto=openssl
>  endif
>  
>  # Add zlib support if enabled

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
