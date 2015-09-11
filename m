From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 12:42:11 +0100
Subject: [Buildroot] [PATCH 1/4] package/cups: Un-deprecate,
 and update CUPS to 2.1.0
In-Reply-To: <1441965911-22138-2-git-send-email-olivier.schonken@gmail.com>
References: <1441965911-22138-1-git-send-email-olivier.schonken@gmail.com>
 <1441965911-22138-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <55F2BE13.7050309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

please mark your old series as superseded in Patchwork:

http://patchwork.ozlabs.org/patch/459154/
http://patchwork.ozlabs.org/patch/459155/
http://patchwork.ozlabs.org/patch/459156/
http://patchwork.ozlabs.org/patch/459157/

More comments below. Please keep reading.

On 09/11/2015 11:05 AM, Olivier Schonken wrote:

[snip]

> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index c028ef4..0056462 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_VERSION = 1.3.11
> +CUPS_VERSION = 2.1.0
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
>  CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
>  CUPS_LICENSE = GPLv2 LGPLv2

For me it fails to build statically for MIPS architecture because it's
using -fPIE and -pie. I would suggest you to add the following changes
to your patch in order to fix this:


--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -12,6 +12,15 @@ CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR)
install
+
+# Don't use -fPIE and -pie for static builds
+ifeq ($(BR2_STATIC_LIBS),y)
+define CUPS_REMOVE_PIEFLAGS
+       $(SED) s/@PIEFLAGS@// $(@D)/Makedefs.in
+endef
+CUPS_PRE_CONFIGURE_HOOKS += CUPS_REMOVE_PIEFLAGS
+endif
+
 CUPS_CONF_OPTS = \
        --without-perl \
        --without-java \


Regards,

Vincent.

> @@ -16,16 +16,14 @@ CUPS_CONF_OPTS = \
>  	--without-perl \
>  	--without-java \
>  	--without-php \
> -	--disable-gnutls \
>  	--disable-gssapi \
>  	--libdir=/usr/lib
>  CUPS_CONFIG_SCRIPTS = cups-config
>  
> -CUPS_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_ZLIB),zlib) \
> -	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
> -	$(if $(BR2_PACKAGE_JPEG),jpeg) \
> -	$(if $(BR2_PACKAGE_TIFF),tiff)
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +CUPS_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
> +CUPS_DEPENDENCIES += systemd
> +endif
>  
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  CUPS_CONF_OPTS += --enable-dbus
> @@ -34,8 +32,11 @@ else
>  CUPS_CONF_OPTS += --disable-dbus
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -CUPS_DEPENDENCIES += xlib_libX11
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +CUPS_CONF_OPTS += --enable-gnutls
> +CUPS_DEPENDENCIES += gnutls
> +else
> +CUPS_CONF_OPTS += --disable-gnutls
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
> @@ -45,18 +46,25 @@ else
>  CUPS_CONF_OPTS += --without-python
>  endif
>  
> -ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
> -CUPS_CONF_OPTS += --enable-pdftops
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +CUPS_CONF_OPTS += --enable-libusb
> +CUPS_DEPENDENCIES += libusb
>  else
> -CUPS_CONF_OPTS += --disable-pdftops
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
> +ifeq ($(BR2_PACKAGE_CUPS_AVAHI),y)
> +CUPS_DEPENDENCIES += avahi
> +CUPS_CONF_OPTS += --enable-avahi
> +else
> +CUPS_CONF_OPTS += --disable-avahi
> +endif
>  
>  $(eval $(autotools-package))
> 
