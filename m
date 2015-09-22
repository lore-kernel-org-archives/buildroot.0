From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 16:01:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua: do not install man files
In-Reply-To: <1442876342-10841-1-git-send-email-joerg.krause@embedded.rocks>
References: <1442876342-10841-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150922160121.2c878fa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

On Tue, 22 Sep 2015 00:59:02 +0200, J?rg Krause wrote:
> As written in the holy manual:
> http://buildroot.org/downloads/manual/manual.html#faq-no-doc-on-target
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/lua/lua.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 1279b76..af5cef3 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -87,7 +87,7 @@ define HOST_LUA_BUILD_CMDS
>  endef
>  
>  define LUA_INSTALL_STAGING_CMDS
> -	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
> +	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" INSTALL_MAN= -C $(@D) install
>  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
>  endef
> @@ -97,7 +97,7 @@ define LUA_INSTALL_TARGET_CMDS
>  endef
>  
>  define HOST_LUA_INSTALL_CMDS
> -	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
> +	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" INSTALL_MAN= -C $(@D) install
>  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>  		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
>  endef

This is in fact not needed. Buildroot is already removing the man pages
in the target-finalize step of the main Makefile. I have checked, the
Lua man pages are installed in standard locations, so they are properly
removed by this generic removal step.

For this reason, I am not sure it is really worth to add more
complexity to a package to avoid doing something that is anyway already
handled at some later point in a generic way. It would be worth if that
thing was actually taking a significant amount of build time, or
required additional dependencies. But it's not the case here, so i
would be tempted to leave the Lua package as is, and not take this
patch.

Opinions?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
