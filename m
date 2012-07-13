From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 13 Jul 2012 11:45:14 +0200
Subject: [Buildroot] [PATCH] New package: lua-cjson
In-Reply-To: <1339463981-11070-1-git-send-email-danomimanchego123@gmail.com>
References: <1339463981-11070-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAB0FRssoNUiN+u0j4S+Vf63aWM968s1ebeOQTY9RJYonhNtyVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this package works for me.
but Config.in contains an useless line :
       depends on BR2_PACKAGE_LUA
and the upstream package comes with a CMakeLists.txt file,
so lua-cjson.mk could be simplified by the use of the CMake
infrastructure supplied by Buildroot.

Fran?ois

2012/6/12 Danomi Manchego <danomimanchego123@gmail.com>:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/Config.in              |    1 +
>  package/lua-cjson/Config.in    |   14 ++++++++++++++
>  package/lua-cjson/lua-cjson.mk |   32 ++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 package/lua-cjson/Config.in
>  create mode 100644 package/lua-cjson/lua-cjson.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ca8fc96..39a88e2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -244,6 +244,7 @@ menu "LUA libraries/modules"
>  source "package/cgilua/Config.in"
>  source "package/copas/Config.in"
>  source "package/coxpcall/Config.in"
> +source "package/lua-cjson/Config.in"
>  source "package/luafilesystem/Config.in"
>  source "package/luasocket/Config.in"
>  source "package/rings/Config.in"
> diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
> new file mode 100644
> index 0000000..c0690c7
> --- /dev/null
> +++ b/package/lua-cjson/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LUA_CJSON
> +       depends on BR2_PACKAGE_LUA
> +       bool "lua_cjson"
> +       help
> +         The Lua CJSON module provides JSON support for Lua. It features:
> +         - Fast, standards compliant encoding/parsing routines
> +         - Full support for JSON with UTF-8, including decoding surrogate pairs
> +         - Optional run-time support for common exceptions to the JSON
> +           specification (infinity, NaN, ...)
> +         - No dependencies on other libraries
> +
> +         (C-module)
> +
> +         http://www.kyne.com.au/~mark/software/lua-cjson.php
> diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
> new file mode 100644
> index 0000000..05087ea
> --- /dev/null
> +++ b/package/lua-cjson/lua-cjson.mk
> @@ -0,0 +1,32 @@
> +#############################################################
> +#
> +# lua-cjson
> +#
> +#############################################################
> +LUA_CJSON_VERSION      = 2.1.0
> +LUA_CJSON_SOURCE       = lua-cjson-$(LUA_CJSON_VERSION).tar.gz
> +LUA_CJSON_SITE         = http://www.kyne.com.au/~mark/software/download
> +LUA_CJSON_DEPENDENCIES = lua
> +
> +define LUA_CJSON_BUILD_CMDS
> +       $(MAKE) -C $(@D) \
> +               CFLAGS="$(TARGET_CFLAGS)"   \
> +               LDFLAGS="$(TARGET_LDFLAGS)" \
> +               CC="$(TARGET_CC)"           \
> +               LD="$(TARGET_LD)"           \
> +               PREFIX=$(STAGING_DIR)/usr
> +endef
> +
> +define LUA_CJSON_INSTALL_TARGET_CMDS
> +       install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
> +endef
> +
> +define LUA_CJSON_CLEAN_CMDS
> +       $(MAKE) -C $(@D) clean
> +endef
> +
> +define LUA_CJSON_UNINSTALL_TARGET_CMDS
> +       rm -f "$(TARGET_DIR)/usr/lib/lua/cjson.so"
> +endef
> +
> +$(eval $(call GENTARGETS))
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
