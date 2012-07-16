From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 17:44:46 +0200
Subject: [Buildroot] [PATCH 3/5] lua : don't install shared library in
 staging
In-Reply-To: <1342446352-31231-3-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <1342446352-31231-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120716174446.5e112599@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 15:45:50 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> dead code, LUA_INSTALL_STAGING_SHARED_LIB not used
> ---
>  package/lua/lua.mk |    8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index ab9a1a2..5b8022a 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -42,14 +42,6 @@ define HOST_LUA_BUILD_CMDS
>  	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
>  endef
>  
> -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
> -define LUA_INSTALL_STAGING_SHARED_LIB
> -	$(INSTALL) -D $(@D)/src/liblua.so.$(LUA_VERSION) \
> -		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
> -	ln -sf liblua.so.$(LUA_VERSION)
> $(STAGING_DIR)/usr/lib/liblua.so -endef
> -endif
> -
>  define LUA_INSTALL_STAGING_CMDS
>  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc

Doh? The code is probably dead, but the right thing here is not to
remove, but to make it work: the liblua.so.* files *SHOULD* definitely
be installed in the staging directory, just like all other shared
libraries. They are needed so that other packages (that rely on the
Lua shared library) can be linked against this library.

The installation code in this package tries to be smart, but is in fact
very complicated. It should just:

 * Install the shared library + .pc file + .h files + .a file to both
   the staging directory and target directory, unconditionally

 * Install the Lua compiler in the target directory if the compiler is
   enabled in the config

 * Install the Lua interpreter in the target directory if the
   interpreter is enabled in the config.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
