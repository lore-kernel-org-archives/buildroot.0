From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 23:58:03 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/cups-filters: Add new
 package cups-filters 1.0.74
In-Reply-To: <1442319834-20549-5-git-send-email-olivier.schonken@gmail.com>
References: <1442319834-20549-1-git-send-email-olivier.schonken@gmail.com>
 <1442319834-20549-5-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150916235803.7eb51234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

On Tue, 15 Sep 2015 14:23:54 +0200, Olivier Schonken wrote:
> Add --enable-xpdf-headers to poppler.mk. Required for succesfull
> build of cups-filters.

The poppler.mk modification should be a separate patch, coming before
cups-filters in the patch series.

> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> new file mode 100644
> index 0000000..cb70192
> --- /dev/null
> +++ b/package/cups-filters/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_CUPS_FILTERS
> +	bool "cups-filters"
> +	depends on BR2_PACKAGE_CUPS
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_IJS
> +	select BR2_PACKAGE_LCMS2
> +	select BR2_PACKAGE_POPPLER
> +	select BR2_PACKAGE_QPDF

You need to replicate here the dependencies of all those packages you
are selected, and add the corresponding comment.

> +	# needs fork()
> +	depends on BR2_USE_MMU
> +	help
> +	  This project provides backends, filters, and other software that was
> +	  once part of the core CUPS distribution but is no longer maintained
> +	  by Apple Inc. In addition it contains additional filters and software
> +	  developed independently of Apple, especially filters for the PDF-
> +	  centric printing workflow introduced by OpenPrinting and a daemon
> +	  to browse Bonjour broadcasts of remote CUPS printers to make these
> +	  printers available locally and to provide backward compatibility to
> +	  the old CUPS broadcasting and browsing of CUPS 1.5.x and older.
> +	  From CUPS 1.6.0 on, this package is required for using printer drivers
> +	  with CUPS under Linux. With CUPS 1.5.x and earlier this package can be
> +	  used optionally to switch over to PDF-based printing.
> +
> +	  http://hplipopensource.com/
> +
> +if BR2_PACKAGE_CUPS_FILTERS
> +
> +config BR2_PACKAGE_CUPS_FILTERS_PDFTOPS
> +	bool "pdftops support"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Enable pdftops support

Ah, ok, I know understand that the pdftops support has been moved here.
So indeed please remove the option entirely from cups/Config.in, move
it to Config.in.legacy, and make that old option select this new one.

> +
> +comment "pdftops support needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_CUPS_FILTERS_AVAHI
> +	bool "avahi support"
> +	depends on !BR2_STATIC_LIBS # avahi
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS # avahi

Wrong, it should be:

	depends on BR2_TOOLCHAIN_HAS_THREADS

however, it will not be necessary to have it here, since the main
cups-filters option should depend on thread, since it selects glib2,
which needs thread support.

> +	select BR2_PACKAGE_AVAHI
> +	select BR2_PACKAGE_AVAHI_DAEMON
> +	help
> +	  Enable Avahi support.
> +	  Select this if you want cups to support Bonjour protocol.
> +
> +endif
> diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
> new file mode 100644
> index 0000000..cb300d4
> --- /dev/null
> +++ b/package/cups-filters/cups-filters.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	c091938a7c25a600138c501075b222611ef333157e2554376bb60189032591c5  cups-filters-1.0.74.tar.gz
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> new file mode 100644
> index 0000000..aba3861
> --- /dev/null
> +++ b/package/cups-filters/cups-filters.mk
> @@ -0,0 +1,65 @@
> +#############################################################
> +#
> +# cups-filters
> +#
> +#############################################################

80 # signs needed, and one empty newline between this (silly) header
and the first variable.

> +CUPS_FILTERS_VERSION = 1.0.74
> +CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters/
> +CUPS_FILTERS_LICENSE = GPLv2+
> +CUPS_FILTERS_LICENSE_FILES = COPYING
> +
> +CUPS_FILTERS_DEPENDENCIES = cups libglib2 ijs lcms2 poppler qpdf
> +
> +CUPS_FILTERS_CONF_OPTS = --disable-avahi \
> +                        --disable-imagefilters \
> +                        --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
> +                        --without-png \
> +                        --with-sysroot=$(STAGING_DIR)

One tab only for the indentation (for all options)

> +
> +ifeq ($(BR2_PACKAGE_CUPS_FILTERS_PDFTOPS),y)
> +	CUPS_FILTERS_CONF_OPTS += --with-pdftops=pdftops

Please don't indent such lines (valid for the entire file). Does this
option BR2_PACKAGE_CUPS_FILTERS_PDFTOPS=y adds a lot of overhead? If
not, we could simply enable it unconditionally.

> +endif
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	CUPS_FILTERS_CONF_OPTS += --disable-shared \
> +				  --enable-static
> +else
> +	CUPS_FILTERS_CONF_OPTS += --enable-shared
> +endif

Don't do this, it's done automatically by the package infrastructure,
see http://git.buildroot.net/buildroot/tree/package/Makefile.in#n377
and
http://git.buildroot.net/buildroot/tree/package/pkg-autotools.mk#n179.

> +
> +ifeq ($(BR2_PACKAGE_JPEG),y)
> +	CUPS_FILTERS_CONF_OPTS += --with-jpeg
> +	CUPS_FILTERS_DEPENDENCIES += jpeg
> +else
> +	CUPS_FILTERS_CONF_OPTS += --without-jpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +	CUPS_FILTERS_CONF_OPTS += --with-png
> +	CUPS_FILTERS_DEPENDENCIES += libpng
> +else
> +	CUPS_FILTERS_CONF_OPTS += --without-png
> +endif

So the --without-png in the main CUPS_FILTERS_CONF_OPTS is unnecessary.

> +
> +ifeq ($(BR2_PACKAGE_TIFF),y)
> +	CUPS_FILTERS_CONF_OPTS += --with-tiff
> +	CUPS_FILTERS_DEPENDENCIES += tiff
> +else
> +	CUPS_FILTERS_CONF_OPTS += --without-tiff
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +	CUPS_FILTERS_CONF_OPTS += --enable-dbus
> +	CUPS_FILTERS_DEPENDENCIES += dbus
> +else
> +	CUPS_FILTERS_CONF_OPTS += --disable-dbus
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CUPS_FILTERS_AVAHI),y)
> +	CUPS_FILTERS_DEPENDENCIES += avahi
> +	CUPS_FILTERS_CONF_OPTS += --enable-avahi
> +else
> +	CUPS_FILTERS_CONF_OPTS += --disable-avahi
> +endif

Just like the comment I made on the cups package: why not enable the
Avahi support automatically when BR2_PACKAGE_AVAHI=y ? You're doing
this for jpeg, png, tiff, dbus... but not for Avahi. Is there a
motivation behind this difference?

> +
> +$(eval $(autotools-package))
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 6142cba..b457048 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -11,7 +11,9 @@ POPPLER_DEPENDENCIES = fontconfig host-pkgconf
>  POPPLER_LICENSE = GPLv2+
>  POPPLER_LICENSE_FILES = COPYING
>  POPPLER_INSTALL_STAGING = YES
> -POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
> +POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
> +	--enable-xpdf-headers

As said above: please move this to a separate patch.

> +

And don't add a useless empty line here.

>  
>  ifeq ($(BR2_PACKAGE_LCMS2),y)
>  POPPLER_CONF_OPTS += --enable-cms=lcms2

Can you respin a new iteration that takes into account those comments?
The vast majority of the comments are really trivial things, so it
should be possible to address them quickly in order to finally get
those patches merged.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
