From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Apr 2016 01:00:24 +0200
Subject: [Buildroot] ilixi package support
In-Reply-To: <CAPWb3NRXUixbAYu1jJVqy2RUpxgpfFsx+PEXTEDBGhoO0JWfKw@mail.gmail.com>
References: <CAPWb3NRXUixbAYu1jJVqy2RUpxgpfFsx+PEXTEDBGhoO0JWfKw@mail.gmail.com>
Message-ID: <57044388.5070600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/16 22:44, Justin Berger wrote:
>
> This patch adds support for ilixi, a C++ library for creating embedded GUIs

  Hi Justin,

  Please send patches in-line, using git send-email. See the manual for details.

  The patch subject should be:

ilixi: new package

> Signed-off-by: Justin Berger <j.david.berger@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/ilixi/Config.in  | 20 ++++++++++++++++++++
>  package/ilixi/ilixi.hash |  1 +
>  package/ilixi/ilixi.mk   | 18 ++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/ilixi/Config.in
>  create mode 100644 package/ilixi/ilixi.hash
>  create mode 100644 package/ilixi/ilixi.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..6bbe278 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -261,6 +261,7 @@ endif
>  	source "package/fbterm/Config.in"
>  	source "package/fbv/Config.in"
>  	source "package/freerdp/Config.in"
> +	source "package/ilixi/Config.in"
>  	source "package/imagemagick/Config.in"
>  	source "package/linux-fusion/Config.in"
>  	source "package/lite/Config.in"
> diff --git a/package/ilixi/Config.in b/package/ilixi/Config.in
> new file mode 100644
> index 0000000..47aac65
> --- /dev/null
> +++ b/package/ilixi/Config.in
> @@ -0,0 +1,20 @@
> +comment "ilixi needs a toolchain w/ C++, threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS

  Please split this line.

  Also, you should add || BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 and 
update the comment text accordingly.

> +
> +config BR2_PACKAGE_ILIXI
> +	bool "ilixi"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS

  Does it really require shared libraries? I don't see calls to dlopen() and it 
can build static libraries, and AFAICS it can even build static-only.

> +	depends on BR2_PACKAGE_DIRECTFB

  This should be a select rather than depends. Which means you also need to 
propagate the dependencies of directfb:

	depends on !BR2_TOOLCHAIN_USES_MUSL # directfb
	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # directfb

  And that again has to be propagated to the comment.

> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

  Are you sure that 4.7 is not enough?

> +	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # wstring / iconv.h

  This should be split over two lines. No comment is needed for wstring. 
However, for locale I'm not so sure if it is needed. If it is really needed, it 
should be:

select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE

Cfr. 
https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages
But as I said, I don't think it is really needed. As far as I can see, locale 
support can be selected with --enable/disable-nls, which defaults to no (and 
doesn't have autodetection). The only problem is that
ilixi/lib/InputHelperJP.cpp unconditionally includes iconv.h, but it doesn't 
actually use it unless ILIXI_HAVE_LIBWNN is defined (which is not the case 
because we don't have libwnn). So just adding a patch that puts an #ifdef 
ILIXI_HAVE_LIBWNN around the include iconv.h should be sufficient.


> +	select BR2_PACKAGE_LIBSIGC
> +	select BR2_PACKAGE_LIBXML2

  I think fontconfig should be selected as well.

> +	help
> +		ilixi is an open-source C++ library aimed at developing rich graphical

  Indentation should be one tab + 2 spaces, and it should be wrapped at 72 
columns (where tab counts for 8, so 62 actual characters).

> +		applications for embedded Linux systems. Having been actively developed
> +		since 2010, it is running on thousands of devices around the world.
> +
> +		www.ilixi.org

  Add http:// in front.

> diff --git a/package/ilixi/ilixi.hash b/package/ilixi/ilixi.hash
> new file mode 100644
> index 0000000..0ffe151
> --- /dev/null
> +++ b/package/ilixi/ilixi.hash
> @@ -0,0 +1 @@
> +sha256 9b0c17efa75f2dc6a6a1438580a2f01e1cdfde822b10ad8c3f3b4a641caeadce  ilixi-1.0.0.tar.gz
> diff --git a/package/ilixi/ilixi.mk b/package/ilixi/ilixi.mk
> new file mode 100644
> index 0000000..cce080e
> --- /dev/null
> +++ b/package/ilixi/ilixi.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# ilixi
> +#
> +################################################################################
> +
> +ILIXI_VERSION_MAJOR = 1.0.0

  No need to define an additional _VERSION_MAJOR variable, just define _VERSION.

> +ILIXI_VERSION = $(ILIXI_VERSION_MAJOR)
> +ILIXI_SOURCE = ilixi-$(ILIXI_VERSION).tar.gz

  This is the default so not needed.

> +ILIXI_SITE = http://ilixi.org/releases
> +ILIXI_LICENSE = LGPL

  The project claims that it's LGPLv3+, but in fact, there is one file which is 
GPLv3+. So this should be:

ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)

  Note BTW that the osk app is only built/installed when sawman is detected (see 
below).

> +ILIXI_LICENSE_FILES = COPYING

  The main license file is COPYING.LESSER, but because of the utf8-decoder you 
need COPYING as well, so:

ILIXI_LICENSE_FILES = COPYING.LESSER COPYING

> +ILIXI_INSTALL_STAGING = YES
> +
> +ILIXI_DEPENDENCIES = libsigc libxml2

  Also directfb and fontconfig. That will probably make the line too long, so 
it's nice to split it with just one dependency per line.


  In addition, there is an optional dependency on sawman (which causes some demo 
apps to be built):

ifeq ($(BR2_PACKAGE_SAWMAN),y)
ILIXI_CONF_OPTS += --enable-sawman
ILIXI_DEPENDENCIES += sawman
else
ILIXI_CONF_OPTS += --disable-sawman
endif


  Regards,
  Arnout

> +ILIXI_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
> +
> +$(eval $(autotools-package))
> --
> 2.5.0
>



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
