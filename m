From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] lua: Migrate to gentargets and
	improve it
Message-ID: <20100502074442.AA05E8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=46913a2d4f5a059126aaf0411aded258f7d2de1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #803

Based on initial patch by rvpaasen at t3i.nl

[Peter: lua/luac needs liblua.so.* on target]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    3 +-
 package/lua/Config.in                    |   30 +++++-
 package/lua/lua-boolean_expression.patch |   48 ++++++++
 package/lua/lua-debug_getfenv.patch      |   10 ++
 package/lua/lua-gc_performance.patch     |   14 +++
 package/lua/lua-root-path.patch          |   17 +++
 package/lua/lua-shared-libs.patch        |  145 +++++++++++++++++++++++++
 package/lua/lua-table.patch              |   22 ++++
 package/lua/lua.mk                       |  175 ++++++++++++++++++------------
 9 files changed, 394 insertions(+), 70 deletions(-)
 create mode 100644 package/lua/lua-boolean_expression.patch
 create mode 100644 package/lua/lua-debug_getfenv.patch
 create mode 100644 package/lua/lua-gc_performance.patch
 create mode 100644 package/lua/lua-root-path.patch
 create mode 100644 package/lua/lua-shared-libs.patch
 create mode 100644 package/lua/lua-table.patch

diff --git a/CHANGES b/CHANGES
index 1a9629d..e574c90 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,7 +14,7 @@
 
 	Updated/fixed packages: alsa-utils, busybox, dnsmasq, dosfstools,
 	e2fsprogs, eeprog, fbv, freetype, hostapd, iperf, iptables, iw, less,
-	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
+	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, lua, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
 	samba, setserial, squashfs, tslib, usb_modeswith, wget,
@@ -34,6 +34,7 @@
 	#513: Add new squid package
 	#661: lmbench: new package
 	#800: [PATCH] iperf update to 2.0.4
+	#803: [PATCH] lua - add shared library patch and config option for...
 	#805: [PATCH] mdadm - version update
 	#817: integrator926_defconfig uses unsupported uboot board name
 	#851: Add option to specify --sysroot value for external toolchain
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 95108cd..56eba35 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,8 +1,34 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
-	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_NCURSES
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
 	  http://www.lua.org/
