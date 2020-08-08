From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:25:51 +0200
Subject: [Buildroot] [git commit branch/next] package/lua: add 5.4.0 version
Message-ID: <20200808162412.25562814FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5ea243b56aa88b011fe423adde6e682b2423e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua/5.4.0/0001-root-path.patch           | 17 ++++++
 package/lua/5.4.0/0002-shared-libs-for-lua.patch | 78 ++++++++++++++++++++++++
 package/lua/5.4.0/0011-linenoise.patch           | 25 ++++++++
 package/lua/Config.in                            |  6 +-
 package/lua/lua.hash                             |  3 +
 package/lua/lua.mk                               | 10 ++-
 package/luainterpreter/Config.in                 |  4 ++
 package/pkg-luarocks.mk                          |  3 +
 8 files changed, 142 insertions(+), 4 deletions(-)

diff --git a/package/lua/5.4.0/0001-root-path.patch b/package/lua/5.4.0/0001-root-path.patch
new file mode 100644
index 0000000000..588fecb12d
--- /dev/null
+++ b/package/lua/5.4.0/0001-root-path.patch
@@ -0,0 +1,17 @@
+Adjust installation location to /usr.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -227,7 +227,7 @@
+ 
+ #else			/* }{ */
+ 
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR "/"
+ #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR "/"
+ 
diff --git a/package/lua/5.4.0/0002-shared-libs-for-lua.patch b/package/lua/5.4.0/0002-shared-libs-for-lua.patch
new file mode 100644
index 0000000000..4ff2044298
--- /dev/null
+++ b/package/lua/5.4.0/0002-shared-libs-for-lua.patch
@@ -0,0 +1,78 @@
+Add the compilation of a shared library.
+Compile the lua binary with the shared library.
+And install the shared library.
+The variable BUILDMODE allows to switch between static and dynamic mode.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -42,6 +42,7 @@
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
+ TO_LIB= liblua.a
++TO_SOLIB = liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -57,6 +58,8 @@
+ install: dummy
+ 	cd src && $(MKDIR) $(INSTALL_BIN) $(INSTALL_INC) $(INSTALL_LIB) $(INSTALL_MAN) $(INSTALL_LMOD) $(INSTALL_CMOD)
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
++	test -f src/$(TO_SOLIB) && cd src && $(INSTALL_EXEC) $(TO_SOLIB) $(INSTALL_LIB) || :
++	test -f src/$(TO_SOLIB) && ln -sf $(TO_SOLIB) $(INSTALL_LIB)/liblua.so || :
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -33,6 +33,7 @@
+ PLATS= guess aix bsd c89 freebsd generic linux linux-readline macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO=	liblua.so
+ CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o
+ LIB_O=	lauxlib.o lbaselib.o lcorolib.o ldblib.o liolib.o lmathlib.o loadlib.o loslib.o lstrlib.o ltablib.o lutf8lib.o linit.o
+ BASE_O= $(CORE_O) $(LIB_O) $(MYOBJS)
+@@ -44,8 +45,13 @@
+ LUAC_O=	luac.o
+ 
+ ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
++ifneq (dynamic,$(BUILDMODE))
+ ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++else
++ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
++endif
+ ALL_A= $(LUA_A)
++ALL_SO= $(LUA_SO)
+ 
+ # Targets start here.
+ default: $(PLAT)
+@@ -56,12 +62,23 @@
+ 
+ a:	$(ALL_A)
+ 
++so:	$(ALL_SO)
++
+ $(LUA_A): $(BASE_O)
+ 	$(AR) $@ $(BASE_O)
+ 	$(RANLIB) $@
+ 
++$(LUA_SO): $(CORE_O) $(LIB_O)
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	ln -fs $@.$(PKG_VERSION) $@
++
++ifneq (dynamic,$(BUILDMODE))
+ $(LUA_T): $(LUA_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++else
++$(LUA_T): $(LUA_O) $(LUA_SO)
++	$(CC) -o $@ -L. $(LDFLAGS) $(LUA_O) -llua $(LIBS)
++endif
+ 
+ $(LUAC_T): $(LUAC_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/5.4.0/0011-linenoise.patch b/package/lua/5.4.0/0011-linenoise.patch
new file mode 100644
index 0000000000..e842e5b1ef
--- /dev/null
+++ b/package/lua/5.4.0/0011-linenoise.patch
@@ -0,0 +1,25 @@
+Add support of linenoise (replace readline)
+
+see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/lua.c
+===================================================================
+--- a/src/lua.c
++++ b/src/lua.c
+@@ -401,6 +401,14 @@
+ #define lua_saveline(L,line)	((void)L, add_history(line))
+ #define lua_freeline(L,b)	((void)L, free(b))
+ 
++#elif defined(LUA_USE_LINENOISE)
++
++#include <linenoise.h>
++#define lua_initreadline(L)	((void)L)
++#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
++#define lua_saveline(L,line)	((void)L, linenoiseHistoryAdd(line))
++#define lua_freeline(L,b)	((void)L, free(b))
++
+ #else				/* }{ */
+ 
+ #define lua_initreadline(L)  ((void)L)
diff --git a/package/lua/Config.in b/package/lua/Config.in
index d6ddc708e7..5d4cee5d5b 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -26,9 +26,13 @@ config BR2_PACKAGE_LUA_5_3
 	bool "Lua 5.3.x"
 	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 
+config BR2_PACKAGE_LUA_5_4
+	bool "Lua 5.4.x"
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_4
+
 endchoice
 
-if BR2_PACKAGE_LUA_5_3
+if BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
 config BR2_PACKAGE_LUA_32BITS
 	bool "Use 32 bit numbers"
 	default y if !BR2_ARCH_IS_64
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 3e7812b7dc..ab72480e55 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,4 +1,7 @@
 # Hashes from: http://www.lua.org/ftp/
+md5 dbf155764e5d433fc55ae80ea7060b60           lua-5.4.0.tar.gz
+sha1 8cdbffa8a214a23d190d7c45f38c19518ae62e89  lua-5.4.0.tar.gz
+
 md5 4f4b4f323fd3514a68e0ab3da8ce3455           lua-5.3.5.tar.gz
 sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ce75af6b02..ee604b6121 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+LUA_VERSION = 5.4.0
+else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.5
 else
 LUA_VERSION = 5.1.5
@@ -12,7 +14,7 @@ endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_LICENSE_FILES = doc/readme.html
 else
 LUA_LICENSE_FILES = COPYRIGHT
@@ -22,7 +24,9 @@ LUA_PROVIDES = luainterpreter
 
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+LUA_CFLAGS += -DLUA_COMPAT_5_3
+else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index d35b35ff31..873fb345b9 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
 	default "5.1" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	default "5.3" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
+	default "5.4" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_4
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	bool
@@ -16,6 +17,9 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 	bool
 
+config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_4
+	bool
+
 config BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER
 	string
 	default "host-lua"
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 603c0851b4..81a6cf208a 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -23,6 +23,9 @@ HOST_LUAROCKS_CFLAGS = $(HOST_CFLAGS) -fPIC
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 HOST_LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
+else ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+LUAROCKS_CFLAGS += -DLUA_COMPAT_5_3
+HOST_LUAROCKS_CFLAGS += -DLUA_COMPAT_5_3
 endif
 
 ################################################################################
