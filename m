From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:22:49 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 01/10] luainterpreter:
 create virtual package
In-Reply-To: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222182249.4b8e0b14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:30 +0100, Francois Perrad wrote:
> luainterpreter is lua or luajit

It would be good to have slightly more verbose commit logs. Something
like:

"""
This commit introduces the 'luainterpreter' package, which serves as a
virtual package depending either on the 'lua' package or the 'luajit'
package depending on which interpreter is selected.

In order to achieve this, it also updates all the existing Lua packages
to depend on luainterpreter... blablabla.
"""


> diff --git a/package/Config.in b/package/Config.in
> index 311cc6c..a8ebb27 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -352,6 +352,7 @@ source "package/haserl/Config.in"
>  source "package/jamvm/Config.in"
>  source "package/jimtcl/Config.in"
>  source "package/lua/Config.in"
> +source "package/luainterpreter/Config.in"
>  source "package/luajit/Config.in"
>  if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT

Why not replace this condition by:

if BR2_PACKAGE_HAS_LUA_INTERPRETER

so that you can remove the "depends on BR2_PACKAGE_HAS_LUA_INTERPRETER"
in all of the Lua packages.

>  menu "Lua libraries/modules"
> diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
> index bd8503a..ca9dd5d 100644
> --- a/package/lbase64/Config.in
> +++ b/package/lbase64/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LBASE64
>  	bool "lbase64"
> +	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER

Like this one.

>  	help
>  	  A base64 library for Lua
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
>  	bool "lua-ev"
> +	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER

This one. And so on.

> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> new file mode 100644
> index 0000000..6e2ccfe
> --- /dev/null
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# Virtual package for luainterpreter
> +#
> +#############################################################

No need for a special comment. Just "luainterpreter" is sufficient.

> +LUAINTERPRETER_VERSION = virtual
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

This should probably be converted to use the new virtual package scheme
proposed by Yann. But Yann is telling me on IRC that he has already
done so.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
