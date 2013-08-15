From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 15 Aug 2013 18:56:48 +0200
Subject: [Buildroot] [PATCH] lua: remove shared library feature
In-Reply-To: <20130814003652.39c4d945@skate>
References: <1352033124-2514-1-git-send-email-arnout@mind.be>
 <20130814003652.39c4d945@skate>
Message-ID: <CAB0FRss5gTuePkganj6UfXg0ssqQADc_rAya90znq-=6zVfDwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/8/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Fran?ois, Gustavo,
>
> Can you look at the below patch and tell me what you think?
>

Seems obsolete (BR2_PACKAGE_LUA_SHARED_LIBRARY was removed).

Fran?ois

> Thanks,
>
> Thomas
>
> On Sun,  4 Nov 2012 13:45:24 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> The shared library is a feature we added to lua, but it doesn't work
>> correctly.  Since we anyway normally don't add features to packages,
>> just remove all the support for the shared library.
>>
>> Fixes
>> http://autobuild.buildroot.net/results/3946da859a0dcab99a8db8b91fd9428d9e85bdf1/
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> Francois, Gustavo, could you review and Ack this patch please?  You're
>> more or less the lua maintainers...
>>
>> v2: Added reference to autobuild failure
>>
>>  package/lua/Config.in                         |    7 --
>>  package/lua/lua-02-shared-libs-for-lua.patch  |   49 -------------
>>  package/lua/lua-03-shared-libs-for-luac.patch |   97 -------------------------
>>  package/lua/lua.mk                            |   28 +------
>>  4 files changed, 2 insertions(+), 179 deletions(-)
>>
>> diff --git a/package/lua/Config.in b/package/lua/Config.in
>> index 76359c0..c85b6ab 100644
>> --- a/package/lua/Config.in
>> +++ b/package/lua/Config.in
>> @@ -9,13 +9,11 @@ if BR2_PACKAGE_LUA
>>
>>  config BR2_PACKAGE_LUA_COMPILER
>>       bool "lua compiler"
>> -     select BR2_PACKAGE_LUA_SHARED_LIBRARY
>>       help
>>         Install luac binary
>>
>>  config BR2_PACKAGE_LUA_INTERPRETER
>>       bool "lua interpreter"
>> -     select BR2_PACKAGE_LUA_SHARED_LIBRARY
>>       help
>>         Install lua binary
>>
>> @@ -27,9 +25,4 @@ config BR2_PACKAGE_LUA_INTERPRETER_READLINE
>>       help
>>         Enables command-line editing in the lua interpreter.
>>
>> -config BR2_PACKAGE_LUA_SHARED_LIBRARY
>> -     bool "shared library"
>> -     help
>> -       Install shared liblua.so
>> -
>>  endif
>> diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/lua-02-shared-libs-for-lua.patch
>> deleted file mode 100644
>> index 454e660..0000000
>> --- a/package/lua/lua-02-shared-libs-for-lua.patch
>> +++ /dev/null
>> @@ -1,49 +0,0 @@
>> -Add the compilation of a shared library.
>> -Compile the lua binary with the shared library.
>> -
>> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> -
>> -Index: b/src/Makefile
>> -===================================================================
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -23,6 +23,7 @@
>> - PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
>> -
>> - LUA_A=      liblua.a
>> -+LUA_SO=     liblua.so
>> - CORE_O=     lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
>> -     lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
>> -     lundump.o lvm.o lzio.o
>> -@@ -36,8 +37,9 @@
>> - LUAC_O=     luac.o print.o
>> -
>> - ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
>> --ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
>> -+ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
>> - ALL_A= $(LUA_A)
>> -+ALL_SO= $(LUA_SO)
>> -
>> - default: $(PLAT)
>> -
>> -@@ -47,12 +49,18 @@
>> -
>> - a:  $(ALL_A)
>> -
>> -+so: $(ALL_SO)
>> -+
>> - $(LUA_A): $(CORE_O) $(LIB_O)
>> -     $(AR) $@ $(CORE_O) $(LIB_O)     # DLL needs all object files
>> -     $(RANLIB) $@
>> -
>> --$(LUA_T): $(LUA_O) $(LUA_A)
>> --    $(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
>> -+$(LUA_SO): $(CORE_O) $(LIB_O)
>> -+    $(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? -nostdlib -lgcc
>> -+    ln -fs $@.$(PKG_VERSION) $@
>> -+
>> -+$(LUA_T): $(LUA_O) $(LUA_SO)
>> -+    $(CC) -o $@ -L. $(MYLDFLAGS) $(LUA_O) -llua $(LIBS)
>> -
>> - $(LUAC_T): $(LUAC_O) $(LUA_A)
>> -     $(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
>> diff --git a/package/lua/lua-03-shared-libs-for-luac.patch b/package/lua/lua-03-shared-libs-for-luac.patch
>> deleted file mode 100644
>> index 33f9183..0000000
>> --- a/package/lua/lua-03-shared-libs-for-luac.patch
>> +++ /dev/null
>> @@ -1,97 +0,0 @@
>> -Compile the luac binary with the shared library.
>> -Many internal functions (LUAI_FUNC) must be exported (LUA_API).
>> -
>> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> -
>> -Index: b/src/ldo.h
>> -===================================================================
>> ---- a/src/ldo.h
>> -+++ b/src/ldo.h
>> -@@ -46,7 +46,7 @@
>> - LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
>> - LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
>> - LUAI_FUNC void luaD_reallocstack (lua_State *L, int newsize);
>> --LUAI_FUNC void luaD_growstack (lua_State *L, int n);
>> -+LUA_API void luaD_growstack (lua_State *L, int n);
>> -
>> - LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
>> - LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
>> -Index: b/src/lfunc.h
>> -===================================================================
>> ---- a/src/lfunc.h
>> -+++ b/src/lfunc.h
>> -@@ -18,7 +18,7 @@
>> -                          cast(int, sizeof(TValue *)*((n)-1)))
>> -
>> -
>> --LUAI_FUNC Proto *luaF_newproto (lua_State *L);
>> -+LUA_API Proto *luaF_newproto (lua_State *L);
>> - LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
>> - LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
>> - LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
>> -Index: b/src/lmem.h
>> -===================================================================
>> ---- a/src/lmem.h
>> -+++ b/src/lmem.h
>> -@@ -38,9 +38,9 @@
>> -    ((v)=cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))
>> -
>> -
>> --LUAI_FUNC void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
>> -+LUA_API void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
>> -                                                           size_t size);
>> --LUAI_FUNC void *luaM_toobig (lua_State *L);
>> -+LUA_API void *luaM_toobig (lua_State *L);
>> - LUAI_FUNC void *luaM_growaux_ (lua_State *L, void *block, int *size,
>> -                                size_t size_elem, int limit,
>> -                                const char *errormsg);
>> -Index: b/src/lstring.h
>> -===================================================================
>> ---- a/src/lstring.h
>> -+++ b/src/lstring.h
>> -@@ -25,7 +25,7 @@
>> -
>> - LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
>> - LUAI_FUNC Udata *luaS_newudata (lua_State *L, size_t s, Table *e);
>> --LUAI_FUNC TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
>> -+LUA_API TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
>> -
>> -
>> - #endif
>> -Index: b/src/lundump.h
>> -===================================================================
>> ---- a/src/lundump.h
>> -+++ b/src/lundump.h
>> -@@ -17,7 +17,7 @@
>> - LUAI_FUNC void luaU_header (char* h);
>> -
>> - /* dump one chunk; from ldump.c */
>> --LUAI_FUNC int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
>> -+LUA_API int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
>> -
>> - #ifdef luac_c
>> - /* print one chunk; from print.c */
>> -Index: b/src/Makefile
>> -===================================================================
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -34,7 +34,7 @@
>> - LUA_O=      lua.o
>> -
>> - LUAC_T=     luac
>> --LUAC_O=     luac.o print.o
>> -+LUAC_O=     luac.o print.o lopcodes.o
>> -
>> - ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
>> - ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
>> -@@ -62,8 +62,8 @@
>> - $(LUA_T): $(LUA_O) $(LUA_SO)
>> -     $(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
>> -
>> --$(LUAC_T): $(LUAC_O) $(LUA_A)
>> --    $(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
>> -+$(LUAC_T): $(LUAC_O) $(LUA_SO)
>> -+    $(CC) -o $@ -L. $(MYLDFLAGS) $(LUAC_O) -llua $(LIBS)
>> -
>> - clean:
>> -     $(RM) $(ALL_T) $(ALL_O)
>> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
>> index de60c57..cc5cd34 100644
>> --- a/package/lua/lua.mk
>> +++ b/package/lua/lua.mk
>> @@ -11,9 +11,6 @@ LUA_LICENSE = MIT
>>  LUA_LICENSE_FILES = COPYRIGHT
>>
>>  LUA_CFLAGS = -Wall
>> -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
>> -     LUA_CFLAGS += -fPIC
>> -endif
>>
>>  LUA_MYLIBS += -ldl
>>
>> @@ -28,7 +25,7 @@ endif
>>  # We never want to have host-readline and host-ncurses as dependencies
>>  # of host-lua.
>>  HOST_LUA_DEPENDENCIES =
>> -HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
>> +HOST_LUA_CFLAGS = -Wall -DLUA_USE_DLOPEN -DLUA_USE_POSIX
>>  HOST_LUA_MYLIBS = -ldl
>>
>>  define LUA_BUILD_CMDS
>> @@ -46,14 +43,6 @@ define HOST_LUA_BUILD_CMDS
>>       PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
>>  endef
>>
>> -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
>> -define LUA_INSTALL_STAGING_SHARED_LIB
>> -     $(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
>> -             $(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
>> -     ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
>> -endef
>> -endif
>> -
>>  define LUA_INSTALL_STAGING_CMDS
>>       $(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>>               $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
>> @@ -78,18 +67,9 @@ define LUA_INSTALL_COMPILER
>>  endef
>>  endif
>>
>> -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
>>  define LUA_INSTALL_LIBRARY
>> -     $(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
>> -             $(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
>> -     ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
>>       $(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
>>  endef
>> -else
>> -define LUA_INSTALL_LIBRARY
>> -     $(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
>> -endef
>> -endif
>>
>>  ifeq ($(BR2_HAVE_DEVFILES),y)
>>  define LUA_INSTALL_DEVFILES
>> @@ -112,9 +92,6 @@ endef
>>  define HOST_LUA_INSTALL_CMDS
>>       $(INSTALL) -m 0755 -D $(@D)/src/lua $(HOST_DIR)/usr/bin/lua
>>       $(INSTALL) -m 0755 -D $(@D)/src/luac $(HOST_DIR)/usr/bin/luac
>> -     $(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
>> -             $(HOST_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
>> -     ln -sf liblua.so.$(LUA_VERSION) $(HOST_DIR)/usr/lib/liblua.so
>>       $(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
>>       $(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
>>               $(HOST_DIR)/usr/lib/pkgconfig/lua.pc
>> @@ -132,8 +109,7 @@ LUA_INSTALLED_FILES = \
>>       /usr/lib/pkgconfig/lua.pc \
>>       /usr/bin/lua \
>>       /usr/bin/luac \
>> -     /usr/lib/liblua.a \
>> -     /usr/lib/liblua.so*
>> +     /usr/lib/liblua.a
>>
>>  define LUA_UNINSTALL_STAGING_CMDS
>>       for i in $(LUA_INSTALLED_FILES); do \
>
>
>
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