+
+config BR2_PACKAGE_LUA_COMPILER
+	bool "lua compiler"
+	depends on BR2_PACKAGE_LUA
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
+	help
+	  Install luac binary
+
+config BR2_PACKAGE_LUA_INTERPRETER
+	bool "lua interpreter"
+	depends on BR2_PACKAGE_LUA
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
+	help
+	  Install lua binary
+
+config BR2_PACKAGE_LUA_INTERPRETER_READLINE
+	bool "readline support"
+	depends on BR2_PACKAGE_LUA_INTERPRETER
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_NCURSES
+	help
+	  Enables command-line editing in the lua interpreter.
+
+config BR2_PACKAGE_LUA_SHARED_LIBRARY
+	bool "shared library"
+	depends on BR2_PACKAGE_LUA
+	help
+	  Install shared liblua.so
diff --git a/package/lua/lua-boolean_expression.patch b/package/lua/lua-boolean_expression.patch
new file mode 100644
index 0000000..f04eb85
--- /dev/null
+++ b/package/lua/lua-boolean_expression.patch
@@ -0,0 +1,48 @@
+--- lua-5.1.4.orig/src/lcode.c	2007/12/28 15:32:23	2.25.1.3
++++ lua-5.1.4/src/lcode.c	2009/06/15 14:07:34
+@@ -544,15 +544,18 @@
+       pc = NO_JUMP;  /* always true; do nothing */
+       break;
+     }
+-    case VFALSE: {
+-      pc = luaK_jump(fs);  /* always jump */
+-      break;
+-    }
+     case VJMP: {
+       invertjump(fs, e);
+       pc = e->u.s.info;
+       break;
+     }
++    case VFALSE: {
++      if (!hasjumps(e)) {
++        pc = luaK_jump(fs);  /* always jump */
++        break;
++      }
++      /* else go through */
++    }
+     default: {
+       pc = jumponcond(fs, e, 0);
+       break;
+@@ -572,14 +575,17 @@
+       pc = NO_JUMP;  /* always false; do nothing */
+       break;
+     }
+-    case VTRUE: {
+-      pc = luaK_jump(fs);  /* always jump */
+-      break;
+-    }
+     case VJMP: {
+       pc = e->u.s.info;
+       break;
+     }
++    case VTRUE: {
++      if (!hasjumps(e)) {
++        pc = luaK_jump(fs);  /* always jump */
++        break;
++      }
++      /* else go through */
++    }
+     default: {
+       pc = jumponcond(fs, e, 1);
+       break;
+
diff --git a/package/lua/lua-debug_getfenv.patch b/package/lua/lua-debug_getfenv.patch
new file mode 100644
index 0000000..fce4d47
--- /dev/null
+++ b/package/lua/lua-debug_getfenv.patch
@@ -0,0 +1,10 @@
+--- lua-5.1.4.orig/src/ldblib.c	2007/12/28 15:32:23	2.63.1.3
++++ lua-5.1.4/src/ldblib.c	2010/02/23 12:36:59
+@@ -45,6 +45,7 @@
+ 
+ 
+ static int db_getfenv (lua_State *L) {
++  luaL_checkany(L, 1);
+   lua_getfenv(L, 1);
+   return 1;
+ }
diff --git a/package/lua/lua-gc_performance.patch b/package/lua/lua-gc_performance.patch
new file mode 100644
index 0000000..3c78525
--- /dev/null
+++ b/package/lua/lua-gc_performance.patch
@@ -0,0 +1,14 @@
+--- lua-5.1.4.orig/src/llex.c	2007/12/28 15:32:23	2.63.1.3
++++ lua-5.1.4/src/llex.c	2010/02/23 12:36:59
+@@ -118,8 +118,10 @@
+   lua_State *L = ls->L;
+   TString *ts = luaS_newlstr(L, str, l);
+   TValue *o = luaH_setstr(L, ls->fs->h, ts);  /* entry for `str' */
+-  if (ttisnil(o))
++  if (ttisnil(o)) {
+     setbvalue(o, 1);  /* make sure `str' will not be collected */
++    luaC_checkGC(L);
++  }
+   return ts;
+ }
+ 
diff --git a/package/lua/lua-root-path.patch b/package/lua/lua-root-path.patch
new file mode 100644
index 0000000..a00b99e
--- /dev/null
+++ b/package/lua/lua-root-path.patch
@@ -0,0 +1,17 @@
+diff -Naur lua-5.1.4.org/src/luaconf.h lua-5.1.4/src/luaconf.h
+--- lua-5.1.4.org/src/luaconf.h	2008-02-11 17:25:08.000000000 +0100
++++ lua-5.1.4/src/luaconf.h	2009-11-24 23:19:15.052817379 +0100
+@@ -94,9 +94,9 @@
+ 	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
+ 
+ #else
+-#define LUA_ROOT	"/usr/local/"
+-#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
+-#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
++#define LUA_ROOT	"/usr/"
++#define LUA_LDIR	LUA_ROOT "share/lua/"
++#define LUA_CDIR	LUA_ROOT "lib/lua/"
+ #define LUA_PATH_DEFAULT  \
+ 		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" \
+ 		            LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"
+
diff --git a/package/lua/lua-shared-libs.patch b/package/lua/lua-shared-libs.patch
new file mode 100644
index 0000000..d24015c
--- /dev/null
+++ b/package/lua/lua-shared-libs.patch
@@ -0,0 +1,145 @@
+diff -Naur lua-5.1.4.org/Makefile lua-5.1.4/Makefile
+--- lua-5.1.4.org/Makefile	2009-11-24 23:49:28.232820455 +0100
++++ lua-5.1.4/Makefile	2009-11-24 23:50:35.452817115 +0100
+@@ -43,7 +43,7 @@
+ # What to install.
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
+-TO_LIB= liblua.a
++TO_LIB= liblua.a liblua.so.$R
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -63,6 +63,7 @@
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
++	ln -sf liblua.so.$R $(INSTALL_LIB)/liblua.so
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+ 
+ ranlib:
+diff -Naur lua-5.1.4.org/src/ldo.h lua-5.1.4/src/ldo.h
+--- lua-5.1.4.org/src/ldo.h	2009-11-24 23:49:28.232820455 +0100
++++ lua-5.1.4/src/ldo.h	2009-11-24 23:49:54.244818140 +0100
+@@ -46,7 +46,7 @@
+ LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
+ LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
+ LUAI_FUNC void luaD_reallocstack (lua_State *L, int newsize);
+-LUAI_FUNC void luaD_growstack (lua_State *L, int n);
++LUA_API void luaD_growstack (lua_State *L, int n);
+ 
+ LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
+ LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
+diff -Naur lua-5.1.4.org/src/lfunc.h lua-5.1.4/src/lfunc.h
+--- lua-5.1.4.org/src/lfunc.h	2009-11-24 23:49:28.236815431 +0100
++++ lua-5.1.4/src/lfunc.h	2009-11-24 23:49:54.244818140 +0100
+@@ -18,7 +18,7 @@
+                          cast(int, sizeof(TValue *)*((n)-1)))
+ 
+ 
+-LUAI_FUNC Proto *luaF_newproto (lua_State *L);
++LUA_API Proto *luaF_newproto (lua_State *L);
+ LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
+ LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
+ LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
+diff -Naur lua-5.1.4.org/src/lmem.h lua-5.1.4/src/lmem.h
+--- lua-5.1.4.org/src/lmem.h	2009-11-24 23:49:28.236815431 +0100
++++ lua-5.1.4/src/lmem.h	2009-11-24 23:49:54.244818140 +0100
+@@ -38,9 +38,9 @@
+    ((v)=cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))
+ 
+ 
+-LUAI_FUNC void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
++LUA_API void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
+                                                           size_t size);
+-LUAI_FUNC void *luaM_toobig (lua_State *L);
++LUA_API void *luaM_toobig (lua_State *L);
+ LUAI_FUNC void *luaM_growaux_ (lua_State *L, void *block, int *size,
+                                size_t size_elem, int limit,
+                                const char *errormsg);
+diff -Naur lua-5.1.4.org/src/lstring.h lua-5.1.4/src/lstring.h
+--- lua-5.1.4.org/src/lstring.h	2009-11-24 23:49:28.236815431 +0100
++++ lua-5.1.4/src/lstring.h	2009-11-24 23:49:54.244818140 +0100
+@@ -25,7 +25,7 @@
+ 
+ LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
+ LUAI_FUNC Udata *luaS_newudata (lua_State *L, size_t s, Table *e);
+-LUAI_FUNC TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
++LUA_API TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
+ 
+ 
+ #endif
+diff -Naur lua-5.1.4.org/src/lundump.h lua-5.1.4/src/lundump.h
+--- lua-5.1.4.org/src/lundump.h	2009-11-24 23:49:28.232820455 +0100
++++ lua-5.1.4/src/lundump.h	2009-11-24 23:49:54.244818140 +0100
+@@ -17,7 +17,7 @@
+ LUAI_FUNC void luaU_header (char* h);
+ 
+ /* dump one chunk; from ldump.c */
+-LUAI_FUNC int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
++LUA_API int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
+ 
+ #ifdef luac_c
+ /* print one chunk; from print.c */
+diff -Naur lua-5.1.4.org/src/Makefile lua-5.1.4/src/Makefile
+--- lua-5.1.4.org/src/Makefile	2009-11-24 23:49:28.236815431 +0100
++++ lua-5.1.4/src/Makefile	2009-11-24 23:49:54.244818140 +0100
+@@ -23,6 +23,7 @@
+ PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO= liblua.so
+ CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
+ 	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
+ 	lundump.o lvm.o lzio.o
+@@ -33,11 +34,12 @@
+ LUA_O=	lua.o
+ 
+ LUAC_T=	luac
+-LUAC_O=	luac.o print.o
++LUAC_O=	luac.o print.o lopcodes.o
+ 
+ ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
+-ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
+ ALL_A= $(LUA_A)
++ALL_SO= $(LUA_SO)
+ 
+ default: $(PLAT)
+ 
+@@ -47,14 +49,23 @@
+ 
+ a:	$(ALL_A)
+ 
++so:	$(ALL_SO)
++
+ $(LUA_A): $(CORE_O) $(LIB_O)
+ 	$(AR) $@ $?
+ 	$(RANLIB) $@
+ 
+-$(LUA_T): $(LUA_O) $(LUA_A)
+-	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++$(LUA_SO): $(CORE_O) $(LIB_O)
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? -nostdlib -lgcc
++	ln -fs $@.$(PKG_VERSION) $@
++
++$(LUA_T): $(LUA_O) $(LUA_SO)
++	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
++
++$(LUAC_T): $(LUAC_O) $(LUA_SO)
++	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUAC_O) $(LIBS)
+ 
+-$(LUAC_T): $(LUAC_O) $(LUA_A)
++$(LUAC_T)-host: $(LUAC_O) $(LUA_A)
+ 	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
+ 
+ clean:
+@@ -96,7 +107,7 @@
+ 	$(MAKE) all MYCFLAGS=
+ 
+ linux:
+-	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
++	$(MAKE) all MYCFLAGS+=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
+ 
+ macosx:
+ 	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-lreadline"
diff --git a/package/lua/lua-table.patch b/package/lua/lua-table.patch
new file mode 100644
index 0000000..9ffc1bb
--- /dev/null
+++ b/package/lua/lua-table.patch
@@ -0,0 +1,22 @@
+--- lua-5.1.4.orig/src/lvm.c	2007/12/28 15:32:23	2.63.1.3
++++ lua-5.1.4/src/lvm.c	2009/07/01 20:36:59
+@@ -133,6 +133,7 @@
+ 
+ void luaV_settable (lua_State *L, const TValue *t, TValue *key, StkId val) {
+   int loop;
++  TValue temp;
+   for (loop = 0; loop < MAXTAGLOOP; loop++) {
+     const TValue *tm;
+     if (ttistable(t)) {  /* `t' is a table? */
+@@ -152,7 +153,9 @@
+       callTM(L, tm, t, key, val);
+       return;
+     }
+-    t = tm;  /* else repeat with `tm' */ 
++    /* else repeat with `tm' */
++    setobj(L, &temp, tm);  /* avoid pointing inside table (may rehash) */
++    t = &temp;
+   }
+   luaG_runerror(L, "loop in settable");
+ }
+
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aeb6c82..9b23021 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,78 +4,119 @@
 #
 #############################################################
 
