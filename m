From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Nov 2018 22:33:16 +0100
Subject: [Buildroot] [PATCH] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <20181108001209.14889-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Thu, 8 Nov 2018 00:12:23 +0000")
References: <20181108001209.14889-1-tpiepho@impinj.com>
Message-ID: <87ftwb8db7.fsf@dell.be.48ers.dk>
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

Ok, nice description.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>
 > ---
 >  package/libcurl/Config.in  | 28 ++++++++++++++++++++++++++++
 >  package/libcurl/libcurl.mk | 15 ++++++++-------
 >  2 files changed, 36 insertions(+), 7 deletions(-)

 > diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
 > index 21c2ee2b7f..0b2334beb9 100644
 > --- a/package/libcurl/Config.in
 > +++ b/package/libcurl/Config.in
 > @@ -19,4 +19,32 @@ config BR2_PACKAGE_LIBCURL_VERBOSE
 >  	help
 >  	  Enable verbose text strings
 
 > +choice
 > +	prompt "SSL/TLS library to use"
 > +	default BR2_PACKAGE_LIBCURL_OPENSSL if BR2_PACKAGE_OPENSSL
 > +	default BR2_PACKAGE_LIBCURL_GNUTLS if BR2_PACKAGE_GNUTLS
 > +	default BR2_PACKAGE_LIBCURL_LIBNSS if BR2_PACKAGE_LIBNSS
 > +	default BR2_PACKAGE_LIBCURL_MBEDTLS if BR2_PACKAGE_MBEDTLS

kconfig defaults to the first available option, so these default .. if
.. can be removed.

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
 > +config BR2_PACKAGE_LIBCURL_NOSSL
 > +	bool "No SSL/TLS support"

Is there really a use case for building curl without TLS support if one
or more of the libraries are available? If not, then I would simply make
the choice depend on openssl || gnutls || libnss || mbedtls and drop
this nossl option.

-- 
Bye, Peter Korsgaard
