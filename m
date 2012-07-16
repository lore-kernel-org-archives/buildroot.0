From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 16 Jul 2012 16:29:54 +0200
Subject: [Buildroot] [PATCH] New package: lua-cjson [v2]
In-Reply-To: <1342407627-2861-2-git-send-email-danomimanchego123@gmail.com>
References: <1342407627-2861-1-git-send-email-danomimanchego123@gmail.com>
 <1342407627-2861-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAB0FRss+UK1cuQgkvmgb+sg3rAG74yCD1ooMc2NJQJPguO1VAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in lua-cjson.mk :
- the variable LUA_CJSON_SOURCE is useless, because the default scheme
(packagename-$(LIBFOO_VERSION).tar.gz) is used
- PREFIX=$(STAGING_DIR)/usr in LUA_CJSON_BUILD_CMDS is useless

a good use of PREFIX & DESTDIR is, for example :
    define LUA_FOO_INSTALL_TARGET_CMDS
	     $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX="/usr" install
    endef

Fran?ois

2012/7/16 Danomi Manchego <danomimanchego123@gmail.com>:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/Config.in              |    1 +
>  package/lua-cjson/Config.in    |   13 +++++++++++++
>  package/lua-cjson/lua-cjson.mk |   32 ++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 package/lua-cjson/Config.in
>  create mode 100644 package/lua-cjson/lua-cjson.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 99257b4..9cbf1e2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -250,6 +250,7 @@ menu "LUA libraries/modules"
>  source "package/cgilua/Config.in"
>  source "package/copas/Config.in"
>  source "package/coxpcall/Config.in"
> +source "package/lua-cjson/Config.in"
>  source "package/luafilesystem/Config.in"
>  source "package/luasocket/Config.in"
>  source "package/rings/Config.in"
> diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
> new file mode 100644
> index 0000000..c9d6abd
> --- /dev/null
> +++ b/package/lua-cjson/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LUA_CJSON
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
