From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 19:03:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: add dejavu
 mandatory dependency
In-Reply-To: <20200713124642.741955-1-fontaine.fabrice@gmail.com>
References: <20200713124642.741955-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713170357.GD18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-13 14:46 +0200, Fabrice Fontaine spake thusly:
> Since version 1.27.3, cups-filters needs dejavu (even if it is only used
> for test programs):
> https://github.com/OpenPrinting/cups-filters/commit/1d66106e5ae45407b01459cb112ee09752166dba

This is a bit sad... :-(

What we usually try to do in such a case, is to add an option to disable
or enable tests, and submit that upstream.

Furthermore, see below...

> Fixes:
>  - http://autobuild.buildroot.org/results/0e141abc57e4185c74adce75cac4215dd8a3108b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups-filters/Config.in       | 1 +
>  package/cups-filters/cups-filters.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> index 9e4e37ca6b..d62a791ed6 100644
> --- a/package/cups-filters/Config.in
> +++ b/package/cups-filters/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_PACKAGE_CUPS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	select BR2_PACKAGE_DEJAVU
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_FREETYPE
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index dc4e89b52e..dd78f4b7f7 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -9,7 +9,7 @@ CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
>  CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
>  CUPS_FILTERS_LICENSE_FILES = COPYING
>  
> -CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
> +CUPS_FILTERS_DEPENDENCIES = cups dejavu libglib2 lcms2 qpdf fontconfig freetype jpeg
>  
>  CUPS_FILTERS_CONF_OPTS = \
>  	--disable-mutool \
> @@ -20,6 +20,7 @@ CUPS_FILTERS_CONF_OPTS = \
>  	--with-sysroot=$(STAGING_DIR) \
>  	--with-pdftops=pdftops \
>  	--with-jpeg \
> +	--with-test-font-path=$(TARGET_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf \

This is not nice at all, because the tests programs are compiled for the
target, so they can't run natively. But still you are passing a path
that is only valid at build time, so they would not even run on the
target.

So, this tests of cups-filter os borked for cross-compilation, and thus
the best option would be to idneed add a configutre option to
enable/disable tests, and disable them when doing cross-compilation.

An alternate solution: since we do not care what about those test
programs to begin with, and since the font file only has to exist at
build time, we can simply point to whatever we see fit. /dev/null would
be the obvious candidate, I believe...

Thus, we do not need to have the dejavu fonts on the target.

Care to check ansd respin, please?

Regards,
Yann E. MORIN.

>  	--without-rcdir
>  
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
> -- 
> 2.27.0
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
