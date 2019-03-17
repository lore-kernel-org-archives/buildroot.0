From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:08:42 +0100
Subject: [Buildroot] [PATCH v8 1/3] openjdk: new package
In-Reply-To: <20190315205233.128763-1-aduskett@gmail.com>
References: <20190315205233.128763-1-aduskett@gmail.com>
Message-ID: <20190317140842.5bace709@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Mar 2019 16:52:31 -0400
aduskett at gmail.com wrote:

> - If ccache is enabled, Buildroot sets CC, CXX, and CPP to the ccache binary,

Actually this is not correct: CC, CXX, CPP and al. point to the
toolchain wrapper, and the use of ccache is completely hidden inside
the toolchain wrapper.

It is HOSTCC/HOSTCXX and al. and are of the form "ccache gcc".

So I've dropped this comment from the commit log and the .mk, because
it was not correct.

> - Even when cross-compiling, OpenJDK builds several host-tools using the host's
>   gcc. In the case of zlib, if a host doesn't have the zlib development package
>   installed, OpenJDK compilation stops because zlib.h won't exist on the host
>   system. Because zlib is used to compile both native tools and cross-compiled
>   tools, patching make/autoconf/lib-bundled.m4 to call PKG_CHECK_MODULES for
>   zlib results in the host gcc trying to use cross-compiled libraries for
>   compiling native tools, which results in linking failures.
>   Using --with-zlib=bundled allows OpenJDK to compile correctly.

I have fixed the package to use --with-zlib=system. The key was to pass
BUILD_SYSROOT_CFLAGS="$(HOST_CFLAGS)" and
BUILD_SYSROOT_LDFLAGS="$(HOST_LDFLAGS)" so that the host-zlib library
is properly found.


> +config BR2_PACKAGE_OPENJDK
> +	bool "OpenJDK"
> +	depends on !BR2_SOFT_FLOAT
> +	depends on !BR2_STATIC_LIBS # Glibc
> +	depends on BR2_INSTALL_LIBSTDCPP # cups
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_MMU # cups
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_CUPS
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_GIFLIB
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LCMS2
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_XLIB_LIBXRENDER
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	select BR2_PACKAGE_XLIB_LIBXTST

I've added:

	select BR2_PACKAGE_ZLIB


> +if BR2_PACKAGE_OPENJDK
> +
> +menu "JVM Variants"

I have dropped this menu, and in the main option, I've added a "select"
that ensures at least one of the client and/or server variants are
enabled.

> +comment "OpenJDK needs X.Org"

	depends on BR2_USE_MMU

was missing

> +	depends on !BR2_PACKAGE_XORG7
> +
> +comment "OpenJDK needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> +
> +comment "OpenJDK does not support soft floats"

	depends on BR2_USE_MMU

was missing as well.


> +# OpenJDK ignores some variables unless passed via the environment.
> +# These variables are PATH, LD, CC, CXX, and CPP.
> +# OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
> +# arguments during the linking process, which causes compilation failures.
> +# To fix this issue, LD is set to point to gcc.
> +# If ccache is enabled, Buildroot sets CC, CXX, and CPP to the ccache binary,
> +# which causes the configuration error:
> +# "Please use --enable-ccache instead of providing a wrapped compiler."
> +# This error is why CC, CPP, and CXX are explicitly set to point to their
> +# actual binaries.

So I've dropped this explanation about ccache.

> +OPENJDK_CONF_ENV = \
> +	PATH=$(BR_PATH) \
> +	CC=$(TARGET_CC) \
> +	CPP=$(TARGET_CPP) \
> +	CXX=$(TARGET_CXX) \
> +	LD=$(TARGET_CC)

... and defined BUILD_SYSROOT_CFLAGS and BUILD_SYSROOT_LDFLAGS.

> +	--with-zlib=bundled

and used --with-zlib=system

Applied with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
