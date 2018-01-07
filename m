From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:20:22 +0100
Subject: [Buildroot] [PATCH] snort: new package
In-Reply-To: <1515326249-26971-1-git-send-email-sergio.prado@e-labworks.com>
References: <1515326249-26971-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180107152022.18f6c1df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 09:57:29 -0200, Sergio Prado wrote:

> diff --git a/package/snort/0001-Fix-cross-compilation-errors.patch b/package/snort/0001-Fix-cross-compilation-errors.patch
> new file mode 100644
> index 000000000000..f5ff03343821
> --- /dev/null
> +++ b/package/snort/0001-Fix-cross-compilation-errors.patch
> @@ -0,0 +1,251 @@
> +From 30d31b3064e26ce437ffc36e6e95cf8ebd1ecc22 Mon Sep 17 00:00:00 2001
> +From: Sergio Prado <sergio.prado@e-labworks.com>
> +Date: Sat, 6 Jan 2018 20:13:18 -0200
> +Subject: [PATCH] Fix cross compilation errors
> +
> +Ignore errors when trying to run programs in a cross compilation
> +environment.
> +
> +Also remove unsafe header/library path used in cross-compilation.
> +
> +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> +---

Why do you patch the configure script instead of configure.ac, and use
autoreconf ?

> diff --git a/package/snort/snort.mk b/package/snort/snort.mk
> new file mode 100644
> index 000000000000..73e376a6474c
> --- /dev/null
> +++ b/package/snort/snort.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# snort
> +#
> +################################################################################
> +
> +SNORT_VERSION = 2.9.11.1
> +SNORT_SOURCE = snort-$(SNORT_VERSION).tar.gz
> +SNORT_SITE = https://www.snort.org/downloads/snort
> +SNORT_LICENSE = GPL-2.0
> +SNORT_LICENSE_FILES = LICENSE COPYING
> +
> +SNORT_DEPENDENCIES = libpcap daq pcre
> +
> +SNORT_CONF_OPTS = \
> +	--with-libpcap-includes=$(TARGET_DIR)/usr/include/pcap \

TARGET_DIR doesn't have header files. Use STAGING_DIR instead.

> +	--disable-static-daq
> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +SNORT_DEPENDENCIES += libtirpc host-pkgconf
> +SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
> +SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
> +endif
> +
> +SNORT_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" LIBS="$(SNORT_LIBS)"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
