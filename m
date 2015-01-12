From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 09:28:00 +0100
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <54B317DE.9090105@ou.edu>
References: <54B317DE.9090105@ou.edu>
Message-ID: <20150112092800.08ce4350@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sun, 11 Jan 2015 18:39:58 -0600, Steve Kenton wrote:

> /data/bcdist/test/buildroot-2014.11/output/host/usr/include/libxml2/libxml/encoding.h:28:19: fatal error: iconv.h: No such file or directory
>  #include <iconv.h>

This is a *host* header, so it shouldn't be included when building a
target package.

>                    ^
> compilation terminated.
> make[3]: *** [readxml.o] Error 1
> 
> 
> diff -pruN buildroot-2014.11.ori/package/Config.in buildroot-2014.11/package/Config.in
> --- buildroot-2014.11.ori/package/Config.in	2014-12-01 03:19:00.000000000 -0600
> +++ buildroot-2014.11/package/Config.in	2015-01-11 17:44:27.920155192 -0600
> @@ -6,6 +6,7 @@ menu "Audio and video applications"
>  	source "package/alsa-utils/Config.in"
>  	source "package/aumix/Config.in"
>  	source "package/bellagio/Config.in"
> +	source "package/dvdauthor/Config.in"
>  	source "package/espeak/Config.in"
>  	source "package/faad2/Config.in"
>  	source "package/ffmpeg/Config.in"
> diff -pruN buildroot-2014.11.ori/package/dvdauthor/Config.in buildroot-2014.11/package/dvdauthor/Config.in
> --- buildroot-2014.11.ori/package/dvdauthor/Config.in	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot-2014.11/package/dvdauthor/Config.in	2015-01-11 18:07:40.892181913 -0600
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_DVDAUTHOR
> +	bool "dvdauthor"
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE # libxml2 may be missing a dependency
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBDVDREAD
> +	depends on BR2_LARGEFILE && !BR2_PREFER_STATIC_LIB # libdvdread

BR2_PREFER_STATIC_LIB has been renamed to BR2_STATIC_LIBS. Please make
sure to test your patches against the latest master, since this is
where they will be applied.

> +# Note - Despite lack of a version bump the two line gentoo
> +# patch to src/spuunmux.c against "stock" dvdauthor-0.7.1
> +# -    if (setjmp(png_ptr->jmpbuf))
> +# +    if (setjmp(png_jmpbuf(png_ptr)))
> +# to allow use of libpng15/16 is already applied to downloadable
> +# dvdauthor-0.7.1.tar.gz

This should go to the commit log.

Also, does this means that your libpng12 patch is now unnecessary?

> +
> diff -pruN buildroot-2014.11.ori/package/dvdauthor/dvdauthor.mk buildroot-2014.11/package/dvdauthor/dvdauthor.mk
> --- buildroot-2014.11.ori/package/dvdauthor/dvdauthor.mk	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot-2014.11/package/dvdauthor/dvdauthor.mk	2015-01-11 18:07:40.892181913 -0600
> @@ -0,0 +1,14 @@
> +###############################################################################
> +#
> +# dvdauthor
> +#
> +###############################################################################
> +
> +DVDAUTHOR_VERSION = 0.7.1
> +DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
> +DVDAUTHOR_DEPENDENCIES = host-pkgconf host-libxml2 host-freetype libxml2 freetype libpng libdvdread

I'm a little bit surprised by the need for host-libxml2 and
host-freetype, but I admittedly haven't looked in detail.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
