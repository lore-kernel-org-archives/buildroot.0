From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 21:44:11 +0100
Subject: [Buildroot] [PATCH 1/1] libgdiplus: new package
In-Reply-To: <1448048842-25060-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448048842-25060-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <5652291B.2040408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sergio,

 Thanks for your contribution. I have a few comments below. Care to fix them up
and resend your patch? Thanks!

On 20-11-15 20:47, Sergio Prado wrote:
> Libgdiplus is an open source implementation of the GDI+ API.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/Config.in                  |  1 +
>  package/libgdiplus/Config.in       | 14 ++++++++++++
>  package/libgdiplus/libgdiplus.hash |  2 ++
>  package/libgdiplus/libgdiplus.mk   | 46 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/libgdiplus/Config.in
>  create mode 100644 package/libgdiplus/libgdiplus.hash
>  create mode 100644 package/libgdiplus/libgdiplus.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063abd1a..ef09361c5440 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -824,6 +824,7 @@ menu "Graphics"
>  	source "package/libfm-extra/Config.in"
>  	source "package/libfreeimage/Config.in"
>  	source "package/libgail/Config.in"
> +	source "package/libgdiplus/Config.in"
>  	source "package/libgeotiff/Config.in"
>  	source "package/libglade/Config.in"
>  	source "package/libglew/Config.in"
> diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
> new file mode 100644
> index 000000000000..173d9af0d48a
> --- /dev/null
> +++ b/package/libgdiplus/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBGDIPLUS
> +	bool "libgdiplus"
> +	select BR2_PACKAGE_XLIB_LIBXFT
> +	select BR2_PACKAGE_LIBGLIB2

 You need to add that package's dependencies to this package, so:

	depends on BR2_USE_WCHAR # libglib2 -> gettext
	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
	depends on BR2_USE_MMU # libglib2

> +	select BR2_PACKAGE_CAIRO

 Same here:

	depends on BR2_ARCH_HAS_ATOMICS # cairo

> +	select BR2_PACKAGE_LIBPNG
> +	depends on BR2_PACKAGE_XORG7
> +	help
> +	  An Open Source implementation of the GDI+ API.
> +
> +	  https://github.com/mono/libgdiplus
> +
> +comment "libgdiplus depends on X.org"
> +	depends on !BR2_PACKAGE_XORG7

 We don't add comments for X.org dependencies. But you should add a comment for
wchar and threads:

comment "libgdiplus needs a toolchain w/ wchar, threads"


> diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
> new file mode 100644
> index 000000000000..f2b0d33d71ab
> --- /dev/null
> +++ b/package/libgdiplus/libgdiplus.hash
> @@ -0,0 +1,2 @@
> +# No hash for 3.12, comes from the github-helper:

 We noticed that github tarballs are not changing anymore, so we started
requiring hashes for github tarballs as well since October.

> +none    xxx     libgdiplus-3.12.tar.gz
> diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
> new file mode 100644
> index 000000000000..c8e2d96a1c82
> --- /dev/null
> +++ b/package/libgdiplus/libgdiplus.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# libgdiplus
> +#
> +################################################################################
> +
> +LIBGDIPLUS_VERSION = 3.12
> +LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
> +LIBGDIPLUS_LICENSE = LGPL MPLv1.0

 Ah, the licensing mess... Even though there is a LICENSE file that specifies
LGPL or MPLv1.1, and there is a MPL-1.1.html file which indeed contains the MPL,
the actual source files specify that they're licensed under MIT, and so does
COPYING. And in fact, all these predate the addition of LICENSE and
MPL-1.1.html. There are a few header files that don't specify a license, but I'm
pretty confident that the license is MIT and only MIT.

> +LIBGDIPLUS_LICENSE_FILES = LICENSE

 Unfortunately, COPYING doesn't contain the license text, so this should be

LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h

> +LIBGDIPLUS_AUTORECONF = YES

 You should also add a comment here why it is needed, e.g.
# github tarball doesn't have configure

> +LIBGDIPLUS_INSTALL_STAGING = YES
> +
> +LIBGDIPLUS_DEPENDENCIES = xlib_libXft libglib2 cairo libpng

 It also depends on host-pkgconf

> +
> +# API changes in recent versions of libgif makes it incompatible with
> +# this version of libgdiplus, so we are disabling it for now.
> +LIBGDIPLUS_CONF_OPTS = --without-libgif
> +
> +ifeq ($(BR2_PACKAGE_PANGO),y)
> +LIBGDIPLUS_CONF_OPTS += --with-pango
> +LIBGDIPLUS_DEPENDENCIES += pango

 We prefer to add an explicit --without-pango.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEXIF),y)
> +LIBGDIPLUS_CONF_OPTS += --with-libexif
> +LIBGDIPLUS_DEPENDENCIES += libexif
> +else
> +LIBGDIPLUS_CONF_OPTS += --without-libexif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JPEG),y)
> +LIBGDIPLUS_CONF_OPTS += --with-libjpeg
> +LIBGDIPLUS_DEPENDENCIES += jpeg 
> +else
> +LIBGDIPLUS_CONF_OPTS += --without-libjpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TIFF),y)
> +LIBGDIPLUS_CONF_OPTS += --with-libtiff
> +LIBGDIPLUS_DEPENDENCIES += tiff
> +else
> +LIBGDIPLUS_CONF_OPTS += --without-libtiff
> +endif

 There are also optional dependencies on fontconfig, freetype.


 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
