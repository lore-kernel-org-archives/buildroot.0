From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 08:02:26 +0100
Subject: [Buildroot] [PATCH 07/24] luarocks: allow to work with
	host-luajit
In-Reply-To: <1393227301-14874-8-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-8-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EE302.70507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> when we use luajit on target

 Can you explain more clearly why this is needed? I.e., why can't you use
host-lua for luarocks to build packages for luajit on the target? You'll
need at least two paragraphs to explain that properly. I can write the
explanation if you like, only I don't understand myself why it is needed :-)

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luainterpreter/luainterpreter.mk |    4 ++++
>  package/luarocks/luarocks.mk             |   18 ++++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> index c37d621..d5b95db 100644
> --- a/package/luainterpreter/luainterpreter.mk
> +++ b/package/luainterpreter/luainterpreter.mk
> @@ -5,8 +5,12 @@
>  #############################################################
>  
>  LUAINTERPRETER_SOURCE =
> +HOST_LUAINTERPRETER_SOURCE =
>  LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
>  
>  LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
>  
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))

 This should be a separate patch - with explanation in the commit log! E.g.

luainterpreter: add host-luainterpreter

host-luainterpreter is needed for luarocks to work with the same lua
implementation as the one on the target.

> +
> +LUA_RUN = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))

 Wouldn't it be easier to just symlink lua -> luajit in luajit?

 Actually, in the luajit Makefile I see:

$(SYMLINK) $(INSTALL_TNAME) $(INSTALL_TSYM)

which smells to me as if it is already symlinking...

> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 86e57d2..0b99de6 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -9,16 +9,22 @@ LUAROCKS_SITE = http://luarocks.org/releases/
>  LUAROCKS_LICENSE = MIT
>  LUAROCKS_LICENSE_FILES = COPYING
>  
> -HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
> +HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter luainterpreter
>  
>  LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
>  LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
>  
> +HOST_LUAROCKS_CONF_OPT = \
> +	--prefix=$(HOST_DIR)/usr \
> +	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
> +	--with-lua=$(HOST_DIR)/usr
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +HOST_LUAROCKS_CONF_OPT += --lua-suffix=jit
> +endif
> +
>  define HOST_LUAROCKS_CONFIGURE_CMDS
> -	cd $(@D) && ./configure \
> -		--prefix=$(HOST_DIR)/usr \
> -		--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
> -		--with-lua=$(HOST_DIR)/usr
> +	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPT)
>  endef
>  
>  define HOST_LUAROCKS_INSTALL_CMDS
> @@ -43,4 +49,4 @@ endef
>  $(eval $(host-generic-package))
>  
>  LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
> -	$(HOST_DIR)/usr/bin/lua $(HOST_DIR)/usr/bin/luarocks
> +	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks

 This should be mentioned and explained explicitly in the commit message.
E.g.:

Since the host-lua executable can be either lua or luajit, use $(LUA_RUN)
to call it instead of an explicit path.

 Unless of course the symlink is installed :-)

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
