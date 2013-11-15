From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 08:24:59 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 01/10] luainterpreter:
 create virtual package
In-Reply-To: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LXVQ8uFccP2+-TwQOC0iAH=ochrtzUQH-sFN7sZetrpUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Thu, Nov 14, 2013 at 9:17 PM, Francois Perrad <fperrad@gmail.com> wrote:
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
> index 311cc6c..c45f7f6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -353,6 +353,7 @@ source "package/jamvm/Config.in"
>  source "package/jimtcl/Config.in"
>  source "package/lua/Config.in"
>  source "package/luajit/Config.in"
> +source "package/luainterpreter/Config.in"

Entries in Config.in are supposed to be ordered alphabetically.
Although in this case luainterpreter does not provide a visible entry,
I would still order this file to avoid confusion... So that is lua,
luainterpreter, luajit.

>  if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
>  menu "Lua libraries/modules"
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

The meaning of BR2_PACKAGE_HAS_LUA_INTERPRETER is that the user has
selected one of lua or luajit, right?
Is the PACKAGE in there really needed? What about
BR2_HAS_LUA_INTERPRETER instead? This says that 'buildroot has a lua
interpreter' and not that 'a package has a lua interpreter'.

[..]

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

What is the meaning of this version? It seems to be the lua version,
but is this relevant for a virtual package?

[..]

Best regards,
Thomas
