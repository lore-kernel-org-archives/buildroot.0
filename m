From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:34:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: bump to version 2.72.0
In-Reply-To: <20210524150112.3049254-1-aperez@igalia.com>
References: <20210524150112.3049254-1-aperez@igalia.com>
Message-ID: <20210524173442.GG3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-24 18:01 +0300, Adrian Perez de Castro spake thusly:
> Among other fixes, switching to the current stable version plugs a few
> memory leaks; solves many WebSocket bugs; makes NTLM authentication work;
> allows building gobject-introspection data when cross-building (to be
> enabled in a separate patch); fixes message cancellation; adds support
> for HTTP 308 permanent redirects, same-site cookies, secure cookies,
> HSTS, and Brotli compression.
> 
> This also removes the unneeded LIBSOUP_CONF_ENV which defined an
> autoconf variable, and updates the Meson build configuration options
> to follow the changes done by upstream.

Good catch about the autoconf legacy; I did miss it.

Applied to next, thanks (I again did a little cleanup in the
dependencies and options ordering and formatting, because pet-peeve
again... ;-) )

Regards,
Yann E. MORIN.

> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libsoup/libsoup.hash |  4 ++--
>  package/libsoup/libsoup.mk   | 19 +++++++++++++------
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
> index 3b9009884d..01bf419563 100644
> --- a/package/libsoup/libsoup.hash
> +++ b/package/libsoup/libsoup.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.66/libsoup-2.66.5.sha256sum
> -sha256  ee43be1485bd95b686236b1e0043ec6edb761a538616c9c63004d7d1979bb139  libsoup-2.66.5.tar.xz
> +# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.72/libsoup-2.72.0.sha256sum
> +sha256  170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387  libsoup-2.72.0.tar.xz
>  # Locally calculated
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> index 1617940c8f..814a35ee4c 100644
> --- a/package/libsoup/libsoup.mk
> +++ b/package/libsoup/libsoup.mk
> @@ -4,24 +4,31 @@
>  #
>  ################################################################################
>  
> -LIBSOUP_VERSION_MAJOR = 2.66
> -LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).5
> +LIBSOUP_VERSION_MAJOR = 2.72
> +LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
>  LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
>  LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
>  LIBSOUP_LICENSE = LGPL-2.0+
>  LIBSOUP_LICENSE_FILES = COPYING
>  LIBSOUP_CPE_ID_VENDOR = gnome
>  LIBSOUP_INSTALL_STAGING = YES
> -LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
> -LIBSOUP_CONF_OPTS = -Dtests=false -Dvapi=false -Dgssapi=false
> +LIBSOUP_CONF_OPTS = -Dtests=false -Dgtk_doc=false -Dsysprof=disabled \
> +	-Dvapi=disabled -Dgssapi=disabled -Dntlm=disabled
>  LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
>  	libglib2 libpsl libxml2 sqlite host-intltool
>  
> +ifeq ($(BR2_PACKAGE_BROTLI),y)
> +LIBSOUP_CONF_OPTS += -Dbrotli=enabled
> +LIBSOUP_DEPENDENCIES += brotli
> +else
> +LIBSOUP_CONF_OPTS += -Dbrotli=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -LIBSOUP_CONF_OPTS += -Dintrospection=true
> +LIBSOUP_CONF_OPTS += -Dintrospection=enabled
>  LIBSOUP_DEPENDENCIES += gobject-introspection
>  else
> -LIBSOUP_CONF_OPTS += -Dintrospection=false
> +LIBSOUP_CONF_OPTS += -Dintrospection=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
> -- 
> 2.31.1
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
