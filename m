From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:43:07 +0100
Subject: [Buildroot] [RFC] lua: always use host-lua for
 host-luainterpreter
In-Reply-To: <20171021205457.18687-1-peter@korsgaard.com>
References: <20171021205457.18687-1-peter@korsgaard.com>
Message-ID: <20180108234307.612cdd97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

Could you comment on this patch that touches Lua packaging in Buildroot?

It's been there for a bit more than 2 months, so unless you reply to
say that you disagree, I'll apply this patch in the next days.

Thanks!

Thomas

On Sat, 21 Oct 2017 22:54:57 +0200, Peter Korsgaard wrote:
> Similar to how we do for openssl.
> 
> host-luainterpreter is only used by the luarocks infrastructure, and there
> is afaik no specific reason why the host lua variant must match the target one.
> 
> Luajit only supports a limited number of architectures, so building it for
> the host limits the architectures Buildroot can be used on (E.G. powerpc64
> autobuilders).
> 
> To fix this, always use host-lua.  Slightly rework lua.mk to ensure
> host-lua-5.1 is used when luajit is selected, and drop the logic for using
> host-luajit.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/lua/lua.mk                       | 6 +++---
>  package/luainterpreter/Config.in         | 4 ++++
>  package/luainterpreter/luainterpreter.mk | 2 +-
>  package/luarocks/luarocks.mk             | 4 ----
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 0ac2e0e25d..851dc8f734 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -16,10 +16,10 @@ endif
>  LUA_SITE = http://www.lua.org/ftp
>  LUA_INSTALL_STAGING = YES
>  LUA_LICENSE = MIT
> -ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> -LUA_LICENSE_FILES = COPYRIGHT
> -else
> +ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
>  LUA_LICENSE_FILES = doc/readme.html
> +else
> +LUA_LICENSE_FILES = COPYRIGHT
>  endif
>  
>  LUA_PROVIDES = luainterpreter
> diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
> index e89a9b84d2..7bc54d862f 100644
> --- a/package/luainterpreter/Config.in
> +++ b/package/luainterpreter/Config.in
> @@ -7,3 +7,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
>  
>  config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
>  	string
> +
> +config BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER
> +	string
> +	default "host-lua"
> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> index cb1d5dde18..58d421b183 100644
> --- a/package/luainterpreter/luainterpreter.mk
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -20,4 +20,4 @@ endif
>  $(eval $(virtual-package))
>  $(eval $(host-virtual-package))
>  
> -LUA_RUN = $(HOST_DIR)/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
> +LUA_RUN = $(HOST_DIR)/bin/lua
> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index e050cb553c..ea57530633 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -23,10 +23,6 @@ HOST_LUAROCKS_CONF_OPTS = \
>  	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
>  	--with-lua=$(HOST_DIR)
>  
> -ifeq ($(BR2_PACKAGE_LUAJIT),y)
> -HOST_LUAROCKS_CONF_OPTS += --lua-suffix=jit
> -endif
> -
>  define HOST_LUAROCKS_CONFIGURE_CMDS
>  	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
>  endef



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
