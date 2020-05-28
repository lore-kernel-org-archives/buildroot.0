From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:33:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] gloox: new package
In-Reply-To: <CslBIYDGe4BUOvGIdHlTB0sFo8pMXh3qKilRP_74vVORercVX6JU15UWVy9B4nGfUbK0qwrpyfmQTNtYJq2byWLupxAZOiZ2MzjOoDDnTHQ=@protonmail.com>
References: <CslBIYDGe4BUOvGIdHlTB0sFo8pMXh3qKilRP_74vVORercVX6JU15UWVy9B4nGfUbK0qwrpyfmQTNtYJq2byWLupxAZOiZ2MzjOoDDnTHQ=@protonmail.com>
Message-ID: <20200528223336.62c62062@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yair,

On Tue, 19 May 2020 08:26:30 +0000
Yair Ben-Avraham <yairba@protonmail.com> wrote:

> gloox is a rock-solid, full-featured Jabber/XMPP client library, written in
> clean ANSI C++. It makes writing spec-compliant clients easy and allows for
> hassle-free integration of Jabber/XMPP functionality into existing
> applications. gloox is released under the GNU GPLv3. Commercial licensing and
> support are available.
> 
> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>

I've applied your patch to our next branch, but after fixing a few
things. See below.

> ---
>  package/Config.in        |  1 +
>  package/gloox/Config.in  | 16 ++++++++++++++
>  package/gloox/gloox.hash |  3 +++
>  package/gloox/gloox.mk   | 47 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)

Your forgot to add an entry to the DEVELOPERS file, so I've done so.


> diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
> new file mode 100644
> index 0000000000..a7df492566
> --- /dev/null
> +++ b/package/gloox/gloox.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# gloox
> +#
> +################################################################################
> +
> +GLOOX_VERSION = 1.0.23
> +GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
> +GLOOX_SITE = https://camaya.net/download
> +GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
> +GLOOX_LICENSE_FILES = LICENSE
> +GLOOX_INSTALL_STAGING = YES
> +
> +GLOOX_DEPENDENCIES += mpc

No need for += here, = is fine as it's an unconditional dependency.

> +GLOOX_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +GLOOX_CXXFLAGS += -O0
> +endif

This GLOOX_CXXFLAGS variable was not used anywhere. In a previous
iteration, you correctly had:

GLOOX_CONF_ENV += CXXFLAGS="$(GLOOX_CFLAGS)"

So I've re-added that.

> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GLOOX_CONF_ENV += LIBS=-latomic
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +GLOOX_CONF_OPTS += --with-zlib
> +GLOOX_DEPENDENCIES += zlib
> +else
> +GLOOX_CONF_OPTS += --without-zlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +GLOOX_CONF_OPTS += --with-openssl --without-gnutls
> +GLOOX_DEPENDENCIES += openssl
> +else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +GLOOX_CONF_OPTS += --with-gnutls --without-openssl
> +GLOOX_DEPENDENCIES += gnutls
> +else
> +GLOOX_CONF_OPTS += --without-gnutls --without-openssl
> +endif
> +
> +GLOOX_CONF_OPTS += \
> +	--without-libidn \
> +	--enable-getaddrinfo

No need for += here as well, and I've moved this up, together with the
unconditional definitions earlier in the file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
