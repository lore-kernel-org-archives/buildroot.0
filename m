From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 22:34:54 +0100
Subject: [Buildroot] [PATCH v2 3/4] wpewebkit: new package
In-Reply-To: <20190205204152.10376-4-francois.perrad@gadz.org>
References: <20190205204152.10376-1-francois.perrad@gadz.org>
 <20190205204152.10376-4-francois.perrad@gadz.org>
Message-ID: <20190211223454.7ebe7cb1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 21:41:51 +0100
Francois Perrad <fperrad@gmail.com> wrote:


> +comment "wpewebkit needs an OpenGL ES w/ EGL backend"

This comment lacked a:

	depends BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
	depends on !BR2_BINFMT_FLAT

> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL

There was no comment about all the other "depends on" that you have
below, so I fixed that.

> +config BR2_PACKAGE_WPEWEBKIT
> +	bool "wpewebkit"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_INSTALL_LIBSTDCPP # icu
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
> +	depends on BR2_USE_WCHAR # gettext
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS

I fixed this to:

+       depends on !BR2_STATIC_LIBS # wayland
+       depends on !BR2_BINFMT_FLAT # icu
+       depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
+       depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+       depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
+       depends on BR2_USE_WCHAR # icu, libsoup
+       depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
+       depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+       depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS

i.e, mainly BR2_HOST_GCC_AT_LEAST_4_8 was missing, and I changed the
comments to be more relevant (IMO).

> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBEPOXY
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_LIBTASN1
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS

You can't select this package without selecting BR2_PACKAGE_WAYLAND. I
know wpebackend-fdo selects wayland, but to me it looks more obvious if
we also select BR2_PACKAGE_WAYLAND here.


> +WPEWEBKIT_CONF_OPTS = \
> +	-DPORT=WPE \
> +	-DENABLE_API_TESTS=OFF \
> +	-DENABLE_MINIBROWSER=OFF
> +
> +ifeq ($(BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF

Notice the bad copy/paste here ? It should be WPEWEBKIT_CONF_OPTS, not
WEBKITGTK_CONF_OPTS.

I fixed up this issue and the minor nits above and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
