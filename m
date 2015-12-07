From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Dec 2015 23:17:51 +0100
Subject: [Buildroot] [PATCH v7 05/33] package/efl/libefl: new
	host-package
In-Reply-To: <1449523775-6582-6-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-6-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151207221751.GD14874@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> This new host-package provide edje_cc, embryo_cc and eet binaries
> that will be used by the upcomming libefl packages which will
> contain the new version of efl libraries.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v6: Add more license files (Yann E.Morin)
> v4: keep efl as a sub-directory.
>     rename this new package to libefl since we want to keep a efl
>     and elementary version in sync.
> v3: remove trailing slash (Vicente Bergas)
>     bump to 1.15.2
> ---
>  package/efl/libefl/libefl.hash |  2 ++
>  package/efl/libefl/libefl.mk   | 82 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 package/efl/libefl/libefl.hash
>  create mode 100644 package/efl/libefl/libefl.mk
> 
> diff --git a/package/efl/libefl/libefl.hash b/package/efl/libefl/libefl.hash
> new file mode 100644
> index 0000000..7ac26f4
> --- /dev/null
> +++ b/package/efl/libefl/libefl.hash
> @@ -0,0 +1,2 @@
> +# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.2.tar.xz.sha256
> +sha256	dd738f19f454621a7fa1fdb4c008457c170989f5f0c535edfed7b6773ae6c2a4	efl-1.15.2.tar.xz
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> new file mode 100644
> index 0000000..d070131
> --- /dev/null
> +++ b/package/efl/libefl/libefl.mk
> @@ -0,0 +1,82 @@
> +################################################################################
> +#
> +# libefl
> +#
> +################################################################################
> +
> +# hardcode the version here since the bump to 1.15 is not complete in Buildroot
> +LIBEFL_VERSION = 1.15.2
> +LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
> +LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
> +LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
> +LIBEFL_LICENSE_FILES = \
> +	COMPLIANCE \
> +	COPYING \
> +	licenses/COPYING.BSD \
> +	licenses/COPYING.FTL \
> +	licenses/COPYING.GPL \
> +	licenses/COPYING.LGPL \
> +	licenses/COPYING.SMALL
> +
> +################################################################################
> +#
> +# host-libefl
> +#
> +################################################################################
> +
> +# We want to build only some host tools used later in the build.
> +# Actually we want: edje_cc, embryo_cc and eet.
> +
> +# Host dependencies:
> +# * host-dbus: for Eldbus
> +# * host-freetype: for libevas
> +# * host-libglib2: for libecore
> +# * host-libjpeg, host-libpng: for libevas image loader
> +# * host-lua: disable luajit dependency
> +HOST_LIBEFL_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-dbus \
> +	host-freetype \
> +	host-libglib2 \
> +	host-libjpeg \
> +	host-libpng \
> +	host-lua \
> +	host-zlib
> +
> +# Configure options:
> +# --disable-audio, --disable-multisense remove libsndfile dependency.
> +# --disable-cxx-bindings: disable C++11 bindings.
> +# --disable-fontconfig: remove dependency on fontconfig.
> +# --disable-fribidi: remove dependency on libfribidi.
> +# --disable-gstreamer1: remove dependency on gtreamer 1.0.
> +# --disable-libeeze: remove libudev dependency.
> +# --disable-libmount: remove dependency on host-util-linux libmount.
> +# --disable-physics: remove Bullet dependency.
> +# --enable-image-loader-gif=no: disable Gif dependency.
> +# --enable-image-loader-tiff=no: disable Tiff dependency.
> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +# --with-crypto=none: remove dependencies on openssl or gnutls.
> +# --with-x11=none: remove dependency on X.org.
> +#   Yes I really know what I am doing.
> +HOST_LIBEFL_CONF_OPTS += \
> +	--disable-audio \
> +	--disable-cxx-bindings \
> +	--disable-fontconfig \
> +	--disable-fribidi \
> +	--disable-gstreamer1 \
> +	--disable-libeeze \
> +	--disable-libmount \
> +	--disable-multisense \
> +	--disable-physics \
> +	--enable-image-loader-gif=no \
> +	--enable-image-loader-jpeg=yes \
> +	--enable-image-loader-png=yes \
> +	--enable-image-loader-tiff=no \
> +	--enable-lua-old \
> +	--with-crypto=none \
> +	--with-glib=yes \
> +	--with-opengl=none \
> +	--with-x11=none \
> +	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
> +
> +$(eval $(host-autotools-package))
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
