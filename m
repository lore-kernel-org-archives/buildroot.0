From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 15:52:41 +0100
Subject: [Buildroot] [git commit] lua: add 5.3.x serie
Message-ID: <20150202152923.F2710800AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b3dc5c37093b79a3f68855462414617e3ebc002
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.3.0/0001-root-path.patch           |   17 +++++
 package/lua/5.3.0/0002-shared-libs-for-lua.patch |   78 ++++++++++++++++++++++
 package/lua/5.3.0/0004-lua-pc.patch              |   40 +++++++++++
 package/lua/5.3.0/0011-linenoise.patch           |   26 +++++++
 package/lua/Config.in                            |    4 +
 package/lua/lua.mk                               |   15 ++++-
 package/luarocks/luarocks.mk                     |    6 ++-
 7 files changed, 182 insertions(+), 4 deletions(-)

diff --git a/package/lua/5.3.0/0001-root-path.patch b/package/lua/5.3.0/0001-root-path.patch
new file mode 100644
index 0000000..660bc15
--- /dev/null
+++ b/package/lua/5.3.0/0001-root-path.patch
@@ -0,0 +1,17 @@
+Adjust installation location to /usr.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -175,7 +175,7 @@
+
+ #else			/* }{ */
+
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR "/"
+ #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR "/"
+ #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.3.0/0002-shared-libs-for-lua.patch b/package/lua/5.3.0/0002-shared-libs-for-lua.patch
new file mode 100644
index 0000000..493828c
--- /dev/null
+++ b/package/lua/5.3.0/0002-shared-libs-for-lua.patch
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
+@@ -60,6 +61,8 @@
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
+@@ -29,6 +29,7 @@
+ PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO=	liblua.so
+ CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
+ 	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
+ 	ltm.o lundump.o lvm.o lzio.o
+@@ -43,8 +44,13 @@
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
+@@ -55,12 +61,23 @@
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
diff --git a/package/lua/5.3.0/0004-lua-pc.patch b/package/lua/5.3.0/0004-lua-pc.patch
new file mode 100644
index 0000000..d3129d7
--- /dev/null
+++ b/package/lua/5.3.0/0004-lua-pc.patch
@@ -0,0 +1,40 @@
+add lua.pc
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/etc/lua.pc
+===================================================================
+--- /dev/null
++++ b/etc/lua.pc
+@@ -0,0 +1,31 @@
++# lua.pc -- pkg-config data for Lua
++
++# vars from install Makefile
++
++# grep '^V=' ../Makefile
++V= 5.3
++# grep '^R=' ../Makefile
++R= 5.3.0
++
++# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
++prefix= /usr
++INSTALL_BIN= ${prefix}/bin
++INSTALL_INC= ${prefix}/include
++INSTALL_LIB= ${prefix}/lib
++INSTALL_MAN= ${prefix}/man/man1
++INSTALL_LMOD= ${prefix}/share/lua/${V}
++INSTALL_CMOD= ${prefix}/lib/lua/${V}
++
++# canonical vars
++exec_prefix=${prefix}
++libdir=${exec_prefix}/lib
++includedir=${prefix}/include
++
++Name: Lua
++Description: An Extensible Extension Language
++Version: ${R}
++Requires: 
++Libs: -L${libdir} -llua -lm
++Cflags: -I${includedir}
++
++# (end of lua.pc)
diff --git a/package/lua/5.3.0/0011-linenoise.patch b/package/lua/5.3.0/0011-linenoise.patch
new file mode 100644
index 0000000..b2e5695
--- /dev/null
+++ b/package/lua/5.3.0/0011-linenoise.patch
@@ -0,0 +1,26 @@
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
+@@ -85,6 +85,15 @@
+           add_history(lua_tostring(L, idx));  /* add it to history */
+ #define lua_freeline(L,b)	((void)L, free(b))
+
++#elif defined(LUA_USE_LINENOISE)
++
++#include <linenoise.h>
++#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
++#define lua_saveline(L,idx) \
++	if (lua_rawlen(L,idx) > 0)  /* non-empty line? */ \
++	  linenoiseHistoryAdd(lua_tostring(L, idx));  /* add it to history */
++#define lua_freeline(L,b)	((void)L, free(b))
++
+ #else				/* }{ */
+
+ #define lua_readline(L,b,p) \
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 0e31858..dde999f 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -23,11 +23,15 @@ choice
 	config BR2_PACKAGE_LUA_5_2
 		bool "Lua 5.2.x"
 
+	config BR2_PACKAGE_LUA_5_3
+		bool "Lua 5.3.x"
+
 endchoice
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"	if BR2_PACKAGE_LUA_5_1
 	default "5.2"	if BR2_PACKAGE_LUA_5_2
+	default "5.3"	if BR2_PACKAGE_LUA_5_3
 
 choice
 	prompt "Lua command-line editing"
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index f1164ec..0e30186 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+LUA_VERSION = 5.3.0
+else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.3
 else
 LUA_VERSION = 5.1.5
 endif
+endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
@@ -23,10 +27,11 @@ LUA_PROVIDES = luainterpreter
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
 
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-LUA_CFLAGS += -DLUA_COMPAT_ALL
-ifneq ($(BR2_LARGEFILE),y)
-LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
+	LUA_CFLAGS += -DLUA_COMPAT_ALL
 endif
+
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+	LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -49,6 +54,10 @@ ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
 endif
 endif
 
+ifneq ($(BR2_LARGEFILE),y)
+	LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
+endif
+
 # We never want to have host-readline and host-ncurses as dependencies
 # of host-lua.
 HOST_LUA_DEPENDENCIES =
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 44bd520..40fdc91 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -13,6 +13,10 @@ HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
 LUAROCKS_CONFIG_DIR = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+	LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
+endif
 
 HOST_LUAROCKS_CONF_OPTS = \
 	--prefix=$(HOST_DIR)/usr \
@@ -37,7 +41,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
-	echo "   CFLAGS = [[$(TARGET_CFLAGS) -fPIC]],"          >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CFLAGS = [[$(LUAROCKS_CFLAGS)]],"              >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
