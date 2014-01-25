From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 25 Jan 2014 15:51:15 +0100
Subject: [Buildroot] [PATCH 2/2] lua: handles BR2_PREFER_STATIC_LIB
In-Reply-To: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
References: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1390661475-23218-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix compilation with Blackfin FLAT

see http://autobuild.buildroot.net/results/b41/b4146bf821d59f694546f6e3a341394cc8fa43ce/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |    2 +-
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   28 +++++++++++++-------
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   28 +++++++++++++-------
 package/lua/lua.mk                                 |   23 +++++++++++-----
 4 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 397cc11..85d3a15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -362,7 +362,7 @@ source "package/jimtcl/Config.in"
 source "package/lua/Config.in"
 source "package/luainterpreter/Config.in"
 source "package/luajit/Config.in"
-if BR2_PACKAGE_HAS_LUA_INTERPRETER
+if BR2_PACKAGE_HAS_LUA_INTERPRETER && !BR2_PREFER_STATIC_LIB
 menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
index 1227cbd..c087c73 100644
--- a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
@@ -1,6 +1,7 @@
 Add the compilation of a shared library.
 Compile the lua binary with the shared library.
 And install the shared library.
+The variable BUILDMODE allows to switch between static and dynamic mode.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
@@ -8,20 +9,23 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -43,7 +43,7 @@
+@@ -43,7 +43,11 @@
  # What to install.
  TO_BIN= lua luac
  TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
--TO_LIB= liblua.a
++ifneq (dynamic,$(BUILDMODE))
+ TO_LIB= liblua.a
++else
 +TO_LIB= liblua.a liblua.so.$(R)
++endif
  TO_MAN= lua.1 luac.1
  
  # Lua version and release.
-@@ -63,6 +63,7 @@
+@@ -63,6 +67,7 @@
  	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
  	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
  	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
-+	cd $(INSTALL_LIB) && ln -sf liblua.so.$(R) liblua.so
++	cd $(INSTALL_LIB) && test -f liblua.so.$(R) && ln -sf liblua.so.$(R) liblua.so || :
  	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
  
  ranlib:
@@ -37,18 +41,21 @@ Index: b/src/Makefile
  CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
  	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
  	lundump.o lvm.o lzio.o
-@@ -36,8 +37,9 @@
+@@ -36,8 +37,13 @@
  LUAC_O=	luac.o print.o
  
  ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
--ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++ifneq (dynamic,$(BUILDMODE))
+ ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++else
 +ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
++endif
  ALL_A= $(LUA_A)
 +ALL_SO= $(LUA_SO)
  
  default: $(PLAT)
  
-@@ -47,12 +49,18 @@
+@@ -47,12 +53,23 @@
  
  a:	$(ALL_A)
  
@@ -58,14 +65,17 @@ Index: b/src/Makefile
  	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
  	$(RANLIB) $@
  
--$(LUA_T): $(LUA_O) $(LUA_A)
--	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
 +$(LUA_SO): $(CORE_O) $(LIB_O)
 +	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
 +	ln -fs $@.$(PKG_VERSION) $@
 +
++ifneq (dynamic,$(BUILDMODE))
+ $(LUA_T): $(LUA_O) $(LUA_A)
+ 	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++else
 +$(LUA_T): $(LUA_O) $(LUA_SO)
 +	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUA_O) -llua $(LIBS)
++endif
  
  $(LUAC_T): $(LUAC_O) $(LUA_A)
  	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
index 9321c62..e92db77 100644
--- a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
@@ -1,6 +1,7 @@
 Add the compilation of a shared library.
 Compile the lua binary with the shared library.
 And install the shared library.
+The variable BUILDMODE allows to switch between static and dynamic mode.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
@@ -8,20 +9,23 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -41,7 +41,7 @@
+@@ -41,7 +41,11 @@
  # What to install.
  TO_BIN= lua luac
  TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
--TO_LIB= liblua.a
++ifneq (dynamic,$(BUILDMODE))
+ TO_LIB= liblua.a
++else
 +TO_LIB= liblua.a liblua.so.$(R)
++endif
  TO_MAN= lua.1 luac.1
  
  # Lua version and release.
-@@ -62,6 +62,7 @@
+@@ -62,6 +66,7 @@
  	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
  	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
  	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
-+	cd $(INSTALL_LIB) && ln -sf liblua.so.$(R) liblua.so
++	cd $(INSTALL_LIB) && test -f liblua.so.$(R) && ln -sf liblua.so.$(R) liblua.so || :
  	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
  
  uninstall:
@@ -37,18 +41,21 @@ Index: b/src/Makefile
  CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
  	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
  	ltm.o lundump.o lvm.o lzio.o
-@@ -43,8 +44,9 @@
+@@ -43,8 +44,13 @@
  LUAC_O=	luac.o
  
  ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
--ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++ifneq (dynamic,$(BUILDMODE))
+ ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++else
 +ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
++endif
  ALL_A= $(LUA_A)
 +ALL_SO= $(LUA_SO)
  
  # Targets start here.
  default: $(PLAT)
-@@ -55,12 +57,18 @@
+@@ -55,12 +61,23 @@
  
  a:	$(ALL_A)
  
@@ -58,14 +65,17 @@ Index: b/src/Makefile
  	$(AR) $@ $(BASE_O)
  	$(RANLIB) $@
  
--$(LUA_T): $(LUA_O) $(LUA_A)
--	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
 +$(LUA_SO): $(CORE_O) $(LIB_O)
 +	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
 +	ln -fs $@.$(PKG_VERSION) $@
 +
++ifneq (dynamic,$(BUILDMODE))
+ $(LUA_T): $(LUA_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
++else
 +$(LUA_T): $(LUA_O) $(LUA_SO)
 +	$(CC) -o $@ -L. $(LDFLAGS) $(LUA_O) -llua $(LIBS)
++endif
  
  $(LUAC_T): $(LUAC_O) $(LUA_A)
  	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index c016d7e..41296d9 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -15,7 +15,6 @@ LUA_LICENSE = MIT
 LUA_LICENSE_FILES = COPYRIGHT
 
 LUA_CFLAGS = -Wall -fPIC
-LUA_MYLIBS += -ldl
 
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_CFLAGS += -DLUA_COMPAT_ALL
@@ -24,17 +23,25 @@ LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 endif
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	LUA_BUILDMODE = static
+else
+	LUA_BUILDMODE = dynamic
+	LUA_CFLAGS += -DLUA_USE_DLOPEN
+	LUA_MYLIBS += -ldl
+endif
+
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_LINENOISE),y)
 	LUA_DEPENDENCIES = linenoise
 	LUA_MYLIBS += -llinenoise
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_LINENOISE
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_LINENOISE
 else
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
+	LUA_CFLAGS += -DLUA_USE_POSIX
 endif
 endif
 
@@ -53,6 +60,7 @@ define LUA_BUILD_CMDS
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
 	CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
 	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
+	BUILDMODE=$(LUA_BUILDMODE) \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
@@ -61,21 +69,22 @@ define HOST_LUA_BUILD_CMDS
 	CFLAGS="$(HOST_LUA_CFLAGS)" \
 	MYLDFLAGS="$(HOST_LDFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
+	BUILDMODE=static \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
 define LUA_INSTALL_STAGING_CMDS
-	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" BUILDMODE=$(LUA_BUILDMODE) -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
-	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" BUILDMODE=$(LUA_BUILDMODE) -C $(@D) install
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" BUILDMODE=static -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
 endef
-- 
1.7.9.5
