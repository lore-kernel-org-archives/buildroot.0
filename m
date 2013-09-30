From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 30 Sep 2013 14:31:46 -0400
Subject: [Buildroot] [v4 1/2] luainterpreter: create virtual package
In-Reply-To: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Wed, Aug 14, 2013 at 4:35 AM, Francois Perrad <fperrad@gmail.com> wrote:
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
> [...]
>
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

I was curious on your choice of version number for the virtual
package. Is this intended to be used for API compatibility checks?

The reason that I'm asking is that I'm going to need to upgrade a
project to Lua 5.2. There are enough API differences between Lua 5.1
and 5.2 that it would be useful to use your patch set and add Lua 5.2
as another luainterpreter. Using LUAINTERPRETER_VERSION sounds like
one way of checking Lua API compatibility in other projects. Or did
you have other thoughts?

Also, any word on the status of your patches?

Thanks,
Frank

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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
