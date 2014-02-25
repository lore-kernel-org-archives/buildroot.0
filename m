From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 23:06:06 +0100
Subject: [Buildroot] [PATCH 2/2] lua: handles BR2_PREFER_STATIC_LIB
In-Reply-To: <1390661475-23218-3-git-send-email-francois.perrad@gadz.org>
References: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
 <1390661475-23218-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <530D13CE.3060908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/14 15:51, Francois Perrad wrote:
> fix compilation with Blackfin FLAT
> 
> see http://autobuild.buildroot.net/results/b41/b4146bf821d59f694546f6e3a341394cc8fa43ce/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Since lua is a high-profile package, this one should preferably still go
in 2014.02.

 Although I have quite a few suggestions still below, this patch is OK as
it is for me, except for the additional comment to explain the STATIC
dependency in package/Config.in. So Francois, if you don't have time to
fix all the rest, please just add that comment and resubmit as is.


> ---
>  package/Config.in                                  |    2 +-
>  package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   28 +++++++++++++-------
>  package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   28 +++++++++++++-------
>  package/lua/lua.mk                                 |   23 +++++++++++-----
>  4 files changed, 55 insertions(+), 26 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 397cc11..85d3a15 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -362,7 +362,7 @@ source "package/jimtcl/Config.in"
>  source "package/lua/Config.in"
>  source "package/luainterpreter/Config.in"
>  source "package/luajit/Config.in"
> -if BR2_PACKAGE_HAS_LUA_INTERPRETER

 Add this comment:

# lua modules are dynamically loaded, so not available on static builds

> +if BR2_PACKAGE_HAS_LUA_INTERPRETER && !BR2_PREFER_STATIC_LIB
>  menu "Lua libraries/modules"
>  source "package/cgilua/Config.in"
>  source "package/copas/Config.in"
> diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
> index 1227cbd..c087c73 100644
> --- a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
> +++ b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
> @@ -1,6 +1,7 @@
>  Add the compilation of a shared library.
>  Compile the lua binary with the shared library.
>  And install the shared library.
> +The variable BUILDMODE allows to switch between static and dynamic mode.
>  
>  Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  
> @@ -8,20 +9,23 @@ Index: b/Makefile
>  ===================================================================
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -43,7 +43,7 @@
> +@@ -43,7 +43,11 @@
>   # What to install.
>   TO_BIN= lua luac
>   TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
> --TO_LIB= liblua.a
> ++ifneq (dynamic,$(BUILDMODE))

 I have the impression that lua tries hard not to use gnu-isms in their
Makefiles. So if it is to stand a chance of being upstreamed, this should
be avoided. Maybe:

TO_LIB= liblua.a
TO_DYNLIB = liblua.so.$(R)
...
INSTALL_DYNLIB_$(DYNAMIC) = \
	cd src && $(INSTALL_DATA) $(TO_DYNLIB) $(INSTALL_LIB) && \
	ln -sf $(TO_DYNLIB) $(INSTALL_LIB)/liblua.so

and setting DYNAMIC=Y in the call.

 If you don't manage to get this in a reasonable upstreamable shape, I'm
OK with the way it is now (i.e. with the BUILDMODE), because I really
want this in 2014.02.

> + TO_LIB= liblua.a
> ++else
>  +TO_LIB= liblua.a liblua.so.$(R)
> ++endif
>   TO_MAN= lua.1 luac.1
>   
>   # Lua version and release.
> -@@ -63,6 +63,7 @@
> +@@ -63,6 +67,7 @@
>   	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
>   	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
>   	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
> -+	cd $(INSTALL_LIB) && ln -sf liblua.so.$(R) liblua.so
> ++	cd $(INSTALL_LIB) && test -f liblua.so.$(R) && ln -sf liblua.so.$(R) liblua.so || :
$(INSTALL_DYNLIB_Y)

>   	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
>   
>   ranlib:
> @@ -37,18 +41,21 @@ Index: b/src/Makefile
>   CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
>   	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
>   	lundump.o lvm.o lzio.o
> -@@ -36,8 +37,9 @@
> +@@ -36,8 +37,13 @@
>   LUAC_O=	luac.o print.o
>   
>   ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
> --ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
> ++ifneq (dynamic,$(BUILDMODE))
> + ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
> ++else
>  +ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
> ++endif

LUA_SO_$(DYNAMIC) = liblua.so.$(R)
ALL_T = $(LUA_A) $(LUA_SO_Y) $(LUA_T) $(LUAC_T)

 etc.

[snip]
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index c016d7e..41296d9 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -15,7 +15,6 @@ LUA_LICENSE = MIT
>  LUA_LICENSE_FILES = COPYRIGHT
>  
>  LUA_CFLAGS = -Wall -fPIC
> -LUA_MYLIBS += -ldl
>  
>  ifeq ($(BR2_PACKAGE_LUA_5_2),y)
>  LUA_CFLAGS += -DLUA_COMPAT_ALL
> @@ -24,17 +23,25 @@ LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
>  endif
>  endif
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	LUA_BUILDMODE = static
> +else
> +	LUA_BUILDMODE = dynamic
> +	LUA_CFLAGS += -DLUA_USE_DLOPEN
> +	LUA_MYLIBS += -ldl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
>  	LUA_DEPENDENCIES = readline ncurses
>  	LUA_MYLIBS += -lreadline -lhistory -lncurses
> -	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE
> +	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_READLINE

 Would be good to move the -DLUA_USE_POSIX outside of the condition.


 Regards,
 Arnout

>  else
>  ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_LINENOISE),y)
>  	LUA_DEPENDENCIES = linenoise
>  	LUA_MYLIBS += -llinenoise
> -	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_LINENOISE
> +	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_LINENOISE
>  else
> -	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
> +	LUA_CFLAGS += -DLUA_USE_POSIX
>  endif
>  endif
>  
> @@ -53,6 +60,7 @@ define LUA_BUILD_CMDS
>  	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
>  	CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
>  	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
> +	BUILDMODE=$(LUA_BUILDMODE) \
>  	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
>  endef
>  
> @@ -61,21 +69,22 @@ define HOST_LUA_BUILD_CMDS
>  	CFLAGS="$(HOST_LUA_CFLAGS)" \
>  	MYLDFLAGS="$(HOST_LDFLAGS)" \
>  	MYLIBS="$(HOST_LUA_MYLIBS)" \
> +	BUILDMODE=static \
>  	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
>  endef
>  
>  define LUA_INSTALL_STAGING_CMDS
> -	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
> +	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" BUILDMODE=$(LUA_BUILDMODE) -C $(@D) install
>  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
>  endef
>  
>  define LUA_INSTALL_TARGET_CMDS
> -	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" -C $(@D) install
> +	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" BUILDMODE=$(LUA_BUILDMODE) -C $(@D) install
>  endef
>  
>  define HOST_LUA_INSTALL_CMDS
> -	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
> +	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" BUILDMODE=static -C $(@D) install
>  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>  		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
