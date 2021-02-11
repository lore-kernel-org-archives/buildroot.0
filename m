From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 11 Feb 2021 08:47:43 +0100
Subject: [Buildroot] [PATCH 3/3] package/perl-gd: provide gd options
In-Reply-To: <20210124112214.480254-3-fontaine.fabrice@gmail.com>
References: <20210124112214.480254-1-fontaine.fabrice@gmail.com>
 <20210124112214.480254-3-fontaine.fabrice@gmail.com>
Message-ID: <CAB0FRssGRm1LeEveHTr_EKLrQExSnyq-RyDy1=4SnQe7cZ_B-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 24 janv. 2021 ? 12:23, Fabrice Fontaine <fontaine.fabrice@gmail.com>
a ?crit :

> Now that gdlib-config is gone, provide the GD options otherwise perl-gd
> will assume that everything is available:
>
> $features = 'GD_GIF GD_GIFANIM GD_OPENPOLYGON GD_ZLIB GD_PNG GD_FREETYPE
> GD_FONTCONFIG GD_JPEG GD_XPM GD_TIFF GD_WEBP';
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-gd/perl-gd.mk | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
> index 1471cfb8bf..6872fd1ce1 100644
> --- a/package/perl-gd/perl-gd.mk
> +++ b/package/perl-gd/perl-gd.mk
> @@ -17,10 +17,31 @@ PERL_GD_CONF_ENV = \
>         PATH=$(BR_PATH) \
>         PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>
> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> +PERL_GD_OPTIONS += FONTCONFIG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
> +PERL_GD_OPTIONS += FT
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JPEG),y)
> +PERL_GD_OPTIONS += JPEG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +PERL_GD_OPTIONS += PNG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
> +PERL_GD_OPTIONS += XPM
> +endif
> +
>  PERL_GD_CONF_OPTS = \
>         -lib_gd_path=$(STAGING_DIR)/usr \
>         -lib_ft_path=$(STAGING_DIR)/usr \
>         -lib_png_path=$(STAGING_DIR)/usr \
> -       -lib_zlib_path=$(STAGING_DIR)/usr
> +       -lib_zlib_path=$(STAGING_DIR)/usr \
> +       -options=$(subst $(space),$(comma),$(PERL_GD_OPTIONS))
>
>
Fabrice,

PERL_GD_DEPENDENCIES & PERL_GD_CONF_OPTS should depend on optional
dependencies, like that:

PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
...

PERL_GD_CONF_OPTS = \
-lib_gd_path=$(STAGING_DIR)/usr \
-lib_zlib_path=$(STAGING_DIR)/usr

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
PERL_GD_DEPENDENCIES += fontconfig
PERL_GD_OPTIONS += FONTCONFIG
PERL_GD_CONF_OPTS += -lib_fontconfig_path=$(STAGING_DIR)/usr
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
PERL_GD_DEPENDENCIES += freetype
PERL_GD_OPTIONS += FT
PERL_GD_CONF_OPTS += -lib_ft_path=$(STAGING_DIR)/usr
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
PERL_GD_DEPENDENCIES += jpeg
PERL_GD_OPTIONS += JPEG
PERL_GD_CONF_OPTS += -lib_jpeg_path=$(STAGING_DIR)/usr
endif

ifeq ($(BR2_PACKAGE_LIBPNG),y)
PERL_GD_DEPENDENCIES += libpng
PERL_GD_OPTIONS += PNG
PERL_GD_CONF_OPTS += -lib_png_path=$(STAGING_DIR)/usr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
PERL_GD_OPTIONS += XPM
PERL_GD_CONF_OPTS += -lib_xpm_path=$(STAGING_DIR)/usr
endif

PERL_GD_CONF_OPTS += -options=$(subst $(space),$(comma),$(PERL_GD_OPTIONS))

Fran?ois

 $(eval $(perl-package))
> --
> 2.29.2
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210211/08bd7f3b/attachment.html>
