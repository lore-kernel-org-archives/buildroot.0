From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 16:08:15 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/spidermonkey185: new package
In-Reply-To: <20170806164452.11938-1-bernd.kuhls@t-online.de>
References: <20170806164452.11938-1-bernd.kuhls@t-online.de>
Message-ID: <20170823160815.3ea3ae11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Nicolas in Cc.

I'm still not really thrilled by the idea of adding a package for such
a large piece of code that Mozilla says is outdated
(https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/Releases/1.8.5).
Is it still just CouchDB that needs this? Do they have some plans of
using something more maintained ?

On Sun,  6 Aug 2017 18:44:52 +0200, Bernd Kuhls wrote:

>  create mode 100644 package/spidermonkey185/0001-64bit-big-endian.patch
>  create mode 100644 package/spidermonkey185/0002-secondary-jit.patch
>  create mode 100644 package/spidermonkey185/0003-destdir.patch
>  create mode 100644 package/spidermonkey185/0004-537701.patch
>  create mode 100644 package/spidermonkey185/0005-arm-nosoftfp.patch
>  create mode 100644 package/spidermonkey185/0006-aarch64.patch
>  create mode 100644 package/spidermonkey185/0007-ppc64le.patch
>  create mode 100644 package/spidermonkey185/0008-array-recursion.patch
>  create mode 100644 package/spidermonkey185/0009-c++11.patch
>  create mode 100644 package/spidermonkey185/0010-tag.patch

Most of those patches don't have any useful description. Could you add
such a description inside the patches ?

> diff --git a/package/spidermonkey185/0001-64bit-big-endian.patch b/package/spidermonkey185/0001-64bit-big-endian.patch
> new file mode 100644
> index 000000000..9d5142b20
> --- /dev/null
> +++ b/package/spidermonkey185/0001-64bit-big-endian.patch
> @@ -0,0 +1,21 @@
> +https://bugzilla.mozilla.org/show_bug.cgi?id=627664
> +
> +Source:
> +https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-64bit-big-endian.patch
> +
> +Patch position #1:
> +https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_12
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -up xulrunner-2.0/mozilla-central/js/src/jsval.h.64bit-big-endian xulrunner-2.0/mozilla-central/js/src/jsval.h
> +--- js-1.8.5/js/src/jsval.h.64bit-big-endian	2011-01-20 15:59:49.000000000 +0100
> ++++ js-1.8.5/js/src/jsval.h	2011-01-20 16:00:21.000000000 +0100
> +@@ -347,6 +347,7 @@ typedef union jsval_layout
> +             int32          i32;
> +             uint32         u32;
> +             JSWhyMagic     why;
> ++            jsuword        word;

This change is later reverted by patch 0004.

> +diff -up xulrunner-2.0/mozilla-central/js/src/Makefile.in.big-endian-jit xulrunner-2.0/mozilla-central/js/src/Makefile.in
> +--- js-1.8.5/js/src/Makefile.in.big-endian-jit	2010-11-04 21:05:48.000000000 +0100
> ++++ js-1.8.5/js/src/Makefile.in	2010-11-15 14:17:39.000000000 +0100
> +@@ -371,7 +371,7 @@ CPPSRCS += 	checks.cc \
> + # END enclude sources for V8 dtoa
> + #############################################
> + 
> +-ifeq (,$(filter-out powerpc sparc,$(TARGET_CPU)))
> ++ifeq (,$(filter-out powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))

This change is later modified again in patch 0013, to go in a different
direction (use filter instead of filter-out to opt-in supported
architectures instead of opt-out unsupported architectures).


> +-ifeq (,$(filter-out powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
> ++ifeq (,$(filter-out aarch64 powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))

Another change modified later.


> +-ifeq (,$(filter-out aarch64 powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
> ++ifeq (,$(filter-out aarch64 powerpc powerpc64 powerpc64le sparc sparc64 s390 s390x,$(TARGET_CPU)))

Ditto.


> diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
> new file mode 100644
> index 000000000..d1d02bf2e
> --- /dev/null
> +++ b/package/spidermonkey185/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_SPIDERMONKEY185
> +	bool "spidermonkey (1.8.5)"

spidermonkey-185 ? Perhaps use that as the name for the package ?

> +	depends on BR2_USE_MMU # fork in executable tools.
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
> +	help
> +	  SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
> +	  used in various Mozilla products, including Firefox.
> +
> +	  This is the old 1.8.5 branch, used in Firefox 4.
> +
> +comment "Spider monkey (1.8.5) need a toolchain with C++, dynamic library, NPTL"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL

> diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
> new file mode 100644
> index 000000000..4787a6309
> --- /dev/null
> +++ b/package/spidermonkey185/spidermonkey185.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# Spidermonkey (1.8.5)

spidermonkey185, or spidermonkey-185 if you change the package name.

> +#
> +################################################################################
> +
> +SPIDERMONKEY185_VERSION = 1.0.0
> +SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
> +SPIDERMONKEY185_SOURCE = js185-$(SPIDERMONKEY185_VERSION).tar.gz
> +SPIDERMONKEY185_SUBDIR = js/src
> +SPIDERMONKEY185_LICENSE = MPL-1.1 or GPL-2.0+ or LGPL-2.1+

No license file available ?

> +SPIDERMONKEY185_INSTALL_STAGING = YES
> +SPIDERMONKEY185_DEPENDENCIES = host-python host-perl
> +
> +# To detect endianess a host binary is built from jscpucfg.cpp which is
> +# not cross-compile friendly, so we force endianess.
> +# HOST_CFLAGS are forced to avoid problems when detecting host gcc
> +# because configure would pass TARGET_CFLAGS to the host gcc.
> +SPIDERMONKEY185_CONF_ENV = \
> +	HOST_CFLAGS="$(HOST_CFLAGS)" \
> +	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN" \

So you have to specify the endianness of the target in host flags?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
