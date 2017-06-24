From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:19:58 +0200
Subject: [Buildroot] [PATCH v2 03/13] package/minetest: new package
In-Reply-To: <20170612205410.20230-3-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-3-romain.naour@gmail.com>
Message-ID: <20170624171958.56312346@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:54:00 +0200, Romain Naour wrote:

> + 		message(STATUS "GetText enabled; locales found: ${GETTEXT_AVAILABLE_LOCALES}")
> ++		# On some platforms, such as Linux with GNU libc, the gettext
> ++		# functions are present in the C standard library and libintl
> ++		# is not required. For other libc (uClibc-ng or musl) libintl

Only uClibc-ng in fact. musl has stub gettext functionality.

> +if BR2_PACKAGE_MINETEST
> +
> +config BR2_PACKAGE_MINETEST_CLIENT
> +	bool
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_XLIB_LIBXXF86VM
> +
> +config BR2_PACKAGE_MINETEST_SERVER
> +	bool
> +
> +choice
> +	prompt "minetest build"
> +
> +config BR2_PACKAGE_MINETEST_CLIENT_ONLY
> +	bool "client only"
> +	select BR2_PACKAGE_MINETEST_CLIENT
> +	help
> +	  Build Minetest client only.
> +
> +config BR2_PACKAGE_MINETEST_SERVER_ONLY
> +	bool "server only"
> +	select BR2_PACKAGE_MINETEST_SERVER
> +	help
> +	  Build Minetest server only.
> +
> +config BR2_PACKAGE_MINETEST_CLIENT_SERVER
> +	bool "client and server"
> +	select BR2_PACKAGE_MINETEST_CLIENT
> +	select BR2_PACKAGE_MINETEST_SERVER
> +	help
> +	  Build Minetest client and server.
> +
> +endchoice

Why are you doing all this instead of having just two sub-options, one
to enable the client, one to enable the server?

Is it because you need at least one of them to be enabled? If so, then
just add a "select BR2_PACKAGE_MINETEST_CLIENT
if !BR2_PACKAGE_MINETEST_SERVER" in the BR2_PACKAGE_MINETEST definition.

> +comment "minetest needs a toolchain w/ C++, gcc >= 4.7, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS

Missing depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

> +
> +comment "minetest needs X11, an OpenGL provider, luajit"
> +	depends on (BR2_INSTALL_LIBSTDCPP \
> +		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
> +		&& BR2_TOOLCHAIN_HAS_THREADS)
> +	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7 \
> +		|| !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

Mentioning LuaJIT is useless, since you're selecting it. However, you
shouldn't display this comment if BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is
not enabled.

BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is an architecture dependency, very
much like BR2_USE_MMU, so we don't add comments about it, since there's
nothing the user can do about it.

> +MINETEST_VERSION = 0.4.16
> +MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
> +MINETEST_LICENSE = LGPL-2.1+, CC-BY-SA-3.0

Maybe mention what is under LGPL, what is under CC-BY-SA? if it's
clearly understood.

> +MINETEST_LICENSE_FILES = README.txt
> +
> +MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib

Alphabetic ordering would be nicer (j before g).

> +
> +MINETEST_CONF_OPTS = \
> +	-DDEFAULT_RUN_IN_PLACE=OFF \
> +	-DENABLE_CURL=OFF \
> +	-DENABLE_GETTEXT=OFF \
> +	-DENABLE_SOUND=OFF \
> +	-DENABLE_GLES=OFF \
> +	-DENABLE_FREETYPE=OFF \
> +	-DENABLE_LUAJIT=ON \
> +	-DENABLE_CURSES=OFF \
> +	-DENABLE_POSTGRESQL=OFF \
> +	-DENABLE_LEVELDB=OFF \
> +	-DENABLE_REDIS=OFF \
> +	-DENABLE_SPATIAL=OFF \
> +	-DAPPLY_LOCALE_BLACKLIST=OFF \
> +	-DENABLE_SYSTEM_GMP=ON \
> +	-DENABLE_SYSTEM_JSONCPP=ON
> +
> +ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
> +MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm

jpeg is already part of the unconditional dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
