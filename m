From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Nov 2018 22:20:02 +0100
Subject: [Buildroot] [PATCH v2] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <20181108222517.20629-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Thu, 8 Nov 2018 22:25:31 +0000")
References: <20181108222517.20629-1-tpiepho@impinj.com>
Message-ID: <87r2fq56yl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > Instead of defaulting to OpenSSL, allow selection of package to use
 > through a choice in libcurl's config.  The default will be to select the
 > first enabled TLS provider in the same preference order as is used now,
 > i.e. no change from current behavior.

 > Some of the alternative libraries have advantages over OpenSSL in
 > certain areas.

 > For example, gnutls has vastly superior PKCS11 support.  One can use
 > client TLS private keys by supplying a PKCS11 URI instead of a private
 > key file name.  The TLS server cert trust store can be a PKCS11 URI,
 > e.g. configure libcurl with a ca-bundle of "pkcs11:model=p11-kit-trust". 
 > Now server certs can be stored in a software and/or hardware HSM(s). 
 > This doesn't work with OpenSSL.

 > However, some software only supports OpenSSL for TLS or other crypto
 > functions.  So it might be necessary to enable OpenSSL for that reason.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>
 > ---
 > Changes since v1:
 >   Removed unneeded defaults.
 >   Removed no TLS choice, replaced with comment

 >  package/libcurl/Config.in  | 25 +++++++++++++++++++++++++
 >  package/libcurl/libcurl.mk | 15 ++++++++-------
 >  2 files changed, 33 insertions(+), 7 deletions(-)

 > diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
 > index 21c2ee2b7f..6309e5bfc0 100644
 > --- a/package/libcurl/Config.in
 > +++ b/package/libcurl/Config.in
 > @@ -19,4 +19,29 @@ config BR2_PACKAGE_LIBCURL_VERBOSE
 >  	help
 >  	  Enable verbose text strings
 
 > +choice
 > +	prompt "SSL/TLS library to use"

This choice should be hidden if none of the dependencies are
available. As we also need (the inverse of) the same for the comment
below I have added a blind BR2_PACKAGE_LIBCURL_TLS_SUPPORT option when
depends on openssl/gnutls/libnss/mbedtls and used it here and for the
comment.


> +
 > +config BR2_PACKAGE_LIBCURL_OPENSSL
 > +	bool "OpenSSL"
 > +	depends on BR2_PACKAGE_OPENSSL
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
 
 >  LIBCURL_CONFIG_SCRIPTS = curl-config
 
 > -ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > +ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 >  LIBCURL_DEPENDENCIES += openssl
 >  # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 >  # native stuff during the rest of configure when target == host.
 > @@ -44,15 +44,16 @@ LIBCURL_DEPENDENCIES += openssl
 >  LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 >  LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 >  	--with-ca-path=/etc/ssl/certs

I think it is cleaner to handle each option on its own instead of ifeg
.. else ifeq .. else ifeq now that Config.in ensures only one of them is
available. That way we also ensure we pass all the correct --without
options so the configure script doesn't decide to use another TLS
provider than what is selected.

E.G.:

ifeq ($(BR2_PACKAGE_LIBCURL_FOO))
LIBCURL_CONF_OPTS += --with-foo
LIBCURL_DEPENDENCIES += foo
else
LIBCURL_CONF_OPTS += --without-foo
endif

ifeq ($(BR2_PACKAGE_LIBCURL_BAR))
LIBCURL_CONF_OPTS += --with-bar
LIBCURL_DEPENDENCIES += bar
else
LIBCURL_CONF_OPTS += --without-bar
endif

..

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

There was still a place where BR2_PACKAGE_OPENSSL was checked (for the
.pc fixup) instead of BR2_PACKAGE_LIBCURL_OPENSSL.

Committed to next with these fixes, thanks.

-- 
Bye, Peter Korsgaard
