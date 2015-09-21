From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 21 Sep 2015 21:05:43 +0200
Subject: [Buildroot] [git commit] luv: new package
In-Reply-To: <20150921144444.3117E7FD8D@busybox.osuosl.org>
References: <20150921144444.3117E7FD8D@busybox.osuosl.org>
Message-ID: <1442862343.6125.15.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mo, 2015-09-21 at 16:03 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=e512a4b9d00bf45
> 3e939279937db58afbe9d09e6
> branch: 
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> libuv bindings for LuaJIT and Lua.
> 
> [Thomas:
>   - Move the package to the sub-menu of Lua modules.
>   - Remove no longer needed dependency on
>     BR2_PACKAGE_HAS_LUAINTERPRETER.
>   - Propagate dependencies of libuv (mmu, !static, threads)
>   - Update to upstream version 1.7.4-4.
>   - Add hash file.]
> 

Many thanks for this! More comments below...

> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in     |    1 +
>  package/luv/Config.in |   14 ++++++++++++++
>  package/luv/luv.hash  |    2 ++
>  package/luv/luv.mk    |   30 ++++++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 22aef52..5158371 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -502,6 +502,7 @@ menu "Lua libraries/modules"
>  	source "package/luasocket/Config.in"
>  	source "package/luasql-sqlite3/Config.in"
>  	source "package/lunit/Config.in"
> +	source "package/luv/Config.in"
>  	source "package/lzlib/Config.in"
>  	source "package/orbit/Config.in"
>  	source "package/rings/Config.in"
> diff --git a/package/luv/Config.in b/package/luv/Config.in
> new file mode 100644
> index 0000000..787d162
> --- /dev/null
> +++ b/package/luv/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LUV
> +	bool "luv"
> +	select BR2_PACKAGE_LIBUV
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
> +	depends on BR2_USE_MMU # libuv
> +	depends on !BR2_STATIC_LIBS # libuv
> +	help
> +	  libuv bindings for LuaJIT and Lua.
> +
> +	  https://github.com/luvit/luv
> +
> +comment "luv needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on BR2_USE_MMU
> diff --git a/package/luv/luv.hash b/package/luv/luv.hash
> new file mode 100644
> index 0000000..307fc19
> --- /dev/null
> +++ b/package/luv/luv.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256
> 9ea1c2343e76f653f8e7d3420d2c7718ef4eca67a645a9d17297ae91caa224b5 luv
> -1.7.4-4.tar.gz
> diff --git a/package/luv/luv.mk b/package/luv/luv.mk
> new file mode 100644
> index 0000000..8e108a0
> --- /dev/null
> +++ b/package/luv/luv.mk
> @@ -0,0 +1,30 @@
> +####################################################################
> ############
> +#
> +# luv
> +#
> +####################################################################
> ############
> +
> +LUV_VERSION = 1.7.4-4
> +LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
> +LUV_SITE = 
> https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
> +LUV_LICENSE = Apache-2.0
> +LUV_LICENSE_FILE = LICENSE.txt
> +LUV_DEPENDENCIES = libuv
> +LUV_INSTALL_STAGING = YES
> +
> +LUV_CONF_OPTS += \
> +	-DBUILD_MODULE=OFF \
> +	-DWITH_SHARED_LIBUV=ON \
> +	-DLUA_BUILD_TYPE=System
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +LUV_DEPENDENCIES += luajit
> +LUV_CONF_OPTS += \
> +	-DWITH_LUA_ENGINE=LuaJIT
> +else
> +LUV_DEPENDENCIES += lua
> +LUV_CONF_OPTS += \
> +	-DWITH_LUA_ENGINE=Lua
> +endif
> +
> +$(eval $(cmake-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


I have one problem with this package:

luv can be build as a non-linkable library (a module library [1]) named
"luv.so". This file is installed to the default Lua search path so you
can use it in a Lua application with require "luv". For that you have
to build with BUILD_MODULE=ON.

On the other hand you can build luv as a linkable shared library named
"libluv.so" by building luv with BUILD_MODULE=OFF (as done now). This
is necessary for other packages like luvi (not submitted yet).

Is it possible to get both in Buildroot?

Best regards
J?rg Krause


[1] http://www.cmake.org/cmake/help/v3.0/command/add_library.html

"MODULE libraries are plugins that are not linked into other targets
but may be loaded dynamically at runtime using dlopen-like
functionality.
