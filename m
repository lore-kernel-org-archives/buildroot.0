From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 21:55:23 +0200
Subject: [Buildroot] [PATCH v3 3/3] libressl: new package
In-Reply-To: <20170626162538.27101-3-aduskett@codeblue.com>
References: <20170626162538.27101-1-aduskett@codeblue.com>
 <20170626162538.27101-3-aduskett@codeblue.com>
Message-ID: <75c918e8-221d-a781-d5f9-911ff124445a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-06-17 18:25, Adam Duskett wrote:
> Libressl is a fork of openssl from OpenSSL in 2014.  Its goal is to
> modernize the OpenSSL codebase, improve security, and apply best
> practice development processes.
> 
> Right now, libressl is API compatible with OpenSSL 1.0.1, but does not
> yet include all new APIs from OpenSSL 1.0.2 and later.

 This looks largely OK to me (after converting back to non-virtual package of
course), with one small addition.

 Oh, and when adding in package/Config.in, I think this package should break
alphabetical ordering and come right below libressl, with a comment to explain
that it break alphabetical ordering because it's an openssl replacement.

[snip]
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> new file mode 100644
> index 0000000..ca8bf34
> --- /dev/null
> +++ b/package/libressl/libressl.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libressl
> +#
> +################################################################################
> +
> +LIBRESSL_VERSION = 2.5.4
> +LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
> +LIBRESSL_LICENSE = ISC (New additions), OpenSSL or SSLeay (Original OpenSSL code)
                           ^                                  ^
 Don't capitalize here, we don't do that anywhere else.

 Regards,
 Arnout

> +LIBRESSL_LICENSE_FILES = COPYING
> +LIBRESSL_INSTALL_STAGING = YES
> +LIBRESSL_PROVIDES = libssl
> +
> +ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
> +define LIBRESSL_REMOVE_BIN
> +	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
> +endef
> +LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
> +endif
> +
> +$(eval $(autotools-package))
> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
> index 5b912e6..5f81348 100644
> --- a/package/libssl/Config.in
> +++ b/package/libssl/Config.in
> @@ -9,7 +9,7 @@ choice
>  	prompt "libssl variant"
>  	default BR2_PACKAGE_OPENSSL
>  	help
> -	  Select OpenSSL
> +	  Select OpenSSL or LibreSSL
>  
>  config BR2_PACKAGE_OPENSSL
>  	bool "openssl"
> @@ -25,6 +25,16 @@ config BR2_PACKAGE_OPENSSL
>  	  http://www.openssl.org/
>  	  Note: Some helper scripts need perl.
>  
> +config BR2_PACKAGE_LIBRESSL
> +	bool "libressl"
> +	select BR2_PACKAGE_HAS_LIBSSL
> +	help
> +	  LibreSSL is a version of the TLS/crypto stack forked from
> +	  OpenSSL in 2014, with goals of modernizing the codebase,
> +	  improving security, and applying best practice development
> +	  processes.
> +
> +	  http://www.libressl.org/
>  endchoice
>  
>  if BR2_PACKAGE_OPENSSL
> @@ -43,11 +53,20 @@ config BR2_PACKAGE_OPENSSL_ENGINES
>  
>  endif
>  
> +if BR2_PACKAGE_LIBRESSL
> +
> +config BR2_PACKAGE_LIBRESSL_BIN
> +	bool "openssl binary"
> +	help
> +	  Install the openssl binary to the target file system. This is
> +	  a command line tool for doing various cryptographic stuff.
> +
> +endif
>  config BR2_PACKAGE_HAS_LIBSSL
>  	bool
>  
>  config BR2_PACKAGE_PROVIDES_LIBSSL
>  	string
>  	default "openssl"    if BR2_PACKAGE_OPENSSL
> -
> +	default "libressl"   if BR2_PACKAGE_LIBRESSL
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
