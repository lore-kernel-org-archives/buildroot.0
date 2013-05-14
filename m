From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 May 2013 00:32:14 +0200
Subject: [Buildroot] [PATCH 4/6] libcurl: bump to version 7.30.0
In-Reply-To: <1368463259-18958-4-git-send-email-gustavo@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5192BB6E.2090304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 18:40, Gustavo Zacarias wrote:
> And add support for other SSL backends such as gnutls, nss and polarssl.
> Also add support for libidn and zlib.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[snip]
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index f0236d9..39eef10 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,9 +4,12 @@
>   #
>   #############################################################
>
> -LIBCURL_VERSION = 7.28.1
> +LIBCURL_VERSION = 7.30.0
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
>   LIBCURL_SITE = http://curl.haxx.se/download
> +LIBCURL_DEPENDENCIES = host-pkgconf \
> +	$(if $(BR2_PACKAGE_ZLIB),zlib) \
> +	$(if $(BR2_PACKAGE_LIBIDN),libidn)
>   LIBCURL_LICENSE = ICS
>   LIBCURL_LICENSE_FILES = COPYING
>   LIBCURL_INSTALL_STAGING = YES
> @@ -15,23 +18,34 @@ LIBCURL_INSTALL_STAGING = YES
>   # on non-MMU platforms. Moreover, this authentication method is
>   # probably almost never used. See
>   # http://curl.haxx.se/docs/manpage.html#--ntlm.
> -LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
> -	--enable-hidden-symbols --disable-ntlm-wb
> +LIBCURL_CONF_OPT = --disable-verbose --disable-manual --disable-ntlm-wb \
> +	--enable-hidden-symbols --with-random=/dev/urandom

  Is the --with-random now needed without ssl as well?

>   LIBCURL_CONFIG_SCRIPTS = curl-config
>
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -LIBCURL_DEPENDENCIES += openssl
>   LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
>   # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
>   # native stuff during the rest of configure when target == host.
>   # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
>   # are found first.
> +LIBCURL_DEPENDENCIES += openssl

  Moving this a couple of lines down is not necessary...

>   LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
>   LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
> -	--with-random=/dev/urandom \
>   	--with-ca-path=/etc/ssl/certs
> +LIBCURL_DEPENDENCIES += openssl

  ... and duplicating it certainly isn't!

> +else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +LIBCURL_CONF_OPT += --with-gnutls=$(STAGING_DIR)/usr

  No need for ca-path? (Same for the others.)

  Regards,
  Arnout

> +LIBCURL_DEPENDENCIES += gnutls
> +else ifeq ($(BR2_PACKAGE_POLARSSL),y)
> +LIBCURL_CONF_OPT += --with-polarssl=$(STAGING_DIR)/usr
> +LIBCURL_DEPENDENCIES += polarssl
> +else ifeq ($(BR2_PACKAGE_LIBNSS),y)
> +LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
> +LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
> +LIBCURL_DEPENDENCIES += libnss
>   else
> -LIBCURL_CONF_OPT += --without-ssl
> +LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
> +	--without-polarssl --without-nss
>   endif
>
>   define LIBCURL_FIX_DOT_PC
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
