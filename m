From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 15:57:44 +0100
Subject: [Buildroot] [PATCH 1/8] package/cups: Un-deprecate,
 and update CUPS to 2.0.2
In-Reply-To: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <550ED868.2020101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Olivier,

On 22/03/15 15:10, Olivier Schonken wrote:

 Please add a short explanation why the removed patches are no longer necessary.

> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  ...01-Remove-building-html-from-man-makefile.patch | 27 +++++++++++
>  package/cups/0001-fix-static.patch                 | 28 ------------
>  package/cups/0002-Do-not-use-genstrings.patch      | 27 +++++++++++
>  package/cups/0002-fix-stack-protector-check.patch  | 25 -----------
>  package/cups/0003-mantohtml.patch                  | 11 -----
>  package/cups/Config.in                             | 17 ++++---
>  package/cups/cups.hash                             |  2 +
>  package/cups/cups.mk                               | 52 +++++++++++++++-------
>  8 files changed, 99 insertions(+), 90 deletions(-)
>  create mode 100644 package/cups/0001-Remove-building-html-from-man-makefile.patch
>  delete mode 100644 package/cups/0001-fix-static.patch
>  create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
>  delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
>  delete mode 100644 package/cups/0003-mantohtml.patch
>  create mode 100644 package/cups/cups.hash
> 
> diff --git a/package/cups/0001-Remove-building-html-from-man-makefile.patch b/package/cups/0001-Remove-building-html-from-man-makefile.patch
> new file mode 100644
> index 0000000..546e76b
> --- /dev/null
> +++ b/package/cups/0001-Remove-building-html-from-man-makefile.patch
> @@ -0,0 +1,27 @@
> +From da960a1384625d2550ffbf5765a10fe9b3aa5a51 Mon Sep 17 00:00:00 2001
> +From: Olivier Schonken <olivier.schonken@gmail.com>
> +Date: Wed, 18 Mar 2015 20:30:39 +0200
> +Subject: [PATCH 1/2] Remove building html from man makefile
> +
> +Building and using mantohtml causes problems for cross-compiling

 Wouldn't it be better to remove the entire man directory from the build?

 And even better of course would be an upstreamable patch that makes the
documentation build optional. Or alternatively, and probably easier to upstream,
a patch that uses $(CC_FOR_BUILD) for host tools.

> +
> +Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> +---
> + man/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/man/Makefile b/man/Makefile
> +index dc1a8c0..0ad42a1 100644
> +--- a/man/Makefile
> ++++ b/man/Makefile
> +@@ -73,7 +73,7 @@ MAN8	=	cupsaccept.$(MAN8EXT) \
> + # Make everything...
> + #
> +
> +-all:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) html
> ++all:	$(MAN1) $(MAN5) $(MAN7) $(MAN8)
> +
> +
> + #
> +--
> +1.9.1
[snip]
> diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
> new file mode 100644
> index 0000000..eef3409
> --- /dev/null
> +++ b/package/cups/0002-Do-not-use-genstrings.patch
> @@ -0,0 +1,27 @@
> +From 8a5666a586e752b6c513bc8a7467c8a00085f069 Mon Sep 17 00:00:00 2001
> +From: Olivier Schonken <olivier.schonken@gmail.com>
> +Date: Wed, 18 Mar 2015 20:33:41 +0200
> +Subject: [PATCH 2/2] Do not use genstrings
> +
> +Using cross compiled genstrings while cross-compiling will break compilation.
> +
> +Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> +---
> + ppdc/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ppdc/Makefile b/ppdc/Makefile
> +index bc8bb64..f6bae25 100644
> +--- a/ppdc/Makefile
> ++++ b/ppdc/Makefile
> +@@ -243,7 +243,7 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
> +		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
> +		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
> +	echo Generating localization strings...

 This is also one that could be solved by using CC_FOR_BUILD.

> +-	./genstrings >sample.c
> ++	#./genstrings >sample.c
> +
> +
> + #
> +--
> +1.9.1
[snip]
> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index 8e60221..a161818 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -1,8 +1,7 @@
>  config BR2_PACKAGE_CUPS
>  	bool "cups"
> -	# serious security issues, needs upgrading
> -	depends on BR2_DEPRECATED_SINCE_2015_05
>  	# needs fork()
> +	depends on BR2_INSTALL_LIBSTDCPP

 The fork() comment is no longer in the right place.

