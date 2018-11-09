From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 22:56:52 +0100
Subject: [Buildroot] [PATCH v2] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <20181108222517.20629-1-tpiepho@impinj.com>
References: <20181108222517.20629-1-tpiepho@impinj.com>
Message-ID: <89e08627-ea80-393e-53da-c8ab90df66f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Trent,

On 08/11/2018 23:25, Trent Piepho wrote:
> Instead of defaulting to OpenSSL, allow selection of package to use
> through a choice in libcurl's config.  The default will be to select the
> first enabled TLS provider in the same preference order as is used now,
> i.e. no change from current behavior.
> 
> Some of the alternative libraries have advantages over OpenSSL in
> certain areas.
> 
> For example, gnutls has vastly superior PKCS11 support.  One can use
> client TLS private keys by supplying a PKCS11 URI instead of a private
> key file name.  The TLS server cert trust store can be a PKCS11 URI,
> e.g. configure libcurl with a ca-bundle of "pkcs11:model=p11-kit-trust". 
> Now server certs can be stored in a software and/or hardware HSM(s). 
> This doesn't work with OpenSSL.
> 
> However, some software only supports OpenSSL for TLS or other crypto
> functions.  So it might be necessary to enable OpenSSL for that reason.

 As Peter already said: excellent explanation, thanks!

> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
> Changes since v1:
>   Removed unneeded defaults.
>   Removed no TLS choice, replaced with comment
> 
>  package/libcurl/Config.in  | 25 +++++++++++++++++++++++++
>  package/libcurl/libcurl.mk | 15 ++++++++-------
>  2 files changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 21c2ee2b7f..6309e5bfc0 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -19,4 +19,29 @@ config BR2_PACKAGE_LIBCURL_VERBOSE
>  	help
>  	  Enable verbose text strings
>  
> +choice
> +	prompt "SSL/TLS library to use"
> +
> +config BR2_PACKAGE_LIBCURL_OPENSSL
> +	bool "OpenSSL"
> +	depends on BR2_PACKAGE_OPENSSL

 I don't really like this depends. I would rather revert it into a select. So:

choice
	prompt "SSL/TLS library to use"

config BR2_PACKAGE_LIBCURL_OPENSSL
	bool "openssl"
	select BR2_PACKAGE_OPENSSL

...

config BR2_PACKAGE_LIBCURL_NONE
	bool "disable TLS"

endchoice

 Note that that means that libcurl will by default select openssl, which was not
the case before. However, I think it makes complete sense to default to enabling
TLS support in libcurl. Peter, what do you think? This would obviously have to
be mentioned in the release notes because the behaviour of existing configs
would change.

 Regards,
 Arnout

> +
> +config BR2_PACKAGE_LIBCURL_GNUTLS
> +	bool "GnuTLS"
> +	depends on BR2_PACKAGE_GNUTLS
> +
> +config BR2_PACKAGE_LIBCURL_LIBNSS
> +	bool "NSS"
> +	depends on BR2_PACKAGE_LIBNSS
> +
> +config BR2_PACKAGE_LIBCURL_MBEDTLS
> +	bool "mbed TLS"
> +	depends on BR2_PACKAGE_MBEDTLS
> +
> +endchoice
> +
> +comment "A TLS library is needed for SSL/TLS support"
> +       depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && \
> +                  !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_MBEDTLS
> +
>  endif
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index c3da8aa3e5..ac368fbb53 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -35,7 +35,7 @@ endif
>  
>  LIBCURL_CONFIG_SCRIPTS = curl-config
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>  LIBCURL_DEPENDENCIES += openssl
>  # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
>  # native stuff during the rest of configure when target == host.
> @@ -44,15 +44,16 @@ LIBCURL_DEPENDENCIES += openssl
>  LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
>  LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
>  	--with-ca-path=/etc/ssl/certs
> -else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> -LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
> +else ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
> +LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr --without-ssl
>  LIBCURL_DEPENDENCIES += gnutls
> -else ifeq ($(BR2_PACKAGE_LIBNSS),y)
> -LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
> +else ifeq ($(BR2_PACKAGE_LIBCURL_LIBNSS),y)
> +LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr --without-ssl --without-gnutls
>  LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
>  LIBCURL_DEPENDENCIES += libnss
> -else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> -LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
> +else ifeq ($(BR2_PACKAGE_LIBCURL_MBEDTLS),y)
> +LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
> +	--without-ssl --without-gnutls --without-nss
>  LIBCURL_DEPENDENCIES += mbedtls
>  else
>  LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
> 
