From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 4 Apr 2020 16:54:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: new package
In-Reply-To: <20200403141503.21643-1-zhaojh329@gmail.com>
References: <20200403141503.21643-1-zhaojh329@gmail.com>
Message-ID: <20200404165435.286382cd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jianhui,

On Fri,  3 Apr 2020 22:15:03 +0800, Jianhui Zhao <zhaojh329@gmail.com> wrote:

> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/libuhttpd/Config.in      |  8 +++++++
>  package/libuhttpd/libuhttpd.hash |  3 +++
>  package/libuhttpd/libuhttpd.mk   | 39 ++++++++++++++++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/libuhttpd/Config.in
>  create mode 100644 package/libuhttpd/libuhttpd.hash
>  create mode 100644 package/libuhttpd/libuhttpd.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f1bf5c263c..c34018405c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1273,6 +1273,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
>  F:	package/x11r7/xdriver_xf86-video-imx-viv/
>
>  N:	Jianhui Zhao <zhaojh329@gmail.com>
> +F:	package/libuhttpd/
>  F:	package/libuwsc/
>  F:	package/rtty/
>
> diff --git a/package/Config.in b/package/Config.in
> index 4aaf2d93f8..09f92f0b85 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1713,6 +1713,7 @@ menu "Networking"
>  	source "package/libtirpc/Config.in"
>  	source "package/libtorrent/Config.in"
>  	source "package/libtorrent-rasterbar/Config.in"
> +	source "package/libuhttpd/Config.in"
>  	source "package/libupnp/Config.in"
>  	source "package/libupnp18/Config.in"
>  	source "package/libupnpp/Config.in"
> diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
> new file mode 100644
> index 0000000000..1ab39c5878
> --- /dev/null
> +++ b/package/libuhttpd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBUHTTPD
> +	bool "libuhttpd"
> +	select BR2_PACKAGE_LIBEV
> +	help
> +	  A lightweight and fully asynchronous HTTP server
> +	  library based on libev
> +
> +	  https://github.com/zhaojh329/libuhttpd
> diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
> new file mode 100644
> index 0000000000..89d6b74501
> --- /dev/null
> +++ b/package/libuhttpd/libuhttpd.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 b329612e8454c335929021bb751e80f7875d06501034524f90abf830e6f68589  libuhttpd-3.1.1.tar.gz
> +sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> new file mode 100644
> index 0000000000..f00d59748b
> --- /dev/null
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# libuhttpd
> +#
> +################################################################################
> +
> +LIBUHTTPD_VERSION = 3.1.1
> +LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
> +LIBUHTTPD_LICENSE = MIT
> +LIBUHTTPD_LICENSE_FILES = LICENSE
> +LIBUHTTPD_INSTALL_STAGING = YES
> +LIBUHTTPD_DEPENDENCIES = libev
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBUHTTPD_DEPENDENCIES += openssl
> +LIBUHTTPD_CONF_OPTS += \
> +	-DUHTTPD_SSL_SUPPORT=ON \
> +	-DUHTTPD_USE_MBEDTLS=OFF \
> +	-DUHTTPD_USE_OPENSSL=ON \
> +	-DUHTTPD_USE_WOLFSSL=OFF
> +else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +LIBUHTTPD_DEPENDENCIES += wolfssl
> +LIBUHTTPD_CONF_OPTS += \
> +	-DUHTTPD_SSL_SUPPORT=ON \
> +	-DUHTTPD_USE_MBEDTLS=OFF \
> +	-DUHTTPD_USE_OPENSSL=OFF \
> +	-DUHTTPD_USE_WOLFSSL=ON
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBUHTTPD_DEPENDENCIES += mbedtls
> +LIBUHTTPD_CONF_OPTS += \
> +	-DUHTTPD_SSL_SUPPORT=ON \
> +	-DUHTTPD_USE_MBEDTLS=ON \
> +	-DUHTTPD_USE_OPENSSL=OFF \
> +	-DUHTTPD_USE_WOLFSSL=OFF
> +else
> +LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
> +endif
> +
> +$(eval $(cmake-package))

Did a test with utils/test-pkg (see [1]) for libuhttpd, got some failures, e.g.:

- br-arm-cortex-m4-full [ 8/44]: FAILED

  test_libuhttpd_001/br-arm-cortex-m4-full/build/libuhttpd-3.1.1/src/uhttpd.c:29:10: fatal error: dlfcn.h: No such file or directory
   #include <dlfcn.h>
            ^~~~~~~~~

Same with:

- br-arm-full-static [11/44]: FAILED
- br-m68k-5208-full [14/44]: FAILED

Seems a
	depends on !BR2_STATIC_LIBS # dlfcn.h

is missing for libuhttpd....

Regards,
Peter

[1] http://nightly.buildroot.org/manual.html#_tips_and_tricks
