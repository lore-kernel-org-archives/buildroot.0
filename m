From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 22:21:37 +0100
Subject: [Buildroot] [v2] luajit: complete replacement for lua
In-Reply-To: <1354783499-20000-1-git-send-email-francois.perrad@gadz.org>
References: <1354783499-20000-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <50CA46E1.2090105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Francois,

On 06/12/12 09:44, Francois Perrad wrote:
> the mutual exclusion is done by a choice
>
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
>
> see initial discussion, http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/43499
>
> ---
>   Makefile                                         |    6 ++++++
>   package/Config.in                                |    1 -
>   package/copas/copas.mk                           |    2 +-
>   package/coxpcall/coxpcall.mk                     |    1 -
>   package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
>   package/lua/Config.in                            |   25 ++++++++++++++++++++++
>   package/luacjson/luacjson.mk                     |    2 +-
>   package/luaexpat/luaexpat.mk                     |    2 +-
>   package/luafilesystem/luafilesystem.mk           |    2 +-
>   package/luajit/Config.in                         |   12 -----------
>   package/luajit/luajit-05-install-like-lua.patch  |   17 +++++++++++++++
>   package/luasocket/luasocket.mk                   |    2 +-
>   package/rings/rings.mk                           |    2 +-
>   package/xavante/xavante.mk                       |    2 +-
>   14 files changed, 56 insertions(+), 22 deletions(-)
>   delete mode 100644 package/luajit/Config.in
>   create mode 100644 package/luajit/luajit-05-install-like-lua.patch
>
> diff --git a/Makefile b/Makefile
> index 4b09437..b5215e0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -282,6 +282,12 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
>   HOSTCXX := $(CCACHE) $(HOSTCXX)
>   endif
>
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +    LUA_INTERPRETER = lua
> +else ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +    LUA_INTERPRETER = luajit
> +endif
> +

  Minor detail: I think this fits better in package/Makefile.in.

>   #############################################################
>   #
>   # You should probably leave this stuff alone unless you know
> diff --git a/package/Config.in b/package/Config.in
> index 74e439e..e6e294e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -271,7 +271,6 @@ source "package/erlang/Config.in"
>   source "package/haserl/Config.in"
>   source "package/jamvm/Config.in"
>   source "package/lua/Config.in"
> -source "package/luajit/Config.in"
>   if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
>   menu "LUA libraries/modules"
>   source "package/cgilua/Config.in"
> diff --git a/package/copas/copas.mk b/package/copas/copas.mk
> index c84a6cc..a258927 100644
> --- a/package/copas/copas.mk
> +++ b/package/copas/copas.mk
> @@ -6,7 +6,7 @@
>
>   COPAS_VERSION = 1.1.6
>   COPAS_SITE = http://github.com/downloads/keplerproject/copas
> -COPAS_DEPENDENCIES = lua coxpcall luasocket
> +COPAS_DEPENDENCIES = coxpcall luasocket

  I guess this is removed because it's a runtime-only dependency?
Then it's better to do this in a separate patch.

[snip]
> diff --git a/package/lua/Config.in b/package/lua/Config.in
> index 4166730..d698a25 100644
> --- a/package/lua/Config.in
> +++ b/package/lua/Config.in
> @@ -1,3 +1,13 @@
> +
> +choice
> +	prompt "Lua Interpreter"
> +	default BR2_PACKAGE_LUA_NONE
> +
> +config BR2_PACKAGE_LUA_NONE
> +	bool "none"
> +	help
> +	  None.
> +
>   config BR2_PACKAGE_LUA
>   	bool "lua"
>   	help
> @@ -5,6 +15,21 @@ config BR2_PACKAGE_LUA
>
>   	  http://www.lua.org/
>
> +config BR2_PACKAGE_LUAJIT
> +	bool "luajit"
> +	# Luajit is only available for some target architectures, and
> +	# has some complexity wrt 32/64. See luajit.mk for details.
> +	depends on BR2_i386 || (BR2_x86_64&&  BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
> +	help
> +	  LuaJIT implements the full set of language features defined
> +	  by Lua 5.1. The virtual machine (VM) is API- and
> +	  ABI-compatible to the standard Lua interpreter and can be
> +	  deployed as a drop-in replacement.
> +
> +	  http://luajit.org/
> +
> +endchoice

  It's a good idea to make it a choice, but I have a few problems
with it:

- it doesn't work well with packages that select LUA (e.g.
BR2_PACKAGE_LIGHTTPD_LUA);
- it's not good to split luajit's Config.in from the .mk file.

  Maybe there could be a symbol BR2_USE_LUA that can be selected by
other packages? This symbol could be defined package/Config.in.
The choice would default to BR2_PACKAGE_LUA if BR2_USE_LUA, and
BR2_PACKAGE_LUA_NONE would depend on !BR2_USE_LUA.

> +
>   if BR2_PACKAGE_LUA
>
>   choice
[snip]
> diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
> index 0c1c6f1..7f49f4d 100644
> --- a/package/xavante/xavante.mk
> +++ b/package/xavante/xavante.mk
> @@ -6,7 +6,7 @@
>
>   XAVANTE_VERSION = 2.2.1
>   XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
> -XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
> +XAVANTE_DEPENDENCIES = cgilua copas coxpcall luafilesystem luasocket wsapi

  Here again I think it should be a separate patch.


  Regards,
  Arnout

>   XAVANTE_LICENSE = MIT
>
>   define XAVANTE_INSTALL_TARGET_CMDS

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
