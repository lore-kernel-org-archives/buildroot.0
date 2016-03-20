From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:42:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/efl: enable luajit support
In-Reply-To: <1457132443-15973-2-git-send-email-romain.naour@gmail.com>
References: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
 <1457132443-15973-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160320224234.1f6f837c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Mar 2016 00:00:43 +0100, Romain Naour wrote:
> The lua-old support is currently broken for Lua 5.2+ due to [1] and it's not
> yet fixed with efl 1.17.
> 
> In order to bump to a newer efl version, we need to enable the luajit support
> and use it by default.
> 
> We need to build Elua for the host to enable luajit support for the target.
> 
> [1] https://phab.enlightenment.org/T2728

I don't really understand the discussion in this bug report, and it
seems like you got no feedback. Maybe the explanation was not clear
enough as to which cases work / don't work.

In the below, I wonder if it's worth to support Lua 5.1 at all.
Supporting Luajit would make the whole thing a lot simpler, no? Do we
really care enough to offer the possibility of using Lua instead of
Luajit, when recent versions of Lua are in fact not supported?

> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 88e2c36..0851961 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -2,8 +2,10 @@ config BR2_PACKAGE_EFL
>  	bool "efl"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_HAS_UDEV # libudev
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # luajit or Lua 5.1
>  	# https://phab.enlightenment.org/T2728
> -	depends on BR2_PACKAGE_LUA_5_1 # needs lua 5.1, broken with 5.2+
> +	depends on !BR2_PACKAGE_LUA_5_2 # broken with 5.2+
> +	depends on !BR2_PACKAGE_LUA_5_3 # broken with 5.2+

I'd prefer:

	depends on BR2_PACKAGE_HAS_LUAINTERPRETER && \
		!BR2_PACKAGE_LUA_5_2 && !BR2_PACKAGE_LUA_5_3

>  	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
>  	depends on BR2_USE_MMU
>  	depends on BR2_USE_WCHAR # use wchar_t
> @@ -186,6 +188,11 @@ comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library,
>  		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  	depends on BR2_USE_MMU
>  
> -comment "efl needs lua 5.1"
> -	depends on !BR2_PACKAGE_LUA_5_1
> +comment "efl needs a lua interpreter (luajit or lua 5.1)"
> +	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on BR2_USE_MMU
> +
> +comment "efl needs Lua 5.1"
> +	depends on BR2_PACKAGE_LUA_5_2 # broken with 5.2+
> +	depends on BR2_PACKAGE_LUA_5_3 # broken with 5.2+
>  	depends on BR2_USE_MMU

I don't think two comments are needed. Only one is enough:

comment "elf needs a lua interpreter (luajit or lua 5.1)"
	depends on BR2_USE_MMU
	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || \
		BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3

> +# We need to build Elua for the host to enable luajit support for the target.
> +# --disable-lua-old: build elua for the target.
> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +EFL_CONF_OPTS += --disable-lua-old
> +else
> +EFL_CONF_OPTS += --enable-lua-old
> +endif

I must say I don't really understand this comment, and why you're
adding --disable-lua-old/--enable-lua-old to both the target and host
EFL configure options, in both cases depending on BR2_PACKAGE_LUAJIT.

Here, you are saying "We need to build Elua for the host", but the
below code is changing the configuration options for the target variant
of EFL, which looks weird.

> +# If luajit is enabled for the target, we need to build Elua for the host.
> +# --disable-lua-old: build elua for the host.
> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +HOST_EFL_CONF_OPTS += --disable-lua-old
> +else
> +HOST_EFL_CONF_OPTS += --enable-lua-old
> +endif

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
