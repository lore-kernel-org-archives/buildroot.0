From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 14 Sep 2013 10:09:35 +0200
Subject: [Buildroot] [v4 1/2] luainterpreter: create virtual package
In-Reply-To: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAB0FRssxK-RvMPJLP+ivnUEjbvFtFAUoNfnMTK2UtAtaK1V=3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

2013/8/14 Francois Perrad <fperrad@gmail.com>:
> luainterpreter is lua or luajit
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                |    1 +
>  package/lbase64/Config.in                        |    1 +
>  package/lbase64/lbase64.mk                       |    2 +-
>  package/lua-ev/Config.in                         |    1 +
>  package/lua-ev/lua-ev.mk                         |    2 +-
>  package/lua-msgpack-native/Config.in             |    1 +
>  package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
>  package/lua/Config.in                            |    1 +
>  package/luacjson/Config.in                       |    1 +
>  package/luacjson/luacjson.mk                     |    2 +-
>  package/luaexpat/Config.in                       |    1 +
>  package/luaexpat/luaexpat.mk                     |    2 +-
>  package/luafilesystem/Config.in                  |    1 +
>  package/luafilesystem/luafilesystem.mk           |    2 +-
>  package/luainterpreter/Config.in                 |    2 ++
>  package/luainterpreter/luainterpreter.mk         |   18 ++++++++++++++++++
>  package/luajit/Config.in                         |    1 +
>  package/luaposix/Config.in                       |    1 +
>  package/luaposix/luaposix.mk                     |    2 +-
>  package/luasec/Config.in                         |    1 +
>  package/luasec/luasec.mk                         |    2 +-
>  package/luasocket/Config.in                      |    1 +
>  package/luasocket/luasocket.mk                   |    2 +-
>  package/luasql/Config.in                         |    1 +
>  package/luasql/luasql.mk                         |    2 +-
>  package/rings/Config.in                          |    1 +
>  package/rings/rings.mk                           |    2 +-
>  27 files changed, 45 insertions(+), 11 deletions(-)
>  create mode 100644 package/luainterpreter/Config.in
>  create mode 100644 package/luainterpreter/luainterpreter.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 86961e9..98b5bcf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -320,6 +320,7 @@ source "package/jamvm/Config.in"
>  source "package/jimtcl/Config.in"
>  source "package/lua/Config.in"
>  source "package/luajit/Config.in"
> +source "package/luainterpreter/Config.in"
>  if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
>  menu "LUA libraries/modules"
>  source "package/cgilua/Config.in"
> diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
> index bd8503a..ca9dd5d 100644
> --- a/package/lbase64/Config.in
> +++ b/package/lbase64/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LBASE64
>         bool "lbase64"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           A base64 library for Lua
>
> diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
> index 87dda40..ab726ef 100644
> --- a/package/lbase64/lbase64.mk
> +++ b/package/lbase64/lbase64.mk
> @@ -9,7 +9,7 @@ LBASE64_SITE = http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1
>  LBASE64_SOURCE = lbase64.tar.gz
>  LBASE64_LICENSE = Public domain
>  LBASE64_LICENSE_FILES = README
> -LBASE64_DEPENDENCIES = lua
> +LBASE64_DEPENDENCIES = luainterpreter
>
>  define LBASE64_BUILD_CMDS
>         $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
> index 1e89c27..2f9c486 100644
> --- a/package/lua-ev/Config.in
> +++ b/package/lua-ev/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUA_EV
>         bool "lua-ev"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         select BR2_PACKAGE_LIBEV
>         help
>           Get access to the libev library from Lua.
> diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
> index 2b03936..f4bfe12 100644
> --- a/package/lua-ev/lua-ev.mk
> +++ b/package/lua-ev/lua-ev.mk
> @@ -6,7 +6,7 @@
>
>  LUA_EV_VERSION = 458165b
>  LUA_EV_SITE = http://github.com/brimworks/lua-ev/tarball/$(LUA_EV_VERSION)
> -LUA_EV_DEPENDENCIES = lua libev
> +LUA_EV_DEPENDENCIES = luainterpreter libev
>  LUA_EV_LICENSE = MIT
>  LUA_EV_LICENSE_FILES = README
>  LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua"
> diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
> index 8894ee5..1014298 100644
> --- a/package/lua-msgpack-native/Config.in
> +++ b/package/lua-msgpack-native/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUA_MSGPACK_NATIVE
>         bool "lua-msgpack-native"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           This is a native, C language implementation of msgpack
>           (http://msgpack.org) library/protocol for Lua language
> diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
> index 6ec923c..42ab8a6 100644
> --- a/package/lua-msgpack-native/lua-msgpack-native.mk
> +++ b/package/lua-msgpack-native/lua-msgpack-native.mk
> @@ -6,7 +6,7 @@
>
>  LUA_MSGPACK_NATIVE_VERSION = 41cce91
>  LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
> -LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
> +LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
>  LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
>  LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
>
> diff --git a/package/lua/Config.in b/package/lua/Config.in
> index 4166730..cc62dee 100644
> --- a/package/lua/Config.in
> +++ b/package/lua/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUA
>         bool "lua"
> +       select BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           Lua is a powerful, fast, light-weight, embeddable scripting language.
>
> diff --git a/package/luacjson/Config.in b/package/luacjson/Config.in
> index 8a5624f..d3665c0 100644
> --- a/package/luacjson/Config.in
> +++ b/package/luacjson/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUACJSON
>         bool "luacjson"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           The Lua CJSON module provides JSON support for Lua. It features:
>           - Fast, standards compliant encoding/parsing routines
> diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
> index f976ec6..d1f1ebb 100644
> --- a/package/luacjson/luacjson.mk
> +++ b/package/luacjson/luacjson.mk
> @@ -7,7 +7,7 @@
>  LUACJSON_VERSION       = 2.1.0
>  LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
>  LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
> -LUACJSON_DEPENDENCIES  = lua
> +LUACJSON_DEPENDENCIES  = luainterpreter
>  LUACJSON_LICENSE       = MIT
>  LUACJSON_LICENSE_FILES = LICENSE
>
> diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
> index 186c5c9..f8db318 100644
> --- a/package/luaexpat/Config.in
> +++ b/package/luaexpat/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LUAEXPAT
>         bool "luaexpat"
>         select BR2_PACKAGE_EXPAT
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           LuaExpat is a SAX XML parser based on the Expat library.
>
> diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
> index 5c45f34..e0fa043 100644
> --- a/package/luaexpat/luaexpat.mk
> +++ b/package/luaexpat/luaexpat.mk
> @@ -6,7 +6,7 @@
>
>  LUAEXPAT_VERSION      = 1.2.0
>  LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
> -LUAEXPAT_DEPENDENCIES = lua expat
> +LUAEXPAT_DEPENDENCIES = luainterpreter expat
>  LUAEXPAT_LICENSE      = MIT
>
>
> diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
> index 7c130f8..489ebf3 100644
> --- a/package/luafilesystem/Config.in
> +++ b/package/luafilesystem/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUAFILESYSTEM
>         bool "luafilesystem"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           LuaFileSystem offers a portable way to access
>           the underlying directory structure and file attributes.
> diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
> index 2f7b4d8..edd7203 100644
> --- a/package/luafilesystem/luafilesystem.mk
> +++ b/package/luafilesystem/luafilesystem.mk
> @@ -6,7 +6,7 @@
>
>  LUAFILESYSTEM_VERSION = 1.6.2
>  LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
> -LUAFILESYSTEM_DEPENDENCIES = lua
> +LUAFILESYSTEM_DEPENDENCIES = luainterpreter
>  LUAFILESYSTEM_LICENSE = MIT
>
>  ifeq ($(BR2_LARGEFILE),y)
> diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
> new file mode 100644
> index 0000000..d85d7e8
> --- /dev/null
> +++ b/package/luainterpreter/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_HAS_LUA_INTERPRETER
> +       bool
> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> new file mode 100644
> index 0000000..5297ccc
> --- /dev/null
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# Virtual package for luainterpreter
> +#
> +#############################################################
> +
> +LUAINTERPRETER_VERSION = 5.1
> +LUAINTERPRETER_SOURCE =
> +
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +LUAINTERPRETER_DEPENDENCIES = lua
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +LUAINTERPRETER_DEPENDENCIES = luajit
> +endif
> +
> +$(eval $(generic-package))
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 23b2650..97013e4 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUAJIT
>         bool "luajit"
> +       select BR2_PACKAGE_HAS_LUA_INTERPRETER
>         # Luajit is only available for some target architectures, and
>         # has some complexity wrt 32/64. See luajit.mk for details.
>         depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
> index 412e07f..c47db06 100644
> --- a/package/luaposix/Config.in
> +++ b/package/luaposix/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUAPOSIX
>         bool "luaposix"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           luaposix is a POSIX binding, including curses, for Lua 5.1
>           and 5.2; Like most libraries it simply binds to C APIs on
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index 1d1ee6a..8058f90 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -8,7 +8,7 @@ LUAPOSIX_VERSION = 5.1.20
>  LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
>  LUAPOSIX_LICENSE = MIT
>  LUAPOSIX_LICENSE_FILES = COPYING
> -LUAPOSIX_DEPENDENCIES = lua host-lua
> +LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
>  LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
>  LUAPOSIX_AUTORECONF = YES
>
> diff --git a/package/luasec/Config.in b/package/luasec/Config.in
> index 2d303c1..ed55df7 100644
> --- a/package/luasec/Config.in
> +++ b/package/luasec/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LUASEC
>         bool "luasec"
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_LUASOCKET
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           LuaSec is a binding for OpenSSL library to provide TLS/SSL
>           communication.
> diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
> index 053309f..3fb7060 100644
> --- a/package/luasec/luasec.mk
> +++ b/package/luasec/luasec.mk
> @@ -8,7 +8,7 @@ LUASEC_VERSION = 0.4.1
>  LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download/
>  LUASEC_LICENSE = MIT
>  LUASEC_LICENSE_FILES = LICENSE
> -LUASEC_DEPENDENCIES = lua openssl
> +LUASEC_DEPENDENCIES = luainterpreter openssl
>
>  define LUASEC_BUILD_CMDS
>         $(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
> diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
> index 4526303..619d649 100644
> --- a/package/luasocket/Config.in
> +++ b/package/luasocket/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUASOCKET
>         bool "luasocket"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           LuaSocket is the most comprehensive networking support library
>           for the Lua language.
> diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
> index b0c0be5..20ad8bf 100644
> --- a/package/luasocket/luasocket.mk
> +++ b/package/luasocket/luasocket.mk
> @@ -6,7 +6,7 @@
>
>  LUASOCKET_VERSION = 2.0.2
>  LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
> -LUASOCKET_DEPENDENCIES = lua
> +LUASOCKET_DEPENDENCIES = luainterpreter
>  LUASOCKET_LICENSE = MIT
>  LUASOCKET_LICENSE_FILES = LICENSE
>
> diff --git a/package/luasql/Config.in b/package/luasql/Config.in
> index 4dd011a..96e04fb 100644
> --- a/package/luasql/Config.in
> +++ b/package/luasql/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LUASQL
>         bool "luasql"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           LuaSQL is a simple interface from Lua to a DBMS.
>
> diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
> index 6fbdccc..12fd02c 100644
> --- a/package/luasql/luasql.mk
> +++ b/package/luasql/luasql.mk
> @@ -8,7 +8,7 @@ LUASQL_VERSION = v2.3.0
>  LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_VERSION)
>  LUASQL_LICENSE = MIT
>  LUASQL_LICENSE_FILES = README
> -LUASQL_DEPENDENCIES = lua
> +LUASQL_DEPENDENCIES = luainterpreter
>
>  LUASQL_MAKE_FLAGS = \
>         CC="$(TARGET_CC)" \
> diff --git a/package/rings/Config.in b/package/rings/Config.in
> index d1f1efe..b1d41f3 100644
> --- a/package/rings/Config.in
> +++ b/package/rings/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_RINGS
>         bool "rings"
> +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>         help
>           Provides a way to create new Lua states from within Lua.
>
> diff --git a/package/rings/rings.mk b/package/rings/rings.mk
> index 610ded0..67a4916 100644
> --- a/package/rings/rings.mk
> +++ b/package/rings/rings.mk
> @@ -6,7 +6,7 @@
>
>  RINGS_VERSION = 1.2.3
>  RINGS_SITE = http://github.com/downloads/keplerproject/rings
> -RINGS_DEPENDENCIES = lua
> +RINGS_DEPENDENCIES = luainterpreter
>  RINGS_LICENSE = MIT
>
>  define RINGS_BUILD_CMDS
> --
> 1.7.9.5
>
