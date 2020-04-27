From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:28:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: new package
In-Reply-To: <20200426135842.2125143-2-thomas@ruschival.de>
References: <20200426135842.2125143-1-thomas@ruschival.de>
 <20200426135842.2125143-2-thomas@ruschival.de>
Message-ID: <20200427212812.274c80ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your contribution!

On Sun, 26 Apr 2020 15:58:42 +0200
Thomas Ruschival <thomas@ruschival.de> wrote:

> diff --git a/package/pistache/Config.in b/package/pistache/Config.in
> new file mode 100644
> index 0000000000..5b81c9c1b7
> --- /dev/null
> +++ b/package/pistache/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PISTACHE
> +	bool "pistache"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14

Are you sure C++14 support was complete in gcc 4.9 ?

Did you test building with gcc 4.9 ?

Also, you need to add:

	depends on BR2_INSTALL_LIBSTDCPP

since you have a C++ dependency.

> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Pistache is a C++ REST framework written by Mathieu Stefani
> +	  at Datacratic. It is written in pure C++14 with no external
> +	  dependency and provides a low-level HTTP abstraction. It
> +	  provides both an HTTP client and server that can be used
> +	  to create and query complex web and REST APIs.
> +
> +	  https://pistache.io/
> +
> +
> +config BR2_PACKAGE_PISTACHE_ENABLE_SSL
> +	bool "pistache SSL support"
> +	depends on BR2_PACKAGE_PISTACHE
> +	depends on BR2_PACKAGE_OPENSSL
> +	help
> +	  Configure pistache with -DPISTACHE_USE_SSL=On to support HTTPS

This option is not needed, I'll explain how to handle this in the .mk
file.

However, you also need to add a Config.in comment:

comment "pistache needs a toolchain w/ C++, gcc >= 4.9, threads, wchar"
	depends on !BR2_INSTALL_LIBSTDCPP || \
		!BR2_TOOLCHAIN_HAS_GCC_AT_LEAST_4_9 || \
		!BR2_TOOLCHAIN_HAS_THREADS || \
		!BR2_USE_WCHAR

> diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
> new file mode 100644
> index 0000000000..fb4ada8b24
> --- /dev/null
> +++ b/package/pistache/pistache.hash
> @@ -0,0 +1,5 @@
> +# Nov 22
> +sha256 6b02ee423047992c5298d9c81a81231f71d62a549242a63913a050836b863e64  pistache-394b17c01f928bb.tar.gz
> +
> +# Apr 13
> +sha256 bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  73f248acd6db4c53.tar.gz

Why two hashes? Why dates in comments? This does not make much sense.

> diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
> new file mode 100644
> index 0000000000..da9e61b10e
> --- /dev/null
> +++ b/package/pistache/pistache.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# Pistache

Lower case please.

> +#
> +################################################################################
> +
> +PISTACHE_VERSION = 73f248acd6db4c53
> +PISTACHE_SOURCE = $(PISTACHE_VERSION).tar.gz
> +PISTACHE_SITE = https://github.com/oktal/pistache/archive
> +PISTACHE_SITE_METHOD = wget

Use the $(call github...) helper macro. Grep for other packages that use it.

> +
> +PISTACHE_INSTALL_STAGING = YES
> +PISTACHE_INSTALL_TARGET = YES

Line not needed. Please run "make check-package" to verify the coding
style of your package.

> +PISTACHE_LICENSE = Apache-2.0
> +PISTACHE_LICENSE_FILE = LICENSE
> +
> +PISTACHE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

Not needed, this is passed by the cmake package infrastructure.

> +ifeq (y, $(BR2_PACKAGE_PISTACHE_ENABLE_SSL))
> +	PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=On
> +endif

You forgot the dependency on openssl. This should be:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
PISTACHE_DEPENDENCIES += openssl
PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
else
PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
endif

Also, could you test this package with our ./utils/test-pkg utility ?
This will allow to detect the most common build issue with this package
(if any).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