-LUA_VERSION=5.1.4
+LUA_VERSION = 5.1.4
+LUA_SITE = http://www.lua.org/ftp
+LUA_INSTALL_STAGING = YES
 
-LUA_SOURCE=lua-$(LUA_VERSION).tar.gz
-LUA_CAT:=$(ZCAT)
-LUA_SITE=http://www.lua.org/ftp
-
-LUA_DIR=$(BUILD_DIR)/lua-$(LUA_VERSION)
-
-LUA_CFLAGS=-DLUA_USE_LINUX
-LUA_MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
-
-$(DL_DIR)/$(LUA_SOURCE):
-	$(call DOWNLOAD,$(LUA_SITE),$(LUA_SOURCE))
-
-$(LUA_DIR)/.unpacked: $(DL_DIR)/$(LUA_SOURCE)
-	$(LUA_CAT) $(DL_DIR)/$(LUA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LUA_DIR)/.unpacked
-
-$(LUA_DIR)/src/lua: $(LUA_DIR)/.unpacked
-	rm -f $@
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		MYCFLAGS=$(LUA_CFLAGS) \
-		MYLIBS=$(LUA_MYLIBS) \
-		AR="$(TARGET_CROSS)ar rcu" \
-		-C $(LUA_DIR)/src all
-
-$(LUA_DIR)/src/luac: $(LUA_DIR)/src/lua
-
-$(LUA_DIR)/src/liblua.a: $(LUA_DIR)/src/lua
-
-$(STAGING_DIR)/usr/lib/liblua.a: $(LUA_DIR)/src/liblua.a
-	cp -dpf $(LUA_DIR)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
-
-$(STAGING_DIR)/usr/bin/lua: $(LUA_DIR)/src/lua
-	cp -dpf $(LUA_DIR)/src/lua $(STAGING_DIR)/usr/bin/lua
-
-$(STAGING_DIR)/usr/bin/luac: $(LUA_DIR)/src/luac
-	cp -dpf $(LUA_DIR)/src/luac $(STAGING_DIR)/usr/bin/luac
-
-$(TARGET_DIR)/usr/lib/liblua.a: $(STAGING_DIR)/usr/lib/liblua.a
-	cp -dpf $(STAGING_DIR)/usr/lib/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-
-$(TARGET_DIR)/usr/bin/lua: $(STAGING_DIR)/usr/bin/lua
-	cp -dpf $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/lua
-
-$(TARGET_DIR)/usr/bin/luac: $(STAGING_DIR)/usr/bin/luac
-	cp -dpf $(STAGING_DIR)/usr/bin/luac $(TARGET_DIR)/usr/bin/luac
-
-
-lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
+ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
+	LUA_MYCFLAGS += -fPIC -DLUA_USE_DLOPEN
+	LUA_MYLIBS += -ldl
+endif
 
