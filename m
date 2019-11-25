From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 15:28:29 +0100
Subject: [Buildroot] [PATCH/next v2 1/4] spidermonkey: new package
In-Reply-To: <20191124214823.2570598-2-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
 <20191124214823.2570598-2-aduskett@gmail.com>
Message-ID: <20191125152829.0f5f72a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks a lot for this!

On Sun, 24 Nov 2019 13:48:20 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Spidermonkey is Mozilla's JavaScript engine written in C and C++. It is used in
> various Mozilla products, including Firefox, and is available under the MPL2.
> 
> There are 19 patches currently required to properly cross-compile spidermonkey:

You have 10 patches, not 19.

Thanks a lot for writing down the details of why each patch is needed,
this is very useful to have in the commit log.


> diff --git a/package/spidermonkey/0004-fix-building-with-musl.patch b/package/spidermonkey/0004-fix-building-with-musl.patch
> new file mode 100644
> index 0000000000..8d8b10fb71
> --- /dev/null
> +++ b/package/spidermonkey/0004-fix-building-with-musl.patch
> @@ -0,0 +1,133 @@
> +From 0c9e8f586ba52a9aef5ed298e8315b2598b8fb72 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 25 May 2019 16:54:45 -0700
> +Subject: [PATCH] fix building with musl
> +
> +The MIPS specific header <sgidefs.h> is not provided by musl
> +linux kernel headers provide <asm/sgidefs.h> which has same definitions

This is doing a lot more than switching to asm/sgidefs.h. But well, OK
you're not the author of the patch.

> diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
> new file mode 100644
> index 0000000000..1a5e0e29a5
> --- /dev/null
> +++ b/package/spidermonkey/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on !BR2_nios2
> +	depends on !BR2_aarch64_be

It is generally better to have an explicit list of supported
architectures, rather than a list of exclusions.

> +
> +config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64  || BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64
> +
> +config BR2_PACKAGE_SPIDERMONKEY
> +	bool "spidermonkey"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
> +	depends on BR2_USE_MMU # fork in executable tools.
> +	depends on !BR2_STATIC_LIBS # dlopen
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # No way to check for fenv support.
> +	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS

Alphabetic ordering.

> +	select BR2_PACKAGE_HOST_PYTHON
> +	select BR2_PACKAGE_HOST_PYTHON_SSL
> +	select BR2_PACKAGE_LIBNSPR
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  SpiderMonkey is the code-name for Mozilla Firefox's C++
> +	  implementation of JavaScript. It is intended to be embedded in
> +	  other applications that provide host environments for
> +	  JavaScript.
> +
> +	  https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey
> +
> +comment "spidermonkey needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
> +	depends on BR2_USE_MMU || !BR2_USE_WCHAR
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +	!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5

This is not good. It should be:

	depends on BR2_USE_MMU
	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
	depends on !BR2_TOOLCHAIN_USES_UCLIBC || \
		!BR2_INSTALL_LIBSTDCPP || \
		BR2_STATIC_LIBS || \
		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
		!BR2_USE_WCHAR

Also, please double check the gcc version dependency: you're using 4.9
in some places, and 5 in another place.

> diff --git a/package/spidermonkey/spidermonkey.mk b/package/spidermonkey/spidermonkey.mk
> new file mode 100644
> index 0000000000..583ccb803f
> --- /dev/null
> +++ b/package/spidermonkey/spidermonkey.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# spidermonkey
> +#
> +################################################################################
> +
> +# Use a tarball with only the spidermonkey source code and a pre-setup
> +# old-configure in src/js.This prevents having to use autoconf 2.13 and
> +# makes the package much 31M instead of 257M
> +SPIDERMONKEY_VERSION = 60.5.2
> +SPIDERMONKEY_SOURCE = mozjs-$(SPIDERMONKEY_VERSION).tar.bz2
> +SPIDERMONKEY_SITE = https://gentoo.osuosl.org/distfiles/9a
> +SPIDERMONKEY_SUBDIR = js/src
> +SPIDERMONKEY_LICENSE = MPL-2.0
> +SPIDERMONKEY_INSTALL_STAGING = YES
> +SPIDERMONKEY_LICENSE_FILES = moz.configure

Could you put this line right after the _LICENSE line ? It makes sense
to keep both together.

> +SPIDERMONKEY_DEPENDENCIES = \
> +	host-perl \
> +	host-python \

You really need to build our own version of Perl? You can't use the
Perl provided by the system? Buildroot has a hard dependency on Perl,
so you have the guarantee that a Perl interpreter is available.

> +	host-zip \

Just curious, what do you need from host-zip ?

> +	libnspr \
> +	zlib
> +
> +SPIDERMONKEY_CONF_ENV += \
> +	PYTHON="$(HOST_DIR)/bin/python2"
> +
> +# spidermonkey mixes up target and host.
> +# spidermonkey does not allow building against a system jemalloc,
> +# as it causes a conflict with glibc.
> +SPIDERMONKEY_CONF_OPTS = \
> +	--host=$(GNU_HOST_NAME) \
> +	--target=$(GNU_TARGET_NAME) \
> +	--disable-jemalloc \
> +	--disable-readline \

This line should not be here but below in an else clause of the
readline conditional [1].

> +	--enable-shared-js \
> +	--enable-ion \
> +	--with-system-zlib \
> +	--with-system-nspr \
> +	--with-nspr-exec-prefix="$(STAGING_DIR)/usr"
> +
> +ifneq ($(BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS),y)

Better:

ifeq ($(BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS),y)
SPIDERMONKEY_CONF_OPTS += --enable-ion
else
SPIDERMONKEY_CONF_OPTS += --disable-ion
endif

> +SPIDERMONKEY_CONF_OPTS += --disable-ion
> +endif
> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +SPIDERMONKEY_CONF_OPTS += --enable-readline
> +SPIDERMONKEY_DEPENDENCIES += readline

[1] here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
