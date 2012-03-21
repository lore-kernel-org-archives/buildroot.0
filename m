From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 16:20:14 +0100
Subject: [Buildroot] Libcurl : to depend or not to depend ?
In-Reply-To: <8E5E9D7D337A4C58AD26215008FACEF4@JohanW7>
References: <8E5E9D7D337A4C58AD26215008FACEF4@JohanW7>
Message-ID: <20120321162014.6e2fd485@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Mar 2012 16:06:52 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> After my issue last week with libcurl it seems that libcurl uses openssl if it has been found. (if it was build before libcurl)
> If its not found then libcurl simply has no SSL support.
> So libcurl is'nt really dependend of openssl.
> It may be better i think to have an option in the config to enable/disable ssl for libcurl.
> In case ssl is enabled then libcurl should be made dependend of openssl.

libcurl already has the following code:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBCURL_DEPENDENCIES += openssl
LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
# native stuff during the rest of configure when target == host.
# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
# are found first.
LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
else
LIBCURL_CONF_OPT += --without-ssl
endif

Which means that:

 * If the OpenSSL package is selected, then we guarantee that it is
   build *before* libcurl, and libcurl is built with OpenSSL support.

 * If the OpenSSL package is not selected, then we force libcurl to be
   compiled without SSL support

It doesn't work for you?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
