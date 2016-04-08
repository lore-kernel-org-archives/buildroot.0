From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 05:00:47 +0200
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
Message-ID: <20160408050047.6bffcf3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! See my review below for some comments.

On Tue,  5 Apr 2016 20:47:16 -0600, Justin Berger wrote:

> diff --git a/package/ilixi/0001-Added-ifdef-around-iconv.patch b/package/ilixi/0001-Added-ifdef-around-iconv.patch
> new file mode 100644
> index 0000000..a341c8c
> --- /dev/null
> +++ b/package/ilixi/0001-Added-ifdef-around-iconv.patch
> @@ -0,0 +1,28 @@
> +From 3e2844eead42ac4e17835f5e59746a52ad0caf76 Mon Sep 17 00:00:00 2001
> +From: Justin Berger <j.david.berger@gmail.com>
> +Date: Tue, 5 Apr 2016 20:06:11 -0600
> +Subject: [PATCH] Added ifdef around iconv

This is not really a great title. A better title IMO could be:

	Fix building with locale support

> +Locale support in ilixi is a conditional dependency, and is only used when the libwnn dependency is also met. 

This should be wrapped to 80 characters. And you need to Signed-off-by
your patches.

Also, please submit this patch upstream.

> diff --git a/package/ilixi/Config.in b/package/ilixi/Config.in
> new file mode 100644
> index 0000000..54e7b04
> --- /dev/null
> +++ b/package/ilixi/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_ILIXI
> +	bool "ilixi"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # directfb
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # directfb
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_DIRECTFB
> +	select BR2_PACKAGE_LIBSIGC
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  ilixi is an open-source C++ library aimed at developing rich
> +	  graphical applications for embedded Linux systems. Having been
> +	  actively developed since 2010, it is running on thousands of
> +	  devices around the world.

Not related to the review itself, but I find it odd to use things based
on DirectFB these days. The project is dead, the web site has been dead
for over a year now, etc.

> +comment "ilixi needs a toolchain w/ C++, threads, wchar, gcc >= 4.7"

"needs a glibc/uclibc toolchain w/"

> diff --git a/package/ilixi/ilixi.mk b/package/ilixi/ilixi.mk
> new file mode 100644
> index 0000000..cde9af3
> --- /dev/null
> +++ b/package/ilixi/ilixi.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# ilixi
> +#
> +################################################################################
> +
> +ILIXI_VERSION = 1.0.0
> +ILIXI_SITE = http://ilixi.org/releases
> +ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)
> +ILIXI_LICENSE_FILES = COPYING.LESSER COPYING
> +ILIXI_INSTALL_STAGING = YES
> +
> +ILIXI_DEPENDENCIES = 	\
> +	libsigc 	\
> +	libxml2 	\
> +	directfb 	\

We typically don't indent the \

> +	fontconfig	\

This last \ is not needed.

> +
> +ifeq ($(BR2_PACKAGE_SAWMAN),y)
> +	ILIXI_CONF_OPTS += --enable-sawman
> +	ILIXI_DEPENDENCIES += sawman
> +else
> +	ILIXI_CONF_OPTS += --disable-sawman
> +endif

The sawman package no longer exists in Buildroot. Please make sure to
send your patch against the latest version of Buildroot. Sawman is now
part of DirectFB itself.

Does ilixi has some optional dependencies? According to your patch, it
can optional depend on libwnn. If that's the case, then please add the
relevant --disable-<foo> or --without-<bar> configuration options to
explicitly disable all those optional dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
