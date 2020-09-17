From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:44:52 +0200
Subject: [Buildroot] [PATCH 3/6] package/wpebackend-fdo: bump to version
 1.8.0
In-Reply-To: <20200915223053.3090447-4-aperez@igalia.com>
References: <20200915223053.3090447-1-aperez@igalia.com>
 <20200915223053.3090447-4-aperez@igalia.com>
Message-ID: <20200917224452.6e856078@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 01:30:50 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

>  comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
>  	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +		|| !BR2_PACKAGE_HAS_LIBGL || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

This is not longer really in sync with the comment that says "an OpenGL
capable Wayland backend".

>  config BR2_PACKAGE_WPEBACKEND_FDO
>  	bool "wpebackend-fdo"
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_LIBGL # libepoxy

This looks really odd as:

 (1) Requiring full OpenGL means that no OpenGL ES platform can use
     wpebakend-fdo. Remember that libgl == full/desktop OpenGL, while
     libgles = OpenGL ES.

 (2) libepoxy does not depned on HAS_LIBGL, but HAS_LIBGL || HAS_LIBEGL

 (3) You have a dependency on HAS_LIBEGL_WAYLAND... so it kind of
     implies that an EGL/OpenGL ES configuration should work ?

Could you revisit this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
