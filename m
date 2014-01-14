From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Jan 2014 14:14:56 +0100
Subject: [Buildroot] [PATCH 1/3] lua: choice between 5.1.x & 5.2.x
In-Reply-To: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
References: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389705298-27263-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/{ => 5.1.5}/lua-01-root-path.patch     |    0
 .../{ => 5.1.5}/lua-02-shared-libs-for-lua.patch   |    0
 package/lua/{ => 5.1.5}/lua-11-linenoise.patch     |    0
 package/lua/5.2.3/lua-01-root-path.patch           |   17 +++++++
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   49 ++++++++++++++++++++
 package/lua/5.2.3/lua-04-lua-pc.patch              |   40 ++++++++++++++++
 package/lua/5.2.3/lua-11-linenoise.patch           |   26 +++++++++++
 package/lua/Config.in                              |   14 ++++++
 package/lua/lua.mk                                 |   18 ++++++-
 package/luainterpreter/Config.in                   |   10 ++++
 10 files changed, 172 insertions(+), 2 deletions(-)
 rename package/lua/{ => 5.1.5}/lua-01-root-path.patch (100%)
 rename package/lua/{ => 5.1.5}/lua-02-shared-libs-for-lua.patch (100%)
 rename package/lua/{ => 5.1.5}/lua-11-linenoise.patch (100%)
 create mode 100644 package/lua/5.2.3/lua-01-root-path.patch
 create mode 100644 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
 create mode 100644 package/lua/5.2.3/lua-04-lua-pc.patch
 create mode 100644 package/lua/5.2.3/lua-11-linenoise.patch

diff --git a/package/lua/lua-01-root-path.patch b/package/lua/5.1.5/lua-01-root-path.patch
similarity index 100%
rename from package/lua/lua-01-root-path.patch
rename to package/lua/5.1.5/lua-01-root-path.patch
diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/lua-02-shared-libs-for-lua.patch
rename to package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
diff --git a/package/lua/lua-11-linenoise.patch b/package/lua/5.1.5/lua-11-linenoise.patch
similarity index 100%
rename from package/lua/lua-11-linenoise.patch
rename to package/lua/5.1.5/lua-11-linenoise.patch
diff --git a/package/lua/5.2.3/lua-01-root-path.patch b/package/lua/5.2.3/lua-01-root-path.patch
new file mode 100644
index 0000000..c6f242c
--- /dev/null
+++ b/package/lua/5.2.3/lua-01-root-path.patch
@@ -0,0 +1,17 @@
+Adjust installation location to /usr.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -100,7 +100,7 @@
+ #else			/* }{ */
+ 
+ #define LUA_VDIR	LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR
+ #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR
+ #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
new file mode 100644
index 0000000..4679325
--- /dev/null
+++ b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
@@ -0,0 +1,49 @@
+Add the compilation of a shared library.
+Compile the lua binary with the shared library.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -29,6 +29,7 @@
+ PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO=	liblua.so
+ CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
+ 	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
+ 	ltm.o lundump.o lvm.o lzio.o
+@@ -43,8 +44,9 @@
+ LUAC_O=	luac.o
+ 
+ ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
+-ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
+ ALL_A= $(LUA_A)
++ALL_SO= $(LUA_SO)
+ 
+ # Targets start here.
+ default: $(PLAT)
+@@ -55,12 +57,18 @@
+ 
+ a:	$(ALL_A)
+ 
++so:	$(ALL_SO)
++
+ $(LUA_A): $(BASE_O)
+ 	$(AR) $@ $(BASE_O)
+ 	$(RANLIB) $@
+ 
+-$(LUA_T): $(LUA_O) $(LUA_A)
+-	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++$(LUA_SO): $(CORE_O) $(LIB_O)
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	ln -fs $@.$(PKG_VERSION) $@
++
++$(LUA_T): $(LUA_O) $(LUA_SO)
++	$(CC) -o $@ -L. $(LDFLAGS) $(LUA_O) -llua $(LIBS)
+ 
+ $(LUAC_T): $(LUAC_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/5.2.3/lua-04-lua-pc.patch b/package/lua/5.2.3/lua-04-lua-pc.patch
new file mode 100644
index 0000000..62acb20
--- /dev/null
+++ b/package/lua/5.2.3/lua-04-lua-pc.patch
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
++V= 5.2
++# grep '^R=' ../Makefile
++R= 5.2.3
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
diff --git a/package/lua/5.2.3/lua-11-linenoise.patch b/package/lua/5.2.3/lua-11-linenoise.patch
new file mode 100644
index 0000000..b1f228c
--- /dev/null
+++ b/package/lua/5.2.3/lua-11-linenoise.patch
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
+@@ -72,6 +72,15 @@
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
+ #elif !defined(lua_readline)
+ 
+ #define lua_readline(L,b,p) \
diff --git a/package/lua/Config.in b/package/lua/Config.in
index b96ef0e..9b8b6f1 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -12,6 +12,20 @@ config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
 	default "lua"
 
 choice
+	prompt "Lua Version"
+	default BR2_PACKAGE_LUA_5_1
+	help
+	  Select the version of Lua API/ABI you wish to use.
+
+	config BR2_PACKAGE_LUA_5_1
+		bool "Lua 5.1.x"
+
+	config BR2_PACKAGE_LUA_5_2
+		bool "Lua 5.2.x"
+
+endchoice
+
+choice
 	prompt "Lua Interpreter command-line editing"
 	default BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index a88a11e..97e5ea8 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
+LUA_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUA_VERSION))
+ifeq ($(LUA_ABIVER),5.1)
 LUA_VERSION = 5.1.5
+else
+LUA_VERSION = 5.2.3
+endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
@@ -13,6 +18,14 @@ LUA_LICENSE_FILES = COPYRIGHT
 LUA_CFLAGS = -Wall -fPIC
 LUA_MYLIBS += -ldl
 
+ifneq ($(BR2_LARGEFILE),y)
+LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
+endif
+
+ifeq ($(LUA_ABIVER),5.2)
+LUA_CFLAGS += -DLUA_COMPAT_ALL
+endif
+
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
@@ -30,7 +43,7 @@ endif
 # We never want to have host-readline and host-ncurses as dependencies
 # of host-lua.
 HOST_LUA_DEPENDENCIES =
-HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX -DLUA_COMPAT_ALL
 HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
@@ -70,7 +83,8 @@ define LUA_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUA_ABIVER)
+	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUA_ABIVER)
 endef
 
 define HOST_LUA_INSTALL_CMDS
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index 1562145..3bc257e 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -4,3 +4,13 @@ config BR2_PACKAGE_HAS_LUA_INTERPRETER
 config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
 	string
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+
+config BR2_PACKAGE_LUA_VERSION
+	string
+	default "5.1"	if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	default "5.2"	if BR2_PACKAGE_LUA_5_2
+
+config BR2_PACKAGE_LUA_VERSION_NUM
+	int
+	default 501	if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	default 502	if BR2_PACKAGE_LUA_5_2
-- 
1.7.9.5
