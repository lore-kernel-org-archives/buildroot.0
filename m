From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Jan 2014 18:38:32 +0100
Subject: [Buildroot] [V2 1/3] lua: choice between 5.1.x & 5.2.x
In-Reply-To: <1389815674-14759-1-git-send-email-francois.perrad@gadz.org>
References: <1389815674-14759-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <52D81918.2000205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/14 20:54, Francois Perrad wrote:
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[snip]
> diff --git a/package/lua/5.2.3/lua-04-lua-pc.patch b/package/lua/5.2.3/lua-04-lua-pc.patch
> new file mode 100644
> index 0000000..62acb20
> --- /dev/null
> +++ b/package/lua/5.2.3/lua-04-lua-pc.patch
> @@ -0,0 +1,40 @@
> +add lua.pc

  So they had a .pc file, and now they removed it? How weird...

[snip]
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index a88a11e..2c867f6 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -4,7 +4,11 @@
>   #
>   ################################################################################
>
> +ifeq ($(BR2_PACKAGE_LUA_5_2),y)
> +LUA_VERSION = 5.2.3
> +else
>   LUA_VERSION = 5.1.5
> +endif
>   LUA_SITE = http://www.lua.org/ftp
>   LUA_INSTALL_STAGING = YES
>   LUA_LICENSE = MIT
> @@ -13,6 +17,13 @@ LUA_LICENSE_FILES = COPYRIGHT
>   LUA_CFLAGS = -Wall -fPIC
>   LUA_MYLIBS += -ldl
>
> +ifeq ($(BR2_PACKAGE_LUA_5_2),y)
> +LUA_CFLAGS += -DLUA_COMPAT_ALL
> +ifneq ($(BR2_LARGEFILE),y)
> +LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
> +endif
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
>   	LUA_DEPENDENCIES = readline ncurses
>   	LUA_MYLIBS += -lreadline -lhistory -lncurses
> @@ -33,6 +44,10 @@ HOST_LUA_DEPENDENCIES =
>   HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
>   HOST_LUA_MYLIBS = -ldl
>
> +ifeq ($(BR2_PACKAGE_LUA_5_2),y)
> +HOST_LUA_CFLAGS += -DLUA_COMPAT_ALL
> +endif

[snip]

> diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
> index 1562145..ec51c1a 100644
> --- a/package/luainterpreter/Config.in
> +++ b/package/luainterpreter/Config.in
> @@ -4,3 +4,8 @@ config BR2_PACKAGE_HAS_LUA_INTERPRETER
>   config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
>   	string
>   	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
> +
> +config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
> +	string
> +	default "5.1"	if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
> +	default "5.2"	if BR2_PACKAGE_LUA_5_2

  Sorry, not OK. It should be split over the three packages.

  In luainterpreter/Config.in:

config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
	string


  In lua/Config.in (inside the LUA condition):

config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
	default "5.1" if BR2_PACKAGE_LUA_5_1
	default "5.2" if BR2_PACKAGE_LUA_5_2


  In luajit/Config.in:

config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
	default "5.1"


  Regards,
  Arnout

> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> index 04d63d4..c37d621 100644
> --- a/package/luainterpreter/luainterpreter.mk
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -7,4 +7,6 @@
>   LUAINTERPRETER_SOURCE =
>   LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
>
> +LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
> +
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
