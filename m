From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 13:36:39 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
Message-ID: <20200426113639.GA5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-26 13:05 +0200, Fabrice Fontaine spake thusly:
> ualpn with mbedtls requires the activation of
> MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION on mbedtls which can
> be a security risk.
> 
> So let the user explicitly choose the crypto library by copy/pasting
> behavior of libssh and don't allow the user to select mbedtls with ualpn
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5d42189299549cd655218e9e7cfcfa63e79f74ec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 58b7c534e7..ba60d787f0 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -16,6 +16,30 @@ config BR2_PACKAGE_UACME
>  
>  if BR2_PACKAGE_UACME
>  
> +choice
> +	prompt "Crypto Backend"
> +	help
> +	  Select crypto library to be used in uacme.
> +
> +config BR2_PACKAGE_UACME_GNUTLS
> +	bool "gnutls"
> +	depends on BR2_PACKAGE_GNUTLS
> +
> +config BR2_PACKAGE_UACME_MBEDTLS
> +	bool "mbedtls"
> +	depends on BR2_PACKAGE_MBEDTLS
> +	depends on !BR2_PACKAGE_UACME_UALPN
> +
> +comment "mbedtls crypto backend unavailable with ualpn"
> +	depends on BR2_PACKAGE_MBEDTLS
> +	depends on BR2_PACKAGE_UACME_UALPN
> +
> +config BR2_PACKAGE_UACME_OPENSSL
> +	bool "openssl"
> +	depends on BR2_PACKAGE_OPENSSL
> +
> +endchoice

Sorry, but this is still not correct: enable mbedtls, then enable uacme
and ualpn: there is no crypto backend selectable in the choice...

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_UACME_UALPN
>  	bool "enable ualpn"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index 6df13eced6..90c3a24c13 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -15,13 +15,13 @@ UACME_DEPENDENCIES = libcurl
>  
>  UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  
> -ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +ifeq ($(BR2_PACKAGE_UACME_GNUTLS),y)
>  UACME_CONF_OPTS += --with-gnutls
>  UACME_DEPENDENCIES += gnutls
> -else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +else ifeq ($(BR2_PACKAGE_UACME_MBEDTLS),y)
>  UACME_CONF_OPTS += --with-mbedtls
>  UACME_DEPENDENCIES += mbedtls
> -else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +else ifeq ($(BR2_PACKAGE_UACME_OPENSSL),y)
>  UACME_CONF_OPTS += --with-openssl
>  UACME_DEPENDENCIES += openssl
>  endif
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
