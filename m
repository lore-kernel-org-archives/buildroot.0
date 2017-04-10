From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:14:58 +0200
Subject: [Buildroot] [PATCH v3] libgphoto2: new package
In-Reply-To: <1491827774-11245-1-git-send-email-kevin.joly@sensefly.com>
References: <1491827774-11245-1-git-send-email-kevin.joly@sensefly.com>
Message-ID: <be4a6cfa-8ca0-d013-837c-21b0f4367a41@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 14:36, Kevin JOLY wrote:
> Add support for libgphoto2 core library designed to allow access to
> digital camera.
> 
> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
> Cc: Romain Naour <romain.naour@gmail.com>

 Except for some minor issues and one style issue in Config.in (see below), it
all looks good. I've already ran test-pkg for a dozen toolchains and it looks
good. So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> Changes v2 -> v3 (suggested by Arnout Vandecappelle)
>   - Change the commit description
>   - Turn libusb-compat as an optional dependency
>   - Add the BR2_TOOLCHAIN_HAS_THREADS dependency
>   - Update package website location
>   - Update version to 2.5.13
>   - Add comments
>   - Improve configure options
>   - Update license informations
> 
> Changes v1 -> v2 (suggested by Romain Naour)
>   - Handle optionnal dependencies on libexif, libjpeg, libgd and lockdev
>   - Add license informations
>   - Use tar.bz2 package
>   - Change hash
>   - Added myself as package maintainer in the DEVELOPPERS file
> ---
>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/libgphoto2/Config.in       | 14 +++++++++++
>  package/libgphoto2/libgphoto2.hash |  6 +++++
>  package/libgphoto2/libgphoto2.mk   | 50 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 74 insertions(+)
>  create mode 100644 package/libgphoto2/Config.in
>  create mode 100644 package/libgphoto2/libgphoto2.hash
>  create mode 100644 package/libgphoto2/libgphoto2.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a298669..1f45012 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -957,6 +957,9 @@ F:	package/cpuload/
>  F:	package/bwm-ng/
>  F:	package/ramsmp/
>  
> +N:	Kevin Joly <kevin.joly@sensefly.com>
> +F:	package/libgphoto2/
> +
>  N:	Laurent Cans <laurent.cans@gmail.com>
>  F:	package/aircrack-ng/
>  
> diff --git a/package/Config.in b/package/Config.in
> index c12e5b5..f98a2b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1086,6 +1086,7 @@ menu "Hardware handling"
>  	source "package/libfreefare/Config.in"
>  	source "package/libftdi/Config.in"
>  	source "package/libftdi1/Config.in"
> +	source "package/libgphoto2/Config.in"
>  	source "package/libgpiod/Config.in"
>  	source "package/libgudev/Config.in"
>  	source "package/libhid/Config.in"
> diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
> new file mode 100644
> index 0000000..fd53232
> --- /dev/null
> +++ b/package/libgphoto2/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBGPHOTO2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_LIBXML2
> +	bool "libgphoto2"

 This should come right below the config line.
(you can now run './support/scripts/check-package package/libgphoto2/*' to
detect this kind of error).

> +	help
> +	  libgphoto2 is the core library designed to allow access to
> +	  digital camera by external programs.
> +
> +	  http://gphoto.org/proj/libgphoto2/
> +
> +comment "libgphoto needs a toolchain w threads"
                                        ^w/

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
> new file mode 100644
> index 0000000..1afe275
> --- /dev/null
> +++ b/package/libgphoto2/libgphoto2.hash
> @@ -0,0 +1,6 @@
> +# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.13/
> +md5 73bf5b3d94c8c6f5fad9ea6b5e561843 libgphoto2-2.5.13.tar.bz2
> +sha1 cef2d2f1930f8ada16a63aca15683188231a626a libgphoto2-2.5.13.tar.bz2
> +
> +# Locally calculated hash
> +sha256 ceaacbdf187d1cd1aed5336991f46b0100f6960b6c8383f9aeab98f1f64780ef libgphoto2-2.5.13.tar.bz2
> diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
> new file mode 100644
> index 0000000..24dac19
> --- /dev/null
> +++ b/package/libgphoto2/libgphoto2.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# libgphoto2
> +#
> +################################################################################
> +
> +LIBGPHOTO2_VERSION = 2.5.13
> +LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
> +# Project is maintained on github but github tarball doesn't have configure
> +LIBGPHOTO2_SITE = https://sourceforge.net/projects/gphoto/files/libgphoto/$(LIBGPHOTO2_VERSION)
> +LIBGPHOTO2_INSTALL_STAGING = YES
> +
> +LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
> +	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg).
> +LIBGPHOTO2_LICENSE_FILES = COPYING
> +# No license files for other licenses
> +
> +LIBGPHOTO2_DEPENDENCIES = libxml2 libusb libtool host-pkgconf
> +LIBGPHOTO2_CONF_OPTS += --disable-rpm

 It might be good to also add --disable-gp2ddb --disable-internal-docs but these
are anyway disabled by default so not so important.

> +
> +ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)

 Maybe add

# libusb-compat is not actually used, but it is detected, so add it here to
# guarantee reproducible builds

> +LIBGPHOTO2_DEPENDENCIES += libusb-compat
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEXIF),y)
> +LIBGPHOTO2_DEPENDENCIES += libexif
> +LIBGPHOTO2_CONF_OPTS += --with-libexif=auto
> +else
> +LIBGPHOTO2_CONF_OPTS += --with-libexif=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBJPEG),y)
> +LIBGPHOTO2_DEPENDENCIES += libjpeg
> +LIBGPHOTO2_CONF_OPTS += --with-jpeg
> +else
> +LIBGPHOTO2_CONF_OPTS += --without-jpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GD),y)
> +LIBGPHOTO2_DEPENDENCIES += gd
> +LIBGPHOTO2_CONF_OPTS += --with-gdlib=auto
> +else
> +LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LOCKDEV),y)
> +LIBGPHOTO2_DEPENDENCIES += lockdev

 Good catch!

> +endif
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
