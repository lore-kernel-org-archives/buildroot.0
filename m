From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 2 Jun 2012 10:37:54 +0200
Subject: [Buildroot] [PATCH 1/2] luajit: new package
In-Reply-To: <CANxTyt4QE+HYdpMOnCAhfOpRu77_uGw9TYSnqVyk+fs=zXB1XQ@mail.gmail.com>
References: <CAB0FRstOuaQ2C2cooXfEYsgS6U8ZEuC9AyJDx1T6bxy=oQnLPA@mail.gmail.com>
 <CANxTyt4QE+HYdpMOnCAhfOpRu77_uGw9TYSnqVyk+fs=zXB1XQ@mail.gmail.com>
Message-ID: <CAB0FRst4-PHftsQg+K35+QXE6n4cL4PU3g6vT_uswpMGOf+Q8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/6/2 Danomi Manchego <danomimanchego123@gmail.com>:
> Fran?ois,
>
>> +define LUAJIT_BUILD_CMDS
>> + ? ? ? $(MAKE) PREFIX="/usr" CROSS="$(TARGET_CROSS)" -C $(@D)
>> +endef
>
> Perhaps this should specify the "amalg" target"? ?The install.html says:
> "This compiles the LuaJIT core as one huge C file and allows GCC to generate
> faster and shorter code."
>

good idea (v2 coming soon).

> With regards to the luaconf.h patch, should not the "/5.1" be removed
> from?LUA_XPATH and LUA_XCPATH?
>

The goal of this patch is to reproduce package/lua/lua-root-path.patch,
it allows Lua modules (luasocket for example) to be used with lua and
luajit with the same build.
It concerns Lua configuration embedded in LuaJIT.
The goal is not to shorten all LuaJIT paths.

Fran?ois.

