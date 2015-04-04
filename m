From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:17:52 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/cups: Un-deprecate,
 and update CUPS to 2.0.2
In-Reply-To: <1427058772-1105-2-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
 <1427058772-1105-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150404111752.54aedac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 22 Mar 2015 23:12:45 +0200, Olivier Schonken wrote:

> diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
> new file mode 100644
> index 0000000..e5b2de3
> --- /dev/null
> +++ b/package/cups/0002-Do-not-use-genstrings.patch
> @@ -0,0 +1,27 @@
> +From a863814f6dadda054c964897210789eafff6f605 Mon Sep 17 00:00:00 2001
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
> +-	./genstrings >sample.c
> ++	#./genstrings >sample.c

So how does the cups build work without this sample.c file being
generated?


> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index 8e60221..e1d3c68 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_CUPS
>  	bool "cups"
> -	# serious security issues, needs upgrading
> -	depends on BR2_DEPRECATED_SINCE_2015_05
> +	depends on BR2_INSTALL_LIBSTDCPP

So this needs a new comment about C++ dependency of CUPS.

>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	help
> @@ -11,13 +10,14 @@ config BR2_PACKAGE_CUPS
>  
>  if BR2_PACKAGE_CUPS
>  
> -config BR2_PACKAGE_CUPS_PDFTOPS
> -	bool "pdftops support"
> -	depends on BR2_INSTALL_LIBSTDCPP

When options are removed we normally expect to have a corresponding
entry in Config.in.legacy.

> +config BR2_PACKAGE_CUPS_AVAHI
> +	bool "avahi support"
> +	depends on !BR2_STATIC_LIBS # avahi
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS # avahi
> +	select BR2_PACKAGE_AVAHI
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
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index b6a0663..e1d79e9 100644
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
> @@ -16,47 +16,65 @@ CUPS_CONF_OPTS = \
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

cups-filters is only added as a new package later in the series.

> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +CUPS_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
> +CUPS_DEPENDENCIES += systemd
> +endif
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +CUPS_CONF_OPTS += --enable-static \
> +	--disable-shared
> +else
> +CUPS_CONF_OPTS += --enable-shared
> +endif

Why do you need this chunk? The autotools package infrastructure
already passes the --{enable,disable}-{shared,static} options.

>  ifeq ($(BR2_PACKAGE_DBUS),y)
> -	CUPS_CONF_OPTS += --enable-dbus
> -	CUPS_DEPENDENCIES += dbus
> +CUPS_CONF_OPTS += --enable-dbus
> +CUPS_DEPENDENCIES += dbus
>  else
> -	CUPS_CONF_OPTS += --disable-dbus
> +CUPS_CONF_OPTS += --disable-dbus
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -	CUPS_DEPENDENCIES += xlib_libX11
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +CUPS_CONF_OPTS += --enable-gnutls
> +CUPS_DEPENDENCIES += gnutls
> +else
> +CUPS_CONF_OPTS += --disable-gnutls
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
> -	CUPS_CONF_OPTS += --with-python
> -	CUPS_DEPENDENCIES += python
> +CUPS_CONF_OPTS += --with-python
> +CUPS_DEPENDENCIES += python
>  else
> -	CUPS_CONF_OPTS += --without-python
> +CUPS_CONF_OPTS += --without-python
>  endif

It's a bit sad to have mixed the package bump with the change of
indentation, because it makes the patch harder to read. Also, the
indentation in the cups package has already been fixed in master.

> -ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
> -	CUPS_CONF_OPTS += --enable-pdftops
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +CUPS_CONF_OPTS += --enable-libusb
> +CUPS_DEPENDENCIES += libusb
>  else
> -	CUPS_CONF_OPTS += --disable-pdftops
> +CUPS_CONF_OPTS += --disable-libusb
>  endif
>  
> -# standard autoreconf fails with autoheader failures
> -define CUPS_FIXUP_AUTOCONF
> -	cd $(@D) && $(AUTOCONF)
> -endef
> -CUPS_DEPENDENCIES += host-autoconf
> +ifeq ($(BR2_PACKAGE_LIBPAPER),y)
> +CUPS_CONF_OPTS += --enable-libpaper
> +CUPS_DEPENDENCIES += libpaper
> +else
> +CUPS_CONF_OPTS += --disable-libpaper
> +endif
>  
> -CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
> +ifeq ($(BR2_PACKAGE_CUPS_FILTERS_AVAHI),y)

There is no such option. Probably you meant BR2_PACKAGE_CUPS_AVAHI ?

> +CUPS_DEPENDENCIES += avahi
> +CUPS_CONF_OPTS += --enable-avahi
> +else
> +CUPS_CONF_OPTS += --disable-avahi
> +endif
>  
>  $(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
