From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 23:06:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/poppler: bump version to 0.69.0
In-Reply-To: <20181005133142.1205-1-olivier.schonken@gmail.com>
References: <20181005133142.1205-1-olivier.schonken@gmail.com>
Message-ID: <20190601230620.158deb22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Olivier,

On Fri,  5 Oct 2018 15:31:41 +0200
Olivier Schonken <olivier.schonken@gmail.com> wrote:

> For the version bump, the makefile had to be rewritten for CMake, as
> the project moved from autotools to CMake.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

So I finally look into this patch, and merged it, but after doing a
*lot* of changes.

First of all your PATCH 1/2 and 2/2 should have been squashed into a
single patch, otherwise the series is not bisectable: with just PATCH
1/2 applied, poppler doesn't build.

Also, since poppler 0.69 was old, I bumped all the way to 0.77.

> diff --git a/package/poppler/Config.in b/package/poppler/Config.in
> index 9b03df8d27..bc69e361de 100644
> --- a/package/poppler/Config.in
> +++ b/package/poppler/Config.in
> @@ -2,7 +2,11 @@ config BR2_PACKAGE_POPPLER
>  	bool "poppler"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14

I had to change this to GCC_AT_LEAST_5 for poppler 0.77. Also, you had
forgotten to update the Config.in comment about this gcc version
dependency.

>  	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_OPENJPEG
> +	select BR2_PACKAGE_LCMS2
> +	select BR2_PACKAGE_JPEG

None of these dependencies are mandatory, they can be disabled just
like they could with the old version of poppler.

>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7

These dependencies were apparently no longer needed.

>  	help
> @@ -13,14 +17,6 @@ config BR2_PACKAGE_POPPLER
>  
>  if BR2_PACKAGE_POPPLER
>  
> -config BR2_PACKAGE_POPPLER_QT
> -	bool "Qt support"
> -	depends on BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT_GUI_MODULE
> -	select BR2_PACKAGE_QT_XML
> -	help
> -	  Build Qt support into the Poppler library

This option had been removed in the mean time.

> -
>  config BR2_PACKAGE_POPPLER_QT5
>  	bool "Qt5 support"
>  	depends on BR2_PACKAGE_QT5
> @@ -30,6 +26,32 @@ config BR2_PACKAGE_POPPLER_QT5
>  	help
>  	  Build Qt support into the Poppler library
>  
> +config BR2_PACKAGE_POPPLER_FIXED_POINT
> +	bool "use fixed-point" if !BR2_SOFT_FLOAT
> +	default y if BR2_SOFT_FLOAT
> +	help
> +	  Compile without floating point operations (for machines
> +	  without a fast enough FPU).

I dropped this option, and directly used BR2_SOFT_FLOAT in poppler.mk.

> +
> +config BR2_PACKAGE_POPPLER_LIBCURL
> +	bool "libcurl support"
> +	depends on BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	help
> +	  Build poppler with libcurl based HTTP support.

I dropped this option, and directly used BR2_PACKAGE_LIBCURL in
poppler.mk. I'm not sure why you were selecting QT5BASE_GUI here.

> +
> +config BR2_PACKAGE_POPPLER_ZLIB
> +	bool "zlib support"
> +	depends on BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Build poppler with with zlib.

I dropped this option, and directly used BR2_PACKAGE_ZLIB in poppler.mk.

>  comment "poppler needs a toolchain w/ C++, threads"

This is where I have added the comment about the gcc version dependency.

> -POPPLER_VERSION = 0.59.0
> +POPPLER_VERSION = 0.69.0

So, I bumped to 0.77.0

>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>  POPPLER_SITE = http://poppler.freedesktop.org
> -POPPLER_DEPENDENCIES = fontconfig host-pkgconf
> -POPPLER_LICENSE = GPL-2.0+
> -POPPLER_LICENSE_FILES = COPYING
> +POPPLER_DEPENDENCIES = fontconfig host-pkgconf openjpeg lcms2 libjpeg

I didn't add openjpeg, lcms2 and libjpeg here, because they are still
optional dependencies. BTW, libjpeg was wrong, it should have been just
"jpeg".

> +POPPLER_LICENSE = GPL-2.0+ GPL-3.0+
> +POPPLER_LICENSE_FILES = COPYING COPYING3

To me, the licensing terms are unclear. All files have a "GPL version 2
or later", but the documentation says the code is forked from Xpdf,
which is licensed under GPLv2 or GPLv3 (but not "or any later version",
and they really insist on this).

I should probably send a separate e-mail to Yann/Arnout on this to get
their opinion.

> -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
> -endif

Something like this was still needed, but of course changed for the
CMake build system.

And overall, for the rest of the .mk file, I just adapted to the
changes I described above: lcms2, openjpeg and jpeg are optional, and
sub-options in Config.in were not added.

Since poppler 0.77.0 changed some APIs, I had to bump cups-filters to
1.23.0 as a preparation patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