-lua-libs: $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/liblua.a)
+ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
+	LUA_DEPENDENCIES = readline ncurses
+	LUA_MYLIBS += -lreadline -lhistory -lncurses
+	LUA_MYCFLAGS += -DLUA_USE_LINUX
+else
+	LUA_MYCFLAGS += -DLUA_USE_POSIX
+endif
 
-lua: readline ncurses lua-bins lua-libs
+define LUA_BUILD_CMDS
+	sed -i -e 's/-O2//' $(@D)/src/Makefile
+	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) MYCFLAGS="$(LUA_MYCFLAGS)" \
+	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
+	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
+endef
+
+ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
+define LUA_INSTALL_STAGING_SHARED_LIB
+	$(INSTALL) -D $(@D)/src/liblua.so.$(LUA_VERSION) \
+		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
+	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
+endef
+endif
 
-lua-source: $(DL_DIR)/$(LUA_SOURCE)
+define LUA_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig
+	$(INSTALL) $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib
+	$(INSTALL) $(@D)/src/lua $(STAGING_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/luac $(STAGING_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/lua.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lualib.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include
+endef
+
+ifeq ($(BR2_PACKAGE_LUA_INTERPRETER),y)
+define LUA_INSTALL_INTERPRETER
+	$(INSTALL) $(@D)/src/lua $(TARGET_DIR)/usr/bin
+endef
+endif
 
-lua-clean:
-	rm -f $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(STAGING_DIR)/usr/lib/liblua.a
-	rm -f $(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(TARGET_DIR)/usr/lib/liblua.a
-	-$(MAKE) -C $(LUA_DIR) clean
+ifeq ($(BR2_PACKAGE_LUA_COMPILER),y)
+define LUA_INSTALL_COMPILER
+	$(INSTALL) $(@D)/src/luac $(TARGET_DIR)/usr/bin
+endef
+endif
 
-lua-dirclean:
-	rm -rf $(LUA_DIR)
+ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
+define LUA_INSTALL_LIBRARY
+	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
+		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
+	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
+	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+endef
+else
+define LUA_INSTALL_LIBRARY
+	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+endef
+endif
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LUA),y)
-TARGETS+=lua
+ifeq ($(BR2_HAVE_DEVFILES),y)
+define LUA_INSTALL_DEVFILES
+	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
+		$(TARGET_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) $(@D)/src/lua.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/luaconf.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lualib.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lauxlib.h $(TARGET_DIR)/usr/include
+endef
 endif
+
+define LUA_INSTALL_TARGET_CMDS
+	$(LUA_INSTALL_INTERPRETER)
+	$(LUA_INSTALL_COMPILER)
+	$(LUA_INSTALL_LIBRARY)
+	$(LUA_INSTALL_DEVFILES)
+endef
+
+LUA_INSTALLED_FILES = \
+	/usr/include/lua.h \
+	/usr/include/luaconf.h \
+	/usr/include/lualib.h \
+	/usr/include/lauxlib.h \
+	/usr/lib/pkgconfig/lua.pc \
+	/usr/bin/lua \
+	/usr/bin/luac \
+	/usr/lib/liblua.a \
+	/usr/lib/liblua.so*
+
+define LUA_UNINSTALL_STAGING_CMDS
+	for i in $(LUA_INSTALLED_FILES); do \
+		rm -f $(STAGING_DIR)$$i; \
+	done
+endef
+
+define LUA_UNINSTALL_TARGET_CMDS
+	for i in $(LUA_INSTALLED_FILES); do \
+		rm -f $(TARGET_DIR)$$i; \
+	done
+endef
+
+define LUA_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,lua))
-- 
1.6.3.3