>  	depends on BR2_USE_MMU
>  	help
>  	  The Common Unix Printing System
> @@ -11,13 +10,13 @@ config BR2_PACKAGE_CUPS
>  
>  if BR2_PACKAGE_CUPS
>  
> -config BR2_PACKAGE_CUPS_PDFTOPS
> -	bool "pdftops support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> +config BR2_PACKAGE_CUPS_AVAHI
> +	bool "avahi support"
> +	depends on !BR2_STATIC_LIBS # avahi
> +	select BR2_PACKAGE_AVAHI

 depends on threads, dynamic library.

> +	select BR2_PACKAGE_AVAHI_DAEMON
>  	help
> -	  Enable pdftops support
> -
> -comment "pdftops support needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +	  Enable Avahi support.
> +	  Select this if you want cups to support Bonjour protocol.
>  
>  endif
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> new file mode 100644
> index 0000000..8e99ea8
> --- /dev/null
> +++ b/package/cups/cups.hash
> @@ -0,0 +1,2 @@
> +# From https://www.cups.org/
> +md5	6e0ea72dbafcf5baaa1cf4178e71096d	cups-2.0.2-source.tar.bz2

 If it's just md5 we typically add a locally-calculated sha256.

> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index b6a0663..ade491b 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_VERSION = 1.3.11
> +CUPS_VERSION = 2.0.2
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
>  CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
>  CUPS_LICENSE = GPLv2 LGPLv2
> @@ -16,16 +16,24 @@ CUPS_CONF_OPTS = \
>  	--without-perl \
>  	--without-java \
>  	--without-php \
> -	--disable-gnutls \
>  	--disable-gssapi \
>  	--libdir=/usr/lib
>  CUPS_CONFIG_SCRIPTS = cups-config
>  
>  CUPS_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_ZLIB),zlib) \
> -	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
> -	$(if $(BR2_PACKAGE_JPEG),jpeg) \
> -	$(if $(BR2_PACKAGE_TIFF),tiff)
> +	cups-filters
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +	CUPS_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
> +	CUPS_DEPENDENCIES += systemd

 We don't indent within conditions.

 But in this case, the rest of the file already does that, so either clean up
indentation first or keep this unusual indentation.

> +endif
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	CUPS_CONF_OPTS += --enable-static \
> +			  --disable-shared

 We indent continuation lines with a single tab, we don't try to align (because
that can go wrong very easily when you have a different tab size).


 Regards,
 Arnout

> +else
> +	CUPS_CONF_OPTS += --enable-shared
> +endif
>  
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  	CUPS_CONF_OPTS += --enable-dbus
> @@ -34,8 +42,11 @@ else
>  	CUPS_CONF_OPTS += --disable-dbus
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -	CUPS_DEPENDENCIES += xlib_libX11
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +	CUPS_CONF_OPTS += --enable-gnutls
> +	CUPS_DEPENDENCIES += gnutls
> +else
> +	CUPS_CONF_OPTS += --disable-gnutls
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
> @@ -45,18 +56,25 @@ else
>  	CUPS_CONF_OPTS += --without-python
>  endif
>  
> -ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
> -	CUPS_CONF_OPTS += --enable-pdftops
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +	CUPS_CONF_OPTS += --enable-libusb
> +	CUPS_DEPENDENCIES += libusb
>  else
> -	CUPS_CONF_OPTS += --disable-pdftops
> +	CUPS_CONF_OPTS += --disable-libusb
>  endif
>  
> -# standard autoreconf fails with autoheader failures
> -define CUPS_FIXUP_AUTOCONF
> -	cd $(@D) && $(AUTOCONF)
> -endef
> -CUPS_DEPENDENCIES += host-autoconf
> +ifeq ($(BR2_PACKAGE_LIBPAPER),y)
> +	CUPS_CONF_OPTS += --enable-libpaper
> +	CUPS_DEPENDENCIES += libpaper
> +else
> +	CUPS_CONF_OPTS += --disable-libpaper
> +endif
>  
> -CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
> +ifeq ($(BR2_PACKAGE_CUPS_FILTERS_AVAHI),y)
> +	CUPS_DEPENDENCIES += avahi
> +	CUPS_CONF_OPTS += --enable-avahi
> +else
> +	CUPS_CONF_OPTS += --disable-avahi
> +endif
>  
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
