From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 May 2020 07:57:56 +0300
Subject: [Buildroot] [PATCH 1/1] gloox: new package
In-Reply-To: <G4_UACKbOFKjHR50_oA8x38rKahD3d3KT7v9YY7fcByR5rBGJhwFZfRO9mUhQhPDAsGdwahC-DSbPnuOW0keUGQYX4lIKuc3d3LGAG-Auqo=@protonmail.com>
References: <G4_UACKbOFKjHR50_oA8x38rKahD3d3KT7v9YY7fcByR5rBGJhwFZfRO9mUhQhPDAsGdwahC-DSbPnuOW0keUGQYX4lIKuc3d3LGAG-Auqo=@protonmail.com>
Message-ID: <87mu652623.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

A few quick notes below.

On Sun, May 17 2020, Yair Ben-Avraham wrote:
> gloox is a rock-solid, full-featured Jabber/XMPP client library, written in
> clean ANSI C++. It makes writing spec-compliant clients easy and allows for
> hassle-free integration of Jabber/XMPP functionality into existing
> applications. gloox is released under the GNU GPLv3. Commercial licensing and
> support are available.
>
> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
> ---
>  package/Config.in        |  1 +
>  package/gloox/Config.in  | 16 ++++++++++++++
>  package/gloox/gloox.hash |  3 +++
>  package/gloox/gloox.mk   | 45 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 100644 package/gloox/Config.in
>  create mode 100644 package/gloox/gloox.hash
>  create mode 100644 package/gloox/gloox.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c245abbc42..ca0c078f5f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1806,6 +1806,7 @@ menu "Other"
>  	source "package/gli/Config.in"
>  	source "package/glibmm/Config.in"
>  	source "package/glm/Config.in"
> +	source "package/gloox/Config.in"

The "Networking applications" menu appears to be a better location for
this package.

>  	source "package/gmp/Config.in"
>  	source "package/gobject-introspection/Config.in"
>  	source "package/gsl/Config.in"
> diff --git a/package/gloox/Config.in b/package/gloox/Config.in
> new file mode 100644
> index 0000000000..91e9f06e34
> --- /dev/null
> +++ b/package/gloox/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_GLOOX
> +	bool "gloox"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_MPC
> +	help
> +	  gloox is a portable high-level Jabber/XMPP library for C++. It
> +	  is fully compliant with the XMPP RFCs, supports all of the
> +	  XMPP features (including SRV lookups, TLS, SASL, roster
> +	  management, and privacy lists), and implements several XEPs
> +	  that make it ideal for writing any kind of Jabber/XMPP client
> +	  or component.
> +
> +	  https://camaya.net/gloox/
> +
> +comment "gloox needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
> new file mode 100644
> index 0000000000..3305ba7311
> --- /dev/null
> +++ b/package/gloox/gloox.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 97cb6a0c07e320ffa4a7c66e8ab06b2361086271dc87ed2398befef4e8435f8a  gloox-1.0.23.tar.bz2
> +sha256 40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE

The new convention for hash file is to use two spaces between elements.

> diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
> new file mode 100644
> index 0000000000..bfe0a337de
> --- /dev/null
> +++ b/package/gloox/gloox.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# gloox
> +#
> +################################################################################
> +
> +GLOOX_VERSION = 1.0.23
> +GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
> +GLOOX_SITE = https://camaya.net/download
> +GLOOX_LICENSE = GPL-3.0

Should be "GPL-3.0 with OpenSSL exception".

> +GLOOX_LICENSE_FILES = LICENSE
> +GLOOX_AUTORECONF = YES

Why is that needed? There is a configure script in the tarball. Is there
a reason not to use it?

> +
> +GLOOX_DEPENDENCIES = host-gloox mpc

What is host-gloox used for? You should explain in the commit log.

> +
> +GLOOX_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +GLOOX_CXXFLAGS += -O0
> +endif
> +
> +GLOOX_CONF_ENV = CXXFLAGS="$(GLOOX_CXXFLAGS)"
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GLOOX_CONF_ENV += LIBS=-latomic
> +endif
> +
> +GLOOX_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +GLOOX_DEPENDENCIES += zlib
> +endif
> +
> +HOST_GLOOX_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS)"
> +
> +GLOOX_CONF_OPTS = \
> +		 --with-pic \
> +		 --with-zlib \

This should be conditional on BR2_PACKAGE_ZLIB.

> +		 --with-libidn=no \
> +		 --enable-getaddrinfo \
> +		 --with-gnutls=no \

It would be nice to add conditional support for GnuTLS.

> +		 --with-openssl=yes

This should be conditional on OpenSSL. You also need to add it to
DEPENDENCIES to make sure it builds before gloox.

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
