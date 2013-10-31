From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2013 11:16:09 +0100
Subject: [Buildroot] [pkg-luarocks infra 2/5] lua: remove too invasive patch
In-Reply-To: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
References: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1383214572-8216-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the static version of luac is enough

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua-03-shared-libs-for-luac.patch |   97 -------------------------
 1 file changed, 97 deletions(-)
 delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch

diff --git a/package/lua/lua-03-shared-libs-for-luac.patch b/package/lua/lua-03-shared-libs-for-luac.patch
deleted file mode 100644
index 33f9183..0000000
--- a/package/lua/lua-03-shared-libs-for-luac.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-Compile the luac binary with the shared library.
-Many internal functions (LUAI_FUNC) must be exported (LUA_API).
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
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
-@@ -34,7 +34,7 @@
- LUA_O=	lua.o
- 
- LUAC_T=	luac
--LUAC_O=	luac.o print.o
-+LUAC_O=	luac.o print.o lopcodes.o
- 
- ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
- ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
-@@ -62,8 +62,8 @@
- $(LUA_T): $(LUA_O) $(LUA_SO)
- 	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
- 
--$(LUAC_T): $(LUAC_O) $(LUA_A)
--	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
-+$(LUAC_T): $(LUAC_O) $(LUA_SO)
-+	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUAC_O) -llua $(LIBS)
- 
- clean:
- 	$(RM) $(ALL_T) $(ALL_O)
-- 
1.7.9.5
