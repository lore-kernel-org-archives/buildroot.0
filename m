From: Steve Kenton <skenton@ou.edu>
Date: Thu, 1 Jun 2017 20:15:34 +0000
Subject: [Buildroot] [PATCH/next] package/dvdauthor: bump version to
	0.7.2
In-Reply-To: <20170528103334.30361-1-bernd.kuhls@t-online.de>
References: <20170528103334.30361-1-bernd.kuhls@t-online.de>
Message-ID: <5433c711-329b-df58-8f9b-2a29b77d0fd5@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For what it's worth at this late date, it looks good to me

Acked-by: Steve Kenton <skenton@ou.edu>


On 05/28/2017 10:33 AM, Bernd Kuhls wrote:
> Changed _SITE to https, added upstream hashes.
>
> Removed patch applied upstream:
> https://github.com/ldo/dvdauthor/commit/176172d5dcba4d6e2704a1a2cc48c9e687761996
>
> Also remove autoreconf-related code, basically reverting the original
> commit:
> https://git.buildroot.net/buildroot/commit/package/dvdauthor?id=1cac78fbb044279f1854b1c7c59e94f03fb061f1
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   .../0001-configure.ac-fix-static-build.patch       | 55 ----------------------
>   package/dvdauthor/dvdauthor.hash                   |  5 +-
>   package/dvdauthor/dvdauthor.mk                     |  9 +---
>   3 files changed, 6 insertions(+), 63 deletions(-)
>   delete mode 100644 package/dvdauthor/0001-configure.ac-fix-static-build.patch
>
> diff --git a/package/dvdauthor/0001-configure.ac-fix-static-build.patch b/package/dvdauthor/0001-configure.ac-fix-static-build.patch
> deleted file mode 100644
> index 0e016b8cb..000000000
> --- a/package/dvdauthor/0001-configure.ac-fix-static-build.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From da77704c575f0583fa871ff02bd52906a7979576 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@openwide.fr>
> -Date: Sun, 15 Feb 2015 11:05:43 +0100
> -Subject: [PATCH] configure.ac: fix static build
> -
> -Add LT_INIT macro to handle --enable-shared option.
> -
> -If enable-shared=no then add --static flag to resolve FREETYPE_LIBS.
> -
> -Otherwise, dvdauthor forget to link witk -lbz2 when linking with freetype2.
> -
> -Fixes:
> -http://autobuild.buildroot.net/results/1d8/1d83390a3dd9f6bb595e9fc7b321500b4dc533a8/
> -
> -Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ----
> - configure.ac | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c43df92..d78d56a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4,6 +4,7 @@ AM_CONFIG_HEADER(src/config.h)
> - AC_CONFIG_AUX_DIR(autotools)
> -
> - AM_INIT_AUTOMAKE
> -+LT_INIT
> -
> - AC_PROG_INSTALL
> -
> -@@ -39,6 +40,11 @@ PKG_CHECK_MODULES(LIBPNG, [libpng])
> - AC_SUBST(LIBPNG_CFLAGS)
> - AC_SUBST(LIBPNG_LIBS)
> -
> -+config_static=''
> -+if test "$enable_shared" = 'no'; then
> -+    config_static='--static'
> -+fi
> -+
> - usemagick=0
> -
> - AC_CHECK_PROGS(MAGICKCONFIG, [Magick-config])
> -@@ -95,7 +101,7 @@ AC_SUBST(FRIBIDI_LIBS)
> - AC_CHECK_PROGS(FREETYPECONFIG, [freetype-config])
> - if test -n "$FREETYPECONFIG"; then
> -     FREETYPE_CPPFLAGS="`$FREETYPECONFIG --cflags`"
> --    FREETYPE_LIBS="`$FREETYPECONFIG --libs`"
> -+    FREETYPE_LIBS="`$FREETYPECONFIG --libs $config_static`"
> -     AC_DEFINE(HAVE_FREETYPE, 1, [Whether FreeType is available])
> -
> -     ac_save_CPPFLAGS="$CPPFLAGS"
> ---
> -1.9.3
> -
> diff --git a/package/dvdauthor/dvdauthor.hash b/package/dvdauthor/dvdauthor.hash
> index fe92b29c5..36d5d0e68 100644
> --- a/package/dvdauthor/dvdauthor.hash
> +++ b/package/dvdauthor/dvdauthor.hash
> @@ -1,2 +1,5 @@
> +# From https://sourceforge.net/projects/dvdauthor/files
> +md5 1173dcb8d40e74fc90c0f3a25dbd642d  dvdauthor-0.7.2.tar.gz
> +sha1 0e605642140576bfb3e963414d77630d1c073a51  dvdauthor-0.7.2.tar.gz
>   # Locally computed
> -sha256 501fb11b09c6eb9c5a229dcb400bd81e408cc78d34eab6749970685023c51fe9 dvdauthor-0.7.1.tar.gz
> +sha256 3020a92de9f78eb36f48b6f22d5a001c47107826634a785a62dfcd080f612eb7  dvdauthor-0.7.2.tar.gz
> diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
> index 689367d3f..3f9c2186c 100644
> --- a/package/dvdauthor/dvdauthor.mk
> +++ b/package/dvdauthor/dvdauthor.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -DVDAUTHOR_VERSION = 0.7.1
> -DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
> +DVDAUTHOR_VERSION = 0.7.2
> +DVDAUTHOR_SITE = https://sourceforge.net/projects/dvdauthor/files
>   DVDAUTHOR_DEPENDENCIES = host-pkgconf libxml2 freetype libpng
>   DVDAUTHOR_LICENSE = GPL-2.0+
>   DVDAUTHOR_LICENSE_FILES = COPYING
> @@ -14,11 +14,6 @@ DVDAUTHOR_CONF_ENV = \
>   	ac_cv_path_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config \
>   	ac_cv_prog_GMAGICKCONFIG=
>   
> -# configure.ac patched by 0001-configure.ac-fix-static-build.patch
> -DVDAUTHOR_AUTORECONF = YES
> -# add host-gettext for AM_ICONV macro
> -DVDAUTHOR_DEPENDENCIES += host-gettext
> -
>   ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
>   DVDAUTHOR_DEPENDENCIES += imagemagick
>   DVDAUTHOR_CONF_ENV += \

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170601/937f7dac/attachment.html>
