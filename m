From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Jun 2020 18:36:27 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/efl: depend on lua ABI
 version 5.1
In-Reply-To: <20200525004845.3019642-7-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-7-james.hilliard1@gmail.com>
Message-ID: <53cf1b5f-9859-eaeb-f35d-cdfee0d2773c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le 25/05/2020 ? 02:48, James Hilliard a ?crit?:
> Since efl is compatible with lua interpreters that provide the
> version 5.1 ABI we should depend on that instead of unconditionally
> selecting luajit.

We had some issues with lua support in previous efl version (1.17.x) [1], can
you explain in the commit log that it's safe to add back Lua 5.1 support ?

[1]
https://git.buildroot.net/buildroot/commit/?id=92f7591eca0d2b4ff827ed90629be94292c8b102

Best regards,
Romain

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/efl/Config.in |  7 +++----
>  package/efl/efl.mk    | 26 ++++++++++++++++++++------
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index ff49161163..b074774790 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_EFL
>  	 # g++ issue with 4.4.5, tested with g++ 4.7.2
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
> +	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
>  	depends on BR2_USE_MMU
>  	depends on BR2_USE_WCHAR # use wchar_t
> @@ -13,7 +13,6 @@ config BR2_PACKAGE_EFL
>  	select BR2_PACKAGE_JPEG # Emile needs libjpeg
>  	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
>  	# https://phab.enlightenment.org/T2728
> -	select BR2_PACKAGE_LUAJIT # Lua support broken
>  	select BR2_PACKAGE_LZ4
>  	select BR2_PACKAGE_ZLIB
>  	help
> @@ -302,9 +301,9 @@ comment "SVG loader needs a toolchain w/ gcc >= 4.8"
>  
>  endif # BR2_PACKAGE_EFL
>  
> -comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
> +comment "efl needs a toolchain w/ C++, luajit or lua 5.1, dynamic library, gcc >= 4.7, threads, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
>  		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
>  	depends on BR2_USE_MMU
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index d8364ed76f..ba44738e59 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -20,8 +20,8 @@ EFL_LICENSE_FILES = \
>  
>  EFL_INSTALL_STAGING = YES
>  
> -EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
> -	jpeg luajit lz4 zlib
> +EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype \
> +	jpeg lz4 zlib
>  
>  # Configure options:
>  # --disable-lua-old: build elua for the target.

Don't forget to update/remove the comment.

> @@ -38,11 +38,9 @@ EFL_CONF_OPTS = \
>  	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
>  	--with-elementary-codegen=$(HOST_DIR)/bin/elementary_codegen \
>  	--with-elm-prefs-cc=$(HOST_DIR)/bin/elm_prefs_cc \
> -	--with-elua=$(HOST_DIR)/bin/elua \
>  	--with-eolian-gen=$(HOST_DIR)/bin/eolian_gen \
>  	--disable-image-loader-jp2k \
>  	--with-net-control=none \
> -	--disable-lua-old \
>  	--disable-sdl \
>  	--disable-spectre \
>  	--disable-xinput22 \
> @@ -92,6 +90,16 @@ else
>  EFL_CONF_OPTS += --disable-fribidi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +EFL_CONF_OPTS += \
> +	--with-elua=$(HOST_DIR)/usr/bin/elua \
> +	--disable-lua-old
> +EFL_DEPENDENCIES += host-luajit luajit
> +else ifeq ($(BR2_PACKAGE_LUA),y)
> +EFL_CONF_OPTS += --enable-lua-old
> +EFL_DEPENDENCIES += host-lua lua
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
>  EFL_CONF_OPTS += --enable-gstreamer1
>  EFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
> @@ -320,7 +328,6 @@ HOST_EFL_DEPENDENCIES = \
>  	host-libglib2 \
>  	host-libjpeg \
>  	host-libpng \
> -	host-luajit \
>  	host-zlib
>  
>  # Configure options:
> @@ -351,7 +358,6 @@ HOST_EFL_CONF_OPTS += \
>  	--disable-libmount \
>  	--disable-libraw \
>  	--disable-librsvg \
> -	--disable-lua-old \
>  	--disable-multisense \
>  	--disable-physics \
>  	--disable-poppler \
> @@ -379,6 +385,14 @@ else
>  HOST_EFL_CONF_OPTS += --disable-cxx-bindings
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +HOST_EFL_CONF_OPTS += --disable-lua-old
> +HOST_EFL_DEPENDENCIES += host-luajit
> +else ifeq ($(BR2_PACKAGE_LUA),y)
> +HOST_EFL_CONF_OPTS += --enable-lua-old
> +HOST_EFL_DEPENDENCIES += host-lua
> +endif
> +
>  # Always disable upower system module from host as it's
>  # not useful and would try to use the output/host/var
>  # system bus which is non-existent and does not contain
> 
