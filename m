From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:55 -0000
Subject: [Buildroot] [git commit branch/next] lua: split and rename patches
Message-ID: <20120802195254.ACD8E8EE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c7e9c50e9bef1c494ef90411a466ad320846b96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...{lua-root-path.patch => lua-01-root-path.patch} |    2 +
 package/lua/lua-02-shared-libs-for-lua.patch       |   49 ++++++++++++
 ...ibs.patch => lua-03-shared-libs-for-luac.patch} |   83 ++++----------------
 3 files changed, 66 insertions(+), 68 deletions(-)

diff --git a/package/lua/lua-root-path.patch b/package/lua/lua-01-root-path.patch
similarity index 93%
rename from package/lua/lua-root-path.patch
rename to package/lua/lua-01-root-path.patch
index c31cb2c..c5dbf32 100644
--- a/package/lua/lua-root-path.patch
+++ b/package/lua/lua-01-root-path.patch
@@ -1,3 +1,5 @@
+Adjust installation location to /usr.
+
 Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/lua-02-shared-libs-for-lua.patch
new file mode 100644
index 0000000..afe2ac8
--- /dev/null
+++ b/package/lua/lua-02-shared-libs-for-lua.patch
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
+@@ -23,6 +23,7 @@
+ PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
+ 
+ LUA_A=	liblua.a
++LUA_SO=	liblua.so
+ CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
+ 	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
+ 	lundump.o lvm.o lzio.o
+@@ -36,8 +37,9 @@
+ LUAC_O=	luac.o print.o
+ 
+ ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
+-ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
++ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
+ ALL_A= $(LUA_A)
++ALL_SO= $(LUA_SO)
+ 
+ default: $(PLAT)
+ 
+@@ -47,12 +49,18 @@
+ 
+ a:	$(ALL_A)
+ 
++so:	$(ALL_SO)
++
+ $(LUA_A): $(CORE_O) $(LIB_O)
+ 	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
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
+ 
+ $(LUAC_T): $(LUAC_O) $(LUA_A)
+ 	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/lua-shared-libs.patch b/package/lua/lua-03-shared-libs-for-luac.patch
similarity index 59%
rename from package/lua/lua-shared-libs.patch
rename to package/lua/lua-03-shared-libs-for-luac.patch
index 6bca7f2..ebe5337 100644
--- a/package/lua/lua-shared-libs.patch
+++ b/package/lua/lua-03-shared-libs-for-luac.patch
@@ -1,24 +1,8 @@
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -43,7 +43,7 @@
- # What to install.
- TO_BIN= lua luac
- TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
--TO_LIB= liblua.a
-+TO_LIB= liblua.a liblua.so.$R
- TO_MAN= lua.1 luac.1
- 
- # Lua version and release.
-@@ -63,6 +63,7 @@
- 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
- 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
- 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
-+	ln -sf liblua.so.$R $(INSTALL_LIB)/liblua.so
- 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
- 
- ranlib:
+Compile the luac binary with the shared library.
+Many internal functions (LUAI_FUNC) must be exported (LUA_API).
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
 Index: b/src/ldo.h
 ===================================================================
 --- a/src/ldo.h
@@ -91,15 +75,7 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -23,6 +23,7 @@
- PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
- 
- LUA_A=	liblua.a
-+LUA_SO= liblua.so
- CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
- 	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
- 	lundump.o lvm.o lzio.o
-@@ -33,11 +34,12 @@
+@@ -34,7 +34,7 @@
  LUA_O=	lua.o
  
  LUAC_T=	luac
@@ -107,44 +83,15 @@ Index: b/src/Makefile
 +LUAC_O=	luac.o print.o lopcodes.o
  
  ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
--ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
-+ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
- ALL_A= $(LUA_A)
-+ALL_SO= $(LUA_SO)
- 
- default: $(PLAT)
- 
-@@ -47,14 +49,23 @@
+ ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
+@@ -62,8 +62,8 @@
+ $(LUA_T): $(LUA_O) $(LUA_SO)
+ 	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
  
- a:	$(ALL_A)
- 
-+so:	$(ALL_SO)
-+
- $(LUA_A): $(CORE_O) $(LIB_O)
- 	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
- 	$(RANLIB) $@
- 
-+$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? -nostdlib -lgcc
-+	ln -fs $@.$(PKG_VERSION) $@
-+
- $(LUA_T): $(LUA_O) $(LUA_A)
--	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
-+	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
- 
- $(LUAC_T): $(LUAC_O) $(LUA_A)
-+	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
-+
-+$(LUAC_T)-host: $(LUAC_O) $(LUA_A)
- 	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
+-$(LUAC_T): $(LUAC_O) $(LUA_A)
+-	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
++$(LUAC_T): $(LUAC_O) $(LUA_SO)
++	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUAC_O) $(LIBS)
  
  clean:
-@@ -96,7 +107,7 @@
- 	$(MAKE) all MYCFLAGS=
- 
- linux:
--	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
-+	$(MAKE) all MYCFLAGS+=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
- 
- macosx:
- 	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-lreadline"
+ 	$(RM) $(ALL_T) $(ALL_O)
