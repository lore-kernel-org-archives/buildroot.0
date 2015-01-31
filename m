From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Jan 2015 23:38:40 +0100
Subject: [Buildroot] [PATCH 1/1] libvips: new package
In-Reply-To: <1422534785-24666-1-git-send-email-pieter.degendt@gmail.com>
References: <1422534785-24666-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <20150131233840.6be280ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter De Gendt,

Thanks for this contribution! There are however a few issues in your
patch that need to be resolved before it can be applied. See below my
comments.

On Thu, 29 Jan 2015 13:33:05 +0100, Pieter De Gendt wrote:

> diff --git a/package/libvips/Config.in b/package/libvips/Config.in
> new file mode 100644
> index 0000000..bba40f4
> --- /dev/null
> +++ b/package/libvips/Config.in
> @@ -0,0 +1,47 @@
> +menuconfig BR2_PACKAGE_LIBVIPS
> +	bool "libvips"
> +	depends on BR2_USE_MMU # glib2

If you actually use libglib2, then you should:

	select BR2_PACKAGE_LIBGLIB2

here. And you should also inherits all its dependencies: not only MMU,
but also wchar and threads. See package/libglib2/Config.in.

> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> +	help
> +	  libvips is a 2D image processing library. Compared to similar libraries, 
> +	  libvips runs quickly and uses little memory. livips is licensed under the LGPL 2.1+.

Please wrap your text to ~72 columns. Also the last sentence about the
license is a bit useless since the license should anyway be encoded in
the .mk file.

> +
> +	  http://www.vips.ecs.soton.ac.uk/
> +
> +if BR2_PACKAGE_LIBVIPS
> +
> +config BR2_PACKAGE_LIBVIPS_WITH_JPEG
> +	bool "jpeg support"
> +	select BR2_PACKAGE_JPEG
> +	help
> +	  Use shared libjpeg from the target system.
> +
> +config BR2_PACKAGE_LIBVIPS_WITH_LIBPNG
> +	bool "png support"
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  Use shared libpng from the target system.
> +
> +config BR2_PACKAGE_LIBVIPS_WITH_TIFF
> +	bool "tiff support"
> +	select BR2_PACKAGE_TIFF
> +	help
> +	  Use shared tiff from the target system.
> +
> +config BR2_PACKAGE_LIBVIPS_WITH_FFTW
> +	bool "fftw support"
> +	select BR2_PACKAGE_FFTW
> +	help
> +	  Use shared fftw from the target system.
> +
> +config BR2_PACKAGE_LIBVIPS_WITH_LIBEXIF
> +	bool "libexif support"
> +	select BR2_PACKAGE_LIBEXIF
> +	help
> +	  Use shared libexif from the target system.

We typically don't call such options BR2_PACKAGE_<foo>_WITH_<bar>, but
just BR2_PACKAGE_<foo>_<bar>. But, do we really want such options? In
such cases, we generally do what we call "automatic dependencies":
the .mk file automatically enables the jpeg suport if the JPEG library
is available.

> +endif # BR2_PACKAGE_LIBVIPS
> +
> +comment "libvips needs a toolchain w/ MMU support"
> +        depends on !BR2_USE_MMU
> \ No newline at end of file

This comment is not needed: we don't add comments for things that the
user cannot "fix": a user cannot magically add MMU support to a non-MMU
architecture. So we only add comments for toolchain features that the
user can actually control: wchar, threads. So in the case of this
package, which inherits the wchar and threads dependencies from
libglib2, the comment should be:

comment "libvips needs a toolchain w/ wchar, threads"
	depends on BR2_USE_MMU
	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

Also make sure to have a newline at the end of the last line of th
efile.

> diff --git a/package/libvips/libvips-01-fix-no-gtk-doc.patch b/package/libvips/libvips-01-fix-no-gtk-doc.patch
> new file mode 100644
> index 0000000..bfaf7c3
> --- /dev/null
> +++ b/package/libvips/libvips-01-fix-no-gtk-doc.patch
> @@ -0,0 +1,35 @@
> +From a3d47be3b6bed845af5e1aa87ca2da2b1e840cbb Mon Sep 17 00:00:00 2001
> +From: Pieter De Gendt <pieter.degendt@basalte.be>
> +Date: Thu, 29 Jan 2015 12:25:35 +0100
> +Subject: [PATCH] Same patch as for systemd in commit
> + http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
> +
> +Fix deactivation of gtk-doc
> +
> +The tarball contains the Makefile for building documentation with gtk-doc,
> +Unfortunately the AM_CONDITIONAL variable is not the correct one, which
> +results in an error when running autoreconf.
> +
> +This patch fixes this issue.
> +
> +Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> +---
> + doc/reference/gtk-doc.make | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/doc/reference/gtk-doc.make b/doc/reference/gtk-doc.make
> +index e791656..786803e 100644
> +--- a/doc/reference/gtk-doc.make
> ++++ b/doc/reference/gtk-doc.make
> +@@ -267,7 +267,7 @@ uninstall-local:
> + #
> + # Require gtk-doc when making dist
> + #
> +-if HAVE_GTK_DOC
> ++if ENABLE_GTK_DOC
> + dist-check-gtkdoc: docs
> + else
> + dist-check-gtkdoc:
> +-- 
> +2.2.2
> +
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> new file mode 100644
> index 0000000..8e2bc10
> --- /dev/null
> +++ b/package/libvips/libvips.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# libvips
> +#
> +################################################################################
> +
> +LIBVIPS_VERSION_MAJOR = 7.42
> +LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).1
> +LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
> +LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
> +LIBVIPS_LICENSE = LGPLv2.1+
> +LIBVIPS_LICENSE_FILES = COPYING
> +
> +LIBVIPS_AUTORECONF = YES

Add a comment above this line:

# We're patching gtk-doc.make, so need to autoreconf

> +LIBVIPS_CONF_OPT = --disable-docs --disable-gtk-doc --disable-introspection

Please use the latest version of Buildroot (git master) to test your
patches. This variable is now called <pkg>_CONF_OPTS.

--disable-docs is not needed, because it's already passed to all
autotools package by the autotools package infra. Same for
--disable-gtk-doc.

> +LIBVIPS_INSTALL_STAGING = YES
> +LIBVIPS_DEPENDENCIES = host-pkgconf host-swig host-automake host-autoconf host-libtool libglib2 libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

Please remove host-automake, host-autoconf and host-libtool from this
list. They are automatically added to the dependencies because you pass
LIBVIPS_AUTORECONF = YES.

> +
> +ifeq ($(BR2_PACKAGE_LIBVIPS_CXX),y)

This option doesn't exist. Please use instead:

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)

> +LIBVIPS_CONF_OPT += --enable-cxx

_CONF_OPTS

> +else
> +LIBVIPS_CONF_OPT += --disable-cxx

Ditto (and same for all other occurrences).

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_JPEG),y)

As explained above, I believe you should get rid of this option, and
use instead:

ifeq ($(BR2_PACKAGE_JPEG),y)

And same for libpng, tiff, fftw, libexif.

> +$(eval $(autotools-package))
> \ No newline at end of file

Please add the missing newline here.

Could you work on those issues and send an updated version of your
patch?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
