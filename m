From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 4 Feb 2019 15:21:44 +0100
Subject: [Buildroot] [PATCH v1 1/5] libwpe: new package
In-Reply-To: <20181231154915.32660-2-francois.perrad@gadz.org>
References: <20181231154915.32660-1-francois.perrad@gadz.org>
 <20181231154915.32660-2-francois.perrad@gadz.org>
Message-ID: <20190204152144.GB22033@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 31 Dec 2018 16:49:11 +0100, Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                 |  2 ++
>  package/Config.in          |  1 +
>  package/libwpe/Config.in   | 13 +++++++++++++
>  package/libwpe/libwpe.hash |  7 +++++++
>  package/libwpe/libwpe.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 package/libwpe/Config.in
>  create mode 100644 package/libwpe/libwpe.hash
>  create mode 100644 package/libwpe/libwpe.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6bc0ed284..cf7e43450 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -67,6 +67,7 @@ F:	package/sngrep/
>  N:	Adrian Perez de Castro <aperez@igalia.com>
>  F:	package/brotli/
>  F:	package/libepoxy/
> +F:	package/libwpe/
>  F:	package/webkitgtk/
>  F:	package/woff2/
>  
> @@ -810,6 +811,7 @@ F:	package/gdbm/
>  F:	package/libtomcrypt/
>  F:	package/libtommath/
>  F:	package/libump/
> +F:	package/libwpe/
>  F:	package/linenoise/
>  F:	package/ljlinenoise/
>  F:	package/lpeg/
> diff --git a/package/Config.in b/package/Config.in
> index 14ba545a2..ae5fefb58 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1284,6 +1284,7 @@ menu "Graphics"
>  	source "package/libva-intel-driver/Config.in"
>  	source "package/libvdpau/Config.in"
>  	source "package/libvips/Config.in"
> +	source "package/libwpe/Config.in"
>  	source "package/menu-cache/Config.in"
>  	source "package/opencv/Config.in"
>  	source "package/opencv3/Config.in"
> diff --git a/package/libwpe/Config.in b/package/libwpe/Config.in
> new file mode 100644
> index 000000000..c11c85398
> --- /dev/null
> +++ b/package/libwpe/Config.in
> @@ -0,0 +1,13 @@
> +comment "libwpe needs a toolchain w/ C++, dynamic library and an OpenEGL-capable backend"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_LIBWPE
> +	bool "libwpe"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	help
> +	  Base library for the WPE WebKit port.
> +
> +	  https://wpewebkit.org/
> diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
> new file mode 100644
> index 000000000..58dba92e6
> --- /dev/null
> +++ b/package/libwpe/libwpe.hash
> @@ -0,0 +1,7 @@
> +# From https://wpewebkit.org/releases/libwpe-1.0.0.tar.xz.sums
> +md5 b5ea32bd644811d5c6433cf1439763f7 libwpe-1.0.0.tar.xz
> +sha1 6e51591c00a9a6128e19920807e6874794c723fd libwpe-1.0.0.tar.xz
> +sha256 aff11612123f9ab85a8b9a4bcdfb3a7503eba0a0d2d96f2cdecd30e911091719 libwpe-1.0.0.tar.xz
> +
> +# Hashes for license files:
> +sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
> diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
> new file mode 100644
> index 000000000..aad1214e1
> --- /dev/null
> +++ b/package/libwpe/libwpe.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libwpe
> +#
> +################################################################################
> +
> +LIBWPE_VERSION = 1.0.0
> +LIBWPE_SITE = https://wpewebkit.org/releases
> +LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
> +LIBWPE_INSTALL_STAGING = YES
> +LIBWPE_LICENSE = BSD-2-Clause
> +LIBWPE_LICENSE_FILES = COPYING
> +LIBWPE_DEPENDENCIES = libegl libxkbcommon
> +
> +# Workaround for https://github.com/raspberrypi/userland/issues/316
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +LIBWPE_CONF_OPTS += \
> +	-DCMAKE_C_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE' \
> +	-DCMAKE_CXX_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE'
> +endif

I am not super happy of having to workaround an upstream bug like this, but
there's not much else we can do, so I am for having this here for now. If
somebody can come up with a better way to workaround this, please speak up :)

> +$(eval $(cmake-package))
> -- 
> 2.17.1

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190204/e9b47831/attachment.asc>
