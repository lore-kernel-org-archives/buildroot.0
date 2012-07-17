From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Jul 2012 10:18:27 +0200
Subject: [Buildroot] [PATCH 1/2] lua: split and rename patches v2
Message-ID: <1342513108-27075-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lua/lua-01-root-path.patch            |   19 ++++
 package/lua/lua-02-shared-libs-for-lua.patch  |   49 ++++++++
 package/lua/lua-03-shared-libs-for-luac.patch |   97 ++++++++++++++++
 package/lua/lua-root-path.patch               |   17 ---
 package/lua/lua-shared-libs.patch             |  150 -------------------------
 5 files changed, 165 insertions(+), 167 deletions(-)
 create mode 100644 package/lua/lua-01-root-path.patch
 create mode 100644 package/lua/lua-02-shared-libs-for-lua.patch
 create mode 100644 package/lua/lua-03-shared-libs-for-luac.patch
 delete mode 100644 package/lua/lua-root-path.patch
 delete mode 100644 package/lua/lua-shared-libs.patch

diff --git a/package/lua/lua-01-root-path.patch b/package/lua/lua-01-root-path.patch
new file mode 100644
index 0000000..c5dbf32
--- /dev/null
+++ b/package/lua/lua-01-root-path.patch
@@ -0,0 +1,19 @@
+Adjust installation location to /usr.
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
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
diff --git a/package/lua/lua-03-shared-libs-for-luac.patch b/package/lua/lua-03-shared-libs-for-luac.patch
new file mode 100644
index 0000000..ebe5337
--- /dev/null
+++ b/package/lua/lua-03-shared-libs-for-luac.patch
@@ -0,0 +1,97 @@
+Compile the luac binary with the shared library.
+Many internal functions (LUAI_FUNC) must be exported (LUA_API).
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/ldo.h
+===================================================================
+--- a/src/ldo.h
++++ b/src/ldo.h
+@@ -46,7 +46,7 @@
+ LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
+ LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
+ LUAI_FUNC void luaD_reallocstack (lua_State *L, int newsize);
+-LUAI_FUNC void luaD_growstack (lua_State *L, int n);
++LUA_API void luaD_growstack (lua_State *L, int n);
+ 
+ LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
+ LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
+Index: b/src/lfunc.h
+===================================================================
+--- a/src/lfunc.h
++++ b/src/lfunc.h
+@@ -18,7 +18,7 @@
+                          cast(int, sizeof(TValue *)*((n)-1)))
+ 
+ 
+-LUAI_FUNC Proto *luaF_newproto (lua_State *L);
++LUA_API Proto *luaF_newproto (lua_State *L);
+ LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
+ LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
+ LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
+Index: b/src/lmem.h
+===================================================================
+--- a/src/lmem.h
++++ b/src/lmem.h
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
+Index: b/src/lstring.h
+===================================================================
+--- a/src/lstring.h
++++ b/src/lstring.h
+@@ -25,7 +25,7 @@
+ 
+ LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
+ LUAI_FUNC Udata *luaS_newudata (lua_State *L, size_t s, Table *e);
+-LUAI_FUNC TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
++LUA_API TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
+ 
+ 
+ #endif
+Index: b/src/lundump.h
+===================================================================
+--- a/src/lundump.h
++++ b/src/lundump.h
+@@ -17,7 +17,7 @@
+ LUAI_FUNC void luaU_header (char* h);
+ 
+ /* dump one chunk; from ldump.c */
+-LUAI_FUNC int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
++LUA_API int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
+ 
+ #ifdef luac_c
+ /* print one chunk; from print.c */
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -34,7 +34,7 @@
+ LUA_O=	lua.o
+ 
+ LUAC_T=	luac
+-LUAC_O=	luac.o print.o
++LUAC_O=	luac.o print.o lopcodes.o
+ 
+ ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
+ ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
+@@ -62,8 +62,8 @@
+ $(LUA_T): $(LUA_O) $(LUA_SO)
+ 	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
+ 
+-$(LUAC_T): $(LUAC_O) $(LUA_A)
+-	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
++$(LUAC_T): $(LUAC_O) $(LUA_SO)
++	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUAC_O) $(LIBS)
+ 
+ clean:
+ 	$(RM) $(ALL_T) $(ALL_O)
diff --git a/package/lua/lua-root-path.patch b/package/lua/lua-root-path.patch
deleted file mode 100644
index c31cb2c..0000000
--- a/package/lua/lua-root-path.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: b/src/luaconf.h
-===================================================================
---- a/src/luaconf.h
-+++ b/src/luaconf.h
-@@ -94,9 +94,9 @@
- 	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
- 
- #else
--#define LUA_ROOT	"/usr/local/"
--#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
--#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
-+#define LUA_ROOT	"/usr/"
-+#define LUA_LDIR	LUA_ROOT "share/lua/"
-+#define LUA_CDIR	LUA_ROOT "lib/lua/"
- #define LUA_PATH_DEFAULT  \
- 		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" \
- 		            LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"
diff --git a/package/lua/lua-shared-libs.patch b/package/lua/lua-shared-libs.patch
deleted file mode 100644
index 6bca7f2..0000000
--- a/package/lua/lua-shared-libs.patch
+++ /dev/null
@@ -1,150 +0,0 @@
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
-Index: b/src/ldo.h
-===================================================================
---- a/src/ldo.h
-+++ b/src/ldo.h
-@@ -46,7 +46,7 @@
- LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
- LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
- LUAI_FUNC void luaD_reallocstack (lua_State *L, int newsize);
--LUAI_FUNC void luaD_growstack (lua_State *L, int n);
-+LUA_API void luaD_growstack (lua_State *L, int n);
- 
- LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
- LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
-Index: b/src/lfunc.h
-===================================================================
---- a/src/lfunc.h
-+++ b/src/lfunc.h
-@@ -18,7 +18,7 @@
-                          cast(int, sizeof(TValue *)*((n)-1)))
- 
- 
--LUAI_FUNC Proto *luaF_newproto (lua_State *L);
-+LUA_API Proto *luaF_newproto (lua_State *L);
- LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
- LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
- LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
-Index: b/src/lmem.h
-===================================================================
---- a/src/lmem.h
-+++ b/src/lmem.h
-@@ -38,9 +38,9 @@
-    ((v)=cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))
- 
- 
--LUAI_FUNC void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
-+LUA_API void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
-                                                           size_t size);
--LUAI_FUNC void *luaM_toobig (lua_State *L);
-+LUA_API void *luaM_toobig (lua_State *L);
- LUAI_FUNC void *luaM_growaux_ (lua_State *L, void *block, int *size,
-                                size_t size_elem, int limit,
-                                const char *errormsg);
-Index: b/src/lstring.h
-===================================================================
---- a/src/lstring.h
-+++ b/src/lstring.h
-@@ -25,7 +25,7 @@
- 
- LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
- LUAI_FUNC Udata *luaS_newudata (lua_State *L, size_t s, Table *e);
--LUAI_FUNC TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
-+LUA_API TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
- 
- 
- #endif
-Index: b/src/lundump.h
-===================================================================
---- a/src/lundump.h
-+++ b/src/lundump.h
-@@ -17,7 +17,7 @@
- LUAI_FUNC void luaU_header (char* h);
- 
- /* dump one chunk; from ldump.c */
--LUAI_FUNC int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
-+LUA_API int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
- 
- #ifdef luac_c
- /* print one chunk; from print.c */
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -23,6 +23,7 @@
- PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
- 
- LUA_A=	liblua.a
-+LUA_SO= liblua.so
- CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
- 	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
- 	lundump.o lvm.o lzio.o
-@@ -33,11 +34,12 @@
- LUA_O=	lua.o
- 
- LUAC_T=	luac
--LUAC_O=	luac.o print.o
-+LUAC_O=	luac.o print.o lopcodes.o
- 
- ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
--ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
-+ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
- ALL_A= $(LUA_A)
-+ALL_SO= $(LUA_SO)
- 
- default: $(PLAT)
- 
-@@ -47,14 +49,23 @@
- 
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
- 
- clean:
-@@ -96,7 +107,7 @@
- 	$(MAKE) all MYCFLAGS=
- 
- linux:
--	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
-+	$(MAKE) all MYCFLAGS+=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
- 
- macosx:
- 	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-lreadline"
-- 
1.7.9.5
