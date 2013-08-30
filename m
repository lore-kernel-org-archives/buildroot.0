From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Aug 2013 06:55:21 +0300
Subject: [Buildroot] [PATCH v2 1/2] libssh2: add support for new package
 libssh2
In-Reply-To: <1377815546-3125-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1377815546-3125-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377815546-3125-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130830035521.GX3773@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Thu, Aug 29, 2013 at 05:32:25PM -0500, Ryan Barnett wrote:
> Adding new package - libssh2 - under
> Target packages > Libraries > Crypto > libssh2
> 
> libssh2 is a client-side C library implementing the SSH2 protocol.
> 
> For more information on this package - see their website:
> http://www.libssh2.org/
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---

[...]

> +# libssh2 must use either libgcrypt or OpenSSL
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBSSH2_DEPENDENCIES += openssl
> +LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
> +endif

You should probably use 'else' here. What if both BR2_PACKAGE_OPENSSL and 
BR2_PACKAGE_LIBGCRYPT ares selected? You end up with

LIBSSH2_CONF_OPT ~= --with-openssl --without-libgcrypt --with-libgcrypt \
    --without-openssl

which is not what you want. You might also want to reverse the order since 
libgcrypt is considered the default.

baruch

> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +LIBSSH2_DEPENDENCIES += libgcrypt
> +LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
> +endif
> +
> +# Add zlib support if enabled
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +LIBSSH2_DEPENDENCIES += zlib
> +LIBSSH2_CONF_OPT += --with-libz
> +else
> +LIBSSH2_CONF_OPT += --without-libz
> +endif
> +
> +$(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
