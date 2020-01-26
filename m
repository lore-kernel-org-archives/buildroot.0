From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2020 12:43:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/celt051: drop package
In-Reply-To: <20200124200931.1684714-1-fontaine.fabrice@gmail.com>
References: <20200124200931.1684714-1-fontaine.fabrice@gmail.com>
Message-ID: <20200126114308.GM32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-24 21:09 +0100, Fabrice Fontaine spake thusly:
> Remove celt051 package as celt has been merged into the IETF Opus codec
> and is now obsolete (see http://celt-codec.org/).
> 
> The only reverse dependency of celt051 is spice. Opus support on spice
> has been added upstream 6 years ago with
> https://gitlab.freedesktop.org/spice/spice/commit/ce9b714137a767b81f2d3c40b5f3ce0d5cf70fc8
> 
> Spice disabled celt by default since version 0.14.1 and
> https://gitlab.freedesktop.org/spice/spice-common/commit/72b0d603e128cd3af15974fe6b3e4b56ea9c6f34
> 
> Spice evens error out, by default, if Opus is missing since
> https://gitlab.freedesktop.org/spice/spice-common/commit/f5224738425a7e97e1c32ea85bb3b243e50d4e22
> 
> This will also fix a static build failure on spice with celt051 and opus
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I did slightly rephrase the legacy help, as the way it was written
seemed to imply the CELT code was obsolete, while it's the package
that is.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                           | 10 ++++++++
>  DEVELOPERS                                 |  1 -
>  package/Config.in                          |  1 -
>  package/celt051/0001-fix-gnuc-prereq.patch | 29 ---------------------
>  package/celt051/Config.in                  | 15 -----------
>  package/celt051/celt051.hash               |  2 --
>  package/celt051/celt051.mk                 | 30 ----------------------
>  package/jack2/jack2.mk                     |  5 ----
>  package/spice/spice.mk                     |  7 -----
>  9 files changed, 10 insertions(+), 90 deletions(-)
>  delete mode 100644 package/celt051/0001-fix-gnuc-prereq.patch
>  delete mode 100644 package/celt051/Config.in
>  delete mode 100644 package/celt051/celt051.hash
>  delete mode 100644 package/celt051/celt051.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 1801ec06da..111cc02bd4 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,16 @@ endif
>  
>  comment "Legacy options removed in 2020.02"
>  
> +config BR2_PACKAGE_CELT051
> +	bool "celt051 package was removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_OPUS
> +	help
> +	  The celt051 package was removed as the CELT codec has been
> +	  merged into the IETF Opus codec and is now obsolete. As a
> +	  result, the opus package has been automatically selected in
> +	  your configuration.
> +
>  config BR2_PACKAGE_WIREGUARD
>  	bool "wireguard package renamed"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a1eb052652..818ceb8736 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2534,7 +2534,6 @@ F:	configs/nanopi_neo_defconfig
>  F:	fs/squashfs/
>  F:	package/asterisk/
>  F:	package/cegui06/
> -F:	package/celt051/
>  F:	package/dahdi-linux/
>  F:	package/dahdi-tools/
>  F:	package/dtc/
> diff --git a/package/Config.in b/package/Config.in
> index 4c94914680..60fcb13bd5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1210,7 +1210,6 @@ menu "Audio/Sound"
>  	source "package/audiofile/Config.in"
>  	source "package/bcg729/Config.in"
>  	source "package/caps/Config.in"
> -	source "package/celt051/Config.in"
>  	source "package/fdk-aac/Config.in"
>  	source "package/libao/Config.in"
>  	source "package/libasplib/Config.in"
> diff --git a/package/celt051/0001-fix-gnuc-prereq.patch b/package/celt051/0001-fix-gnuc-prereq.patch
> deleted file mode 100644
> index 8efd518d97..0000000000
> --- a/package/celt051/0001-fix-gnuc-prereq.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix musl build
> -
> -musl does not define __GNUC_PREREQ. Use patch from Alpine Linux
> -(http://git.alpinelinux.org/cgit/aports/plain/main/celt051/fix-gnuc-prereq.patch).
> -
> -Fixes http://autobuild.buildroot.net/results/223/223ba6003bdd7e0c896455c21fa8fee943b4e716/
> -
> -Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> -
> ---- celt-0.5.1.3.orig/libcelt/ecintrin.h
> -+++ celt-0.5.1.3/libcelt/ecintrin.h
> -@@ -52,8 +52,7 @@
> - /*Count leading zeros.
> -   This macro should only be used for implementing ec_ilog(), if it is defined.
> -   All other code should use EC_ILOG() instead.*/
> --#ifdef __GNUC_PREREQ
> --#if __GNUC_PREREQ(3,4)
> -+#if defined(__GNUC__) && ((__GNUC__<<16)+__GNUC_MINOR__) >= 0x304
> - # if INT_MAX>=2147483647
> - #  define EC_CLZ0 sizeof(unsigned)*CHAR_BIT
> - #  define EC_CLZ(_x) (__builtin_clz(_x))
> -@@ -61,7 +60,6 @@
> - #  define EC_CLZ0 sizeof(unsigned long)*CHAR_BIT
> - #  define EC_CLZ(_x) (__builtin_clzl(_x))
> - # endif
> --#endif
> - #endif
> -
> - #if defined(EC_CLZ)
> diff --git a/package/celt051/Config.in b/package/celt051/Config.in
> deleted file mode 100644
> index e1513190db..0000000000
> --- a/package/celt051/Config.in
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -config BR2_PACKAGE_CELT051
> -	bool "celt051"
> -	select BR2_PACKAGE_LIBOGG
> -	help
> -	  The CELT ultra-low delay audio codec
> -
> -	  The CELT codec is a compression algorithm for audio. Like MP3,
> -	  Vorbis, and AAC it is suitable for transmitting music with
> -	  high quality. Unlike these formats CELT imposes very little
> -	  delay on the signal, even less than is typical for speech
> -	  centric formats like Speex, GSM, or G.729.
> -
> -	  Note: this is version 0.5.1.3 of celt.
> -
> -	  http://www.celt-codec.org/
> diff --git a/package/celt051/celt051.hash b/package/celt051/celt051.hash
> deleted file mode 100644
> index 4ad212b2d3..0000000000
> --- a/package/celt051/celt051.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# From http://downloads.xiph.org/releases/celt/SHA1SUMS
> -sha1	eb05030108c36cb063c3f026c349f16d78e0a497	celt-0.5.1.3.tar.gz
> diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
> deleted file mode 100644
> index 01da5c933e..0000000000
> --- a/package/celt051/celt051.mk
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -################################################################################
> -#
> -# celt
> -#
> -################################################################################
> -
> -# Although version newer than 0.5.1.3 exists, we're
> -# stuck with 0.5.1.3 for use by Spice (coming later)
> -CELT051_VERSION = 0.5.1.3
> -CELT051_SOURCE = celt-$(CELT051_VERSION).tar.gz
> -CELT051_SITE = http://downloads.xiph.org/releases/celt
> -CELT051_LICENSE = BSD-2-Clause
> -CELT051_LICENSE_FILES = COPYING
> -CELT051_INSTALL_STAGING = YES
> -CELT051_DEPENDENCIES = libogg
> -
> -# Need to specify --with-ogg, otherwise /usr/lib may be searched for
> -# if target is the same kind as host (ie. same arch, same bitness,
> -# same endianness, so that /usr/lib contains libraries linkable by
> -# our cross-compiler)
> -CELT051_CONF_OPTS = \
> -	--enable-fixed-point \
> -	--disable-fixed-point-debug \
> -	--disable-experimental-postfilter \
> -	--disable-static-modes \
> -	--disable-assertions \
> -	--disable-oggtest \
> -	--with-ogg=$(STAGING_DIR)/usr
> -
> -$(eval $(autotools-package))
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> index 171f7d039f..c4cad32ed6 100644
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -34,11 +34,6 @@ JACK2_DEPENDENCIES += dbus
>  JACK2_CONF_OPTS += --dbus
>  endif
>  
> -# Even though it advertises support for celt-0.5.x, jack2 really
> -# requires celt >= 0.5.2 but we only have 0.5.1.3 and we cannot
> -# upgrade, so we do not add a dependency to celt051, which it can't
> -# find anyway as it looks for celt.pc but we only have celt-51.pc.
> -
>  # The dependency against eigen is only useful in conjunction with
>  # gtkiostream, which we do not have, so we don't need to depend on
>  # eigen.
> diff --git a/package/spice/spice.mk b/package/spice/spice.mk
> index 8c421abf2e..bed6931c2e 100644
> --- a/package/spice/spice.mk
> +++ b/package/spice/spice.mk
> @@ -32,13 +32,6 @@ SPICE_CONF_OPTS = \
>  
>  SPICE_DEPENDENCIES += host-pkgconf
>  
> -ifeq ($(BR2_PACKAGE_CELT051),y)
> -SPICE_CONF_OPTS += --enable-celt051
> -SPICE_DEPENDENCIES += celt051
> -else
> -SPICE_CONF_OPTS += --disable-celt051
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LZ4),y)
>  SPICE_CONF_OPTS += --enable-lz4
>  SPICE_DEPENDENCIES += lz4
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
