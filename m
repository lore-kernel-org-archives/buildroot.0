From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:42:47 +0100
Subject: [Buildroot] [v2 2/2] luajit: allow to build Lua extensions
 without lua
In-Reply-To: <1362487763-28694-2-git-send-email-francois.perrad@gadz.org>
References: <1362487763-28694-1-git-send-email-francois.perrad@gadz.org>
 <1362487763-28694-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130305194247.54a6176f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue,  5 Mar 2013 13:49:23 +0100, Francois Perrad wrote:
> add a virtual package : luainterpreter
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looks a lot better to me. I hope other Buildroot developers will agree
with this approach of virtual packages :)

However, the following change in my opinion belongs to a different
patch, because it has nothing to do with the current patch:

> -LUAJIT_VERSION = 2.0.1
> +LUAJIT_MAJVER=  2
> +LUAJIT_MINVER=  0
> +LUAJIT_RELVER=  1
> +LUAJIT_VERSION = $(LUAJIT_MAJVER).$(LUAJIT_MINVER).$(LUAJIT_RELVER)
>  LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
>  LUAJIT_SITE    = http://luajit.org/download
>  LUAJIT_LICENSE = MIT
> @@ -47,8 +50,14 @@ define LUAJIT_BUILD_CMDS
>  		-C $(@D) amalg
>  endef
>  
> +LUAJIT_FILES_INC= lua.h lualib.h lauxlib.h luaconf.h lua.hpp
> +
>  define LUAJIT_INSTALL_STAGING_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
> +	for i in $(LUAJIT_FILES_INC); do \
> +		ln -sf $(STAGING_DIR)/usr/include/luajit-$(LUAJIT_MAJVER).$(LUAJIT_MINVER)/$$i \
> +		       $(STAGING_DIR)/usr/include/$$i; \
> +	done
>  endef

Also, I think your patches should generally have a longer commit log,
explaining *why* the patch is needed, what problem it is solving, etc.
Your commit log tend to be a little bit short in explanations, I feel.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