> I'm also wondering if the "-beta10" should be removed from LUA_JDIR ...
>
> Danomi -
>
>
> On Fri, Jun 1, 2012 at 5:57 AM, Fran?ois Perrad <francois.perrad@gadz.org>
> wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>> ?package/Config.in ? ? ? ? ? ? ? ? ? ? | ? ?3 ++-
>> ?package/luajit/Config.in ? ? ? ? ? ? ?| ? ?9 +++++++
>> ?package/luajit/luajit-root-path.patch | ? 16 ++++++++++++
>> ?package/luajit/luajit.mk ? ? ? ? ? ? ?| ? 44
>> +++++++++++++++++++++++++++++++++
>> ?4 files changed, 71 insertions(+), 1 deletion(-)
>> ?create mode 100644 package/luajit/Config.in
>> ?create mode 100644 package/luajit/luajit-root-path.patch
>> ?create mode 100644 package/luajit/luajit.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index fb1b08f..fde30b0 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -237,7 +237,8 @@ endmenu
>> ?menu "Interpreter languages and scripting"
>> ?source "package/haserl/Config.in"
>> ?source "package/lua/Config.in"
>> -if BR2_PACKAGE_LUA
>> +source "package/luajit/Config.in"
>> +if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
>> ?menu "LUA libraries/modules"
>> ?source "package/cgilua/Config.in"
>> ?source "package/copas/Config.in"
>> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
>> new file mode 100644
>> index 0000000..c665b28
>> --- /dev/null
>> +++ b/package/luajit/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_LUAJIT
>> + ? ? ? bool "luajit"
>> + ? ? ? help
>> + ? ? ? ? LuaJIT implements the full set of language features defined by
>> Lua 5.1. The
>> + ? ? ? ? virtual machine (VM) is API- and ABI-compatible to the standard
>> Lua interpreter
>> + ? ? ? ? and can be deployed as a drop-in replacement.
>> +
>> + ? ? ? ? http://luajit.org/
>> +
>> diff --git a/package/luajit/luajit-root-path.patch
>> b/package/luajit/luajit-root-path.patch
>> new file mode 100644
>> index 0000000..2eb037c
>> --- /dev/null
>> +++ b/package/luajit/luajit-root-path.patch
>> @@ -0,0 +1,16 @@
>> +diff -Naur LuaJIT-2.0.0-beta10.orig/src/luaconf.h
>> LuaJIT-2.0.0-beta10/src/luaconf.h
>> +--- LuaJIT-2.0.0-beta10.orig/src/luaconf.h ? ? 2012-05-30
>> 20:33:27.989333819 +0200
>> ++++ LuaJIT-2.0.0-beta10/src/luaconf.h ?2012-05-30 20:46:30.581354777
>> +0200
>> +@@ -22,9 +22,9 @@
>> + #define LUA_CPATH_DEFAULT \
>> + ? ".\\?.dll;" LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
>> + #else
>> +-#define LUA_ROOT ? ? ?"/usr/local/"
>> +-#define LUA_LDIR ? ? ?LUA_ROOT "share/lua/5.1/"
>> +-#define LUA_CDIR ? ? ?LUA_ROOT "lib/lua/5.1/"
>> ++#define LUA_ROOT ? ? ?"/usr/"
>> ++#define LUA_LDIR ? ? ?LUA_ROOT "share/lua/"
>> ++#define LUA_CDIR ? ? ?LUA_ROOT "lib/lua/"
>> + #ifdef LUA_XROOT
>> + #define LUA_JDIR ? ? ?LUA_XROOT "share/luajit-2.0.0-beta10/"
>> + #define LUA_XPATH \
>> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
>> new file mode 100644
>> index 0000000..14c5c66
>> --- /dev/null
>> +++ b/package/luajit/luajit.mk
>> @@ -0,0 +1,44 @@
>> +#############################################################
>> +#
>> +# luajit
>> +#
>> +#############################################################
>> +
>> +LUAJIT_VERSION = 2.0.0-beta10
>> +LUAJIT_SOURCE:=LuaJIT-$(LUAJIT_VERSION).tar.gz
>> +LUAJIT_SITE = http://luajit.org/download
>> +LUAJIT_INSTALL_STAGING = YES
>> +
>> +define LUAJIT_INSTALL_BETA_FIX_MAKEFILE
>> + ? ? ? $(SED) 's/@echo " ?$$(SYMLINK) $$(INSTALL_TNAME)
>> $$(INSTALL_TSYM)"/$$(SYMLINK) $$(INSTALL_TNAME) $$(INSTALL_TSYM)/'
>> $(@D)/Makefile
>> +endef
>> +
>> +ifeq ($(findstring beta,$(LUAJIT_VERSION)),beta)
>> +LUAJIT_POST_PATCH_HOOKS += LUAJIT_INSTALL_BETA_FIX_MAKEFILE
>> +endif
>> +
>> +define LUAJIT_NOLARGEFILE_FIX_MAKEFILE
>> + ? ? ? $(SED) 's/TARGET_XCFLAGS= -D_FILE_OFFSET_BITS=64
>> -D_LARGEFILE_SOURCE/TARGET_XCFLAGS=/' $(@D)/src/Makefile
>> +endef
>> +
>> +ifneq ($(BR2_LARGEFILE),y)
>> +LUAJIT_POST_PATCH_HOOKS += LUAJIT_NOLARGEFILE_FIX_MAKEFILE
>> +endif
>> +
>> +define LUAJIT_BUILD_CMDS
>> + ? ? ? $(MAKE) PREFIX="/usr" CROSS="$(TARGET_CROSS)" -C $(@D)
>> +endef
>> +
>> +define LUAJIT_INSTALL_STAGING_CMDS
>> + ? ? ? $(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
>> +endef
>> +
>> +define LUAJIT_INSTALL_TARGET_CMDS
>> + ? ? ? $(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
>> +endef
>> +
>> +define LUAJIT_CLEAN_CMDS
>> + ? ? ? -$(MAKE) -C $(@D) clean
>> +endef
>> +
>> +$(eval $(call GENTARGETS,package,luajit))
>> --
>> 1.7.9.5
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
