From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 11:35:36 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: add new package
 cups-filters 1.17.9
In-Reply-To: <20171019111502.23419-1-olivier.schonken@gmail.com>
References: <20171019111502.23419-1-olivier.schonken@gmail.com>
Message-ID: <20171021113536.08f1ba93@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 13:15:02 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  Config.in.legacy                       |  1 +
>  package/Config.in                      |  1 +
>  package/cups-filters/Config.in         | 31 ++++++++++++++
>  package/cups-filters/cups-filters.hash |  2 +
>  package/cups-filters/cups-filters.mk   | 78 ++++++++++++++++++++++++++++++++++
>  5 files changed, 113 insertions(+)
>  create mode 100644 package/cups-filters/Config.in
>  create mode 100644 package/cups-filters/cups-filters.hash
>  create mode 100644 package/cups-filters/cups-filters.mk

Thanks for this contribution. Unfortunately, it doesn't build here,
even after fixing a number of build issues. Dependencies on fontconfig
and freetype were missing, so I added them. But even with that, the
build still fails with:

checking for LIBQPDF... no
configure: error: Package requirements (libqpdf >= 3.0.2) were not met:

Package libjpeg was not found in the pkg-config search path.
Perhaps you should add the directory containing `libjpeg.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libjpeg', required by 'libqpdf', not found

But libjpeg is installed (as a dependency of qpdf), but it hasn't
installed any .pc file.

Another minor issue is that you forgot to update the DEVELOPERS file.

> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> new file mode 100644
> index 0000000000..2fd859a6b1
> --- /dev/null
> +++ b/package/cups-filters/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_CUPS_FILTERS
> +       bool "cups-filters"
> +       # needs fork()

This entire file is broken: it uses spaces instead of tabs for
indentation. If possible, try to use ./utils/check-package to check
this kind of coding style problems.

> +       help
> +         This project provides backends, filters, and other software that was
> +         once part of the core CUPS distribution but is no longer maintained
> +         by Apple Inc. In addition it contains additional filters and software
> +         developed independently of Apple, especially filters for the PDF-
> +         centric printing workflow introduced by OpenPrinting and a daemon
> +         to browse Bonjour broadcasts of remote CUPS printers to make these
> +         printers available locally and to provide backward compatibility to
> +         the old CUPS broadcasting and browsing of CUPS 1.5.x and older.
> +         From CUPS 1.6.0 on, this package is required for using printer drivers
> +         with CUPS under Linux. With CUPS 1.5.x and earlier this package can be
> +         used optionally to switch over to PDF-based printing.

Text needs to be wrapped at 72 characters.

> +comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library  support"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_STATIC_LIBS
> +

Useless empty newline.

> +CUPS_FILTERS_VERSION = 1.17.9
> +CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
> +CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause

I was hoping to get a description of what is under what license, but
the list is super long, and it's anyway described very clearly in the
COPYING file. So for me, what you did is good enough.

> +CUPS_FILTERS_LICENSE_FILES = COPYING
> +
> +CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf

So fontconfig and freetype missing here.

> +
> +CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
> +       --disable-mutool \
> +       --disable-foomatic \
> +       --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
> +       --with-sysroot=$(STAGING_DIR) \
> +       --with-pdftops=pdftops

Please use one tab for indentation, not spaces.

Could you fix those problems, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
