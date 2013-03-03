From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 19:07:45 +0100
Subject: [Buildroot] [PATCH 1/1] Added package HPLIP for printing to HP
 printers
In-Reply-To: <1362243769-8714-1-git-send-email-olivier.schonken@gmail.com>
References: <1362243769-8714-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130303190745.0f89b2e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sat,  2 Mar 2013 19:02:49 +0200, Olivier Schonken wrote:
> HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

The commit log should be wrapped at ~80 columns.

> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index dc1c2ed..7b703ff 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -18,4 +18,5 @@ config BR2_PACKAGE_CUPS_PDFTOPS
>  comment "pdftops support requires a toolchain with C++ support enabled"
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  
> +source "package/hplip/Config.in"
>  endif

No, I think the package should still be included from package/Config.in
like all other packages, but maybe it can carry a "depends on
BR2_PACKAGE_CUPS" in package/hplip/Config.in. I guess we can assume
that the person who wants the HP printer drivers will know that CUPS
should be enabled.

> diff --git a/package/hplip/Config.in b/package/hplip/Config.in
> new file mode 100644
> index 0000000..b0d802a
> --- /dev/null
> +++ b/package/hplip/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_HPLIP
> +	bool "hplip"
> +	select BR2_PACKAGE_LIBUSB
> +	help
> +	  HP Linux Imaging and Printing (HPLIP)
> +	  HPLIP is an HP-developed solution for printing, scanning, and faxing
> +	  with HP inkjet and laser based printers in Linux. The HPLIP project 
> +	  provides printing support for 2,211 printer models, including 
> +	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business 
> +	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP. 
> +	  
> +	  http://hplipopensource.com/
> +
> diff --git a/package/hplip/hplip-fix-make.patch b/package/hplip/hplip-fix-make.patch
> new file mode 100644
> index 0000000..339e58e
> --- /dev/null
> +++ b/package/hplip/hplip-fix-make.patch
> @@ -0,0 +1,80 @@
> +From 1e03ca316a3784290b489470b16c34b7f44a0c75 Mon Sep 17 00:00:00 2001
> +From: Olivier Schonken <olivier.schonken@gmail.com>
> +Date: Sat, 2 Mar 2013 18:01:03 +0200
> +Subject: [PATCH] Changed Makefile.am and Makefile.in to allow
> + cross-compilation of HPLIP
> +
> +Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> +---
> + Makefile.am |    4 ++--
> + Makefile.in |   16 ++--------------
> + 2 files changed, 4 insertions(+), 16 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 16ea902..00ec8da 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -72,7 +72,7 @@ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/
> + 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
> + 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb_libusb01.c
> + else
> +-libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
> ++libhpmud_la_CFLAGS = -I$(includedir)/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"

You should make this -I$(includedir)/libusb-1.0

> + libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
> + 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
> + 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb.c
> +@@ -292,7 +292,7 @@ hpmudext_la_LIBADD = libhpmud.la
> + if LIBUSB01_BUILD
> + hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
> + else
> +-hpmudext_la_CFLAGS =-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
> ++hpmudext_la_CFLAGS =-I$(includedir)/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)

Ditto, -I$(includedir)/libusb-1.0

> + endif
> + 
> + # ui (qt3)
> +diff --git a/Makefile.in b/Makefile.in
> +index e8e6142..5d9c331 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in

You are patching both Makefile.am and Makefile.in. Normally, we prefer
to patch Makefile.am and do HPLIP_AUTORECONF=YES. Have you tried that?
Have you had issues in doing this?

> diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
> new file mode 100644
> index 0000000..03fb514
> --- /dev/null
> +++ b/package/hplip/hplip.mk
> @@ -0,0 +1,52 @@
> +#############################################################
> +#
> +# hplip
> +#
> +#############################################################

One blank line between header and first variable.

> +HPLIP_VERSION = 3.12.11
> +HPLIP_SITE = http://prdownloads.sourceforge.net/hplip/hplip/

Please use http://downloads.sourceforge.net instead (see other
packages).

> +HPLIP_SOURCE = hplip-$(HPLIP_VERSION).tar.gz

Not needed, that's the default.

> +HPLIP_INSTALL_STAGING = NO
> +HPLIP_LIBTOOL_PATCH = YES 
> +HPLIP_AUTORECONF = NO

All those values are the default, so they are unneeded. However, if
possible, make your patch only on Makefile.am and do
HPLIP_AUTORECONF = YES.

> +
> +#HPLIP_CONF_ENV += \
> +#	ac_cv_prog_ac_ct_STRIP=arm-none-linux-gnueabi-strip

Please remove such dead code.

> +
> +HPLIP_CONF_OPT =           --disable-qt4 \
> +                           --disable-scan-build \
> +                           --disable-gui-build \
> +                           --disable-doc-build \
> +                           --disable-network-build \
> +                           --enable-hpcups-install \
> +                           --disable-hpijs-install \
> +                           --enable-cups-ppd-install \
> +                           --enable-cups-drv-install \
> +                           --disable-foomatic-ppd-install \
> +                           --disable-foomatic-drv-install \
> +                           --disable-foomatic-rip-hplip-install \
> +                           --enable-new-hpcups \
> +                           --enable-lite-build \
> +                           --with-sysroot=$(STAGING_DIR) \

Why is this needed?

> +			   --includedir=$(STAGING_DIR)

Remove this --includedir, once you make the modification I suggested
above (-I$(includedir)/libusb-1.0), it should no longer be needed to
pass a custom --incluedir.

Also, that's nitpicking, but we usually prefer the following formatting:

HPLIP_CONF_OPT = \
	--enable-foo \
	--disable-bar \
	--with-something=foobar

> +
> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +             HPLIP_CONF_OPT += --enable-dbus-build 
> +endif

Add a:

else
	HPLIP_CONFIG_OPT += --disable-dbus-build
endif


> +   
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +             HPLIP_CONF_OPT += --disable-shared 
> +else
> +             HPLIP_CONF_OPT += --enable-shared 
> +endif

Not needed, already passed by the autotools package infrastructure.

> +
> +HPLIP_DEPENDENCIES = cups libusb
> +
> +
> +define HPLIP_POST_INSTALL_TARGET_FIXUP
> +	mkdir -p $(TARGET_DIR)/usr/share/hplip/data/models
> +        cp $(@D)/data/models/* $(TARGET_DIR)/usr/share/hplip/data/models
> +endef

Please fix the indentation here, it should be one tab.

> +HPLIP_POST_INSTALL_TARGET_HOOKS += HPLIP_POST_INSTALL_TARGET_FIXUP
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
