From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 23:34:35 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/cups: Un-deprecate,
 and update CUPS to 2.1.0
In-Reply-To: <1442319834-20549-2-git-send-email-olivier.schonken@gmail.com>
References: <1442319834-20549-1-git-send-email-olivier.schonken@gmail.com>
 <1442319834-20549-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150916233435.69019250@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

First of all, thanks a lot for getting back to this patch series, and
reviving it. We definitely need to update the printing stack in
Buildroot. Please see below some comments.

On Tue, 15 Sep 2015 14:23:51 +0200, Olivier Schonken wrote:

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

Can you use git format-patch -N so that we don't have numbered patches
(i.e [PATCH] instead of [PATCH 1/2]) ?


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

But then, what is generating sample.c ? It indeed builds fine with your
patch, and a quick inspection of the Makefile seems to indicate that
this generated sample.c is in fact not used to build CUPS. Is this
correct?

If so, can you expand the commit log to explain that?

But since genstrings is not even installed to the target, and not even
used, why not instead simply remove it from the TARGETS variable in
ppdc/Makefile ?

> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index 8e60221..d89c86b 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_CUPS
>  	bool "cups"
> -	# serious security issues, needs upgrading
> -	depends on BR2_DEPRECATED_SINCE_2015_05
> +	# needs libstdcpp for ppdc
> +	depends on BR2_INSTALL_LIBSTDCPP

So you need to add:

comment "cups needs a toolchain w/ C++"
	depends on BR2_USE_MMU
	depends on !BR2_INSTALL_LIBSTDCPP

>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	help
> @@ -13,11 +13,16 @@ if BR2_PACKAGE_CUPS
>  
>  config BR2_PACKAGE_CUPS_PDFTOPS
>  	bool "pdftops support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	help
> -	  Enable pdftops support
> +	depends on BR2_DEPRECATED_SINCE_2015_05

It's not deprecated, it's actually removed: the option is no longer
used. So you should instead remove this option, and add it to
Config.in.legacy (in the root of the Buildroot source tree).

Is this pdftops support completely removed from CUPS, or simply made
non-optional?

>  
> -comment "pdftops support needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +config BR2_PACKAGE_CUPS_AVAHI
> +	bool "avahi support"
> +	depends on !BR2_STATIC_LIBS # avahi
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS # avahi

Wrong dependency, it should be: "depends on BR2_TOOLCHAIN_HAS_THREADS".

Also, you need to add a comment about this:

comment "cups avahi support needs a toolchain w/ threads, dynamic library"
	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

> +	select BR2_PACKAGE_AVAHI
> +	select BR2_PACKAGE_AVAHI_DAEMON
> +	help
> +	  Enable Avahi support.
> +	  Select this if you want cups to support Bonjour protocol.

However, do we really need a suboption for that? What about just
enabling Avahi support in CUPS if Avahi is available?

>  
>  endif
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> new file mode 100644
> index 0000000..7c22b55
> --- /dev/null
> +++ b/package/cups/cups.hash
> @@ -0,0 +1,2 @@
> +# From https://www.cups.org/
> +md5	c4e57a66298bfdba66bb3d5bedd317a4	cups-2.1.0-source.tar.bz2

In addition to the md5 provided by cups.org, please add another
stronger hash, even if you have to calculate it locally. For example:

# Locally calculated
sha256	xxxxxxxx				cups-2.1.0-source.tar.bz2

> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index c028ef4..7392372 100644
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
> @@ -12,20 +12,27 @@ CUPS_LICENSE_FILES = LICENSE.txt
>  CUPS_INSTALL_STAGING = YES
>  CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
>  CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
> +
> +# Don't use -fPIE and -pie for static builds
> +ifeq ($(BR2_STATIC_LIBS),y)
> +define CUPS_REMOVE_PIEFLAGS
> +	$(SED) s/@PIEFLAGS@// $(@D)/Makedefs.in
> +endef
> +CUPS_PRE_CONFIGURE_HOOKS += CUPS_REMOVE_PIEFLAGS
> +endif
> +
>  CUPS_CONF_OPTS = \
>  	--without-perl \
>  	--without-java \
>  	--without-php \
> -	--disable-gnutls \

You could mention in the commit log that you are adding GNUTLS support.

>  	--disable-gssapi \
>  	--libdir=/usr/lib
>  CUPS_CONFIG_SCRIPTS = cups-config
>  
> -CUPS_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_ZLIB),zlib) \
> -	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
> -	$(if $(BR2_PACKAGE_JPEG),jpeg) \
> -	$(if $(BR2_PACKAGE_TIFF),tiff)

Why? At least for zlib, I still see:

AC_CHECK_HEADER(zlib.h,

in config-scripts/cups-common.m4.

In general, the more you document such changes in the commit log, the
less questions you will have during the review process.

Also, when building cups, I get quite a lot of non-fatal but not very
pretty error messages. Lots of:

chgrp: changing group of '/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/etc/cups': Operation not permitted

And lots of:

strip: Unable to recognise the format of the input file `/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/#inst.20641#'
warning: Unable to strip /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcupscgi.so.1!

The latter can probably be fixed by changing the INSTALL_STRIP value
(or overriding it at build/install time).

However, since those are non-fatal, I'm not sure how much we care about
these problems.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
