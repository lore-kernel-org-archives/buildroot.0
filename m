From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 09:28:59 +0200
Subject: [Buildroot] [PATCH 5/9] package/libnetconf2: add package
In-Reply-To: <20191001143023.698-5-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-5-heiko.thiery@gmail.com>
Message-ID: <20191002092859.4312bab1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Oct 2019 16:30:18 +0200
heiko.thiery at gmail.com wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index a378ff2a61..527b8cccac 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1039,6 +1039,7 @@ F:	package/python-sip/
>  N:	Heiko Thiery <heiko.thiery@gmail.com>
>  F:	package/libredblack/
>  F:	package/libyang/
> +F:	package/libnetconf2/

Please keep entries sorted alphabetically.

>  
> diff --git a/package/libnetconf2/0001-Add-support-for-musl-libc.patch b/package/libnetconf2/0001-Add-support-for-musl-libc.patch
> new file mode 100644
> index 0000000000..e6d97ba90f
> --- /dev/null
> +++ b/package/libnetconf2/0001-Add-support-for-musl-libc.patch
> @@ -0,0 +1,60 @@
> +From 153fe40bd60499677e825e66501e8601536e0323 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Mon, 15 Jul 2019 18:15:28 -0700
> +Subject: [PATCH] Add support for musl libc
> +
> +musl does not support pthread_rwlockattr_setkind_np. Don't use it if it is
> +not available.

We need your Signed-off-by here. Also, where does this patch comes
from ? It should ideally be mentioned here as well.

> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> new file mode 100644
> index 0000000000..a991c78c05
> --- /dev/null
> +++ b/package/libnetconf2/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBNETCONF2
> +	bool "libnetconf2 - NETCONF library"

Just:

	bool "libnetconf2"

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_LIBSSH
> +	select BR2_PACKAGE_LIBSSH_SERVER

libssh has a "depends on BR2_USE_MMU", so you need to replicate it here.

> +	help
> +	  libnetconf2 is a NETCONF library in C intended for building
> +	  NETCONF clients and servers.

Upstream URL should be added.

Also, you need a Config.in comment like this:

comment "libnetconf2 needs a toolchain w/ threads, dynamic library"
	depends on BR2_USE_MMU
	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
> new file mode 100644
> index 0000000000..7bafe78324
> --- /dev/null
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# libnetconf2
> +#
> +################################################################################
> +
> +LIBNETCONF2_VERSION = v0.12-r2
> +LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,$(LIBNETCONF2_VERSION))
> +LIBNETCONF2_INSTALL_STAGING = YES
> +LIBNETCONF2_LICENSE = BSD-3-Clause
> +LIBNETCONF2_LICENSE_FILES = LICENSE
> +LIBNETCONF2_DEPENDENCIES += libyang libssh
> +HOST_LIBNETCONF2_DEPENDENCIES += host-libyang host-libssh

Use = instead of +=

> +
> +LIBNETCONF2_CONF_OPTS += \

Ditto.

> +	-DENABLE_TLS=ON \
> +	-DENABLE_SSH=ON \

So SSH support is optional ? Why did you made it mandatory ?

> +	-DENABLE_BUILD_TESTS=OFF \
> +	-DENABLE_VALGRIND_TESTS=OFF
> +
> +HOST_LIBNETCONF2_CONF_OPTS += \
> +	-DENABLE_TLS=ON \
> +	-DENABLE_SSH=ON \
> +	-DENABLE_BUILD_TESTS=OFF \
> +	-DENABLE_VALGRIND_TESTS=OFF

Use = for those unconditional assignments.

> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
