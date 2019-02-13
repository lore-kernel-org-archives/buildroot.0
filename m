From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 13 Feb 2019 23:08:11 +0100
Subject: [Buildroot] [PATCH] package/luvi: add patch to fix build issue with
 OpenSSL 1.1.1a
Message-ID: <20190213220812.29978-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the bundled lua-openssl version to 0.7.4 for compatibility with
OpenSSL 1.1.1a.

Note, that luvi 2.7.6 is the latest version providing a release tarball.

Runtime tested on Banana Pro, note that version string for lua-openssl
does not match the tag name (0.7.4):

```
luvi v2.7.6
zlib: 1.2.11
libuv: 1.25.0
ssl: OpenSSL 1.1.1a  20 Nov 2018, lua-openssl 0.7.3
```

Fixes:
http://autobuild.buildroot.net/results/e87994a3dc987f5aa101a5e721ac927e21453373
http://autobuild.buildroot.net/results/ea725ad90cfcd3c5e242268a593dcabd7297fe70
http://autobuild.buildroot.net/results/f2fb9eea0044e4a5f674742d29ea95af49cf5a45
http://autobuild.buildroot.net/results/de4daa1b930f907f06640dc98a708016217ddea5
.. and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...bundled-lua-openssl-to-version-0.7.4.patch | 31718 ++++++++++++++++
 1 file changed, 31718 insertions(+)
 create mode 100644 package/luvi/0003-Bump-bundled-lua-openssl-to-version-0.7.4.patch

diff --git a/package/luvi/0003-Bump-bundled-lua-openssl-to-version-0.7.4.patch b/package/luvi/0003-Bump-bundled-lua-openssl-to-version-0.7.4.patch
new file mode 100644
index 0000000000..339b3f759a
--- /dev/null
+++ b/package/luvi/0003-Bump-bundled-lua-openssl-to-version-0.7.4.patch
@@ -0,0 +1,31718 @@
+Bump bundled lua-openssl to version 0.7.4 for compatibility with OpenSSL 1.1.x.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/appveyor.yml luvi-src-v2.7.6/deps/lua-openssl/appveyor.yml
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/appveyor.yml	2019-02-13 11:31:40.277302045 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/appveyor.yml	2019-02-13 11:53:24.105128513 +0100
+@@ -9,7 +9,7 @@ install:
+ - git submodule update --recursive
+ - '"C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86'
+ - cd C:\
+-- ps: Start-FileDownload 'https://github.com/zhaozg/openssl-win32/blob/1.0.2/misc/luv.dll?raw=true' 'C:\luv.dll'
++#- ps: Start-FileDownload 'https://github.com/zhaozg/openssl-win32/blob/1.0.2/misc/luv.dll?raw=true' -FileName 'C:\luv.dll'
+ #- git clone https://github.com/zhaozg/openssl-win32.git C:\openssl-win32
+ - git clone http://luajit.org/git/luajit-2.0.git C:\luajit-2.0
+ build_script:
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/auxiliar.c luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/auxiliar.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/auxiliar.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/auxiliar.c	2019-02-13 11:53:29.051738872 +0100
+@@ -7,6 +7,10 @@
+ 
+ #include "auxiliar.h"
+ 
++#if LUA_VERSION_NUM<503
++#include "c-api/compat-5.3.h"
++#endif
++
+ /*=========================================================================*\
+ * Exported functions
+ \*=========================================================================*/
+@@ -143,7 +147,7 @@ void *auxiliar_getgroupudata(lua_State *
+ * otherwise
+ \*-------------------------------------------------------------------------*/
+ void *auxiliar_getclassudata(lua_State *L, const char *classname, int objidx) {
+-    return luaL_checkudata(L, objidx, classname);
++    return luaL_testudata(L, objidx, classname);
+ }
+ 
+ /*-------------------------------------------------------------------------*\
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/readme.md luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/readme.md
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/readme.md	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/readme.md	2019-02-13 11:53:29.051738872 +0100
+@@ -0,0 +1,65 @@
++# lua-auxiliar
++
++## Introduce
++
++The origin auxiliar is part of [luasocket](https://github.com/diegonehab/luasocket), it's a general purpose class implemention lib for userdata with metatable.
++
++```
++/*=========================================================================*\
++* Auxiliar routines for class hierarchy manipulation
++* LuaSocket toolkit (but completely independent of other LuaSocket modules)
++*
++* A LuaSocket class is a name associated with Lua metatables. A LuaSocket
++* group is a name associated with a class. A class can belong to any number
++* of groups. This module provides the functionality to:
++*
++*   - create new classes
++*   - add classes to groups
++*   - set the class of objects
++*   - check if an object belongs to a given class or group
++*   - get the userdata associated to objects
++*   - print objects in a pretty way
++*
++* LuaSocket class names follow the convention <module>{<class>}. Modules
++* can define any number of classes and groups. The module tcp.c, for
++* example, defines the classes tcp{master}, tcp{client} and tcp{server} and
++* the groups tcp{client,server} and tcp{any}. Module functions can then
++* perform type-checking on their arguments by either class or group.
++*
++* LuaSocket metatables define the __index metamethod as being a table. This
++* table has one field for each method supported by the class, and a field
++* "class" with the class name.
++*
++* The mapping from class name to the corresponding metatable and the
++* reverse mapping are done using lauxlib.
++\*=========================================================================*/
++```
++
++## Update
++
++I do minimual change, and add a few APIs for [lui](https://github.com/zhaozg/lui) and [lua-openssl](https://github.com/zhaozg/lua-openssl).
++TODO more
++
++## License
++```text
++LuaSocket 3.0 license
++Copyright ? 2004-2018 Diego Nehab
++
++Permission is hereby granted, free of charge, to any person obtaining a
++copy of this software and associated documentation files (the "Software"),
++to deal in the Software without restriction, including without limitation
++the rights to use, copy, modify, merge, publish, distribute, sublicense,
++and/or sell copies of the Software, and to permit persons to whom the
++Software is furnished to do so, subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in
++all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++DEALINGS IN THE SOFTWARE.
++```
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/subsidiar.c luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/subsidiar.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/subsidiar.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/subsidiar.c	2019-02-13 11:53:29.051738872 +0100
+@@ -0,0 +1,22 @@
++#include "auxiliar.h"
++#include "subsidiar.h"
++
++int auxiliar_enumerate(lua_State *L, int tidx, const LuaL_Enumeration *lenums)
++{
++  int n = tidx < 0 ? tidx-2 : tidx;
++  const LuaL_Enumeration *e = lenums;
++  while( e->name!=NULL ) 
++  {
++    lua_pushstring(L, e->name);
++    lua_pushinteger(L, e->val);
++    lua_rawset(L, n);
++    e++;
++  }
++  return 1;
++}
++
++int auxiliar_checkoption(lua_State*L, int objidx, const char* def, const char* const slist[], const int ival[])
++{
++  int at = luaL_checkoption(L, objidx, def, slist);
++  return ival[at];
++}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/subsidiar.h luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/subsidiar.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/auxiliar/subsidiar.h	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/auxiliar/subsidiar.h	2019-02-13 11:53:29.051738872 +0100
+@@ -0,0 +1,51 @@
++#ifndef SUBSIDIAR_H
++#define SUBSIDIAR_H
++
++#include "lua.h"
++#include "lauxlib.h"
++
++/* subsidiary part for auxiliar libirary */
++
++#define AUXILIAR_SET(L, tidx, lvar, cval, ltype)    \
++  do {                                              \
++  int n = tidx < 0 ? tidx-1 : tidx;                 \
++  lua_push##ltype(L, (cval));                       \
++  lua_setfield(L, n, lvar);                         \
++  } while(0)
++
++#define AUXLIAR_GET(L, tidx, lvar, cvar, ltype)     \
++  do {                                              \
++  lua_getfield(L, tidx, lvar);                      \
++  cvar = lua_to##ltype(L, -1);                      \
++  lua_pop(L, 1);                                    \
++  } while(0)
++
++#define AUXILIAR_SETLSTR(L, tidx, lvar, cval, len)  \
++  do {                                              \
++  int n = tidx < 0 ? tidx-1 : tidx;                 \
++  lua_pushlstring(L, (const char*)(cval),len);      \
++  lua_setfield(L, n, lvar);                         \
++  } while(0)
++
++#define AUXILIAR_GETLSTR(L, tidx, lvar, cvar, len)  \
++  do {                                              \
++  lua_getfield(L, tidx, lvar);                      \
++  cvar = lua_tolstring(L, -1, &len);                \
++  lua_setfield(L, n, lvar);                         \
++  } while(0)
++
++typedef struct
++{
++  const char* name;
++  int val;
++} LuaL_Enumeration;
++
++int auxiliar_enumerate(lua_State *L, int tidx, const LuaL_Enumeration *lenum);
++int auxiliar_checkoption(lua_State*L, 
++                         int objidx,
++                         const char *def, 
++                         const char *const slist[],
++                         const int ival[]);
++
++#endif
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.c luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.c	2019-02-13 11:53:29.078405237 +0100
+@@ -3,6 +3,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <errno.h>
++#include <stdio.h>
+ #include "compat-5.3.h"
+ 
+ /* don't compile it again if it already is included via compat53.h */
+@@ -14,6 +15,75 @@
+ /* definitions for Lua 5.1 only */
+ #if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM == 501
+ 
++#ifndef COMPAT53_FOPEN_NO_LOCK
++#  if defined(_MSC_VER)
++#    define COMPAT53_FOPEN_NO_LOCK 1
++#  else /* otherwise */
++#    define COMPAT53_FOPEN_NO_LOCK 0
++#  endif /* VC++ only so far */
++#endif /* No-lock fopen_s usage if possible */
++
++#if defined(_MSC_VER) && COMPAT53_FOPEN_NO_LOCK
++#  include <share.h>
++#endif /* VC++ _fsopen for share-allowed file read */
++
++#ifndef COMPAT53_HAVE_STRERROR_R
++#  if defined(__GLIBC__) || defined(_POSIX_VERSION) || defined(__APPLE__) || \
++      (!defined (__MINGW32__) && defined(__GNUC__) && (__GNUC__ < 6))
++#    define COMPAT53_HAVE_STRERROR_R 1
++#  else /* none of the defines matched: define to 0 */
++#    define COMPAT53_HAVE_STRERROR_R 0
++#  endif /* have strerror_r of some form */
++#endif /* strerror_r */
++
++#ifndef COMPAT53_HAVE_STRERROR_S
++#  if defined(_MSC_VER) || (defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L && \
++      defined(__STDC_LIB_EXT1__) && __STDC_LIB_EXT1__)
++#    define COMPAT53_HAVE_STRERROR_S 1
++#  else /* not VC++ or C11 */
++#    define COMPAT53_HAVE_STRERROR_S 0
++#  endif /* strerror_s from VC++ or C11 */
++#endif /* strerror_s */
++
++#ifndef COMPAT53_LUA_FILE_BUFFER_SIZE
++#  define COMPAT53_LUA_FILE_BUFFER_SIZE 4096
++#endif /* Lua File Buffer Size */
++
++
++static char* compat53_strerror (int en, char* buff, size_t sz) {
++#if COMPAT53_HAVE_STRERROR_R
++  /* use strerror_r here, because it's available on these specific platforms */
++  if (sz > 0) {
++    buff[0] = '\0';
++    /* we don't care whether the GNU version or the XSI version is used: */
++    if (strerror_r(en, buff, sz)) {
++      /* Yes, we really DO want to ignore the return value!
++       * GCC makes that extra hard, not even a (void) cast will do. */
++    }
++    if (buff[0] == '\0') {
++      /* Buffer is unchanged, so we probably have called GNU strerror_r which
++       * returned a static constant string. Chances are that strerror will
++       * return the same static constant string and therefore be thread-safe. */
++      return strerror(en);
++    }
++  }
++  return buff; /* sz is 0 *or* strerror_r wrote into the buffer */
++#elif COMPAT53_HAVE_STRERROR_S
++  /* for MSVC and other C11 implementations, use strerror_s since it's
++   * provided by default by the libraries */
++  strerror_s(buff, sz, en);
++  return buff;
++#else
++  /* fallback, but strerror is not guaranteed to be threadsafe due to modifying
++   * errno itself and some impls not locking a static buffer for it ... but most
++   * known systems have threadsafe errno: this might only change if the locale
++   * is changed out from under someone while this function is being called */
++  (void)buff;
++  (void)sz;
++  return strerror(en);
++#endif
++}
++
+ 
+ COMPAT53_API int lua_absindex (lua_State *L, int i) {
+   if (i < 0 && i > LUA_REGISTRYINDEX)
+@@ -100,15 +170,17 @@ COMPAT53_API void lua_copy (lua_State *L
+ 
+ COMPAT53_API void lua_len (lua_State *L, int i) {
+   switch (lua_type(L, i)) {
+-    case LUA_TSTRING: /* fall through */
++    case LUA_TSTRING:
++      lua_pushnumber(L, (lua_Number)lua_objlen(L, i));
++      break;
+     case LUA_TTABLE:
+       if (!luaL_callmeta(L, i, "__len"))
+-        lua_pushnumber(L, (int)lua_objlen(L, i));
++        lua_pushnumber(L, (lua_Number)lua_objlen(L, i));
+       break;
+     case LUA_TUSERDATA:
+       if (luaL_callmeta(L, i, "__len"))
+         break;
+-      /* maybe fall through */
++      /* FALLTHROUGH */
+     default:
+       luaL_error(L, "attempt to get length of a %s value",
+                  lua_typename(L, lua_type(L, i)));
+@@ -132,15 +204,6 @@ COMPAT53_API void lua_rawsetp (lua_State
+ }
+ 
+ 
+-COMPAT53_API lua_Integer lua_tointegerx (lua_State *L, int i, int *isnum) {
+-  lua_Integer n = lua_tointeger(L, i);
+-  if (isnum != NULL) {
+-    *isnum = (n != 0 || lua_isnumber(L, i));
+-}
+-  return n;
+-}
+-
+-
+ COMPAT53_API lua_Number lua_tonumberx (lua_State *L, int i, int *isnum) {
+   lua_Number n = lua_tonumber(L, i);
+   if (isnum != NULL) {
+@@ -183,14 +246,15 @@ COMPAT53_API int luaL_getsubtable (lua_S
+ }
+ 
+ 
+-COMPAT53_API int luaL_len (lua_State *L, int i) {
+-  int res = 0, isnum = 0;
++COMPAT53_API lua_Integer luaL_len (lua_State *L, int i) {
++  lua_Integer res = 0;
++  int isnum = 0;
+   luaL_checkstack(L, 1, "not enough stack slots");
+   lua_len(L, i);
+-  res = (int)lua_tointegerx(L, -1, &isnum);
++  res = lua_tointegerx(L, -1, &isnum);
+   lua_pop(L, 1);
+   if (!isnum)
+-    luaL_error(L, "object length is not a number");
++    luaL_error(L, "object length is not an integer");
+   return res;
+ }
+ 
+@@ -233,34 +297,6 @@ COMPAT53_API void *luaL_testudata (lua_S
+ }
+ 
+ 
+-COMPAT53_API const char *luaL_tolstring (lua_State *L, int idx, size_t *len) {
+-  if (!luaL_callmeta(L, idx, "__tostring")) {
+-    int t = lua_type(L, idx);
+-    switch (t) {
+-      case LUA_TNIL:
+-        lua_pushliteral(L, "nil");
+-        break;
+-      case LUA_TSTRING:
+-      case LUA_TNUMBER:
+-        lua_pushvalue(L, idx);
+-        break;
+-      case LUA_TBOOLEAN:
+-        if (lua_toboolean(L, idx))
+-          lua_pushliteral(L, "true");
+-        else
+-          lua_pushliteral(L, "false");
+-        break;
+-      default:
+-        lua_pushfstring(L, "%s: %p", lua_typename(L, t),
+-                                     lua_topointer(L, idx));
+-        break;
+-    }
+-  }
+-  return lua_tolstring(L, -1, len);
+-}
+-
+-
+-#if !defined(COMPAT53_IS_LUAJIT)
+ static int compat53_countlevels (lua_State *L) {
+   lua_Debug ar;
+   int li = 1, le = 1;
+@@ -361,26 +397,221 @@ COMPAT53_API void luaL_traceback (lua_St
+ 
+ 
+ COMPAT53_API int luaL_fileresult (lua_State *L, int stat, const char *fname) {
++  const char *serr = NULL;
+   int en = errno;  /* calls to Lua API may change this value */
++  char buf[512] = { 0 };
+   if (stat) {
+     lua_pushboolean(L, 1);
+     return 1;
+   }
+   else {
+     lua_pushnil(L);
++    serr = compat53_strerror(en, buf, sizeof(buf));
+     if (fname)
+-      lua_pushfstring(L, "%s: %s", fname, strerror(en));
++      lua_pushfstring(L, "%s: %s", fname, serr);
+     else
+-      lua_pushstring(L, strerror(en));
++      lua_pushstring(L, serr);
+     lua_pushnumber(L, (lua_Number)en);
+     return 3;
+   }
+ }
+ 
+ 
++static int compat53_checkmode (lua_State *L, const char *mode, const char *modename, int err) {
++  if (mode && strchr(mode, modename[0]) == NULL) {
++    lua_pushfstring(L, "attempt to load a %s chunk (mode is '%s')", modename, mode);
++    return err;
++  }
++  return LUA_OK;
++}
++
++
++typedef struct {
++  lua_Reader reader;
++  void *ud;
++  int has_peeked_data;
++  const char *peeked_data;
++  size_t peeked_data_size;
++} compat53_reader_data;
++
++
++static const char *compat53_reader (lua_State *L, void *ud, size_t *size) {
++  compat53_reader_data *data = (compat53_reader_data *)ud;
++  if (data->has_peeked_data) {
++    data->has_peeked_data = 0;
++    *size = data->peeked_data_size;
++    return data->peeked_data;
++  } else
++    return data->reader(L, data->ud, size);
++}
++
++
++COMPAT53_API int lua_load (lua_State *L, lua_Reader reader, void *data, const char *source, const char *mode) {
++  int status = LUA_OK;
++  compat53_reader_data compat53_data = { reader, data, 1, 0, 0 };
++  compat53_data.peeked_data = reader(L, data, &(compat53_data.peeked_data_size));
++  if (compat53_data.peeked_data && compat53_data.peeked_data_size &&
++      compat53_data.peeked_data[0] == LUA_SIGNATURE[0]) /* binary file? */
++      status = compat53_checkmode(L, mode, "binary", LUA_ERRSYNTAX);
++  else
++      status = compat53_checkmode(L, mode, "text", LUA_ERRSYNTAX);
++  if (status != LUA_OK)
++    return status;
++  /* we need to call the original 5.1 version of lua_load! */
++#undef lua_load
++  return lua_load(L, compat53_reader, &compat53_data, source);
++#define lua_load COMPAT53_CONCAT(COMPAT53_PREFIX, _load_53)
++}
++
++
++typedef struct {
++  int n;  /* number of pre-read characters */
++  FILE *f;  /* file being read */
++  char buff[COMPAT53_LUA_FILE_BUFFER_SIZE];  /* area for reading file */
++} compat53_LoadF;
++
++
++static const char *compat53_getF (lua_State *L, void *ud, size_t *size) {
++  compat53_LoadF *lf = (compat53_LoadF *)ud;
++  (void)L;  /* not used */
++  if (lf->n > 0) {  /* are there pre-read characters to be read? */
++    *size = lf->n;  /* return them (chars already in buffer) */
++    lf->n = 0;  /* no more pre-read characters */
++  }
++  else {  /* read a block from file */
++    /* 'fread' can return > 0 *and* set the EOF flag. If next call to
++       'compat53_getF' called 'fread', it might still wait for user input.
++       The next check avoids this problem. */
++    if (feof(lf->f)) return NULL;
++    *size = fread(lf->buff, 1, sizeof(lf->buff), lf->f);  /* read block */
++  }
++  return lf->buff;
++}
++
++
++static int compat53_errfile (lua_State *L, const char *what, int fnameindex) {
++  char buf[512] = {0};
++  const char *serr = compat53_strerror(errno, buf, sizeof(buf));
++  const char *filename = lua_tostring(L, fnameindex) + 1;
++  lua_pushfstring(L, "cannot %s %s: %s", what, filename, serr);
++  lua_remove(L, fnameindex);
++  return LUA_ERRFILE;
++}
++
++
++static int compat53_skipBOM (compat53_LoadF *lf) {
++  const char *p = "\xEF\xBB\xBF";  /* UTF-8 BOM mark */
++  int c;
++  lf->n = 0;
++  do {
++    c = getc(lf->f);
++    if (c == EOF || c != *(const unsigned char *)p++) return c;
++    lf->buff[lf->n++] = (char)c;  /* to be read by the parser */
++  } while (*p != '\0');
++  lf->n = 0;  /* prefix matched; discard it */
++  return getc(lf->f);  /* return next character */
++}
++
++
++/*
++** reads the first character of file 'f' and skips an optional BOM mark
++** in its beginning plus its first line if it starts with '#'. Returns
++** true if it skipped the first line.  In any case, '*cp' has the
++** first "valid" character of the file (after the optional BOM and
++** a first-line comment).
++*/
++static int compat53_skipcomment (compat53_LoadF *lf, int *cp) {
++  int c = *cp = compat53_skipBOM(lf);
++  if (c == '#') {  /* first line is a comment (Unix exec. file)? */
++    do {  /* skip first line */
++      c = getc(lf->f);
++    } while (c != EOF && c != '\n');
++    *cp = getc(lf->f);  /* skip end-of-line, if present */
++    return 1;  /* there was a comment */
++  }
++  else return 0;  /* no comment */
++}
++
++
++COMPAT53_API int luaL_loadfilex (lua_State *L, const char *filename, const char *mode) {
++  compat53_LoadF lf;
++  int status, readstatus;
++  int c;
++  int fnameindex = lua_gettop(L) + 1;  /* index of filename on the stack */
++  if (filename == NULL) {
++    lua_pushliteral(L, "=stdin");
++    lf.f = stdin;
++  }
++  else {
++    lua_pushfstring(L, "@%s", filename);
++#if defined(_MSC_VER)
++    /* This code is here to stop a deprecation error that stops builds
++     * if a certain macro is defined. While normally not caring would
++     * be best, some header-only libraries and builds can't afford to
++     * dictate this to the user. A quick check shows that fopen_s this
++     * goes back to VS 2005, and _fsopen goes back to VS 2003 .NET,
++     * possibly even before that so we don't need to do any version
++     * number checks, since this has been there since forever.  */
++
++    /* TO USER: if you want the behavior of typical fopen_s/fopen,
++     * which does lock the file on VC++, define the macro used below to 0 */
++#if COMPAT53_FOPEN_NO_LOCK
++    lf.f = _fsopen(filename, "r", _SH_DENYNO); /* do not lock the file in any way */
++    if (lf.f == NULL)
++      return compat53_errfile(L, "open", fnameindex);
++#else /* use default locking version */
++    if (fopen_s(&lf.f, filename, "r") != 0)
++      return compat53_errfile(L, "open", fnameindex);
++#endif /* Locking vs. No-locking fopen variants */
++#else
++    lf.f = fopen(filename, "r"); /* default stdlib doesn't forcefully lock files here */
++    if (lf.f == NULL) return compat53_errfile(L, "open", fnameindex);
++#endif
++  }
++  if (compat53_skipcomment(&lf, &c))  /* read initial portion */
++    lf.buff[lf.n++] = '\n';  /* add line to correct line numbers */
++  if (c == LUA_SIGNATURE[0] && filename) {  /* binary file? */
++#if defined(_MSC_VER)
++    if (freopen_s(&lf.f, filename, "rb", lf.f) != 0)
++      return compat53_errfile(L, "reopen", fnameindex);
++#else
++    lf.f = freopen(filename, "rb", lf.f);  /* reopen in binary mode */
++    if (lf.f == NULL) return compat53_errfile(L, "reopen", fnameindex);
++#endif
++    compat53_skipcomment(&lf, &c);  /* re-read initial portion */
++  }
++  if (c != EOF)
++    lf.buff[lf.n++] = (char)c;  /* 'c' is the first character of the stream */
++  status = lua_load(L, &compat53_getF, &lf, lua_tostring(L, -1), mode);
++  readstatus = ferror(lf.f);
++  if (filename) fclose(lf.f);  /* close file (even in case of errors) */
++  if (readstatus) {
++    lua_settop(L, fnameindex);  /* ignore results from 'lua_load' */
++    return compat53_errfile(L, "read", fnameindex);
++  }
++  lua_remove(L, fnameindex);
++  return status;
++}
++
++
++COMPAT53_API int luaL_loadbufferx (lua_State *L, const char *buff, size_t sz, const char *name, const char *mode) {
++  int status = LUA_OK;
++  if (sz > 0 && buff[0] == LUA_SIGNATURE[0]) {
++    status = compat53_checkmode(L, mode, "binary", LUA_ERRSYNTAX);
++  }
++  else {
++    status = compat53_checkmode(L, mode, "text", LUA_ERRSYNTAX);
++  }
++  if (status != LUA_OK)
++    return status;
++  return luaL_loadbuffer(L, buff, sz, name);
++}
++
++
+ #if !defined(l_inspectstat) && \
+     (defined(unix) || defined(__unix) || defined(__unix__) || \
+-     defined(__TOS_AIX__) || defined(_SYSTYPE_BSD))
++     defined(__TOS_AIX__) || defined(_SYSTYPE_BSD) || \
++     (defined(__APPLE__) && defined(__MACH__)))
+ /* some form of unix; check feature macros in unistd.h for details */
+ #  include <unistd.h>
+ /* check posix version; the relevant include files and macros probably
+@@ -414,7 +645,6 @@ COMPAT53_API int luaL_execresult (lua_St
+     return 3;
+   }
+ }
+-#endif /* not COMPAT53_IS_LUAJIT */
+ 
+ 
+ COMPAT53_API void luaL_buffinit (lua_State *L, luaL_Buffer_53 *B) {
+@@ -501,6 +731,22 @@ COMPAT53_API int lua_isinteger (lua_Stat
+ }
+ 
+ 
++COMPAT53_API lua_Integer lua_tointegerx (lua_State *L, int i, int *isnum) {
++  int ok = 0;
++  lua_Number n = lua_tonumberx(L, i, &ok);
++  if (ok) {
++    if (n == (lua_Integer)n) {
++      if (isnum)
++        *isnum = 1;
++      return (lua_Integer)n;
++    }
++  }
++  if (isnum)
++    *isnum = 0;
++  return 0;
++}
++
++
+ static void compat53_reverse (lua_State *L, int a, int b) {
+   for (; a < b; ++a, --b) {
+     lua_pushvalue(L, a);
+@@ -537,7 +783,7 @@ COMPAT53_API void lua_seti (lua_State *L
+ 
+ 
+ #if !defined(lua_str2number)
+-#  define lua_str2number(s, p)  strtod(s, p)
++#  define lua_str2number(s, p)  strtod((s), (p))
+ #endif
+ 
+ COMPAT53_API size_t lua_stringtonumber (lua_State *L, const char *s) {
+@@ -555,6 +801,40 @@ COMPAT53_API size_t lua_stringtonumber (
+ }
+ 
+ 
++COMPAT53_API const char *luaL_tolstring (lua_State *L, int idx, size_t *len) {
++  if (!luaL_callmeta(L, idx, "__tostring")) {
++    int t = lua_type(L, idx), tt = 0;
++    char const* name = NULL;
++    switch (t) {
++      case LUA_TNIL:
++        lua_pushliteral(L, "nil");
++        break;
++      case LUA_TSTRING:
++      case LUA_TNUMBER:
++        lua_pushvalue(L, idx);
++        break;
++      case LUA_TBOOLEAN:
++        if (lua_toboolean(L, idx))
++          lua_pushliteral(L, "true");
++        else
++          lua_pushliteral(L, "false");
++        break;
++      default:
++        tt = luaL_getmetafield(L, idx, "__name");
++        name = (tt == LUA_TSTRING) ? lua_tostring(L, -1) : lua_typename(L, t);
++        lua_pushfstring(L, "%s: %p", name, lua_topointer(L, idx));
++        if (tt != LUA_TNIL)
++          lua_replace(L, -2);
++        break;
++    }
++  } else {
++    if (!lua_isstring(L, -1))
++      luaL_error(L, "'__tostring' must return a string");
++  }
++  return lua_tolstring(L, -1, len);
++}
++
++
+ COMPAT53_API void luaL_requiref (lua_State *L, const char *modname,
+                                  lua_CFunction openf, int glb) {
+   luaL_checkstack(L, 3, "not enough stack slots available");
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.h luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.h	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/c-api/compat-5.3.h	2019-02-13 11:53:29.078405237 +0100
+@@ -4,16 +4,18 @@
+ #include <stddef.h>
+ #include <limits.h>
+ #include <string.h>
+-#if defined( __cplusplus ) && !defined( COMPAT53_LUA_CPP )
++#if defined(__cplusplus) && !defined(COMPAT53_LUA_CPP)
+ extern "C" {
+ #endif
+ #include <lua.h>
+ #include <lauxlib.h>
+-#if defined( __cplusplus ) && !defined( COMPAT53_LUA_CPP )
++#include <lualib.h>
++#if defined(__cplusplus) && !defined(COMPAT53_LUA_CPP)
+ }
+ #endif
+ 
+ 
++#undef COMPAT53_INCLUDE_SOURCE
+ #if defined(COMPAT53_PREFIX)
+ /* - change the symbol names of functions to avoid linker conflicts
+  * - compat-5.3.c needs to be compiled (and linked) separately
+@@ -21,13 +23,11 @@ extern "C" {
+ #  if !defined(COMPAT53_API)
+ #    define COMPAT53_API extern
+ #  endif
+-#  undef COMPAT53_INCLUDE_SOURCE
+ #else /* COMPAT53_PREFIX */
+ /* - make all functions static and include the source.
+- * - don't mess with the symbol names of functions
+  * - compat-5.3.c doesn't need to be compiled (and linked) separately
+  */
+-#  define COMPAT53_PREFIX lua
++#  define COMPAT53_PREFIX compat53
+ #  undef COMPAT53_API
+ #  if defined(__GNUC__) || defined(__clang__)
+ #    define COMPAT53_API __attribute__((__unused__)) static
+@@ -51,29 +51,54 @@ extern "C" {
+  * lua_upvaluejoin
+  * lua_version
+  * lua_yieldk
+- * luaL_loadbufferx
+- * luaL_loadfilex
+  */
+ 
+-/* PUC-Rio Lua uses lconfig_h as include guard for luaconf.h,
+- * LuaJIT uses luaconf_h. If you use PUC-Rio's include files
+- * but LuaJIT's library, you will need to define the macro
+- * COMPAT53_IS_LUAJIT yourself! */
+-#if !defined(COMPAT53_IS_LUAJIT) && defined(luaconf_h)
+-#  define COMPAT53_IS_LUAJIT
+-#endif
+-
+-#define LUA_OK 0
+-#define LUA_OPADD 0
+-#define LUA_OPSUB 1
+-#define LUA_OPMUL 2
+-#define LUA_OPDIV 3
+-#define LUA_OPMOD 4
+-#define LUA_OPPOW 5
+-#define LUA_OPUNM 6
+-#define LUA_OPEQ 0
+-#define LUA_OPLT 1
+-#define LUA_OPLE 2
++#ifndef LUA_OK
++#  define LUA_OK 0
++#endif
++#ifndef LUA_OPADD
++#  define LUA_OPADD 0
++#endif
++#ifndef LUA_OPSUB
++#  define LUA_OPSUB 1
++#endif
++#ifndef LUA_OPMUL
++#  define LUA_OPMUL 2
++#endif
++#ifndef LUA_OPDIV
++#  define LUA_OPDIV 3
++#endif
++#ifndef LUA_OPMOD
++#  define LUA_OPMOD 4
++#endif
++#ifndef LUA_OPPOW
++#  define LUA_OPPOW 5
++#endif
++#ifndef LUA_OPUNM
++#  define LUA_OPUNM 6
++#endif
++#ifndef LUA_OPEQ
++#  define LUA_OPEQ 0
++#endif
++#ifndef LUA_OPLT
++#  define LUA_OPLT 1
++#endif
++#ifndef LUA_OPLE
++#  define LUA_OPLE 2
++#endif
++
++/* LuaJIT/Lua 5.1 does not have the updated
++ * error codes for thread status/function returns (but some patched versions do)
++ * define it only if it's not found
++ */
++#if !defined(LUA_ERRGCMM)
++/* Use + 2 because in some versions of Lua (Lua 5.1)
++ * LUA_ERRFILE is defined as (LUA_ERRERR+1)
++ * so we need to avoid it (LuaJIT might have something at this
++ * integer value too)
++ */
++#  define LUA_ERRGCMM (LUA_ERRERR + 2)
++#endif /* LUA_ERRGCMM define */
+ 
+ typedef size_t lua_Unsigned;
+ 
+@@ -86,6 +111,14 @@ typedef struct luaL_Buffer_53 {
+ } luaL_Buffer_53;
+ #define luaL_Buffer luaL_Buffer_53
+ 
++/* In PUC-Rio 5.1, userdata is a simple FILE*
++ * In LuaJIT, it's a struct where the first member is a FILE*
++ * We can't support the `closef` member
++ */
++typedef struct luaL_Stream {
++  FILE *f;
++} luaL_Stream;
++
+ #define lua_absindex COMPAT53_CONCAT(COMPAT53_PREFIX, _absindex)
+ COMPAT53_API int lua_absindex (lua_State *L, int i);
+ 
+@@ -99,20 +132,30 @@ COMPAT53_API int lua_compare (lua_State
+ COMPAT53_API void lua_copy (lua_State *L, int from, int to);
+ 
+ #define lua_getuservalue(L, i) \
+-  (lua_getfenv(L, i), lua_type(L, -1))
++  (lua_getfenv((L), (i)), lua_type((L), -1))
+ #define lua_setuservalue(L, i) \
+-  (luaL_checktype(L, -1, LUA_TTABLE), lua_setfenv(L, i))
++  (luaL_checktype((L), -1, LUA_TTABLE), lua_setfenv((L), (i)))
+ 
+ #define lua_len COMPAT53_CONCAT(COMPAT53_PREFIX, _len)
+ COMPAT53_API void lua_len (lua_State *L, int i);
+ 
+-#define luaL_newlibtable(L, l) \
+-  (lua_createtable(L, 0, sizeof(l)/sizeof(*(l))-1))
+-#define luaL_newlib(L, l) \
+-  (luaL_newlibtable(L, l), luaL_register(L, NULL, l))
++#define lua_pushstring(L, s) \
++  (lua_pushstring((L), (s)), lua_tostring((L), -1))
++
++#define lua_pushlstring(L, s, len) \
++  ((((len) == 0) ? lua_pushlstring((L), "", 0) : lua_pushlstring((L), (s), (len))), lua_tostring((L), -1))
++
++#ifndef luaL_newlibtable
++#  define luaL_newlibtable(L, l) \
++  (lua_createtable((L), 0, sizeof((l))/sizeof(*(l))-1))
++#endif
++#ifndef luaL_newlib
++#  define luaL_newlib(L, l) \
++  (luaL_newlibtable((L), (l)), luaL_register((L), NULL, (l)))
++#endif
+ 
+ #define lua_pushglobaltable(L) \
+-  lua_pushvalue(L, LUA_GLOBALSINDEX)
++  lua_pushvalue((L), LUA_GLOBALSINDEX)
+ 
+ #define lua_rawgetp COMPAT53_CONCAT(COMPAT53_PREFIX, _rawgetp)
+ COMPAT53_API int lua_rawgetp (lua_State *L, int i, const void *p);
+@@ -120,10 +163,9 @@ COMPAT53_API int lua_rawgetp (lua_State
+ #define lua_rawsetp COMPAT53_CONCAT(COMPAT53_PREFIX, _rawsetp)
+ COMPAT53_API void lua_rawsetp(lua_State *L, int i, const void *p);
+ 
+-#define lua_rawlen(L, i) lua_objlen(L, i)
++#define lua_rawlen(L, i) lua_objlen((L), (i))
+ 
+-#define lua_tointegerx COMPAT53_CONCAT(COMPAT53_PREFIX, _tointegerx)
+-COMPAT53_API lua_Integer lua_tointegerx (lua_State *L, int i, int *isnum);
++#define lua_tointeger(L, i) lua_tointegerx((L), (i), NULL)
+ 
+ #define lua_tonumberx COMPAT53_CONCAT(COMPAT53_PREFIX, _tonumberx)
+ COMPAT53_API lua_Number lua_tonumberx (lua_State *L, int i, int *isnum);
+@@ -131,6 +173,15 @@ COMPAT53_API lua_Number lua_tonumberx (l
+ #define luaL_checkversion COMPAT53_CONCAT(COMPAT53_PREFIX, L_checkversion)
+ COMPAT53_API void luaL_checkversion (lua_State *L);
+ 
++#define lua_load COMPAT53_CONCAT(COMPAT53_PREFIX, _load_53)
++COMPAT53_API int lua_load (lua_State *L, lua_Reader reader, void *data, const char* source, const char* mode);
++
++#define luaL_loadfilex COMPAT53_CONCAT(COMPAT53_PREFIX, L_loadfilex)
++COMPAT53_API int luaL_loadfilex (lua_State *L, const char *filename, const char *mode);
++
++#define luaL_loadbufferx COMPAT53_CONCAT(COMPAT53_PREFIX, L_loadbufferx)
++COMPAT53_API int luaL_loadbufferx (lua_State *L, const char *buff, size_t sz, const char *name, const char *mode);
++
+ #define luaL_checkstack COMPAT53_CONCAT(COMPAT53_PREFIX, L_checkstack_53)
+ COMPAT53_API void luaL_checkstack (lua_State *L, int sp, const char *msg);
+ 
+@@ -138,7 +189,7 @@ COMPAT53_API void luaL_checkstack (lua_S
+ COMPAT53_API int luaL_getsubtable (lua_State* L, int i, const char *name);
+ 
+ #define luaL_len COMPAT53_CONCAT(COMPAT53_PREFIX, L_len)
+-COMPAT53_API int luaL_len (lua_State *L, int i);
++COMPAT53_API lua_Integer luaL_len (lua_State *L, int i);
+ 
+ #define luaL_setfuncs COMPAT53_CONCAT(COMPAT53_PREFIX, L_setfuncs)
+ COMPAT53_API void luaL_setfuncs (lua_State *L, const luaL_Reg *l, int nup);
+@@ -149,10 +200,6 @@ COMPAT53_API void luaL_setmetatable (lua
+ #define luaL_testudata COMPAT53_CONCAT(COMPAT53_PREFIX, L_testudata)
+ COMPAT53_API void *luaL_testudata (lua_State *L, int i, const char *tname);
+ 
+-#define luaL_tolstring COMPAT53_CONCAT(COMPAT53_PREFIX, L_tolstring)
+-COMPAT53_API const char *luaL_tolstring (lua_State *L, int idx, size_t *len);
+-
+-#if !defined(COMPAT53_IS_LUAJIT)
+ #define luaL_traceback COMPAT53_CONCAT(COMPAT53_PREFIX, L_traceback)
+ COMPAT53_API void luaL_traceback (lua_State *L, lua_State *L1, const char *msg, int level);
+ 
+@@ -161,12 +208,14 @@ COMPAT53_API int luaL_fileresult (lua_St
+ 
+ #define luaL_execresult COMPAT53_CONCAT(COMPAT53_PREFIX, L_execresult)
+ COMPAT53_API int luaL_execresult (lua_State *L, int stat);
+-#endif /* COMPAT53_IS_LUAJIT */
+ 
+ #define lua_callk(L, na, nr, ctx, cont) \
+-  ((void)(ctx), (void)(cont), lua_call(L, na, nr))
++  ((void)(ctx), (void)(cont), lua_call((L), (na), (nr)))
+ #define lua_pcallk(L, na, nr, err, ctx, cont) \
+-  ((void)(ctx), (void)(cont), lua_pcall(L, na, nr, err))
++  ((void)(ctx), (void)(cont), lua_pcall((L), (na), (nr), (err)))
++
++#define lua_resume(L, from, nargs) \
++  ((void)(from), lua_resume((L), (nargs)))
+ 
+ #define luaL_buffinit COMPAT53_CONCAT(COMPAT53_PREFIX, _buffinit_53)
+ COMPAT53_API void luaL_buffinit (lua_State *L, luaL_Buffer_53 *B);
+@@ -185,15 +234,15 @@ COMPAT53_API void luaL_pushresult (luaL_
+ 
+ #undef luaL_buffinitsize
+ #define luaL_buffinitsize(L, B, s) \
+-  (luaL_buffinit(L, B), luaL_prepbuffsize(B, s))
++  (luaL_buffinit((L), (B)), luaL_prepbuffsize((B), (s)))
+ 
+ #undef luaL_prepbuffer
+ #define luaL_prepbuffer(B) \
+-  luaL_prepbuffsize(B, LUAL_BUFFERSIZE)
++  luaL_prepbuffsize((B), LUAL_BUFFERSIZE)
+ 
+ #undef luaL_addchar
+ #define luaL_addchar(B, c) \
+-  ((void)((B)->nelems < (B)->capacity || luaL_prepbuffsize(B, 1)), \
++  ((void)((B)->nelems < (B)->capacity || luaL_prepbuffsize((B), 1)), \
+    ((B)->ptr[(B)->nelems++] = (c)))
+ 
+ #undef luaL_addsize
+@@ -202,23 +251,23 @@ COMPAT53_API void luaL_pushresult (luaL_
+ 
+ #undef luaL_addstring
+ #define luaL_addstring(B, s) \
+-  luaL_addlstring(B, s, strlen(s))
++  luaL_addlstring((B), (s), strlen((s)))
+ 
+ #undef luaL_pushresultsize
+ #define luaL_pushresultsize(B, s) \
+-  (luaL_addsize(B, s), luaL_pushresult(B))
++  (luaL_addsize((B), (s)), luaL_pushresult((B)))
+ 
+ #if defined(LUA_COMPAT_APIINTCASTS)
+ #define lua_pushunsigned(L, n) \
+-  lua_pushinteger(L, (lua_Integer)(n))
++  lua_pushinteger((L), (lua_Integer)(n))
+ #define lua_tounsignedx(L, i, is) \
+-  ((lua_Unsigned)lua_tointegerx(L, i, is))
++  ((lua_Unsigned)lua_tointegerx((L), (i), (is)))
+ #define lua_tounsigned(L, i) \
+-  lua_tounsignedx(L, i, NULL)
++  lua_tounsignedx((L), (i), NULL)
+ #define luaL_checkunsigned(L, a) \
+-  ((lua_Unsigned)luaL_checkinteger(L, a))
++  ((lua_Unsigned)luaL_checkinteger((L), (a)))
+ #define luaL_optunsigned(L, a, d) \
+-  ((lua_Unsigned)luaL_optinteger(L, a, (lua_Integer)(d)))
++  ((lua_Unsigned)luaL_optinteger((L), (a), (lua_Integer)(d)))
+ #endif
+ 
+ #endif /* Lua 5.1 only */
+@@ -233,13 +282,13 @@ typedef int lua_KContext;
+ typedef int (*lua_KFunction)(lua_State *L, int status, lua_KContext ctx);
+ 
+ #define lua_dump(L, w, d, s) \
+-  ((void)(s), lua_dump(L, w, d))
++  ((void)(s), lua_dump((L), (w), (d)))
+ 
+ #define lua_getfield(L, i, k) \
+-  (lua_getfield(L, i, k), lua_type(L, -1))
++  (lua_getfield((L), (i), (k)), lua_type((L), -1))
+ 
+ #define lua_gettable(L, i) \
+-  (lua_gettable(L, i), lua_type(L, -1))
++  (lua_gettable((L), (i)), lua_type((L), -1))
+ 
+ #define lua_geti COMPAT53_CONCAT(COMPAT53_PREFIX, _geti)
+ COMPAT53_API int lua_geti (lua_State *L, int index, lua_Integer i);
+@@ -247,14 +296,17 @@ COMPAT53_API int lua_geti (lua_State *L,
+ #define lua_isinteger COMPAT53_CONCAT(COMPAT53_PREFIX, _isinteger)
+ COMPAT53_API int lua_isinteger (lua_State *L, int index);
+ 
++#define lua_tointegerx COMPAT53_CONCAT(COMPAT53_PREFIX, _tointegerx_53)
++COMPAT53_API lua_Integer lua_tointegerx (lua_State *L, int i, int *isnum);
++
+ #define lua_numbertointeger(n, p) \
+   ((*(p) = (lua_Integer)(n)), 1)
+ 
+ #define lua_rawget(L, i) \
+-  (lua_rawget(L, i), lua_type(L, -1))
++  (lua_rawget((L), (i)), lua_type((L), -1))
+ 
+ #define lua_rawgeti(L, i, n) \
+-  (lua_rawgeti(L, i, n), lua_type(L, -1))
++  (lua_rawgeti((L), (i), (n)), lua_type((L), -1))
+ 
+ #define lua_rotate COMPAT53_CONCAT(COMPAT53_PREFIX, _rotate)
+ COMPAT53_API void lua_rotate (lua_State *L, int idx, int n);
+@@ -265,11 +317,14 @@ COMPAT53_API void lua_seti (lua_State *L
+ #define lua_stringtonumber COMPAT53_CONCAT(COMPAT53_PREFIX, _stringtonumber)
+ COMPAT53_API size_t lua_stringtonumber (lua_State *L, const char *s);
+ 
++#define luaL_tolstring COMPAT53_CONCAT(COMPAT53_PREFIX, L_tolstring)
++COMPAT53_API const char *luaL_tolstring (lua_State *L, int idx, size_t *len);
++
+ #define luaL_getmetafield(L, o, e) \
+-  (luaL_getmetafield(L, o, e) ? lua_type(L, -1) : LUA_TNIL)
++  (luaL_getmetafield((L), (o), (e)) ? lua_type((L), -1) : LUA_TNIL)
+ 
+ #define luaL_newmetatable(L, tn) \
+-  (luaL_newmetatable(L, tn) ? (lua_pushstring(L, tn), lua_setfield(L, -2, "__name"), 1) : 0)
++  (luaL_newmetatable((L), (tn)) ? (lua_pushstring((L), (tn)), lua_setfield((L), -2, "__name"), 1) : 0)
+ 
+ #define luaL_requiref COMPAT53_CONCAT(COMPAT53_PREFIX, L_requiref_53)
+ COMPAT53_API void luaL_requiref (lua_State *L, const char *modname,
+@@ -290,13 +345,16 @@ COMPAT53_API void luaL_requiref (lua_Sta
+  */
+ 
+ #define lua_getglobal(L, n) \
+-  (lua_getglobal(L, n), lua_type(L, -1))
++  (lua_getglobal((L), (n)), lua_type((L), -1))
+ 
+ #define lua_getuservalue(L, i) \
+-  (lua_getuservalue(L, i), lua_type(L, -1))
++  (lua_getuservalue((L), (i)), lua_type((L), -1))
++
++#define lua_pushlstring(L, s, len) \
++  (((len) == 0) ? lua_pushlstring((L), "", 0) : lua_pushlstring((L), (s), (len)))
+ 
+ #define lua_rawgetp(L, i, p) \
+-  (lua_rawgetp(L, i, p), lua_type(L, -1))
++  (lua_rawgetp((L), (i), (p)), lua_type((L), -1))
+ 
+ #define LUA_KFUNCTION(_name) \
+   static int (_name)(lua_State *L, int status, lua_KContext ctx); \
+@@ -308,30 +366,30 @@ COMPAT53_API void luaL_requiref (lua_Sta
+   static int (_name)(lua_State *L, int status, lua_KContext ctx)
+ 
+ #define lua_pcallk(L, na, nr, err, ctx, cont) \
+-  lua_pcallk(L, na, nr, err, ctx, cont ## _52)
++  lua_pcallk((L), (na), (nr), (err), (ctx), cont ## _52)
+ 
+ #define lua_callk(L, na, nr, ctx, cont) \
+-  lua_callk(L, na, nr, ctx, cont ## _52)
++  lua_callk((L), (na), (nr), (ctx), cont ## _52)
+ 
+ #define lua_yieldk(L, nr, ctx, cont) \
+-  lua_yieldk(L, nr, ctx, cont ## _52)
++  lua_yieldk((L), (nr), (ctx), cont ## _52)
+ 
+ #ifdef lua_call
+ #  undef lua_call
+ #  define lua_call(L, na, nr) \
+-  (lua_callk)(L, na, nr, 0, NULL)
++  (lua_callk)((L), (na), (nr), 0, NULL)
+ #endif
+ 
+ #ifdef lua_pcall
+ #  undef lua_pcall
+ #  define lua_pcall(L, na, nr, err) \
+-  (lua_pcallk)(L, na, nr, err, 0, NULL)
++  (lua_pcallk)((L), (na), (nr), (err), 0, NULL)
+ #endif
+ 
+ #ifdef lua_yield
+ #  undef lua_yield
+ #  define lua_yield(L, nr) \
+-  (lua_yieldk)(L, nr, 0, NULL)
++  (lua_yieldk)((L), (nr), 0, NULL)
+ #endif
+ 
+ #endif /* Lua 5.2 only */
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/compat53/init.lua luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/compat53/init.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/compat53/init.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/compat53/init.lua	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,373 @@
++local lua_version = _VERSION:sub(-3)
++
++
++if lua_version < "5.3" then
++
++   local _G, pairs, require, select, type =
++         _G, pairs, require, select, type
++   local debug, io = debug, io
++   local unpack = lua_version == "5.1" and unpack or table.unpack
++
++   local M = require("compat53.module")
++
++   -- select the most powerful getmetatable function available
++   local gmt = type(debug) == "table" and debug.getmetatable or
++               getmetatable or function() return false end
++   -- metatable for file objects from Lua's standard io library
++   local file_meta = gmt(io.stdout)
++
++
++   -- make '*' optional for file:read and file:lines
++   if type(file_meta) == "table" and type(file_meta.__index) == "table" then
++
++      local function addasterisk(fmt)
++         if type(fmt) == "string" and fmt:sub(1, 1) ~= "*" then
++            return "*"..fmt
++         else
++            return fmt
++         end
++      end
++
++      local file_lines = file_meta.__index.lines
++      file_meta.__index.lines = function(self, ...)
++         local n = select('#', ...)
++         for i = 1, n do
++            local a = select(i, ...)
++            local b = addasterisk(a)
++            -- as an optimization we only allocate a table for the
++            -- modified format arguments when we have a '*' somewhere
++            if a ~= b then
++               local args = { ... }
++               args[i] = b
++               for j = i+1, n do
++                  args[j] = addasterisk(args[j])
++               end
++               return file_lines(self, unpack(args, 1, n))
++            end
++         end
++         return file_lines(self, ...)
++      end
++
++      local file_read = file_meta.__index.read
++      file_meta.__index.read = function(self, ...)
++         local n = select('#', ...)
++         for i = 1, n do
++            local a = select(i, ...)
++            local b = addasterisk(a)
++            -- as an optimization we only allocate a table for the
++            -- modified format arguments when we have a '*' somewhere
++            if a ~= b then
++               local args = { ... }
++               args[i] = b
++               for j = i+1, n do
++                  args[j] = addasterisk(args[j])
++               end
++               return file_read(self, unpack(args, 1, n))
++            end
++         end
++         return file_read(self, ...)
++      end
++
++   end -- got a valid metatable for file objects
++
++
++   -- changes for Lua 5.1 only
++   if lua_version == "5.1" then
++
++      -- cache globals
++      local error, pcall, rawset, setmetatable, tostring, xpcall =
++            error, pcall, rawset, setmetatable, tostring, xpcall
++      local coroutine, package, string = coroutine, package, string
++      local coroutine_resume = coroutine.resume
++      local coroutine_running = coroutine.running
++      local coroutine_status = coroutine.status
++      local coroutine_yield = coroutine.yield
++      local io_type = io.type
++
++
++      -- detect LuaJIT (including LUAJIT_ENABLE_LUA52COMPAT compilation flag)
++      local is_luajit = (string.dump(function() end) or ""):sub(1, 3) == "\027LJ"
++      local is_luajit52 = is_luajit and
++        #setmetatable({}, { __len = function() return 1 end }) == 1
++
++
++      -- make package.searchers available as an alias for package.loaders
++      local p_index = { searchers = package.loaders }
++      setmetatable(package, {
++         __index = p_index,
++         __newindex = function(p, k, v)
++            if k == "searchers" then
++               rawset(p, "loaders", v)
++               p_index.searchers = v
++            else
++               rawset(p, k, v)
++            end
++         end
++      })
++
++
++      if type(file_meta) == "table" and type(file_meta.__index) == "table" then
++         if not is_luajit then
++            local function helper(_, var_1, ...)
++               if var_1 == nil then
++                  if (...) ~= nil then
++                     error((...), 2)
++                  end
++               end
++               return var_1, ...
++            end
++
++            local function lines_iterator(st)
++               return helper(st, st.f:read(unpack(st, 1, st.n)))
++            end
++
++            local file_write = file_meta.__index.write
++            file_meta.__index.write = function(self, ...)
++               local res, msg, errno = file_write(self, ...)
++               if res then
++                  return self
++               else
++                  return nil, msg, errno
++               end
++            end
++
++            file_meta.__index.lines = function(self, ...)
++               if io_type(self) == "closed file" then
++                  error("attempt to use a closed file", 2)
++               end
++               local st = { f=self, n=select('#', ...), ... }
++               for i = 1, st.n do
++                  local t = type(st[i])
++                  if t == "string" then
++                     local fmt = st[i]:match("^*?([aln])")
++                     if not fmt then
++                        error("bad argument #"..(i+1).." to 'for iterator' (invalid format)", 2)
++                     end
++                     st[i] = "*"..fmt
++                  elseif t ~= "number" then
++                     error("bad argument #"..(i+1).." to 'for iterator' (invalid format)", 2)
++                  end
++               end
++               return lines_iterator, st
++            end
++         end -- not luajit
++      end -- file_meta valid
++
++
++      -- the (x)pcall implementations start a new coroutine internally
++      -- to allow yielding even in Lua 5.1. to allow for accurate
++      -- stack traces we keep track of the nested coroutine activations
++      -- in the weak tables below:
++      local weak_meta = { __mode = "kv" }
++      -- maps the internal pcall coroutines to the user coroutine that
++      -- *should* be running if pcall didn't use coroutines internally
++      local pcall_mainOf = setmetatable({}, weak_meta)
++      -- table that maps each running coroutine started by pcall to
++      -- the coroutine that resumed it (user coroutine *or* pcall
++      -- coroutine!)
++      local pcall_previous = setmetatable({}, weak_meta)
++      -- reverse of `pcall_mainOf`. maps a user coroutine to the
++      -- currently active pcall coroutine started within it
++      local pcall_callOf = setmetatable({}, weak_meta)
++      -- similar to `pcall_mainOf` but is used only while executing
++      -- the error handler of xpcall (thus no nesting is necessary!)
++      local xpcall_running = setmetatable({}, weak_meta)
++
++      -- handle debug functions
++      if type(debug) == "table" then
++         local debug_getinfo = debug.getinfo
++         local debug_traceback = debug.traceback
++
++         if not is_luajit then
++            local function calculate_trace_level(co, level)
++               if level ~= nil then
++                  for out = 1, 1/0 do
++                     local info = (co==nil) and debug_getinfo(out, "") or debug_getinfo(co, out, "")
++                     if info == nil then
++                        local max = out-1
++                        if level <= max then
++                           return level
++                        end
++                        return nil, level-max
++                     end
++                  end
++               end
++               return 1
++            end
++
++            local stack_pattern = "\nstack traceback:"
++            local stack_replace = ""
++            function debug.traceback(co, msg, level)
++               local lvl
++               local nilmsg
++               if type(co) ~= "thread" then
++                  co, msg, level = coroutine_running(), co, msg
++               end
++               if msg == nil then
++                  msg = ""
++                  nilmsg = true
++               elseif type(msg) ~= "string" then
++                  return msg
++               end
++               if co == nil then
++                  msg = debug_traceback(msg, level or 1)
++               else
++                  local xpco = xpcall_running[co]
++                  if xpco ~= nil then
++                     lvl, level = calculate_trace_level(xpco, level)
++                     if lvl then
++                        msg = debug_traceback(xpco, msg, lvl)
++                     else
++                        msg = msg..stack_pattern
++                     end
++                     lvl, level = calculate_trace_level(co, level)
++                     if lvl then
++                        local trace = debug_traceback(co, "", lvl)
++                        msg = msg..trace:gsub(stack_pattern, stack_replace)
++                     end
++                  else
++                     co = pcall_callOf[co] or co
++                     lvl, level = calculate_trace_level(co, level)
++                     if lvl then
++                        msg = debug_traceback(co, msg, lvl)
++                     else
++                        msg = msg..stack_pattern
++                     end
++                  end
++                  co = pcall_previous[co]
++                  while co ~= nil do
++                     lvl, level = calculate_trace_level(co, level)
++                     if lvl then
++                        local trace = debug_traceback(co, "", lvl)
++                        msg = msg..trace:gsub(stack_pattern, stack_replace)
++                     end
++                     co = pcall_previous[co]
++                  end
++               end
++               if nilmsg then
++                  msg = msg:gsub("^\n", "")
++               end
++               msg = msg:gsub("\n\t%(tail call%): %?", "\000")
++               msg = msg:gsub("\n\t%.%.%.\n", "\001\n")
++               msg = msg:gsub("\n\t%.%.%.$", "\001")
++               msg = msg:gsub("(%z+)\001(%z+)", function(some, other)
++                  return "\n\t(..."..#some+#other.."+ tail call(s)...)"
++               end)
++               msg = msg:gsub("\001(%z+)", function(zeros)
++                  return "\n\t(..."..#zeros.."+ tail call(s)...)"
++               end)
++               msg = msg:gsub("(%z+)\001", function(zeros)
++                  return "\n\t(..."..#zeros.."+ tail call(s)...)"
++               end)
++               msg = msg:gsub("%z+", function(zeros)
++                  return "\n\t(..."..#zeros.." tail call(s)...)"
++               end)
++               msg = msg:gsub("\001", function()
++                  return "\n\t..."
++               end)
++               return msg
++            end
++         end -- is not luajit
++      end -- debug table available
++
++
++      if not is_luajit52 then
++         local coroutine_running52 = M.coroutine.running
++         function M.coroutine.running()
++            local co, ismain = coroutine_running52()
++            if ismain then
++               return co, true
++            else
++               return pcall_mainOf[co] or co, false
++            end
++         end
++      end
++
++      if not is_luajit then
++         local function pcall_results(current, call, success, ...)
++            if coroutine_status(call) == "suspended" then
++               return pcall_results(current, call, coroutine_resume(call, coroutine_yield(...)))
++            end
++            if pcall_previous then
++               pcall_previous[call] = nil
++               local main = pcall_mainOf[call]
++               if main == current then current = nil end
++               pcall_callOf[main] = current
++            end
++            pcall_mainOf[call] = nil
++            return success, ...
++         end
++
++         local function pcall_exec(current, call, ...)
++            local main = pcall_mainOf[current] or current
++            pcall_mainOf[call] = main
++            if pcall_previous then
++               pcall_previous[call] = current
++               pcall_callOf[main] = call
++            end
++            return pcall_results(current, call, coroutine_resume(call, ...))
++         end
++
++         local coroutine_create52 = M.coroutine.create
++
++         local function pcall_coroutine(func)
++            if type(func) ~= "function" then
++               local callable = func
++               func = function (...) return callable(...) end
++            end
++            return coroutine_create52(func)
++         end
++
++         function M.pcall(func, ...)
++            local current = coroutine_running()
++            if not current then return pcall(func, ...) end
++            return pcall_exec(current, pcall_coroutine(func), ...)
++         end
++
++         local function xpcall_catch(current, call, msgh, success, ...)
++            if not success then
++               xpcall_running[current] = call
++               local ok, result = pcall(msgh, ...)
++               xpcall_running[current] = nil
++               if not ok then
++                  return false, "error in error handling ("..tostring(result)..")"
++               end
++               return false, result
++            end
++            return true, ...
++         end
++
++         function M.xpcall(f, msgh, ...)
++            local current = coroutine_running()
++            if not current then
++               local args, n = { ... }, select('#', ...)
++               return xpcall(function() return f(unpack(args, 1, n)) end, msgh)
++            end
++            local call = pcall_coroutine(f)
++            return xpcall_catch(current, call, msgh, pcall_exec(current, call, ...))
++         end
++      end -- not luajit
++
++   end -- lua 5.1
++
++
++   -- handle exporting to global scope
++   local function extend_table(from, to)
++      if from ~= to then
++         for k,v in pairs(from) do
++            if type(v) == "table" and
++               type(to[k]) == "table" and
++               v ~= to[k] then
++               extend_table(v, to[k])
++            else
++               to[k] = v
++            end
++         end
++      end
++   end
++
++   extend_table(M, _G)
++
++end -- lua < 5.3
++
++-- vi: set expandtab softtabstop=3 shiftwidth=3 :
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/compat53/module.lua luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/compat53/module.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/compat53/module.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/compat53/module.lua	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,827 @@
++local _G, _VERSION = _G, _VERSION
++local lua_version = _VERSION:sub(-3)
++
++
++local M = _G
++
++if lua_version < "5.3" then
++
++   -- cache globals in upvalues
++   local error, ipairs, pairs, pcall, require, select, setmetatable, type =
++         error, ipairs, pairs, pcall, require, select, setmetatable, type
++   local debug, io, math, package, string, table =
++         debug, io, math, package, string, table
++   local io_lines = io.lines
++   local io_read = io.read
++   local unpack = lua_version == "5.1" and unpack or table.unpack
++
++   -- create module table
++   M = {}
++   local M_meta = {
++      __index = _G,
++      -- __newindex is set@the end
++   }
++   setmetatable(M, M_meta)
++
++   -- create subtables
++   M.io = setmetatable({}, { __index = io })
++   M.math = setmetatable({}, { __index = math })
++   M.string = setmetatable({}, { __index = string })
++   M.table = setmetatable({}, { __index = table })
++   M.utf8 = {}
++
++
++   -- select the most powerful getmetatable function available
++   local gmt = type(debug) == "table" and debug.getmetatable or
++               getmetatable or function() return false end
++
++   -- type checking functions
++   local checkinteger -- forward declararation
++
++   local function argcheck(cond, i, f, extra)
++      if not cond then
++         error("bad argument #"..i.." to '"..f.."' ("..extra..")", 0)
++      end
++   end
++
++
++   -- load utf8 library
++   local utf8_ok, utf8lib = pcall(require, "compat53.utf8")
++   if utf8_ok then
++      if lua_version == "5.1" then
++         utf8lib.charpattern = "[%z\1-\127\194-\244][\128-\191]*"
++      end
++      for k,v in pairs(utf8lib) do
++         M.utf8[k] = v
++      end
++      package.loaded["utf8"] = M.utf8
++   end
++
++
++   -- load table library
++   local table_ok, tablib = pcall(require, "compat53.table")
++   if table_ok then
++      for k,v in pairs(tablib) do
++         M.table[k] = v
++      end
++   end
++
++
++   -- load string packing functions
++   local str_ok, strlib = pcall(require, "compat53.string")
++   if str_ok then
++      for k,v in pairs(strlib) do
++         M.string[k] = v
++      end
++   end
++
++
++   -- try Roberto's struct module for string packing/unpacking if
++   -- compat53.string is unavailable
++   if not str_ok then
++      local struct_ok, struct = pcall(require, "struct")
++      if struct_ok then
++         M.string.pack = struct.pack
++         M.string.packsize = struct.size
++         M.string.unpack = struct.unpack
++      end
++   end
++
++
++   -- update math library
++   do
++      local maxint, minint = 1
++
++      while maxint+1 > maxint and 2*maxint > maxint do
++         maxint = maxint * 2
++      end
++      if 2*maxint <= maxint then
++         maxint = 2*maxint-1
++         minint = -maxint-1
++      else
++         maxint = maxint
++         minint = -maxint
++      end
++      M.math.maxinteger = maxint
++      M.math.mininteger = minint
++
++      function M.math.tointeger(n)
++         if type(n) == "number" and n <= maxint and n >= minint and n % 1 == 0 then
++            return n
++         end
++         return nil
++      end
++
++      function M.math.type(n)
++         if type(n) == "number" then
++            if n <= maxint and n >= minint and n % 1 == 0 then
++               return "integer"
++            else
++               return "float"
++            end
++         else
++            return nil
++         end
++      end
++
++      function checkinteger(x, i, f)
++         local t = type(x)
++         if t ~= "number" then
++            error("bad argument #"..i.." to '"..f..
++                  "' (number expected, got "..t..")", 0)
++         elseif x > maxint or x < minint or x % 1 ~= 0 then
++            error("bad argument #"..i.." to '"..f..
++                  "' (number has no integer representation)", 0)
++         else
++            return x
++         end
++      end
++
++      function M.math.ult(m, n)
++         m = checkinteger(m, "1", "math.ult")
++         n = checkinteger(n, "2", "math.ult")
++         if m >= 0 and n < 0 then
++            return true
++         elseif m < 0 and n >= 0 then
++            return false
++         else
++            return m < n
++         end
++      end
++   end
++
++
++   -- assert should allow non-string error objects
++   function M.assert(cond, ...)
++      if cond then
++         return cond, ...
++      elseif select('#', ...) > 0 then
++         error((...), 0)
++      else
++         error("assertion failed!", 0)
++      end
++   end
++
++
++   -- ipairs should respect __index metamethod
++   do
++      local function ipairs_iterator(st, var)
++         var = var + 1
++         local val = st[var]
++         if val ~= nil then
++            return var, st[var]
++         end
++      end
++      function M.ipairs(t)
++         if gmt(t) ~= nil then -- t has metatable
++            return ipairs_iterator, t, 0
++         else
++            return ipairs(t)
++         end
++      end
++   end
++
++
++   -- make '*' optional for io.read and io.lines
++   do
++      local function addasterisk(fmt)
++         if type(fmt) == "string" and fmt:sub(1, 1) ~= "*" then
++            return "*"..fmt
++         else
++            return fmt
++         end
++      end
++
++      function M.io.read(...)
++         local n = select('#', ...)
++         for i = 1, n do
++            local a = select(i, ...)
++            local b = addasterisk(a)
++            -- as an optimization we only allocate a table for the
++            -- modified format arguments when we have a '*' somewhere.
++            if a ~= b then
++               local args = { ... }
++               args[i] = b
++               for j = i+1, n do
++                  args[j] = addasterisk(args[j])
++               end
++               return io_read(unpack(args, 1, n))
++            end
++         end
++         return io_read(...)
++      end
++
++      -- PUC-Rio Lua 5.1 uses a different implementation for io.lines!
++      function M.io.lines(...)
++         local n = select('#', ...)
++         for i = 2, n do
++            local a = select(i, ...)
++            local b = addasterisk(a)
++            -- as an optimization we only allocate a table for the
++            -- modified format arguments when we have a '*' somewhere.
++            if a ~= b then
++               local args = { ... }
++               args[i] = b
++               for j = i+1, n do
++                  args[j] = addasterisk(args[j])
++               end
++               return io_lines(unpack(args, 1, n))
++            end
++         end
++         return io_lines(...)
++      end
++   end
++
++
++   -- update table library (if C module not available)
++   if not table_ok then
++      local table_concat = table.concat
++      local table_insert = table.insert
++      local table_remove = table.remove
++      local table_sort = table.sort
++
++      function M.table.concat(list, sep, i, j)
++         local mt = gmt(list)
++         if type(mt) == "table" and type(mt.__len) == "function" then
++            local src = list
++            list, i, j  = {}, i or 1, j or mt.__len(src)
++            for k = i, j do
++               list[k] = src[k]
++            end
++         end
++         return table_concat(list, sep, i, j)
++      end
++
++      function M.table.insert(list, ...)
++         local mt = gmt(list)
++         local has_mt = type(mt) == "table"
++         local has_len = has_mt and type(mt.__len) == "function"
++         if has_mt and (has_len or mt.__index or mt.__newindex) then
++            local e = (has_len and mt.__len(list) or #list)+1
++            local nargs, pos, value = select('#', ...), ...
++            if nargs == 1 then
++               pos, value = e, pos
++            elseif nargs == 2 then
++               pos = checkinteger(pos, "2", "table.insert")
++               argcheck(1 <= pos and pos <= e, "2", "table.insert",
++                        "position out of bounds" )
++            else
++               error("wrong number of arguments to 'insert'", 0)
++            end
++            for i = e-1, pos, -1 do
++               list[i+1] = list[i]
++            end
++            list[pos] = value
++         else
++            return table_insert(list, ...)
++         end
++      end
++
++      function M.table.move(a1, f, e, t, a2)
++         a2 = a2 or a1
++         f = checkinteger(f, "2", "table.move")
++         argcheck(f > 0, "2", "table.move",
++                  "initial position must be positive")
++         e = checkinteger(e, "3", "table.move")
++         t = checkinteger(t, "4", "table.move")
++         if e >= f then
++            local m, n, d = 0, e-f, 1
++            if t > f then m, n, d = n, m, -1 end
++            for i = m, n, d do
++               a2[t+i] = a1[f+i]
++            end
++         end
++         return a2
++      end
++
++      function M.table.remove(list, pos)
++         local mt = gmt(list)
++         local has_mt = type(mt) == "table"
++         local has_len = has_mt and type(mt.__len) == "function"
++         if has_mt and (has_len or mt.__index or mt.__newindex) then
++            local e = (has_len and mt.__len(list) or #list)
++            pos = pos ~= nil and checkinteger(pos, "2", "table.remove") or e
++            if pos ~= e then
++               argcheck(1 <= pos and pos <= e+1, "2", "table.remove",
++                        "position out of bounds" )
++            end
++            local result = list[pos]
++            while pos < e do
++               list[pos] = list[pos+1]
++               pos = pos + 1
++            end
++            list[pos] = nil
++            return result
++         else
++            return table_remove(list, pos)
++         end
++      end
++
++      do
++         local function pivot(list, cmp, a, b)
++            local m = b - a
++            if m > 2 then
++               local c = a + (m-m%2)/2
++               local x, y, z = list[a], list[b], list[c]
++               if not cmp(x, y) then
++                  x, y, a, b = y, x, b, a
++               end
++               if not cmp(y, z) then
++                  y, b = z, c
++               end
++               if not cmp(x, y) then
++                  y, b = x, a
++               end
++               return b, y
++            else
++               return b, list[b]
++            end
++         end
++
++         local function lt_cmp(a, b)
++            return a < b
++         end
++
++         local function qsort(list, cmp, b, e)
++            if b < e then
++               local i, j, k, val = b, e, pivot(list, cmp, b, e)
++               while i < j do
++                  while i < j and cmp(list[i], val) do
++                     i = i + 1
++                  end
++                  while i < j and not cmp(list[j], val) do
++                     j = j - 1
++                  end
++                  if i < j then
++                     list[i], list[j] = list[j], list[i]
++                     if i == k then k = j end -- update pivot position
++                     i, j = i+1, j-1
++                  end
++               end
++               if i ~= k and not cmp(list[i], val) then
++                  list[i], list[k] = val, list[i]
++                  k = i -- update pivot position
++               end
++               qsort(list, cmp, b, i == k and i-1 or i)
++               return qsort(list, cmp, i+1, e)
++            end
++         end
++
++         function M.table.sort(list, cmp)
++            local mt = gmt(list)
++            local has_mt = type(mt) == "table"
++            local has_len = has_mt and type(mt.__len) == "function"
++            if has_len then
++               cmp = cmp or lt_cmp
++               local len = mt.__len(list)
++               return qsort(list, cmp, 1, len)
++            else
++               return table_sort(list, cmp)
++            end
++         end
++      end
++
++      local function unpack_helper(list, i, j, ...)
++         if j < i then
++            return ...
++         else
++            return unpack_helper(list, i, j-1, list[j], ...)
++         end
++      end
++      function M.table.unpack(list, i, j)
++         local mt = gmt(list)
++         local has_mt = type(mt) == "table"
++         local has_len = has_mt and type(mt.__len) == "function"
++         if has_mt and (has_len or mt.__index) then
++            i, j = i or 1, j or (has_len and mt.__len(list)) or #list
++            return unpack_helper(list, i, j)
++         else
++            return unpack(list, i, j)
++         end
++      end
++   end -- update table library
++
++
++   -- bring Lua 5.1 (and LuaJIT) up to speed with Lua 5.2
++   if lua_version == "5.1" then
++      -- detect LuaJIT (including LUAJIT_ENABLE_LUA52COMPAT compilation flag)
++      local is_luajit = (string.dump(function() end) or ""):sub(1, 3) == "\027LJ"
++      local is_luajit52 = is_luajit and
++        #setmetatable({}, { __len = function() return 1 end }) == 1
++
++      -- cache globals in upvalues
++      local load, loadfile, loadstring, setfenv, xpcall =
++            load, loadfile, loadstring, setfenv, xpcall
++      local coroutine, os = coroutine, os
++      local coroutine_create = coroutine.create
++      local coroutine_resume = coroutine.resume
++      local coroutine_running = coroutine.running
++      local coroutine_status = coroutine.status
++      local coroutine_yield = coroutine.yield
++      local io_input = io.input
++      local io_open = io.open
++      local io_output = io.output
++      local io_write = io.write
++      local math_log = math.log
++      local os_execute = os.execute
++      local string_find = string.find
++      local string_format = string.format
++      local string_gmatch = string.gmatch
++      local string_gsub = string.gsub
++      local string_match = string.match
++      local string_rep = string.rep
++      local table_concat = table.concat
++
++      -- create subtables
++      M.coroutine = setmetatable({}, { __index = coroutine })
++      M.os = setmetatable({}, { __index = os })
++      M.package = setmetatable({}, { __index = package })
++
++      -- handle debug functions
++      if type(debug) == "table" then
++         local debug_setfenv = debug.setfenv
++         local debug_getfenv = debug.getfenv
++         local debug_setmetatable = debug.setmetatable
++
++         M.debug = setmetatable({}, { __index = debug })
++
++         if not is_luajit52 then
++            function M.debug.setuservalue(obj, value)
++               if type(obj) ~= "userdata" then
++                  error("bad argument #1 to 'setuservalue' (userdata expected, got "..
++                        type(obj)..")", 2)
++               end
++               if value == nil then value = _G end
++               if type(value) ~= "table" then
++                  error("bad argument #2 to 'setuservalue' (table expected, got "..
++                        type(value)..")", 2)
++               end
++               return debug_setfenv(obj, value)
++            end
++
++            function M.debug.getuservalue(obj)
++               if type(obj) ~= "userdata" then
++                  return nil
++               else
++                  local v = debug_getfenv(obj)
++                  if v == _G or v == package then
++                     return nil
++                  end
++                  return v
++               end
++            end
++
++            function M.debug.setmetatable(value, tab)
++               debug_setmetatable(value, tab)
++               return value
++            end
++         end -- not luajit with compat52 enabled
++      end -- debug table available
++
++
++      if not is_luajit52 then
++         function M.pairs(t)
++            local mt = gmt(t)
++            if type(mt) == "table" and type(mt.__pairs) == "function" then
++               return mt.__pairs(t)
++            else
++               return pairs(t)
++            end
++         end
++      end
++
++
++      if not is_luajit then
++         local function check_mode(mode, prefix)
++            local has = { text = false, binary = false }
++            for i = 1,#mode do
++               local c = mode:sub(i, i)
++               if c == "t" then has.text = true end
++               if c == "b" then has.binary = true end
++            end
++            local t = prefix:sub(1, 1) == "\27" and "binary" or "text"
++            if not has[t] then
++               return "attempt to load a "..t.." chunk (mode is '"..mode.."')"
++            end
++         end
++
++         function M.load(ld, source, mode, env)
++            mode = mode or "bt"
++            local chunk, msg
++            if type( ld ) == "string" then
++               if mode ~= "bt" then
++                  local merr = check_mode(mode, ld)
++                  if merr then return nil, merr end
++               end
++               chunk, msg = loadstring(ld, source)
++            else
++               local ld_type = type(ld)
++               if ld_type ~= "function" then
++                  error("bad argument #1 to 'load' (function expected, got "..
++                        ld_type..")", 2)
++               end
++               if mode ~= "bt" then
++                  local checked, merr = false, nil
++                  local function checked_ld()
++                     if checked then
++                        return ld()
++                     else
++                        checked = true
++                        local v = ld()
++                        merr = check_mode(mode, v or "")
++                        if merr then return nil end
++                        return v
++                     end
++                  end
++                  chunk, msg = load(checked_ld, source)
++                  if merr then return nil, merr end
++               else
++                  chunk, msg = load(ld, source)
++               end
++            end
++            if not chunk then
++               return chunk, msg
++            end
++            if env ~= nil then
++               setfenv(chunk, env)
++            end
++            return chunk
++         end
++
++         M.loadstring = M.load
++
++         function M.loadfile(file, mode, env)
++            mode = mode or "bt"
++            if mode ~= "bt" then
++               local f = io_open(file, "rb")
++               if f then
++                  local prefix = f:read(1)
++                  f:close()
++                  if prefix then
++                     local merr = check_mode(mode, prefix)
++                     if merr then return nil, merr end
++                  end
++               end
++            end
++            local chunk, msg = loadfile(file)
++            if not chunk then
++               return chunk, msg
++            end
++            if env ~= nil then
++               setfenv(chunk, env)
++            end
++            return chunk
++         end
++      end -- not luajit
++
++
++      if not is_luajit52 then
++         function M.rawlen(v)
++            local t = type(v)
++            if t ~= "string" and t ~= "table" then
++               error("bad argument #1 to 'rawlen' (table or string expected)", 2)
++            end
++            return #v
++         end
++      end
++
++
++      if not is_luajit then
++         function M.xpcall(f, msgh, ...)
++            local args, n = { ... }, select('#', ...)
++            return xpcall(function() return f(unpack(args, 1, n)) end, msgh)
++         end
++      end
++
++
++      if not is_luajit52 then
++         function M.os.execute(cmd)
++            local code = os_execute(cmd)
++            -- Lua 5.1 does not report exit by signal.
++            if code == 0 then
++               return true, "exit", code
++            else
++               if package.config:sub(1, 1) == '/' then
++                  code = code/256 -- only correct on Linux!
++               end
++               return nil, "exit", code
++            end
++         end
++      end
++
++
++      if not table_ok and not is_luajit52 then
++         M.table.pack = function(...)
++            return { n = select('#', ...), ... }
++         end
++      end
++
++
++      local main_coroutine = coroutine_create(function() end)
++
++      function M.coroutine.create(func)
++         local success, result = pcall(coroutine_create, func)
++         if not success then
++            if type(func) ~= "function" then
++               error("bad argument #1 (function expected)", 0)
++             end
++            result = coroutine_create(function(...) return func(...) end)
++         end
++         return result
++      end
++
++      if not is_luajit52 then
++         function M.coroutine.running()
++            local co = coroutine_running()
++            if co then
++               return co, false
++            else
++               return main_coroutine, true
++            end
++         end
++      end
++
++      function M.coroutine.yield(...)
++         local co, flag = coroutine_running()
++         if co and not flag then
++            return coroutine_yield(...)
++         else
++            error("attempt to yield from outside a coroutine", 0)
++         end
++      end
++
++      if not is_luajit then
++         function M.coroutine.resume(co, ...)
++            if co == main_coroutine then
++               return false, "cannot resume non-suspended coroutine"
++            else
++               return coroutine_resume(co, ...)
++            end
++         end
++
++         function M.coroutine.status(co)
++            local notmain = coroutine_running()
++            if co == main_coroutine then
++               return notmain and "normal" or "running"
++            else
++               return coroutine_status(co)
++            end
++         end
++      end -- not luajit
++
++
++      if not is_luajit then
++         M.math.log = function(x, base)
++            if base ~= nil then
++               return math_log(x)/math_log(base)
++            else
++               return math_log(x)
++            end
++         end
++      end
++
++
++      if not is_luajit then
++         function M.package.searchpath(name, path, sep, rep)
++            sep = (sep or "."):gsub("(%p)", "%%%1")
++            rep = (rep or package.config:sub(1, 1)):gsub("(%%)", "%%%1")
++            local pname = name:gsub(sep, rep):gsub("(%%)", "%%%1")
++            local msg = {}
++            for subpath in path:gmatch("[^;]+") do
++               local fpath = subpath:gsub("%?", pname)
++               local f = io_open(fpath, "r")
++               if f then
++                  f:close()
++                  return fpath
++               end
++               msg[#msg+1] = "\n\tno file '" .. fpath .. "'"
++            end
++            return nil, table_concat(msg)
++         end
++      end
++
++
++      local function fix_pattern(pattern)
++         return (string_gsub(pattern, "%z", "%%z"))
++      end
++
++      function M.string.find(s, pattern, ...)
++         return string_find(s, fix_pattern(pattern), ...)
++      end
++
++      function M.string.gmatch(s, pattern)
++         return string_gmatch(s, fix_pattern(pattern))
++      end
++
++      function M.string.gsub(s, pattern, ...)
++         return string_gsub(s, fix_pattern(pattern), ...)
++      end
++
++      function M.string.match(s, pattern, ...)
++         return string_match(s, fix_pattern(pattern), ...)
++      end
++
++      if not is_luajit then
++         function M.string.rep(s, n, sep)
++            if sep ~= nil and sep ~= "" and n >= 2 then
++               return s .. string_rep(sep..s, n-1)
++            else
++               return string_rep(s, n)
++            end
++         end
++      end
++
++      if not is_luajit then
++         do
++            local addqt = {
++               ["\n"] = "\\\n",
++               ["\\"] = "\\\\",
++               ["\""] = "\\\""
++            }
++
++            local function addquoted(c, d)
++               return (addqt[c] or string_format(d~="" and "\\%03d" or "\\%d", c:byte()))..d
++            end
++
++            function M.string.format(fmt, ...)
++               local args, n = { ... }, select('#', ...)
++               local i = 0
++               local function adjust_fmt(lead, mods, kind)
++                  if #lead % 2 == 0 then
++                     i = i + 1
++                     if kind == "s" then
++                        args[i] = _G.tostring(args[i])
++                     elseif kind == "q" then
++                        args[i] = '"'..string_gsub(args[i], "([%z%c\\\"\n])(%d?)", addquoted)..'"'
++                        return lead.."%"..mods.."s"
++                     end
++                  end
++               end
++               fmt = string_gsub(fmt, "(%%*)%%([%d%.%-%+%# ]*)(%a)", adjust_fmt)
++               return string_format(fmt, unpack(args, 1, n))
++            end
++         end
++      end
++
++
++      function M.io.write(...)
++         local res, msg, errno = io_write(...)
++         if res then
++            return io_output()
++         else
++            return nil, msg, errno
++         end
++      end
++
++      if not is_luajit then
++         local function helper(st, var_1, ...)
++            if var_1 == nil then
++               if st.doclose then st.f:close() end
++               if (...) ~= nil then
++                  error((...), 2)
++               end
++            end
++            return var_1, ...
++         end
++
++         local function lines_iterator(st)
++            return helper(st, st.f:read(unpack(st, 1, st.n)))
++         end
++
++         function M.io.lines(fname, ...)
++            local doclose, file, msg
++            if fname ~= nil then
++               doclose, file, msg = true, io_open(fname, "r")
++               if not file then error(msg, 2) end
++            else
++               doclose, file = false, io_input()
++            end
++            local st = { f=file, doclose=doclose, n=select('#', ...), ... }
++            for i = 1, st.n do
++               local t = type(st[i])
++               if t == "string" then
++                  local fmt = st[i]:match("^%*?([aln])")
++                  if not fmt then
++                     error("bad argument #"..(i+1).." to 'for iterator' (invalid format)", 2)
++                  end
++                  st[i] = "*"..fmt
++               elseif t ~= "number" then
++                  error("bad argument #"..(i+1).." to 'for iterator' (invalid format)", 2)
++               end
++            end
++            return lines_iterator, st
++         end
++      end -- not luajit
++
++   end -- lua 5.1
++
++   -- further write should be forwarded to _G
++   M_meta.__newindex = _G
++
++end -- lua < 5.3
++
++
++-- return module table
++return M
++
++-- vi: set expandtab softtabstop=3 shiftwidth=3 :
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/LICENSE luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/LICENSE
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/LICENSE	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/LICENSE	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,20 @@
++The MIT License (MIT)
++
++Copyright (c) 2015 Kepler Project.
++
++Permission is hereby granted, free of charge, to any person obtaining a copy of
++this software and associated documentation files (the "Software"), to deal in
++the Software without restriction, including without limitation the rights to
++use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
++the Software, and to permit persons to whom the Software is furnished to do so,
++subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in all
++copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
++FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
++COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
++IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lprefix.h luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lprefix.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lprefix.h	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lprefix.h	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,175 @@
++/*
++** $Id: lprefix.h,v 1.2 2014/12/29 16:54:13 roberto Exp $
++** Definitions for Lua code that must come before any other header file
++** See Copyright Notice in lua.h
++*/
++
++#ifndef lprefix_h
++#define lprefix_h
++
++
++/*
++** Allows POSIX/XSI stuff
++*/
++#if !defined(LUA_USE_C89)	/* { */
++
++#if !defined(_XOPEN_SOURCE)
++#define _XOPEN_SOURCE           600
++#elif _XOPEN_SOURCE == 0
++#undef _XOPEN_SOURCE  /* use -D_XOPEN_SOURCE=0 to undefine it */
++#endif
++
++/*
++** Allows manipulation of large files in gcc and some other compilers
++*/
++#if !defined(LUA_32BITS) && !defined(_FILE_OFFSET_BITS)
++#define _LARGEFILE_SOURCE       1
++#define _FILE_OFFSET_BITS       64
++#endif
++
++#endif				/* } */
++
++
++/*
++** Windows stuff
++*/
++#if defined(_WIN32) 	/* { */
++
++#if !defined(_CRT_SECURE_NO_WARNINGS)
++#define _CRT_SECURE_NO_WARNINGS  /* avoid warnings about ISO C functions */
++#endif
++
++#endif			/* } */
++
++
++/* COMPAT53 adaptation */
++#include "c-api/compat-5.3.h"
++
++#undef LUAMOD_API
++#define LUAMOD_API extern
++
++
++#ifdef lutf8lib_c
++#  define luaopen_utf8 luaopen_compat53_utf8
++/* we don't support the %U format string of lua_pushfstring!
++ * code below adapted from the Lua 5.3 sources:
++ */
++static const char *compat53_utf8_escape (lua_State* L, long x) {
++  if (x < 0x80) { /* ASCII */
++    char c = (char)x;
++    lua_pushlstring(L, &c, 1);
++  } else {
++    char buff[8] = { 0 };
++    unsigned int mfb = 0x3f;
++    int n = 1;
++    do {
++      buff[8 - (n++)] = (char)(0x80|(x & 0x3f));
++      x >>= 6;
++      mfb >>= 1;
++    } while (x > mfb);
++    buff[8-n] = (char)((~mfb << 1) | x);
++    lua_pushlstring(L, buff+8-n, n);
++  }
++  return lua_tostring(L, -1);
++}
++#  define lua_pushfstring(L, fmt, l) \
++  compat53_utf8_escape(L, l)
++#endif
++
++
++#ifdef ltablib_c
++#  define luaopen_table luaopen_compat53_table
++#  ifndef LUA_MAXINTEGER
++/* conservative estimate: */
++#    define LUA_MAXINTEGER INT_MAX
++#  endif
++#endif /* ltablib_c */
++
++
++#ifdef lstrlib_c
++#include <locale.h>
++#include <lualib.h>
++/* move the string library open function out of the way (we only take
++ * the string packing functions)!
++ */
++#  define luaopen_string luaopen_string_XXX
++/* used in string.format implementation, which we don't use: */
++#  ifndef LUA_INTEGER_FRMLEN
++#    define LUA_INTEGER_FRMLEN ""
++#    define LUA_NUMBER_FRMLEN ""
++#  endif
++#  ifndef LUA_MININTEGER
++#    define LUA_MININTEGER 0
++#  endif
++#  ifndef LUA_INTEGER_FMT
++#    define LUA_INTEGER_FMT "%d"
++#  endif
++#  ifndef LUAI_UACINT
++#    define LUAI_UACINT lua_Integer
++#  endif
++/* different Lua 5.3 versions have conflicting variants of this macro
++ * in luaconf.h, there's a fallback implementation in lstrlib.c, and
++ * the macro isn't used for string (un)packing anyway!
++ * */
++#  undef lua_number2strx
++#  if LUA_VERSION_NUM < 503
++/* lstrlib assumes that lua_Integer and lua_Unsigned have the same
++ * size, so we use the unsigned equivalent of ptrdiff_t! */
++#    define lua_Unsigned size_t
++#  endif
++#  ifndef l_mathlim
++#    ifdef LUA_NUMBER_DOUBLE
++#      define l_mathlim(n) (DBL_##n)
++#    else
++#      define l_mathlim(n) (FLT_##n)
++#    endif
++#  endif
++#  ifndef l_mathop
++#    ifdef LUA_NUMBER_DOUBLE
++#      define l_mathop(op) op
++#    else
++#      define l_mathop(op) op##f
++#    endif
++#  endif
++#  ifndef lua_getlocaledecpoint
++#    define lua_getlocaledecpoint() (localeconv()->decimal_point[0])
++#  endif
++#  ifndef l_sprintf
++#    if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
++#      define l_sprintf(s,sz,f,i) (snprintf(s, sz, f, i))
++#    else
++#      define l_sprintf(s,sz,f,i) ((void)(sz), sprintf(s, f, i))
++#    endif
++#  endif
++
++static int str_pack (lua_State *L);
++static int str_packsize (lua_State *L);
++static int str_unpack (lua_State *L);
++LUAMOD_API int luaopen_compat53_string (lua_State *L) {
++  luaL_Reg const funcs[] = {
++    { "pack", str_pack },
++    { "packsize", str_packsize },
++    { "unpack", str_unpack },
++    { NULL, NULL }
++  };
++  luaL_newlib(L, funcs);
++  return 1;
++}
++/* fake CLANG feature detection on other compilers */
++#  ifndef __has_attribute
++#    define __has_attribute(x) 0
++#  endif
++/* make luaopen_string(_XXX) static, so it (and all other referenced
++ * string functions) won't be included in the resulting dll
++ * (hopefully).
++ */
++#  undef LUAMOD_API
++#  if defined(__GNUC__) || __has_attribute(__unused__)
++#    define LUAMOD_API __attribute__((__unused__)) static
++#  else
++#    define LUAMOD_API static
++#  endif
++#endif /* lstrlib.c */
++
++#endif
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lstrlib.c luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lstrlib.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lstrlib.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lstrlib.c	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,1584 @@
++/*
++** $Id: lstrlib.c,v 1.254 2016/12/22 13:08:50 roberto Exp $
++** Standard library for string operations and pattern-matching
++** See Copyright Notice in lua.h
++*/
++
++#define lstrlib_c
++#define LUA_LIB
++
++#include "lprefix.h"
++
++
++#include <ctype.h>
++#include <float.h>
++#include <limits.h>
++#include <locale.h>
++#include <stddef.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include "lua.h"
++
++#include "lauxlib.h"
++#include "lualib.h"
++
++
++/*
++** maximum number of captures that a pattern can do during
++** pattern-matching. This limit is arbitrary, but must fit in
++** an unsigned char.
++*/
++#if !defined(LUA_MAXCAPTURES)
++#define LUA_MAXCAPTURES		32
++#endif
++
++
++/* macro to 'unsign' a character */
++#define uchar(c)	((unsigned char)(c))
++
++
++/*
++** Some sizes are better limited to fit in 'int', but must also fit in
++** 'size_t'. (We assume that 'lua_Integer' cannot be smaller than 'int'.)
++*/
++#define MAX_SIZET	((size_t)(~(size_t)0))
++
++#define MAXSIZE  \
++	(sizeof(size_t) < sizeof(int) ? MAX_SIZET : (size_t)(INT_MAX))
++
++
++
++
++static int str_len (lua_State *L) {
++  size_t l;
++  luaL_checklstring(L, 1, &l);
++  lua_pushinteger(L, (lua_Integer)l);
++  return 1;
++}
++
++
++/* translate a relative string position: negative means back from end */
++static lua_Integer posrelat (lua_Integer pos, size_t len) {
++  if (pos >= 0) return pos;
++  else if (0u - (size_t)pos > len) return 0;
++  else return (lua_Integer)len + pos + 1;
++}
++
++
++static int str_sub (lua_State *L) {
++  size_t l;
++  const char *s = luaL_checklstring(L, 1, &l);
++  lua_Integer start = posrelat(luaL_checkinteger(L, 2), l);
++  lua_Integer end = posrelat(luaL_optinteger(L, 3, -1), l);
++  if (start < 1) start = 1;
++  if (end > (lua_Integer)l) end = l;
++  if (start <= end)
++    lua_pushlstring(L, s + start - 1, (size_t)(end - start) + 1);
++  else lua_pushliteral(L, "");
++  return 1;
++}
++
++
++static int str_reverse (lua_State *L) {
++  size_t l, i;
++  luaL_Buffer b;
++  const char *s = luaL_checklstring(L, 1, &l);
++  char *p = luaL_buffinitsize(L, &b, l);
++  for (i = 0; i < l; i++)
++    p[i] = s[l - i - 1];
++  luaL_pushresultsize(&b, l);
++  return 1;
++}
++
++
++static int str_lower (lua_State *L) {
++  size_t l;
++  size_t i;
++  luaL_Buffer b;
++  const char *s = luaL_checklstring(L, 1, &l);
++  char *p = luaL_buffinitsize(L, &b, l);
++  for (i=0; i<l; i++)
++    p[i] = tolower(uchar(s[i]));
++  luaL_pushresultsize(&b, l);
++  return 1;
++}
++
++
++static int str_upper (lua_State *L) {
++  size_t l;
++  size_t i;
++  luaL_Buffer b;
++  const char *s = luaL_checklstring(L, 1, &l);
++  char *p = luaL_buffinitsize(L, &b, l);
++  for (i=0; i<l; i++)
++    p[i] = toupper(uchar(s[i]));
++  luaL_pushresultsize(&b, l);
++  return 1;
++}
++
++
++static int str_rep (lua_State *L) {
++  size_t l, lsep;
++  const char *s = luaL_checklstring(L, 1, &l);
++  lua_Integer n = luaL_checkinteger(L, 2);
++  const char *sep = luaL_optlstring(L, 3, "", &lsep);
++  if (n <= 0) lua_pushliteral(L, "");
++  else if (l + lsep < l || l + lsep > MAXSIZE / n)  /* may overflow? */
++    return luaL_error(L, "resulting string too large");
++  else {
++    size_t totallen = (size_t)n * l + (size_t)(n - 1) * lsep;
++    luaL_Buffer b;
++    char *p = luaL_buffinitsize(L, &b, totallen);
++    while (n-- > 1) {  /* first n-1 copies (followed by separator) */
++      memcpy(p, s, l * sizeof(char)); p += l;
++      if (lsep > 0) {  /* empty 'memcpy' is not that cheap */
++        memcpy(p, sep, lsep * sizeof(char));
++        p += lsep;
++      }
++    }
++    memcpy(p, s, l * sizeof(char));  /* last copy (not followed by separator) */
++    luaL_pushresultsize(&b, totallen);
++  }
++  return 1;
++}
++
++
++static int str_byte (lua_State *L) {
++  size_t l;
++  const char *s = luaL_checklstring(L, 1, &l);
++  lua_Integer posi = posrelat(luaL_optinteger(L, 2, 1), l);
++  lua_Integer pose = posrelat(luaL_optinteger(L, 3, posi), l);
++  int n, i;
++  if (posi < 1) posi = 1;
++  if (pose > (lua_Integer)l) pose = l;
++  if (posi > pose) return 0;  /* empty interval; return no values */
++  if (pose - posi >= INT_MAX)  /* arithmetic overflow? */
++    return luaL_error(L, "string slice too long");
++  n = (int)(pose -  posi) + 1;
++  luaL_checkstack(L, n, "string slice too long");
++  for (i=0; i<n; i++)
++    lua_pushinteger(L, uchar(s[posi+i-1]));
++  return n;
++}
++
++
++static int str_char (lua_State *L) {
++  int n = lua_gettop(L);  /* number of arguments */
++  int i;
++  luaL_Buffer b;
++  char *p = luaL_buffinitsize(L, &b, n);
++  for (i=1; i<=n; i++) {
++    lua_Integer c = luaL_checkinteger(L, i);
++    luaL_argcheck(L, uchar(c) == c, i, "value out of range");
++    p[i - 1] = uchar(c);
++  }
++  luaL_pushresultsize(&b, n);
++  return 1;
++}
++
++
++static int writer (lua_State *L, const void *b, size_t size, void *B) {
++  (void)L;
++  luaL_addlstring((luaL_Buffer *) B, (const char *)b, size);
++  return 0;
++}
++
++
++static int str_dump (lua_State *L) {
++  luaL_Buffer b;
++  int strip = lua_toboolean(L, 2);
++  luaL_checktype(L, 1, LUA_TFUNCTION);
++  lua_settop(L, 1);
++  luaL_buffinit(L,&b);
++  if (lua_dump(L, writer, &b, strip) != 0)
++    return luaL_error(L, "unable to dump given function");
++  luaL_pushresult(&b);
++  return 1;
++}
++
++
++
++/*
++** {======================================================
++** PATTERN MATCHING
++** =======================================================
++*/
++
++
++#define CAP_UNFINISHED	(-1)
++#define CAP_POSITION	(-2)
++
++
++typedef struct MatchState {
++  const char *src_init;  /* init of source string */
++  const char *src_end;  /* end ('\0') of source string */
++  const char *p_end;  /* end ('\0') of pattern */
++  lua_State *L;
++  int matchdepth;  /* control for recursive depth (to avoid C stack overflow) */
++  unsigned char level;  /* total number of captures (finished or unfinished) */
++  struct {
++    const char *init;
++    ptrdiff_t len;
++  } capture[LUA_MAXCAPTURES];
++} MatchState;
++
++
++/* recursive function */
++static const char *match (MatchState *ms, const char *s, const char *p);
++
++
++/* maximum recursion depth for 'match' */
++#if !defined(MAXCCALLS)
++#define MAXCCALLS	200
++#endif
++
++
++#define L_ESC		'%'
++#define SPECIALS	"^$*+?.([%-"
++
++
++static int check_capture (MatchState *ms, int l) {
++  l -= '1';
++  if (l < 0 || l >= ms->level || ms->capture[l].len == CAP_UNFINISHED)
++    return luaL_error(ms->L, "invalid capture index %%%d", l + 1);
++  return l;
++}
++
++
++static int capture_to_close (MatchState *ms) {
++  int level = ms->level;
++  for (level--; level>=0; level--)
++    if (ms->capture[level].len == CAP_UNFINISHED) return level;
++  return luaL_error(ms->L, "invalid pattern capture");
++}
++
++
++static const char *classend (MatchState *ms, const char *p) {
++  switch (*p++) {
++    case L_ESC: {
++      if (p == ms->p_end)
++        luaL_error(ms->L, "malformed pattern (ends with '%%')");
++      return p+1;
++    }
++    case '[': {
++      if (*p == '^') p++;
++      do {  /* look for a ']' */
++        if (p == ms->p_end)
++          luaL_error(ms->L, "malformed pattern (missing ']')");
++        if (*(p++) == L_ESC && p < ms->p_end)
++          p++;  /* skip escapes (e.g. '%]') */
++      } while (*p != ']');
++      return p+1;
++    }
++    default: {
++      return p;
++    }
++  }
++}
++
++
++static int match_class (int c, int cl) {
++  int res;
++  switch (tolower(cl)) {
++    case 'a' : res = isalpha(c); break;
++    case 'c' : res = iscntrl(c); break;
++    case 'd' : res = isdigit(c); break;
++    case 'g' : res = isgraph(c); break;
++    case 'l' : res = islower(c); break;
++    case 'p' : res = ispunct(c); break;
++    case 's' : res = isspace(c); break;
++    case 'u' : res = isupper(c); break;
++    case 'w' : res = isalnum(c); break;
++    case 'x' : res = isxdigit(c); break;
++    case 'z' : res = (c == 0); break;  /* deprecated option */
++    default: return (cl == c);
++  }
++  return (islower(cl) ? res : !res);
++}
++
++
++static int matchbracketclass (int c, const char *p, const char *ec) {
++  int sig = 1;
++  if (*(p+1) == '^') {
++    sig = 0;
++    p++;  /* skip the '^' */
++  }
++  while (++p < ec) {
++    if (*p == L_ESC) {
++      p++;
++      if (match_class(c, uchar(*p)))
++        return sig;
++    }
++    else if ((*(p+1) == '-') && (p+2 < ec)) {
++      p+=2;
++      if (uchar(*(p-2)) <= c && c <= uchar(*p))
++        return sig;
++    }
++    else if (uchar(*p) == c) return sig;
++  }
++  return !sig;
++}
++
++
++static int singlematch (MatchState *ms, const char *s, const char *p,
++                        const char *ep) {
++  if (s >= ms->src_end)
++    return 0;
++  else {
++    int c = uchar(*s);
++    switch (*p) {
++      case '.': return 1;  /* matches any char */
++      case L_ESC: return match_class(c, uchar(*(p+1)));
++      case '[': return matchbracketclass(c, p, ep-1);
++      default:  return (uchar(*p) == c);
++    }
++  }
++}
++
++
++static const char *matchbalance (MatchState *ms, const char *s,
++                                   const char *p) {
++  if (p >= ms->p_end - 1)
++    luaL_error(ms->L, "malformed pattern (missing arguments to '%%b')");
++  if (*s != *p) return NULL;
++  else {
++    int b = *p;
++    int e = *(p+1);
++    int cont = 1;
++    while (++s < ms->src_end) {
++      if (*s == e) {
++        if (--cont == 0) return s+1;
++      }
++      else if (*s == b) cont++;
++    }
++  }
++  return NULL;  /* string ends out of balance */
++}
++
++
++static const char *max_expand (MatchState *ms, const char *s,
++                                 const char *p, const char *ep) {
++  ptrdiff_t i = 0;  /* counts maximum expand for item */
++  while (singlematch(ms, s + i, p, ep))
++    i++;
++  /* keeps trying to match with the maximum repetitions */
++  while (i>=0) {
++    const char *res = match(ms, (s+i), ep+1);
++    if (res) return res;
++    i--;  /* else didn't match; reduce 1 repetition to try again */
++  }
++  return NULL;
++}
++
++
++static const char *min_expand (MatchState *ms, const char *s,
++                                 const char *p, const char *ep) {
++  for (;;) {
++    const char *res = match(ms, s, ep+1);
++    if (res != NULL)
++      return res;
++    else if (singlematch(ms, s, p, ep))
++      s++;  /* try with one more repetition */
++    else return NULL;
++  }
++}
++
++
++static const char *start_capture (MatchState *ms, const char *s,
++                                    const char *p, int what) {
++  const char *res;
++  int level = ms->level;
++  if (level >= LUA_MAXCAPTURES) luaL_error(ms->L, "too many captures");
++  ms->capture[level].init = s;
++  ms->capture[level].len = what;
++  ms->level = level+1;
++  if ((res=match(ms, s, p)) == NULL)  /* match failed? */
++    ms->level--;  /* undo capture */
++  return res;
++}
++
++
++static const char *end_capture (MatchState *ms, const char *s,
++                                  const char *p) {
++  int l = capture_to_close(ms);
++  const char *res;
++  ms->capture[l].len = s - ms->capture[l].init;  /* close capture */
++  if ((res = match(ms, s, p)) == NULL)  /* match failed? */
++    ms->capture[l].len = CAP_UNFINISHED;  /* undo capture */
++  return res;
++}
++
++
++static const char *match_capture (MatchState *ms, const char *s, int l) {
++  size_t len;
++  l = check_capture(ms, l);
++  len = ms->capture[l].len;
++  if ((size_t)(ms->src_end-s) >= len &&
++      memcmp(ms->capture[l].init, s, len) == 0)
++    return s+len;
++  else return NULL;
++}
++
++
++static const char *match (MatchState *ms, const char *s, const char *p) {
++  if (ms->matchdepth-- == 0)
++    luaL_error(ms->L, "pattern too complex");
++  init: /* using goto's to optimize tail recursion */
++  if (p != ms->p_end) {  /* end of pattern? */
++    switch (*p) {
++      case '(': {  /* start capture */
++        if (*(p + 1) == ')')  /* position capture? */
++          s = start_capture(ms, s, p + 2, CAP_POSITION);
++        else
++          s = start_capture(ms, s, p + 1, CAP_UNFINISHED);
++        break;
++      }
++      case ')': {  /* end capture */
++        s = end_capture(ms, s, p + 1);
++        break;
++      }
++      case '$': {
++        if ((p + 1) != ms->p_end)  /* is the '$' the last char in pattern? */
++          goto dflt;  /* no; go to default */
++        s = (s == ms->src_end) ? s : NULL;  /* check end of string */
++        break;
++      }
++      case L_ESC: {  /* escaped sequences not in the format class[*+?-]? */
++        switch (*(p + 1)) {
++          case 'b': {  /* balanced string? */
++            s = matchbalance(ms, s, p + 2);
++            if (s != NULL) {
++              p += 4; goto init;  /* return match(ms, s, p + 4); */
++            }  /* else fail (s == NULL) */
++            break;
++          }
++          case 'f': {  /* frontier? */
++            const char *ep; char previous;
++            p += 2;
++            if (*p != '[')
++              luaL_error(ms->L, "missing '[' after '%%f' in pattern");
++            ep = classend(ms, p);  /* points to what is next */
++            previous = (s == ms->src_init) ? '\0' : *(s - 1);
++            if (!matchbracketclass(uchar(previous), p, ep - 1) &&
++               matchbracketclass(uchar(*s), p, ep - 1)) {
++              p = ep; goto init;  /* return match(ms, s, ep); */
++            }
++            s = NULL;  /* match failed */
++            break;
++          }
++          case '0': case '1': case '2': case '3':
++          case '4': case '5': case '6': case '7':
++          case '8': case '9': {  /* capture results (%0-%9)? */
++            s = match_capture(ms, s, uchar(*(p + 1)));
++            if (s != NULL) {
++              p += 2; goto init;  /* return match(ms, s, p + 2) */
++            }
++            break;
++          }
++          default: goto dflt;
++        }
++        break;
++      }
++      default: dflt: {  /* pattern class plus optional suffix */
++        const char *ep = classend(ms, p);  /* points to optional suffix */
++        /* does not match at least once? */
++        if (!singlematch(ms, s, p, ep)) {
++          if (*ep == '*' || *ep == '?' || *ep == '-') {  /* accept empty? */
++            p = ep + 1; goto init;  /* return match(ms, s, ep + 1); */
++          }
++          else  /* '+' or no suffix */
++            s = NULL;  /* fail */
++        }
++        else {  /* matched once */
++          switch (*ep) {  /* handle optional suffix */
++            case '?': {  /* optional */
++              const char *res;
++              if ((res = match(ms, s + 1, ep + 1)) != NULL)
++                s = res;
++              else {
++                p = ep + 1; goto init;  /* else return match(ms, s, ep + 1); */
++              }
++              break;
++            }
++            case '+':  /* 1 or more repetitions */
++              s++;  /* 1 match already done */
++              /* FALLTHROUGH */
++            case '*':  /* 0 or more repetitions */
++              s = max_expand(ms, s, p, ep);
++              break;
++            case '-':  /* 0 or more repetitions (minimum) */
++              s = min_expand(ms, s, p, ep);
++              break;
++            default:  /* no suffix */
++              s++; p = ep; goto init;  /* return match(ms, s + 1, ep); */
++          }
++        }
++        break;
++      }
++    }
++  }
++  ms->matchdepth++;
++  return s;
++}
++
++
++
++static const char *lmemfind (const char *s1, size_t l1,
++                               const char *s2, size_t l2) {
++  if (l2 == 0) return s1;  /* empty strings are everywhere */
++  else if (l2 > l1) return NULL;  /* avoids a negative 'l1' */
++  else {
++    const char *init;  /* to search for a '*s2' inside 's1' */
++    l2--;  /* 1st char will be checked by 'memchr' */
++    l1 = l1-l2;  /* 's2' cannot be found after that */
++    while (l1 > 0 && (init = (const char *)memchr(s1, *s2, l1)) != NULL) {
++      init++;   /* 1st char is already checked */
++      if (memcmp(init, s2+1, l2) == 0)
++        return init-1;
++      else {  /* correct 'l1' and 's1' to try again */
++        l1 -= init-s1;
++        s1 = init;
++      }
++    }
++    return NULL;  /* not found */
++  }
++}
++
++
++static void push_onecapture (MatchState *ms, int i, const char *s,
++                                                    const char *e) {
++  if (i >= ms->level) {
++    if (i == 0)  /* ms->level == 0, too */
++      lua_pushlstring(ms->L, s, e - s);  /* add whole match */
++    else
++      luaL_error(ms->L, "invalid capture index %%%d", i + 1);
++  }
++  else {
++    ptrdiff_t l = ms->capture[i].len;
++    if (l == CAP_UNFINISHED) luaL_error(ms->L, "unfinished capture");
++    if (l == CAP_POSITION)
++      lua_pushinteger(ms->L, (ms->capture[i].init - ms->src_init) + 1);
++    else
++      lua_pushlstring(ms->L, ms->capture[i].init, l);
++  }
++}
++
++
++static int push_captures (MatchState *ms, const char *s, const char *e) {
++  int i;
++  int nlevels = (ms->level == 0 && s) ? 1 : ms->level;
++  luaL_checkstack(ms->L, nlevels, "too many captures");
++  for (i = 0; i < nlevels; i++)
++    push_onecapture(ms, i, s, e);
++  return nlevels;  /* number of strings pushed */
++}
++
++
++/* check whether pattern has no special characters */
++static int nospecials (const char *p, size_t l) {
++  size_t upto = 0;
++  do {
++    if (strpbrk(p + upto, SPECIALS))
++      return 0;  /* pattern has a special character */
++    upto += strlen(p + upto) + 1;  /* may have more after \0 */
++  } while (upto <= l);
++  return 1;  /* no special chars found */
++}
++
++
++static void prepstate (MatchState *ms, lua_State *L,
++                       const char *s, size_t ls, const char *p, size_t lp) {
++  ms->L = L;
++  ms->matchdepth = MAXCCALLS;
++  ms->src_init = s;
++  ms->src_end = s + ls;
++  ms->p_end = p + lp;
++}
++
++
++static void reprepstate (MatchState *ms) {
++  ms->level = 0;
++  lua_assert(ms->matchdepth == MAXCCALLS);
++}
++
++
++static int str_find_aux (lua_State *L, int find) {
++  size_t ls, lp;
++  const char *s = luaL_checklstring(L, 1, &ls);
++  const char *p = luaL_checklstring(L, 2, &lp);
++  lua_Integer init = posrelat(luaL_optinteger(L, 3, 1), ls);
++  if (init < 1) init = 1;
++  else if (init > (lua_Integer)ls + 1) {  /* start after string's end? */
++    lua_pushnil(L);  /* cannot find anything */
++    return 1;
++  }
++  /* explicit request or no special characters? */
++  if (find && (lua_toboolean(L, 4) || nospecials(p, lp))) {
++    /* do a plain search */
++    const char *s2 = lmemfind(s + init - 1, ls - (size_t)init + 1, p, lp);
++    if (s2) {
++      lua_pushinteger(L, (s2 - s) + 1);
++      lua_pushinteger(L, (s2 - s) + lp);
++      return 2;
++    }
++  }
++  else {
++    MatchState ms;
++    const char *s1 = s + init - 1;
++    int anchor = (*p == '^');
++    if (anchor) {
++      p++; lp--;  /* skip anchor character */
++    }
++    prepstate(&ms, L, s, ls, p, lp);
++    do {
++      const char *res;
++      reprepstate(&ms);
++      if ((res=match(&ms, s1, p)) != NULL) {
++        if (find) {
++          lua_pushinteger(L, (s1 - s) + 1);  /* start */
++          lua_pushinteger(L, res - s);   /* end */
++          return push_captures(&ms, NULL, 0) + 2;
++        }
++        else
++          return push_captures(&ms, s1, res);
++      }
++    } while (s1++ < ms.src_end && !anchor);
++  }
++  lua_pushnil(L);  /* not found */
++  return 1;
++}
++
++
++static int str_find (lua_State *L) {
++  return str_find_aux(L, 1);
++}
++
++
++static int str_match (lua_State *L) {
++  return str_find_aux(L, 0);
++}
++
++
++/* state for 'gmatch' */
++typedef struct GMatchState {
++  const char *src;  /* current position */
++  const char *p;  /* pattern */
++  const char *lastmatch;  /* end of last match */
++  MatchState ms;  /* match state */
++} GMatchState;
++
++
++static int gmatch_aux (lua_State *L) {
++  GMatchState *gm = (GMatchState *)lua_touserdata(L, lua_upvalueindex(3));
++  const char *src;
++  gm->ms.L = L;
++  for (src = gm->src; src <= gm->ms.src_end; src++) {
++    const char *e;
++    reprepstate(&gm->ms);
++    if ((e = match(&gm->ms, src, gm->p)) != NULL && e != gm->lastmatch) {
++      gm->src = gm->lastmatch = e;
++      return push_captures(&gm->ms, src, e);
++    }
++  }
++  return 0;  /* not found */
++}
++
++
++static int gmatch (lua_State *L) {
++  size_t ls, lp;
++  const char *s = luaL_checklstring(L, 1, &ls);
++  const char *p = luaL_checklstring(L, 2, &lp);
++  GMatchState *gm;
++  lua_settop(L, 2);  /* keep them on closure to avoid being collected */
++  gm = (GMatchState *)lua_newuserdata(L, sizeof(GMatchState));
++  prepstate(&gm->ms, L, s, ls, p, lp);
++  gm->src = s; gm->p = p; gm->lastmatch = NULL;
++  lua_pushcclosure(L, gmatch_aux, 3);
++  return 1;
++}
++
++
++static void add_s (MatchState *ms, luaL_Buffer *b, const char *s,
++                                                   const char *e) {
++  size_t l, i;
++  lua_State *L = ms->L;
++  const char *news = lua_tolstring(L, 3, &l);
++  for (i = 0; i < l; i++) {
++    if (news[i] != L_ESC)
++      luaL_addchar(b, news[i]);
++    else {
++      i++;  /* skip ESC */
++      if (!isdigit(uchar(news[i]))) {
++        if (news[i] != L_ESC)
++          luaL_error(L, "invalid use of '%c' in replacement string", L_ESC);
++        luaL_addchar(b, news[i]);
++      }
++      else if (news[i] == '0')
++          luaL_addlstring(b, s, e - s);
++      else {
++        push_onecapture(ms, news[i] - '1', s, e);
++        luaL_tolstring(L, -1, NULL);  /* if number, convert it to string */
++        lua_remove(L, -2);  /* remove original value */
++        luaL_addvalue(b);  /* add capture to accumulated result */
++      }
++    }
++  }
++}
++
++
++static void add_value (MatchState *ms, luaL_Buffer *b, const char *s,
++                                       const char *e, int tr) {
++  lua_State *L = ms->L;
++  switch (tr) {
++    case LUA_TFUNCTION: {
++      int n;
++      lua_pushvalue(L, 3);
++      n = push_captures(ms, s, e);
++      lua_call(L, n, 1);
++      break;
++    }
++    case LUA_TTABLE: {
++      push_onecapture(ms, 0, s, e);
++      lua_gettable(L, 3);
++      break;
++    }
++    default: {  /* LUA_TNUMBER or LUA_TSTRING */
++      add_s(ms, b, s, e);
++      return;
++    }
++  }
++  if (!lua_toboolean(L, -1)) {  /* nil or false? */
++    lua_pop(L, 1);
++    lua_pushlstring(L, s, e - s);  /* keep original text */
++  }
++  else if (!lua_isstring(L, -1))
++    luaL_error(L, "invalid replacement value (a %s)", luaL_typename(L, -1));
++  luaL_addvalue(b);  /* add result to accumulator */
++}
++
++
++static int str_gsub (lua_State *L) {
++  size_t srcl, lp;
++  const char *src = luaL_checklstring(L, 1, &srcl);  /* subject */
++  const char *p = luaL_checklstring(L, 2, &lp);  /* pattern */
++  const char *lastmatch = NULL;  /* end of last match */
++  int tr = lua_type(L, 3);  /* replacement type */
++  lua_Integer max_s = luaL_optinteger(L, 4, srcl + 1);  /* max replacements */
++  int anchor = (*p == '^');
++  lua_Integer n = 0;  /* replacement count */
++  MatchState ms;
++  luaL_Buffer b;
++  luaL_argcheck(L, tr == LUA_TNUMBER || tr == LUA_TSTRING ||
++                   tr == LUA_TFUNCTION || tr == LUA_TTABLE, 3,
++                      "string/function/table expected");
++  luaL_buffinit(L, &b);
++  if (anchor) {
++    p++; lp--;  /* skip anchor character */
++  }
++  prepstate(&ms, L, src, srcl, p, lp);
++  while (n < max_s) {
++    const char *e;
++    reprepstate(&ms);  /* (re)prepare state for new match */
++    if ((e = match(&ms, src, p)) != NULL && e != lastmatch) {  /* match? */
++      n++;
++      add_value(&ms, &b, src, e, tr);  /* add replacement to buffer */
++      src = lastmatch = e;
++    }
++    else if (src < ms.src_end)  /* otherwise, skip one character */
++      luaL_addchar(&b, *src++);
++    else break;  /* end of subject */
++    if (anchor) break;
++  }
++  luaL_addlstring(&b, src, ms.src_end-src);
++  luaL_pushresult(&b);
++  lua_pushinteger(L, n);  /* number of substitutions */
++  return 2;
++}
++
++/* }====================================================== */
++
++
++
++/*
++** {======================================================
++** STRING FORMAT
++** =======================================================
++*/
++
++#if !defined(lua_number2strx)	/* { */
++
++/*
++** Hexadecimal floating-point formatter
++*/
++
++#include <math.h>
++
++#define SIZELENMOD	(sizeof(LUA_NUMBER_FRMLEN)/sizeof(char))
++
++
++/*
++** Number of bits that goes into the first digit. It can be any value
++** between 1 and 4; the following definition tries to align the number
++** to nibble boundaries by making what is left after that first digit a
++** multiple of 4.
++*/
++#define L_NBFD		((l_mathlim(MANT_DIG) - 1)%4 + 1)
++
++
++/*
++** Add integer part of 'x' to buffer and return new 'x'
++*/
++static lua_Number adddigit (char *buff, int n, lua_Number x) {
++  lua_Number dd = l_mathop(floor)(x);  /* get integer part from 'x' */
++  int d = (int)dd;
++  buff[n] = (d < 10 ? d + '0' : d - 10 + 'a');  /* add to buffer */
++  return x - dd;  /* return what is left */
++}
++
++
++static int num2straux (char *buff, int sz, lua_Number x) {
++  /* if 'inf' or 'NaN', format it like '%g' */
++  if (x != x || x == (lua_Number)HUGE_VAL || x == -(lua_Number)HUGE_VAL)
++    return l_sprintf(buff, sz, LUA_NUMBER_FMT, (LUAI_UACNUMBER)x);
++  else if (x == 0) {  /* can be -0... */
++    /* create "0" or "-0" followed by exponent */
++    return l_sprintf(buff, sz, LUA_NUMBER_FMT "x0p+0", (LUAI_UACNUMBER)x);
++  }
++  else {
++    int e;
++    lua_Number m = l_mathop(frexp)(x, &e);  /* 'x' fraction and exponent */
++    int n = 0;  /* character count */
++    if (m < 0) {  /* is number negative? */
++      buff[n++] = '-';  /* add signal */
++      m = -m;  /* make it positive */
++    }
++    buff[n++] = '0'; buff[n++] = 'x';  /* add "0x" */
++    m = adddigit(buff, n++, m * (1 << L_NBFD));  /* add first digit */
++    e -= L_NBFD;  /* this digit goes before the radix point */
++    if (m > 0) {  /* more digits? */
++      buff[n++] = lua_getlocaledecpoint();  /* add radix point */
++      do {  /* add as many digits as needed */
++        m = adddigit(buff, n++, m * 16);
++      } while (m > 0);
++    }
++    n += l_sprintf(buff + n, sz - n, "p%+d", e);  /* add exponent */
++    lua_assert(n < sz);
++    return n;
++  }
++}
++
++
++static int lua_number2strx (lua_State *L, char *buff, int sz,
++                            const char *fmt, lua_Number x) {
++  int n = num2straux(buff, sz, x);
++  if (fmt[SIZELENMOD] == 'A') {
++    int i;
++    for (i = 0; i < n; i++)
++      buff[i] = toupper(uchar(buff[i]));
++  }
++  else if (fmt[SIZELENMOD] != 'a')
++    luaL_error(L, "modifiers for format '%%a'/'%%A' not implemented");
++  return n;
++}
++
++#endif				/* } */
++
++
++/*
++** Maximum size of each formatted item. This maximum size is produced
++** by format('%.99f', -maxfloat), and is equal to 99 + 3 ('-', '.',
++** and '\0') + number of decimal digits to represent maxfloat (which
++** is maximum exponent + 1). (99+3+1 then rounded to 120 for "extra
++** expenses", such as locale-dependent stuff)
++*/
++#define MAX_ITEM        (120 + l_mathlim(MAX_10_EXP))
++
++
++/* valid flags in a format specification */
++#define FLAGS	"-+ #0"
++
++/*
++** maximum size of each format specification (such as "%-099.99d")
++*/
++#define MAX_FORMAT	32
++
++
++static void addquoted (luaL_Buffer *b, const char *s, size_t len) {
++  luaL_addchar(b, '"');
++  while (len--) {
++    if (*s == '"' || *s == '\\' || *s == '\n') {
++      luaL_addchar(b, '\\');
++      luaL_addchar(b, *s);
++    }
++    else if (iscntrl(uchar(*s))) {
++      char buff[10];
++      if (!isdigit(uchar(*(s+1))))
++        l_sprintf(buff, sizeof(buff), "\\%d", (int)uchar(*s));
++      else
++        l_sprintf(buff, sizeof(buff), "\\%03d", (int)uchar(*s));
++      luaL_addstring(b, buff);
++    }
++    else
++      luaL_addchar(b, *s);
++    s++;
++  }
++  luaL_addchar(b, '"');
++}
++
++
++/*
++** Ensures the 'buff' string uses a dot as the radix character.
++*/
++static void checkdp (char *buff, int nb) {
++  if (memchr(buff, '.', nb) == NULL) {  /* no dot? */
++    char point = lua_getlocaledecpoint();  /* try locale point */
++    char *ppoint = (char *)memchr(buff, point, nb);
++    if (ppoint) *ppoint = '.';  /* change it to a dot */
++  }
++}
++
++
++static void addliteral (lua_State *L, luaL_Buffer *b, int arg) {
++  switch (lua_type(L, arg)) {
++    case LUA_TSTRING: {
++      size_t len;
++      const char *s = lua_tolstring(L, arg, &len);
++      addquoted(b, s, len);
++      break;
++    }
++    case LUA_TNUMBER: {
++      char *buff = luaL_prepbuffsize(b, MAX_ITEM);
++      int nb;
++      if (!lua_isinteger(L, arg)) {  /* float? */
++        lua_Number n = lua_tonumber(L, arg);  /* write as hexa ('%a') */
++        nb = lua_number2strx(L, buff, MAX_ITEM, "%" LUA_NUMBER_FRMLEN "a", n);
++        checkdp(buff, nb);  /* ensure it uses a dot */
++      }
++      else {  /* integers */
++        lua_Integer n = lua_tointeger(L, arg);
++        const char *format = (n == LUA_MININTEGER)  /* corner case? */
++                           ? "0x%" LUA_INTEGER_FRMLEN "x"  /* use hexa */
++                           : LUA_INTEGER_FMT;  /* else use default format */
++        nb = l_sprintf(buff, MAX_ITEM, format, (LUAI_UACINT)n);
++      }
++      luaL_addsize(b, nb);
++      break;
++    }
++    case LUA_TNIL: case LUA_TBOOLEAN: {
++      luaL_tolstring(L, arg, NULL);
++      luaL_addvalue(b);
++      break;
++    }
++    default: {
++      luaL_argerror(L, arg, "value has no literal form");
++    }
++  }
++}
++
++
++static const char *scanformat (lua_State *L, const char *strfrmt, char *form) {
++  const char *p = strfrmt;
++  while (*p != '\0' && strchr(FLAGS, *p) != NULL) p++;  /* skip flags */
++  if ((size_t)(p - strfrmt) >= sizeof(FLAGS)/sizeof(char))
++    luaL_error(L, "invalid format (repeated flags)");
++  if (isdigit(uchar(*p))) p++;  /* skip width */
++  if (isdigit(uchar(*p))) p++;  /* (2 digits at most) */
++  if (*p == '.') {
++    p++;
++    if (isdigit(uchar(*p))) p++;  /* skip precision */
++    if (isdigit(uchar(*p))) p++;  /* (2 digits at most) */
++  }
++  if (isdigit(uchar(*p)))
++    luaL_error(L, "invalid format (width or precision too long)");
++  *(form++) = '%';
++  memcpy(form, strfrmt, ((p - strfrmt) + 1) * sizeof(char));
++  form += (p - strfrmt) + 1;
++  *form = '\0';
++  return p;
++}
++
++
++/*
++** add length modifier into formats
++*/
++static void addlenmod (char *form, const char *lenmod) {
++  size_t l = strlen(form);
++  size_t lm = strlen(lenmod);
++  char spec = form[l - 1];
++  strcpy(form + l - 1, lenmod);
++  form[l + lm - 1] = spec;
++  form[l + lm] = '\0';
++}
++
++
++static int str_format (lua_State *L) {
++  int top = lua_gettop(L);
++  int arg = 1;
++  size_t sfl;
++  const char *strfrmt = luaL_checklstring(L, arg, &sfl);
++  const char *strfrmt_end = strfrmt+sfl;
++  luaL_Buffer b;
++  luaL_buffinit(L, &b);
++  while (strfrmt < strfrmt_end) {
++    if (*strfrmt != L_ESC)
++      luaL_addchar(&b, *strfrmt++);
++    else if (*++strfrmt == L_ESC)
++      luaL_addchar(&b, *strfrmt++);  /* %% */
++    else { /* format item */
++      char form[MAX_FORMAT];  /* to store the format ('%...') */
++      char *buff = luaL_prepbuffsize(&b, MAX_ITEM);  /* to put formatted item */
++      int nb = 0;  /* number of bytes in added item */
++      if (++arg > top)
++        luaL_argerror(L, arg, "no value");
++      strfrmt = scanformat(L, strfrmt, form);
++      switch (*strfrmt++) {
++        case 'c': {
++          nb = l_sprintf(buff, MAX_ITEM, form, (int)luaL_checkinteger(L, arg));
++          break;
++        }
++        case 'd': case 'i':
++        case 'o': case 'u': case 'x': case 'X': {
++          lua_Integer n = luaL_checkinteger(L, arg);
++          addlenmod(form, LUA_INTEGER_FRMLEN);
++          nb = l_sprintf(buff, MAX_ITEM, form, (LUAI_UACINT)n);
++          break;
++        }
++        case 'a': case 'A':
++          addlenmod(form, LUA_NUMBER_FRMLEN);
++          nb = lua_number2strx(L, buff, MAX_ITEM, form,
++                                  luaL_checknumber(L, arg));
++          break;
++        case 'e': case 'E': case 'f':
++        case 'g': case 'G': {
++          lua_Number n = luaL_checknumber(L, arg);
++          addlenmod(form, LUA_NUMBER_FRMLEN);
++          nb = l_sprintf(buff, MAX_ITEM, form, (LUAI_UACNUMBER)n);
++          break;
++        }
++        case 'q': {
++          addliteral(L, &b, arg);
++          break;
++        }
++        case 's': {
++          size_t l;
++          const char *s = luaL_tolstring(L, arg, &l);
++          if (form[2] == '\0')  /* no modifiers? */
++            luaL_addvalue(&b);  /* keep entire string */
++          else {
++            luaL_argcheck(L, l == strlen(s), arg, "string contains zeros");
++            if (!strchr(form, '.') && l >= 100) {
++              /* no precision and string is too long to be formatted */
++              luaL_addvalue(&b);  /* keep entire string */
++            }
++            else {  /* format the string into 'buff' */
++              nb = l_sprintf(buff, MAX_ITEM, form, s);
++              lua_pop(L, 1);  /* remove result from 'luaL_tolstring' */
++            }
++          }
++          break;
++        }
++        default: {  /* also treat cases 'pnLlh' */
++          return luaL_error(L, "invalid option '%%%c' to 'format'",
++                               *(strfrmt - 1));
++        }
++      }
++      lua_assert(nb < MAX_ITEM);
++      luaL_addsize(&b, nb);
++    }
++  }
++  luaL_pushresult(&b);
++  return 1;
++}
++
++/* }====================================================== */
++
++
++/*
++** {======================================================
++** PACK/UNPACK
++** =======================================================
++*/
++
++
++/* value used for padding */
++#if !defined(LUAL_PACKPADBYTE)
++#define LUAL_PACKPADBYTE		0x00
++#endif
++
++/* maximum size for the binary representation of an integer */
++#define MAXINTSIZE	16
++
++/* number of bits in a character */
++#define NB	CHAR_BIT
++
++/* mask for one character (NB 1's) */
++#define MC	((1 << NB) - 1)
++
++/* size of a lua_Integer */
++#define SZINT	((int)sizeof(lua_Integer))
++
++
++/* dummy union to get native endianness */
++static const union {
++  int dummy;
++  char little;  /* true iff machine is little endian */
++} nativeendian = {1};
++
++
++/* dummy structure to get native alignment requirements */
++struct cD {
++  char c;
++  union { double d; void *p; lua_Integer i; lua_Number n; } u;
++};
++
++#define MAXALIGN	(offsetof(struct cD, u))
++
++
++/*
++** Union for serializing floats
++*/
++typedef union Ftypes {
++  float f;
++  double d;
++  lua_Number n;
++  char buff[5 * sizeof(lua_Number)];  /* enough for any float type */
++} Ftypes;
++
++
++/*
++** information to pack/unpack stuff
++*/
++typedef struct Header {
++  lua_State *L;
++  int islittle;
++  int maxalign;
++} Header;
++
++
++/*
++** options for pack/unpack
++*/
++typedef enum KOption {
++  Kint,		/* signed integers */
++  Kuint,	/* unsigned integers */
++  Kfloat,	/* floating-point numbers */
++  Kchar,	/* fixed-length strings */
++  Kstring,	/* strings with prefixed length */
++  Kzstr,	/* zero-terminated strings */
++  Kpadding,	/* padding */
++  Kpaddalign,	/* padding for alignment */
++  Knop		/* no-op (configuration or spaces) */
++} KOption;
++
++
++/*
++** Read an integer numeral from string 'fmt' or return 'df' if
++** there is no numeral
++*/
++static int digit (int c) { return '0' <= c && c <= '9'; }
++
++static int getnum (const char **fmt, int df) {
++  if (!digit(**fmt))  /* no number? */
++    return df;  /* return default value */
++  else {
++    int a = 0;
++    do {
++      a = a*10 + (*((*fmt)++) - '0');
++    } while (digit(**fmt) && a <= ((int)MAXSIZE - 9)/10);
++    return a;
++  }
++}
++
++
++/*
++** Read an integer numeral and raises an error if it is larger
++** than the maximum size for integers.
++*/
++static int getnumlimit (Header *h, const char **fmt, int df) {
++  int sz = getnum(fmt, df);
++  if (sz > MAXINTSIZE || sz <= 0)
++    luaL_error(h->L, "integral size (%d) out of limits [1,%d]",
++                     sz, MAXINTSIZE);
++  return sz;
++}
++
++
++/*
++** Initialize Header
++*/
++static void initheader (lua_State *L, Header *h) {
++  h->L = L;
++  h->islittle = nativeendian.little;
++  h->maxalign = 1;
++}
++
++
++/*
++** Read and classify next option. 'size' is filled with option's size.
++*/
++static KOption getoption (Header *h, const char **fmt, int *size) {
++  int opt = *((*fmt)++);
++  *size = 0;  /* default */
++  switch (opt) {
++    case 'b': *size = sizeof(char); return Kint;
++    case 'B': *size = sizeof(char); return Kuint;
++    case 'h': *size = sizeof(short); return Kint;
++    case 'H': *size = sizeof(short); return Kuint;
++    case 'l': *size = sizeof(long); return Kint;
++    case 'L': *size = sizeof(long); return Kuint;
++    case 'j': *size = sizeof(lua_Integer); return Kint;
++    case 'J': *size = sizeof(lua_Integer); return Kuint;
++    case 'T': *size = sizeof(size_t); return Kuint;
++    case 'f': *size = sizeof(float); return Kfloat;
++    case 'd': *size = sizeof(double); return Kfloat;
++    case 'n': *size = sizeof(lua_Number); return Kfloat;
++    case 'i': *size = getnumlimit(h, fmt, sizeof(int)); return Kint;
++    case 'I': *size = getnumlimit(h, fmt, sizeof(int)); return Kuint;
++    case 's': *size = getnumlimit(h, fmt, sizeof(size_t)); return Kstring;
++    case 'c':
++      *size = getnum(fmt, -1);
++      if (*size == -1)
++        luaL_error(h->L, "missing size for format option 'c'");
++      return Kchar;
++    case 'z': return Kzstr;
++    case 'x': *size = 1; return Kpadding;
++    case 'X': return Kpaddalign;
++    case ' ': break;
++    case '<': h->islittle = 1; break;
++    case '>': h->islittle = 0; break;
++    case '=': h->islittle = nativeendian.little; break;
++    case '!': h->maxalign = getnumlimit(h, fmt, MAXALIGN); break;
++    default: luaL_error(h->L, "invalid format option '%c'", opt);
++  }
++  return Knop;
++}
++
++
++/*
++** Read, classify, and fill other details about the next option.
++** 'psize' is filled with option's size, 'notoalign' with its
++** alignment requirements.
++** Local variable 'size' gets the size to be aligned. (Kpadal option
++** always gets its full alignment, other options are limited by
++** the maximum alignment ('maxalign'). Kchar option needs no alignment
++** despite its size.
++*/
++static KOption getdetails (Header *h, size_t totalsize,
++                           const char **fmt, int *psize, int *ntoalign) {
++  KOption opt = getoption(h, fmt, psize);
++  int align = *psize;  /* usually, alignment follows size */
++  if (opt == Kpaddalign) {  /* 'X' gets alignment from following option */
++    if (**fmt == '\0' || getoption(h, fmt, &align) == Kchar || align == 0)
++      luaL_argerror(h->L, 1, "invalid next option for option 'X'");
++  }
++  if (align <= 1 || opt == Kchar)  /* need no alignment? */
++    *ntoalign = 0;
++  else {
++    if (align > h->maxalign)  /* enforce maximum alignment */
++      align = h->maxalign;
++    if ((align & (align - 1)) != 0)  /* is 'align' not a power of 2? */
++      luaL_argerror(h->L, 1, "format asks for alignment not power of 2");
++    *ntoalign = (align - (int)(totalsize & (align - 1))) & (align - 1);
++  }
++  return opt;
++}
++
++
++/*
++** Pack integer 'n' with 'size' bytes and 'islittle' endianness.
++** The final 'if' handles the case when 'size' is larger than
++** the size of a Lua integer, correcting the extra sign-extension
++** bytes if necessary (by default they would be zeros).
++*/
++static void packint (luaL_Buffer *b, lua_Unsigned n,
++                     int islittle, int size, int neg) {
++  char *buff = luaL_prepbuffsize(b, size);
++  int i;
++  buff[islittle ? 0 : size - 1] = (char)(n & MC);  /* first byte */
++  for (i = 1; i < size; i++) {
++    n >>= NB;
++    buff[islittle ? i : size - 1 - i] = (char)(n & MC);
++  }
++  if (neg && size > SZINT) {  /* negative number need sign extension? */
++    for (i = SZINT; i < size; i++)  /* correct extra bytes */
++      buff[islittle ? i : size - 1 - i] = (char)MC;
++  }
++  luaL_addsize(b, size);  /* add result to buffer */
++}
++
++
++/*
++** Copy 'size' bytes from 'src' to 'dest', correcting endianness if
++** given 'islittle' is different from native endianness.
++*/
++static void copywithendian (volatile char *dest, volatile const char *src,
++                            int size, int islittle) {
++  if (islittle == nativeendian.little) {
++    while (size-- != 0)
++      *(dest++) = *(src++);
++  }
++  else {
++    dest += size - 1;
++    while (size-- != 0)
++      *(dest--) = *(src++);
++  }
++}
++
++
++static int str_pack (lua_State *L) {
++  luaL_Buffer b;
++  Header h;
++  const char *fmt = luaL_checkstring(L, 1);  /* format string */
++  int arg = 1;  /* current argument to pack */
++  size_t totalsize = 0;  /* accumulate total size of result */
++  initheader(L, &h);
++  lua_pushnil(L);  /* mark to separate arguments from string buffer */
++  luaL_buffinit(L, &b);
++  while (*fmt != '\0') {
++    int size, ntoalign;
++    KOption opt = getdetails(&h, totalsize, &fmt, &size, &ntoalign);
++    totalsize += ntoalign + size;
++    while (ntoalign-- > 0)
++     luaL_addchar(&b, LUAL_PACKPADBYTE);  /* fill alignment */
++    arg++;
++    switch (opt) {
++      case Kint: {  /* signed integers */
++        lua_Integer n = luaL_checkinteger(L, arg);
++        if (size < SZINT) {  /* need overflow check? */
++          lua_Integer lim = (lua_Integer)1 << ((size * NB) - 1);
++          luaL_argcheck(L, -lim <= n && n < lim, arg, "integer overflow");
++        }
++        packint(&b, (lua_Unsigned)n, h.islittle, size, (n < 0));
++        break;
++      }
++      case Kuint: {  /* unsigned integers */
++        lua_Integer n = luaL_checkinteger(L, arg);
++        if (size < SZINT)  /* need overflow check? */
++          luaL_argcheck(L, (lua_Unsigned)n < ((lua_Unsigned)1 << (size * NB)),
++                           arg, "unsigned overflow");
++        packint(&b, (lua_Unsigned)n, h.islittle, size, 0);
++        break;
++      }
++      case Kfloat: {  /* floating-point options */
++        volatile Ftypes u;
++        char *buff = luaL_prepbuffsize(&b, size);
++        lua_Number n = luaL_checknumber(L, arg);  /* get argument */
++        if (size == sizeof(u.f)) u.f = (float)n;  /* copy it into 'u' */
++        else if (size == sizeof(u.d)) u.d = (double)n;
++        else u.n = n;
++        /* move 'u' to final result, correcting endianness if needed */
++        copywithendian(buff, u.buff, size, h.islittle);
++        luaL_addsize(&b, size);
++        break;
++      }
++      case Kchar: {  /* fixed-size string */
++        size_t len;
++        const char *s = luaL_checklstring(L, arg, &len);
++        luaL_argcheck(L, len <= (size_t)size, arg,
++                         "string longer than given size");
++        luaL_addlstring(&b, s, len);  /* add string */
++        while (len++ < (size_t)size)  /* pad extra space */
++          luaL_addchar(&b, LUAL_PACKPADBYTE);
++        break;
++      }
++      case Kstring: {  /* strings with length count */
++        size_t len;
++        const char *s = luaL_checklstring(L, arg, &len);
++        luaL_argcheck(L, size >= (int)sizeof(size_t) ||
++                         len < ((size_t)1 << (size * NB)),
++                         arg, "string length does not fit in given size");
++        packint(&b, (lua_Unsigned)len, h.islittle, size, 0);  /* pack length */
++        luaL_addlstring(&b, s, len);
++        totalsize += len;
++        break;
++      }
++      case Kzstr: {  /* zero-terminated string */
++        size_t len;
++        const char *s = luaL_checklstring(L, arg, &len);
++        luaL_argcheck(L, strlen(s) == len, arg, "string contains zeros");
++        luaL_addlstring(&b, s, len);
++        luaL_addchar(&b, '\0');  /* add zero@the end */
++        totalsize += len + 1;
++        break;
++      }
++      case Kpadding: luaL_addchar(&b, LUAL_PACKPADBYTE);  /* FALLTHROUGH */
++      case Kpaddalign: case Knop:
++        arg--;  /* undo increment */
++        break;
++    }
++  }
++  luaL_pushresult(&b);
++  return 1;
++}
++
++
++static int str_packsize (lua_State *L) {
++  Header h;
++  const char *fmt = luaL_checkstring(L, 1);  /* format string */
++  size_t totalsize = 0;  /* accumulate total size of result */
++  initheader(L, &h);
++  while (*fmt != '\0') {
++    int size, ntoalign;
++    KOption opt = getdetails(&h, totalsize, &fmt, &size, &ntoalign);
++    size += ntoalign;  /* total space used by option */
++    luaL_argcheck(L, totalsize <= MAXSIZE - size, 1,
++                     "format result too large");
++    totalsize += size;
++    switch (opt) {
++      case Kstring:  /* strings with length count */
++      case Kzstr:    /* zero-terminated string */
++        luaL_argerror(L, 1, "variable-length format");
++        /* call never return, but to avoid warnings: *//* FALLTHROUGH */
++      default:  break;
++    }
++  }
++  lua_pushinteger(L, (lua_Integer)totalsize);
++  return 1;
++}
++
++
++/*
++** Unpack an integer with 'size' bytes and 'islittle' endianness.
++** If size is smaller than the size of a Lua integer and integer
++** is signed, must do sign extension (propagating the sign to the
++** higher bits); if size is larger than the size of a Lua integer,
++** it must check the unread bytes to see whether they do not cause an
++** overflow.
++*/
++static lua_Integer unpackint (lua_State *L, const char *str,
++                              int islittle, int size, int issigned) {
++  lua_Unsigned res = 0;
++  int i;
++  int limit = (size  <= SZINT) ? size : SZINT;
++  for (i = limit - 1; i >= 0; i--) {
++    res <<= NB;
++    res |= (lua_Unsigned)(unsigned char)str[islittle ? i : size - 1 - i];
++  }
++  if (size < SZINT) {  /* real size smaller than lua_Integer? */
++    if (issigned) {  /* needs sign extension? */
++      lua_Unsigned mask = (lua_Unsigned)1 << (size*NB - 1);
++      res = ((res ^ mask) - mask);  /* do sign extension */
++    }
++  }
++  else if (size > SZINT) {  /* must check unread bytes */
++    int mask = (!issigned || (lua_Integer)res >= 0) ? 0 : MC;
++    for (i = limit; i < size; i++) {
++      if ((unsigned char)str[islittle ? i : size - 1 - i] != mask)
++        luaL_error(L, "%d-byte integer does not fit into Lua Integer", size);
++    }
++  }
++  return (lua_Integer)res;
++}
++
++
++static int str_unpack (lua_State *L) {
++  Header h;
++  const char *fmt = luaL_checkstring(L, 1);
++  size_t ld;
++  const char *data = luaL_checklstring(L, 2, &ld);
++  size_t pos = (size_t)posrelat(luaL_optinteger(L, 3, 1), ld) - 1;
++  int n = 0;  /* number of results */
++  luaL_argcheck(L, pos <= ld, 3, "initial position out of string");
++  initheader(L, &h);
++  while (*fmt != '\0') {
++    int size, ntoalign;
++    KOption opt = getdetails(&h, pos, &fmt, &size, &ntoalign);
++    if ((size_t)ntoalign + size > ~pos || pos + ntoalign + size > ld)
++      luaL_argerror(L, 2, "data string too short");
++    pos += ntoalign;  /* skip alignment */
++    /* stack space for item + next position */
++    luaL_checkstack(L, 2, "too many results");
++    n++;
++    switch (opt) {
++      case Kint:
++      case Kuint: {
++        lua_Integer res = unpackint(L, data + pos, h.islittle, size,
++                                       (opt == Kint));
++        lua_pushinteger(L, res);
++        break;
++      }
++      case Kfloat: {
++        volatile Ftypes u;
++        lua_Number num;
++        copywithendian(u.buff, data + pos, size, h.islittle);
++        if (size == sizeof(u.f)) num = (lua_Number)u.f;
++        else if (size == sizeof(u.d)) num = (lua_Number)u.d;
++        else num = u.n;
++        lua_pushnumber(L, num);
++        break;
++      }
++      case Kchar: {
++        lua_pushlstring(L, data + pos, size);
++        break;
++      }
++      case Kstring: {
++        size_t len = (size_t)unpackint(L, data + pos, h.islittle, size, 0);
++        luaL_argcheck(L, pos + len + size <= ld, 2, "data string too short");
++        lua_pushlstring(L, data + pos + size, len);
++        pos += len;  /* skip string */
++        break;
++      }
++      case Kzstr: {
++        size_t len = (int)strlen(data + pos);
++        lua_pushlstring(L, data + pos, len);
++        pos += len + 1;  /* skip string plus final '\0' */
++        break;
++      }
++      case Kpaddalign: case Kpadding: case Knop:
++        n--;  /* undo increment */
++        break;
++    }
++    pos += size;
++  }
++  lua_pushinteger(L, pos + 1);  /* next position */
++  return n + 1;
++}
++
++/* }====================================================== */
++
++
++static const luaL_Reg strlib[] = {
++  {"byte", str_byte},
++  {"char", str_char},
++  {"dump", str_dump},
++  {"find", str_find},
++  {"format", str_format},
++  {"gmatch", gmatch},
++  {"gsub", str_gsub},
++  {"len", str_len},
++  {"lower", str_lower},
++  {"match", str_match},
++  {"rep", str_rep},
++  {"reverse", str_reverse},
++  {"sub", str_sub},
++  {"upper", str_upper},
++  {"pack", str_pack},
++  {"packsize", str_packsize},
++  {"unpack", str_unpack},
++  {NULL, NULL}
++};
++
++
++static void createmetatable (lua_State *L) {
++  lua_createtable(L, 0, 1);  /* table to be metatable for strings */
++  lua_pushliteral(L, "");  /* dummy string */
++  lua_pushvalue(L, -2);  /* copy table */
++  lua_setmetatable(L, -2);  /* set table as metatable for strings */
++  lua_pop(L, 1);  /* pop dummy string */
++  lua_pushvalue(L, -2);  /* get string library */
++  lua_setfield(L, -2, "__index");  /* metatable.__index = string */
++  lua_pop(L, 1);  /* pop metatable */
++}
++
++
++/*
++** Open string library
++*/
++LUAMOD_API int luaopen_string (lua_State *L) {
++  luaL_newlib(L, strlib);
++  createmetatable(L);
++  return 1;
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/ltablib.c luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/ltablib.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/ltablib.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/ltablib.c	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,450 @@
++/*
++** $Id: ltablib.c,v 1.93 2016/02/25 19:41:54 roberto Exp $
++** Library for Table Manipulation
++** See Copyright Notice in lua.h
++*/
++
++#define ltablib_c
++#define LUA_LIB
++
++#include "lprefix.h"
++
++
++#include <limits.h>
++#include <stddef.h>
++#include <string.h>
++
++#include "lua.h"
++
++#include "lauxlib.h"
++#include "lualib.h"
++
++
++/*
++** Operations that an object must define to mimic a table
++** (some functions only need some of them)
++*/
++#define TAB_R	1			/* read */
++#define TAB_W	2			/* write */
++#define TAB_L	4			/* length */
++#define TAB_RW	(TAB_R | TAB_W)		/* read/write */
++
++
++#define aux_getn(L,n,w)	(checktab(L, n, (w) | TAB_L), luaL_len(L, n))
++
++
++static int checkfield (lua_State *L, const char *key, int n) {
++  lua_pushstring(L, key);
++  return (lua_rawget(L, -n) != LUA_TNIL);
++}
++
++
++/*
++** Check that 'arg' either is a table or can behave like one (that is,
++** has a metatable with the required metamethods)
++*/
++static void checktab (lua_State *L, int arg, int what) {
++  if (lua_type(L, arg) != LUA_TTABLE) {  /* is it not a table? */
++    int n = 1;  /* number of elements to pop */
++    if (lua_getmetatable(L, arg) &&  /* must have metatable */
++        (!(what & TAB_R) || checkfield(L, "__index", ++n)) &&
++        (!(what & TAB_W) || checkfield(L, "__newindex", ++n)) &&
++        (!(what & TAB_L) || checkfield(L, "__len", ++n))) {
++      lua_pop(L, n);  /* pop metatable and tested metamethods */
++    }
++    else
++      luaL_checktype(L, arg, LUA_TTABLE);  /* force an error */
++  }
++}
++
++
++#if defined(LUA_COMPAT_MAXN)
++static int maxn (lua_State *L) {
++  lua_Number max = 0;
++  luaL_checktype(L, 1, LUA_TTABLE);
++  lua_pushnil(L);  /* first key */
++  while (lua_next(L, 1)) {
++    lua_pop(L, 1);  /* remove value */
++    if (lua_type(L, -1) == LUA_TNUMBER) {
++      lua_Number v = lua_tonumber(L, -1);
++      if (v > max) max = v;
++    }
++  }
++  lua_pushnumber(L, max);
++  return 1;
++}
++#endif
++
++
++static int tinsert (lua_State *L) {
++  lua_Integer e = aux_getn(L, 1, TAB_RW) + 1;  /* first empty element */
++  lua_Integer pos;  /* where to insert new element */
++  switch (lua_gettop(L)) {
++    case 2: {  /* called with only 2 arguments */
++      pos = e;  /* insert new element at the end */
++      break;
++    }
++    case 3: {
++      lua_Integer i;
++      pos = luaL_checkinteger(L, 2);  /* 2nd argument is the position */
++      luaL_argcheck(L, 1 <= pos && pos <= e, 2, "position out of bounds");
++      for (i = e; i > pos; i--) {  /* move up elements */
++        lua_geti(L, 1, i - 1);
++        lua_seti(L, 1, i);  /* t[i] = t[i - 1] */
++      }
++      break;
++    }
++    default: {
++      return luaL_error(L, "wrong number of arguments to 'insert'");
++    }
++  }
++  lua_seti(L, 1, pos);  /* t[pos] = v */
++  return 0;
++}
++
++
++static int tremove (lua_State *L) {
++  lua_Integer size = aux_getn(L, 1, TAB_RW);
++  lua_Integer pos = luaL_optinteger(L, 2, size);
++  if (pos != size)  /* validate 'pos' if given */
++    luaL_argcheck(L, 1 <= pos && pos <= size + 1, 1, "position out of bounds");
++  lua_geti(L, 1, pos);  /* result = t[pos] */
++  for ( ; pos < size; pos++) {
++    lua_geti(L, 1, pos + 1);
++    lua_seti(L, 1, pos);  /* t[pos] = t[pos + 1] */
++  }
++  lua_pushnil(L);
++  lua_seti(L, 1, pos);  /* t[pos] = nil */
++  return 1;
++}
++
++
++/*
++** Copy elements (1[f], ..., 1[e]) into (tt[t], tt[t+1], ...). Whenever
++** possible, copy in increasing order, which is better for rehashing.
++** "possible" means destination after original range, or smaller
++** than origin, or copying to another table.
++*/
++static int tmove (lua_State *L) {
++  lua_Integer f = luaL_checkinteger(L, 2);
++  lua_Integer e = luaL_checkinteger(L, 3);
++  lua_Integer t = luaL_checkinteger(L, 4);
++  int tt = !lua_isnoneornil(L, 5) ? 5 : 1;  /* destination table */
++  checktab(L, 1, TAB_R);
++  checktab(L, tt, TAB_W);
++  if (e >= f) {  /* otherwise, nothing to move */
++    lua_Integer n, i;
++    luaL_argcheck(L, f > 0 || e < LUA_MAXINTEGER + f, 3,
++                  "too many elements to move");
++    n = e - f + 1;  /* number of elements to move */
++    luaL_argcheck(L, t <= LUA_MAXINTEGER - n + 1, 4,
++                  "destination wrap around");
++    if (t > e || t <= f || (tt != 1 && !lua_compare(L, 1, tt, LUA_OPEQ))) {
++      for (i = 0; i < n; i++) {
++        lua_geti(L, 1, f + i);
++        lua_seti(L, tt, t + i);
++      }
++    }
++    else {
++      for (i = n - 1; i >= 0; i--) {
++        lua_geti(L, 1, f + i);
++        lua_seti(L, tt, t + i);
++      }
++    }
++  }
++  lua_pushvalue(L, tt);  /* return destination table */
++  return 1;
++}
++
++
++static void addfield (lua_State *L, luaL_Buffer *b, lua_Integer i) {
++  lua_geti(L, 1, i);
++  if (!lua_isstring(L, -1))
++    luaL_error(L, "invalid value (%s) at index %d in table for 'concat'",
++                  luaL_typename(L, -1), i);
++  luaL_addvalue(b);
++}
++
++
++static int tconcat (lua_State *L) {
++  luaL_Buffer b;
++  lua_Integer last = aux_getn(L, 1, TAB_R);
++  size_t lsep;
++  const char *sep = luaL_optlstring(L, 2, "", &lsep);
++  lua_Integer i = luaL_optinteger(L, 3, 1);
++  last = luaL_optinteger(L, 4, last);
++  luaL_buffinit(L, &b);
++  for (; i < last; i++) {
++    addfield(L, &b, i);
++    luaL_addlstring(&b, sep, lsep);
++  }
++  if (i == last)  /* add last value (if interval was not empty) */
++    addfield(L, &b, i);
++  luaL_pushresult(&b);
++  return 1;
++}
++
++
++/*
++** {======================================================
++** Pack/unpack
++** =======================================================
++*/
++
++static int pack (lua_State *L) {
++  int i;
++  int n = lua_gettop(L);  /* number of elements to pack */
++  lua_createtable(L, n, 1);  /* create result table */
++  lua_insert(L, 1);  /* put it@index 1 */
++  for (i = n; i >= 1; i--)  /* assign elements */
++    lua_seti(L, 1, i);
++  lua_pushinteger(L, n);
++  lua_setfield(L, 1, "n");  /* t.n = number of elements */
++  return 1;  /* return table */
++}
++
++
++static int unpack (lua_State *L) {
++  lua_Unsigned n;
++  lua_Integer i = luaL_optinteger(L, 2, 1);
++  lua_Integer e = luaL_opt(L, luaL_checkinteger, 3, luaL_len(L, 1));
++  if (i > e) return 0;  /* empty range */
++  n = (lua_Unsigned)e - i;  /* number of elements minus 1 (avoid overflows) */
++  if (n >= (unsigned int)INT_MAX  || !lua_checkstack(L, (int)(++n)))
++    return luaL_error(L, "too many results to unpack");
++  for (; i < e; i++) {  /* push arg[i..e - 1] (to avoid overflows) */
++    lua_geti(L, 1, i);
++  }
++  lua_geti(L, 1, e);  /* push last element */
++  return (int)n;
++}
++
++/* }====================================================== */
++
++
++
++/*
++** {======================================================
++** Quicksort
++** (based on 'Algorithms in MODULA-3', Robert Sedgewick;
++**  Addison-Wesley, 1993.)
++** =======================================================
++*/
++
++
++/* type for array indices */
++typedef unsigned int IdxT;
++
++
++/*
++** Produce a "random" 'unsigned int' to randomize pivot choice. This
++** macro is used only when 'sort' detects a big imbalance in the result
++** of a partition. (If you don't want/need this "randomness", ~0 is a
++** good choice.)
++*/
++#if !defined(l_randomizePivot)		/* { */
++
++#include <time.h>
++
++/* size of 'e' measured in number of 'unsigned int's */
++#define sof(e)		(sizeof(e) / sizeof(unsigned int))
++
++/*
++** Use 'time' and 'clock' as sources of "randomness". Because we don't
++** know the types 'clock_t' and 'time_t', we cannot cast them to
++** anything without risking overflows. A safe way to use their values
++** is to copy them to an array of a known type and use the array values.
++*/
++static unsigned int l_randomizePivot (void) {
++  clock_t c = clock();
++  time_t t = time(NULL);
++  unsigned int buff[sof(c) + sof(t)];
++  unsigned int i, rnd = 0;
++  memcpy(buff, &c, sof(c) * sizeof(unsigned int));
++  memcpy(buff + sof(c), &t, sof(t) * sizeof(unsigned int));
++  for (i = 0; i < sof(buff); i++)
++    rnd += buff[i];
++  return rnd;
++}
++
++#endif					/* } */
++
++
++/* arrays larger than 'RANLIMIT' may use randomized pivots */
++#define RANLIMIT	100u
++
++
++static void set2 (lua_State *L, IdxT i, IdxT j) {
++  lua_seti(L, 1, i);
++  lua_seti(L, 1, j);
++}
++
++
++/*
++** Return true iff value at stack index 'a' is less than the value at
++** index 'b' (according to the order of the sort).
++*/
++static int sort_comp (lua_State *L, int a, int b) {
++  if (lua_isnil(L, 2))  /* no function? */
++    return lua_compare(L, a, b, LUA_OPLT);  /* a < b */
++  else {  /* function */
++    int res;
++    lua_pushvalue(L, 2);    /* push function */
++    lua_pushvalue(L, a-1);  /* -1 to compensate function */
++    lua_pushvalue(L, b-2);  /* -2 to compensate function and 'a' */
++    lua_call(L, 2, 1);      /* call function */
++    res = lua_toboolean(L, -1);  /* get result */
++    lua_pop(L, 1);          /* pop result */
++    return res;
++  }
++}
++
++
++/*
++** Does the partition: Pivot P is@the top of the stack.
++** precondition: a[lo] <= P == a[up-1] <= a[up],
++** so it only needs to do the partition from lo + 1 to up - 2.
++** Pos-condition: a[lo .. i - 1] <= a[i] == P <= a[i + 1 .. up]
++** returns 'i'.
++*/
++static IdxT partition (lua_State *L, IdxT lo, IdxT up) {
++  IdxT i = lo;  /* will be incremented before first use */
++  IdxT j = up - 1;  /* will be decremented before first use */
++  /* loop invariant: a[lo .. i] <= P <= a[j .. up] */
++  for (;;) {
++    /* next loop: repeat ++i while a[i] < P */
++    while (lua_geti(L, 1, ++i), sort_comp(L, -1, -2)) {
++      if (i == up - 1)  /* a[i] < P  but a[up - 1] == P  ?? */
++        luaL_error(L, "invalid order function for sorting");
++      lua_pop(L, 1);  /* remove a[i] */
++    }
++    /* after the loop, a[i] >= P and a[lo .. i - 1] < P */
++    /* next loop: repeat --j while P < a[j] */
++    while (lua_geti(L, 1, --j), sort_comp(L, -3, -1)) {
++      if (j < i)  /* j < i  but  a[j] > P ?? */
++        luaL_error(L, "invalid order function for sorting");
++      lua_pop(L, 1);  /* remove a[j] */
++    }
++    /* after the loop, a[j] <= P and a[j + 1 .. up] >= P */
++    if (j < i) {  /* no elements out of place? */
++      /* a[lo .. i - 1] <= P <= a[j + 1 .. i .. up] */
++      lua_pop(L, 1);  /* pop a[j] */
++      /* swap pivot (a[up - 1]) with a[i] to satisfy pos-condition */
++      set2(L, up - 1, i);
++      return i;
++    }
++    /* otherwise, swap a[i] - a[j] to restore invariant and repeat */
++    set2(L, i, j);
++  }
++}
++
++
++/*
++** Choose an element in the middle (2nd-3th quarters) of [lo,up]
++** "randomized" by 'rnd'
++*/
++static IdxT choosePivot (IdxT lo, IdxT up, unsigned int rnd) {
++  IdxT r4 = (up - lo) / 4;  /* range/4 */
++  IdxT p = rnd % (r4 * 2) + (lo + r4);
++  lua_assert(lo + r4 <= p && p <= up - r4);
++  return p;
++}
++
++
++/*
++** QuickSort algorithm (recursive function)
++*/
++static void auxsort (lua_State *L, IdxT lo, IdxT up,
++                                   unsigned int rnd) {
++  while (lo < up) {  /* loop for tail recursion */
++    IdxT p;  /* Pivot index */
++    IdxT n;  /* to be used later */
++    /* sort elements 'lo', 'p', and 'up' */
++    lua_geti(L, 1, lo);
++    lua_geti(L, 1, up);
++    if (sort_comp(L, -1, -2))  /* a[up] < a[lo]? */
++      set2(L, lo, up);  /* swap a[lo] - a[up] */
++    else
++      lua_pop(L, 2);  /* remove both values */
++    if (up - lo == 1)  /* only 2 elements? */
++      return;  /* already sorted */
++    if (up - lo < RANLIMIT || rnd == 0)  /* small interval or no randomize? */
++      p = (lo + up)/2;  /* middle element is a good pivot */
++    else  /* for larger intervals, it is worth a random pivot */
++      p = choosePivot(lo, up, rnd);
++    lua_geti(L, 1, p);
++    lua_geti(L, 1, lo);
++    if (sort_comp(L, -2, -1))  /* a[p] < a[lo]? */
++      set2(L, p, lo);  /* swap a[p] - a[lo] */
++    else {
++      lua_pop(L, 1);  /* remove a[lo] */
++      lua_geti(L, 1, up);
++      if (sort_comp(L, -1, -2))  /* a[up] < a[p]? */
++        set2(L, p, up);  /* swap a[up] - a[p] */
++      else
++        lua_pop(L, 2);
++    }
++    if (up - lo == 2)  /* only 3 elements? */
++      return;  /* already sorted */
++    lua_geti(L, 1, p);  /* get middle element (Pivot) */
++    lua_pushvalue(L, -1);  /* push Pivot */
++    lua_geti(L, 1, up - 1);  /* push a[up - 1] */
++    set2(L, p, up - 1);  /* swap Pivot (a[p]) with a[up - 1] */
++    p = partition(L, lo, up);
++    /* a[lo .. p - 1] <= a[p] == P <= a[p + 1 .. up] */
++    if (p - lo < up - p) {  /* lower interval is smaller? */
++      auxsort(L, lo, p - 1, rnd);  /* call recursively for lower interval */
++      n = p - lo;  /* size of smaller interval */
++      lo = p + 1;  /* tail call for [p + 1 .. up] (upper interval) */
++    }
++    else {
++      auxsort(L, p + 1, up, rnd);  /* call recursively for upper interval */
++      n = up - p;  /* size of smaller interval */
++      up = p - 1;  /* tail call for [lo .. p - 1]  (lower interval) */
++    }
++    if ((up - lo) / 128 > n) /* partition too imbalanced? */
++      rnd = l_randomizePivot();  /* try a new randomization */
++  }  /* tail call auxsort(L, lo, up, rnd) */
++}
++
++
++static int sort (lua_State *L) {
++  lua_Integer n = aux_getn(L, 1, TAB_RW);
++  if (n > 1) {  /* non-trivial interval? */
++    luaL_argcheck(L, n < INT_MAX, 1, "array too big");
++    if (!lua_isnoneornil(L, 2))  /* is there a 2nd argument? */
++      luaL_checktype(L, 2, LUA_TFUNCTION);  /* must be a function */
++    lua_settop(L, 2);  /* make sure there are two arguments */
++    auxsort(L, 1, (IdxT)n, 0);
++  }
++  return 0;
++}
++
++/* }====================================================== */
++
++
++static const luaL_Reg tab_funcs[] = {
++  {"concat", tconcat},
++#if defined(LUA_COMPAT_MAXN)
++  {"maxn", maxn},
++#endif
++  {"insert", tinsert},
++  {"pack", pack},
++  {"unpack", unpack},
++  {"remove", tremove},
++  {"move", tmove},
++  {"sort", sort},
++  {NULL, NULL}
++};
++
++
++LUAMOD_API int luaopen_table (lua_State *L) {
++  luaL_newlib(L, tab_funcs);
++#if defined(LUA_COMPAT_UNPACK)
++  /* _G.unpack = table.unpack */
++  lua_getfield(L, -1, "unpack");
++  lua_setglobal(L, "unpack");
++#endif
++  return 1;
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lutf8lib.c luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lutf8lib.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/lutf8lib.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/lutf8lib.c	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,256 @@
++/*
++** $Id: lutf8lib.c,v 1.16 2016/12/22 13:08:50 roberto Exp $
++** Standard library for UTF-8 manipulation
++** See Copyright Notice in lua.h
++*/
++
++#define lutf8lib_c
++#define LUA_LIB
++
++#include "lprefix.h"
++
++
++#include <assert.h>
++#include <limits.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include "lua.h"
++
++#include "lauxlib.h"
++#include "lualib.h"
++
++#define MAXUNICODE	0x10FFFF
++
++#define iscont(p)	((*(p) & 0xC0) == 0x80)
++
++
++/* from strlib */
++/* translate a relative string position: negative means back from end */
++static lua_Integer u_posrelat (lua_Integer pos, size_t len) {
++  if (pos >= 0) return pos;
++  else if (0u - (size_t)pos > len) return 0;
++  else return (lua_Integer)len + pos + 1;
++}
++
++
++/*
++** Decode one UTF-8 sequence, returning NULL if byte sequence is invalid.
++*/
++static const char *utf8_decode (const char *o, int *val) {
++  static const unsigned int limits[] = {0xFF, 0x7F, 0x7FF, 0xFFFF};
++  const unsigned char *s = (const unsigned char *)o;
++  unsigned int c = s[0];
++  unsigned int res = 0;  /* final result */
++  if (c < 0x80)  /* ascii? */
++    res = c;
++  else {
++    int count = 0;  /* to count number of continuation bytes */
++    while (c & 0x40) {  /* still have continuation bytes? */
++      int cc = s[++count];  /* read next byte */
++      if ((cc & 0xC0) != 0x80)  /* not a continuation byte? */
++        return NULL;  /* invalid byte sequence */
++      res = (res << 6) | (cc & 0x3F);  /* add lower 6 bits from cont. byte */
++      c <<= 1;  /* to test next bit */
++    }
++    res |= ((c & 0x7F) << (count * 5));  /* add first byte */
++    if (count > 3 || res > MAXUNICODE || res <= limits[count])
++      return NULL;  /* invalid byte sequence */
++    s += count;  /* skip continuation bytes read */
++  }
++  if (val) *val = res;
++  return (const char *)s + 1;  /* +1 to include first byte */
++}
++
++
++/*
++** utf8len(s [, i [, j]]) --> number of characters that start in the
++** range [i,j], or nil + current position if 's' is not well formed in
++** that interval
++*/
++static int utflen (lua_State *L) {
++  int n = 0;
++  size_t len;
++  const char *s = luaL_checklstring(L, 1, &len);
++  lua_Integer posi = u_posrelat(luaL_optinteger(L, 2, 1), len);
++  lua_Integer posj = u_posrelat(luaL_optinteger(L, 3, -1), len);
++  luaL_argcheck(L, 1 <= posi && --posi <= (lua_Integer)len, 2,
++                   "initial position out of string");
++  luaL_argcheck(L, --posj < (lua_Integer)len, 3,
++                   "final position out of string");
++  while (posi <= posj) {
++    const char *s1 = utf8_decode(s + posi, NULL);
++    if (s1 == NULL) {  /* conversion error? */
++      lua_pushnil(L);  /* return nil ... */
++      lua_pushinteger(L, posi + 1);  /* ... and current position */
++      return 2;
++    }
++    posi = s1 - s;
++    n++;
++  }
++  lua_pushinteger(L, n);
++  return 1;
++}
++
++
++/*
++** codepoint(s, [i, [j]])  -> returns codepoints for all characters
++** that start in the range [i,j]
++*/
++static int codepoint (lua_State *L) {
++  size_t len;
++  const char *s = luaL_checklstring(L, 1, &len);
++  lua_Integer posi = u_posrelat(luaL_optinteger(L, 2, 1), len);
++  lua_Integer pose = u_posrelat(luaL_optinteger(L, 3, posi), len);
++  int n;
++  const char *se;
++  luaL_argcheck(L, posi >= 1, 2, "out of range");
++  luaL_argcheck(L, pose <= (lua_Integer)len, 3, "out of range");
++  if (posi > pose) return 0;  /* empty interval; return no values */
++  if (pose - posi >= INT_MAX)  /* (lua_Integer -> int) overflow? */
++    return luaL_error(L, "string slice too long");
++  n = (int)(pose -  posi) + 1;
++  luaL_checkstack(L, n, "string slice too long");
++  n = 0;
++  se = s + pose;
++  for (s += posi - 1; s < se;) {
++    int code;
++    s = utf8_decode(s, &code);
++    if (s == NULL)
++      return luaL_error(L, "invalid UTF-8 code");
++    lua_pushinteger(L, code);
++    n++;
++  }
++  return n;
++}
++
++
++static void pushutfchar (lua_State *L, int arg) {
++  lua_Integer code = luaL_checkinteger(L, arg);
++  luaL_argcheck(L, 0 <= code && code <= MAXUNICODE, arg, "value out of range");
++  lua_pushfstring(L, "%U", (long)code);
++}
++
++
++/*
++** utfchar(n1, n2, ...)  -> char(n1)..char(n2)...
++*/
++static int utfchar (lua_State *L) {
++  int n = lua_gettop(L);  /* number of arguments */
++  if (n == 1)  /* optimize common case of single char */
++    pushutfchar(L, 1);
++  else {
++    int i;
++    luaL_Buffer b;
++    luaL_buffinit(L, &b);
++    for (i = 1; i <= n; i++) {
++      pushutfchar(L, i);
++      luaL_addvalue(&b);
++    }
++    luaL_pushresult(&b);
++  }
++  return 1;
++}
++
++
++/*
++** offset(s, n, [i])  -> index where n-th character counting from
++**   position 'i' starts; 0 means character at 'i'.
++*/
++static int byteoffset (lua_State *L) {
++  size_t len;
++  const char *s = luaL_checklstring(L, 1, &len);
++  lua_Integer n  = luaL_checkinteger(L, 2);
++  lua_Integer posi = (n >= 0) ? 1 : len + 1;
++  posi = u_posrelat(luaL_optinteger(L, 3, posi), len);
++  luaL_argcheck(L, 1 <= posi && --posi <= (lua_Integer)len, 3,
++                   "position out of range");
++  if (n == 0) {
++    /* find beginning of current byte sequence */
++    while (posi > 0 && iscont(s + posi)) posi--;
++  }
++  else {
++    if (iscont(s + posi))
++      luaL_error(L, "initial position is a continuation byte");
++    if (n < 0) {
++       while (n < 0 && posi > 0) {  /* move back */
++         do {  /* find beginning of previous character */
++           posi--;
++         } while (posi > 0 && iscont(s + posi));
++         n++;
++       }
++     }
++     else {
++       n--;  /* do not move for 1st character */
++       while (n > 0 && posi < (lua_Integer)len) {
++         do {  /* find beginning of next character */
++           posi++;
++         } while (iscont(s + posi));  /* (cannot pass final '\0') */
++         n--;
++       }
++     }
++  }
++  if (n == 0)  /* did it find given character? */
++    lua_pushinteger(L, posi + 1);
++  else  /* no such character */
++    lua_pushnil(L);
++  return 1;
++}
++
++
++static int iter_aux (lua_State *L) {
++  size_t len;
++  const char *s = luaL_checklstring(L, 1, &len);
++  lua_Integer n = lua_tointeger(L, 2) - 1;
++  if (n < 0)  /* first iteration? */
++    n = 0;  /* start from here */
++  else if (n < (lua_Integer)len) {
++    n++;  /* skip current byte */
++    while (iscont(s + n)) n++;  /* and its continuations */
++  }
++  if (n >= (lua_Integer)len)
++    return 0;  /* no more codepoints */
++  else {
++    int code;
++    const char *next = utf8_decode(s + n, &code);
++    if (next == NULL || iscont(next))
++      return luaL_error(L, "invalid UTF-8 code");
++    lua_pushinteger(L, n + 1);
++    lua_pushinteger(L, code);
++    return 2;
++  }
++}
++
++
++static int iter_codes (lua_State *L) {
++  luaL_checkstring(L, 1);
++  lua_pushcfunction(L, iter_aux);
++  lua_pushvalue(L, 1);
++  lua_pushinteger(L, 0);
++  return 3;
++}
++
++
++/* pattern to match a single UTF-8 character */
++#define UTF8PATT	"[\0-\x7F\xC2-\xF4][\x80-\xBF]*"
++
++
++static const luaL_Reg funcs[] = {
++  {"offset", byteoffset},
++  {"codepoint", codepoint},
++  {"char", utfchar},
++  {"len", utflen},
++  {"codes", iter_codes},
++  /* placeholders */
++  {"charpattern", NULL},
++  {NULL, NULL}
++};
++
++
++LUAMOD_API int luaopen_utf8 (lua_State *L) {
++  luaL_newlib(L, funcs);
++  lua_pushlstring(L, UTF8PATT, sizeof(UTF8PATT)/sizeof(char) - 1);
++  lua_setfield(L, -2, "charpattern");
++  return 1;
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/README.md luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/README.md
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/README.md	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/README.md	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,239 @@
++[![Build Status](https://travis-ci.org/keplerproject/lua-compat-5.3.svg?branch=master)](https://travis-ci.org/keplerproject/lua-compat-5.3)
++
++# lua-compat-5.3
++
++Lua-5.3-style APIs for Lua 5.2 and 5.1.
++
++## What is it
++
++This is a small module that aims to make it easier to write code
++in a Lua-5.3-style that is compatible with Lua 5.1, Lua 5.2, and Lua
++5.3. This does *not* make Lua 5.2 (or even Lua 5.1) entirely
++compatible with Lua 5.3, but it brings the API closer to that of Lua
++5.3.
++
++It includes:
++
++* _For writing Lua_: The Lua module `compat53`, which can be require'd
++  from Lua scripts and run in Lua 5.1, 5.2, and 5.3, including a
++  backport of the `utf8` module, the 5.3 `table` module, and the
++  string packing functions straight from the Lua 5.3 sources.
++* _For writing C_: A C header and file which can be linked to your
++  Lua module written in C, providing some functions from the C API
++  of Lua 5.3 that do not exist in Lua 5.2 or 5.1, making it easier to
++  write C code that compiles with all three versions of liblua.
++
++## How to use it
++
++### Lua module
++
++```lua
++require("compat53")
++```
++
++`compat53` makes changes to your global environment and does not return
++a meaningful return value, so the usual idiom of storing the return of
++`require` in a local variable makes no sense.
++
++When run under Lua 5.3, this module does nothing.
++
++When run under Lua 5.2 or 5.1, it replaces some of your standard
++functions and adds new ones to bring your environment closer to that
++of Lua 5.3. It also tries to load the backported `utf8`, `table`, and
++string packing modules automatically. If unsuccessful, pure Lua
++versions of the new `table` functions are used as a fallback, and
++[Roberto's struct library][1] is tried for string packing.
++
++#### Lua submodules
++
++```lua
++local _ENV = require("compat53.module")
++if setfenv then setfenv(1, _ENV) end
++```
++
++The `compat53.module` module does not modify the global environment,
++and so it is safe to use in modules without affecting other Lua files.
++It is supposed to be set as the current environment (see above), i.e.
++cherry picking individual functions from this module is expressly
++*not* supported!). Not all features are available when using this
++module (e.g. yieldable (x)pcall support, string/file methods, etc.),
++so it is recommended to use plain `require("compat53")` whenever
++possible.
++
++### C code
++
++There are two ways of adding the C API compatibility functions/macros to
++your project:
++* If `COMPAT53_PREFIX` is *not* `#define`d, `compat-5.3.h` `#include`s
++  `compat-5.3.c`, and all functions are made `static`. You don't have to
++  compile/link/add `compat-5.3.c` yourself. This is useful for one-file
++  projects.
++* If `COMPAT53_PREFIX` is `#define`d, all exported functions are renamed
++  behind the scenes using this prefix to avoid linker conflicts with other
++  code using this package. This doesn't change the way you call the
++  compatibility functions in your code. You have to compile and link
++  `compat-5.3.c` to your project yourself. You can change the way the
++  functions are exported using the `COMPAT53_API` macro (e.g. if you need
++  some `__declspec` magic). While it is technically possible to use
++  the "lua" prefix (and it looks better in the debugger), this is
++  discouraged because LuaJIT has started to implement its own Lua 5.2+
++  C API functions, and with the "lua" prefix you'd violate the
++  one-definition rule with recent LuaJIT versions.
++
++## What's implemented
++
++### Lua
++
++* the `utf8` module backported from the Lua 5.3 sources
++* `string.pack`, `string.packsize`, and `string.unpack` from the Lua
++  5.3 sources or from the `struct` module. (`struct` is not 100%
++  compatible to Lua 5.3's string packing!) (See [here][4])
++* `math.maxinteger` and `math.mininteger`, `math.tointeger`, `math.type`,
++  and `math.ult` (see [here][5])
++* `assert` accepts non-string error messages
++* `ipairs` respects `__index` metamethod
++* `table.move`
++* `table` library respects metamethods
++
++For Lua 5.1 additionally:
++* `load` and `loadfile` accept `mode` and `env` parameters
++* `table.pack` and `table.unpack`
++* string patterns may contain embedded zeros (but see [here][6])
++* `string.rep` accepts `sep` argument
++* `string.format` calls `tostring` on arguments for `%s`
++* `math.log` accepts base argument
++* `xpcall` takes additional arguments
++* `pcall` and `xpcall` can execute functions that yield (see
++  [here][22] for a possible problem with `coroutine.running`)
++* `pairs` respects `__pairs` metamethod (see [here][7])
++* `rawlen` (but `#` still doesn't respect `__len` for tables)
++* `package.searchers` as alias for `package.loaders`
++* `package.searchpath` (see [here][8])
++* `coroutine` functions dealing with the main coroutine (see
++  [here][22] for a possible problem with `coroutine.running`)
++* `coroutine.create` accepts functions written in C
++* return code of `os.execute` (see [here][9])
++* `io.write` and `file:write` return file handle
++* `io.lines` and `file:lines` accept format arguments (like `io.read`)
++  (see [here][10] and [here][11])
++* `debug.setmetatable` returns object
++* `debug.getuservalue` (see [here][12])
++* `debug.setuservalue` (see [here][13])
++
++### C
++
++* `lua_KContext` (see [here][14])
++* `lua_KFunction` (see [here][14])
++* `lua_dump` (extra `strip` parameter, ignored, see [here][15])
++* `lua_getfield` (return value)
++* `lua_geti` and `lua_seti`
++* `lua_getglobal` (return value)
++* `lua_getmetafield` (return value)
++* `lua_gettable` (return value)
++* `lua_getuservalue` (limited compatibility, see [here][16])
++* `lua_setuservalue` (limited compatibility, see [here][17])
++* `lua_isinteger`
++* `lua_numbertointeger`
++* `lua_callk` and `lua_pcallk` (limited compatibility, see [here][14])
++* `lua_resume`
++* `lua_rawget` and `lua_rawgeti` (return values)
++* `lua_rawgetp` and `lua_rawsetp`
++* `luaL_requiref` (now checks `package.loaded` first)
++* `lua_rotate`
++* `lua_stringtonumber` (see [here][18])
++
++For Lua 5.1 additionally:
++* `LUA_OK`
++* `LUA_ERRGCMM`
++* `LUA_OP*` macros for `lua_arith` and `lua_compare`
++* `LUA_FILEHANDLE`
++* `lua_Unsigned`
++* `luaL_Stream` (limited compatibility, see [here][19])
++* `lua_absindex`
++* `lua_arith` (see [here][20])
++* `lua_compare`
++* `lua_len`, `lua_rawlen`, and `luaL_len`
++* `lua_load` (mode argument)
++* `lua_pushstring`, `lua_pushlstring` (return value)
++* `lua_copy`
++* `lua_pushglobaltable`
++* `luaL_testudata`
++* `luaL_setfuncs`, `luaL_newlibtable`, and `luaL_newlib`
++* `luaL_setmetatable`
++* `luaL_getsubtable`
++* `luaL_traceback`
++* `luaL_execresult`
++* `luaL_fileresult`
++* `luaL_loadbufferx`
++* `luaL_loadfilex`
++* `luaL_checkversion` (with empty body, only to avoid compile errors,
++  see [here][21])
++* `luaL_tolstring`
++* `luaL_buffinitsize`, `luaL_prepbuffsize`, and `luaL_pushresultsize`
++  (see [here][22])
++* `lua_pushunsigned`, `lua_tounsignedx`, `lua_tounsigned`,
++  `luaL_checkunsigned`, `luaL_optunsigned`, if
++  `LUA_COMPAT_APIINTCASTS` is defined.
++
++## What's not implemented
++
++* bit operators
++* integer division operator
++* utf8 escape sequences
++* 64 bit integers
++* `coroutine.isyieldable`
++* Lua 5.1: `_ENV`, `goto`, labels, ephemeron tables, etc. See
++  [`lua-compat-5.2`][2] for a detailed list.
++* the following C API functions/macros:
++  * `lua_isyieldable`
++  * `lua_getextraspace`
++  * `lua_arith` (new operators missing)
++  * `lua_push(v)fstring` (new formats missing)
++  * `lua_upvalueid` (5.1)
++  * `lua_upvaluejoin` (5.1)
++  * `lua_version` (5.1)
++  * `lua_yieldk` (5.1)
++
++## See also
++
++* For Lua-5.2-style APIs under Lua 5.1, see [lua-compat-5.2][2],
++  which also is the basis for most of the code in this project.
++* For Lua-5.1-style APIs under Lua 5.0, see [Compat-5.1][3]
++
++## Credits
++
++This package contains code written by:
++
++* [The Lua Team](http://www.lua.org)
++* Philipp Janda ([@siffiejoe](http://github.com/siffiejoe))
++* Tom?s Guisasola Gorham ([@tomasguisasola](http://github.com/tomasguisasola))
++* Hisham Muhammad ([@hishamhm](http://github.com/hishamhm))
++* Renato Maia ([@renatomaia](http://github.com/renatomaia))
++* [@ThePhD](http://github.com/ThePhD)
++* [@Daurnimator](http://github.com/Daurnimator)
++
++
++  [1]: http://www.inf.puc-rio.br/~roberto/struct/
++  [2]: http://github.com/keplerproject/lua-compat-5.2/
++  [3]: http://keplerproject.org/compat/
++  [4]: https://github.com/keplerproject/lua-compat-5.3/wiki/string_packing
++  [5]: https://github.com/keplerproject/lua-compat-5.3/wiki/math.type
++  [6]: https://github.com/keplerproject/lua-compat-5.3/wiki/pattern_matching
++  [7]: https://github.com/keplerproject/lua-compat-5.3/wiki/pairs
++  [8]: https://github.com/keplerproject/lua-compat-5.3/wiki/package.searchpath
++  [9]: https://github.com/keplerproject/lua-compat-5.3/wiki/os.execute
++  [10]: https://github.com/keplerproject/lua-compat-5.3/wiki/io.lines
++  [11]: https://github.com/keplerproject/lua-compat-5.3/wiki/file.lines
++  [12]: https://github.com/keplerproject/lua-compat-5.3/wiki/debug.getuservalue
++  [13]: https://github.com/keplerproject/lua-compat-5.3/wiki/debug.setuservalue
++  [14]: https://github.com/keplerproject/lua-compat-5.3/wiki/yieldable_c_functions
++  [15]: https://github.com/keplerproject/lua-compat-5.3/wiki/lua_dump
++  [16]: https://github.com/keplerproject/lua-compat-5.3/wiki/lua_getuservalue
++  [17]: https://github.com/keplerproject/lua-compat-5.3/wiki/lua_setuservalue
++  [18]: https://github.com/keplerproject/lua-compat-5.3/wiki/lua_stringtonumber
++  [19]: https://github.com/keplerproject/lua-compat-5.3/wiki/luaL_Stream
++  [20]: https://github.com/keplerproject/lua-compat-5.3/wiki/lua_arith
++  [21]: https://github.com/keplerproject/lua-compat-5.3/wiki/luaL_checkversion
++  [22]: https://github.com/keplerproject/lua-compat-5.3/wiki/luaL_Buffer
++  [23]: https://github.com/keplerproject/lua-compat-5.3/wiki/coroutine.running
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.1-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.1-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.1-1.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.1-1.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,31 @@
++package = "compat53"
++version = "0.1-1"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/v0.1.zip",
++   dir = "lua-compat-5.3-0.1",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53"] = "compat53.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.2-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.2-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.2-1.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.2-1.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,32 @@
++package = "compat53"
++version = "0.2-1"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/v0.2.zip",
++   dir = "lua-compat-5.3-0.2",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53.init"] = "compat53/init.lua",
++      ["compat53.module"] = "compat53/module.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.3-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.3-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.3-1.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.3-1.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,32 @@
++package = "compat53"
++version = "0.3-1"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/v0.3.zip",
++   dir = "lua-compat-5.3-0.3",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53.init"] = "compat53/init.lua",
++      ["compat53.module"] = "compat53/module.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.4-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.4-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.4-1.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.4-1.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,32 @@
++package = "compat53"
++version = "0.4-1"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/v0.4.zip",
++   dir = "lua-compat-5.3-0.4",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53.init"] = "compat53/init.lua",
++      ["compat53.module"] = "compat53/module.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.5-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.5-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.5-1.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-0.5-1.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,32 @@
++package = "compat53"
++version = "0.5-1"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/v0.5.zip",
++   dir = "lua-compat-5.3-0.5",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53.init"] = "compat53/init.lua",
++      ["compat53.module"] = "compat53/module.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-scm-0.rockspec luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-scm-0.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-scm-0.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/rockspecs/compat53-scm-0.rockspec	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,32 @@
++package = "compat53"
++version = "scm-0"
++source = {
++   url = "https://github.com/keplerproject/lua-compat-5.3/archive/master.zip",
++   dir = "lua-compat-5.3-master",
++}
++description = {
++   summary = "Compatibility module providing Lua-5.3-style APIs for Lua 5.2 and 5.1",
++   detailed = [[
++      This is a small module that aims to make it easier to write Lua
++      code in a Lua-5.3-style that runs on Lua 5.3, 5.2, and 5.1.
++      It does *not* make Lua 5.2 (or even 5.1) entirely compatible
++      with Lua 5.3, but it brings the API closer to that of Lua 5.3.
++   ]],
++   homepage = "https://github.com/keplerproject/lua-compat-5.3",
++   license = "MIT"
++}
++dependencies = {
++   "lua >= 5.1, < 5.4",
++   --"struct" -- make Roberto's struct module optional
++}
++build = {
++   type = "builtin",
++   modules = {
++      ["compat53.init"] = "compat53/init.lua",
++      ["compat53.module"] = "compat53/module.lua",
++      ["compat53.utf8"] = "lutf8lib.c",
++      ["compat53.table"] = "ltablib.c",
++      ["compat53.string"] = "lstrlib.c",
++   }
++}
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/tests/test.lua luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/tests/test.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/tests/test.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/tests/test.lua	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,819 @@
++#!/usr/bin/env lua
++
++local F, tproxy, writefile, noprint, ___
++do
++  local type, unpack = type, table.unpack or unpack
++  local assert, io = assert, io
++  function F(...)
++    local args, n = { ... }, select('#', ...)
++    for i = 1, n do
++      local t = type(args[i])
++      if t ~= "string" and t ~= "number" and t ~= "boolean" then
++        args[i] = t
++      end
++    end
++    return unpack(args, 1, n)
++  end
++  function tproxy(t)
++    return setmetatable({}, {
++      __index = t,
++      __newindex = t,
++      __len = function() return #t end,
++    }), t
++  end
++  function writefile(name, contents, bin)
++    local f = assert(io.open(name, bin and "wb" or "w"))
++    f:write(contents)
++    f:close()
++  end
++  function noprint() end
++  local sep = ("="):rep(70)
++  function ___()
++    print(sep)
++  end
++end
++
++local V = _VERSION:gsub("^.*(%d+)%.(%d+)$", "%1%2")
++if jit then V = "jit" end
++
++local mode = "global"
++if arg[1] == "module" then
++  mode = "module"
++end
++local self = arg[0]
++
++package.path = "../?.lua;../?/init.lua"
++package.cpath = "./?-"..V..".so;./?-"..V..".dll;./?.so;./?.dll"
++if mode == "module" then
++  print("testing Lua API using `compat53.module` ...")
++  _ENV = require("compat53.module")
++  if setfenv then setfenv(1, _ENV) end
++else
++  print("testing Lua API using `compat53` ...")
++  require("compat53")
++end
++
++
++___''
++do
++  print("assert", F(pcall(assert, false)))
++  print("assert", F(pcall(assert, false, nil)))
++  print("assert", F(pcall(assert, false, "error msg")))
++  print("assert", F(pcall(assert, nil, {})))
++  print("assert", F(pcall(assert, 1, 2, 3)))
++end
++
++
++___''
++do
++  local t = setmetatable({}, { __index = { 1, false, "three" } })
++  for i,v in ipairs(t) do
++    print("ipairs", i, v)
++  end
++end
++
++
++___''
++do
++  local p, t = tproxy{ "a", "b", "c" }
++  print("table.concat", table.concat(p))
++  print("table.concat", table.concat(p, ",", 2))
++  print("table.concat", table.concat(p, ".", 1, 2))
++  print("table.concat", table.concat(t))
++  print("table.concat", table.concat(t, ",", 2))
++  print("table.concat", table.concat(t, ".", 1, 2))
++end
++
++
++___''
++do
++  local p, t = tproxy{ "a", "b", "c" }
++  table.insert(p, "d")
++  print("table.insert", next(p), t[4])
++  table.insert(p, 1, "z")
++  print("table.insert", next(p),  t[1], t[2])
++  table.insert(p, 2, "y")
++  print("table.insert", next(p), t[1], t[2], p[3])
++  t = { "a", "b", "c" }
++  table.insert(t, "d")
++  print("table.insert", t[1], t[2], t[3], t[4])
++  table.insert(t, 1, "z")
++  print("table.insert", t[1], t[2], t[3], t[4], t[5])
++  table.insert(t, 2, "y")
++  print("table.insert", t[1], t[2], t[3], t[4], t[5])
++end
++
++
++___''
++do
++  local ps, s = tproxy{ "a", "b", "c", "d" }
++  local pd, d = tproxy{ "A", "B", "C", "D" }
++  table.move(ps, 1, 4, 1, pd)
++  print("table.move", next(pd), d[1], d[2], d[3], d[4])
++  pd, d = tproxy{ "A", "B", "C", "D" }
++  table.move(ps, 2, 4, 1, pd)
++  print("table.move", next(pd), d[1], d[2], d[3], d[4])
++  pd, d = tproxy{ "A", "B", "C", "D" }
++  table.move(ps, 2, 3, 4, pd)
++  print("table.move", next(pd), d[1], d[2], d[3], d[4], d[5])
++  table.move(ps, 2, 4, 1)
++  print("table.move", next(ps), s[1], s[2], s[3], s[4])
++  ps, s = tproxy{ "a", "b", "c", "d" }
++  table.move(ps, 2, 3, 4)
++  print("table.move", next(ps), s[1], s[2], s[3], s[4], s[5])
++  s = { "a", "b", "c", "d" }
++  d = { "A", "B", "C", "D" }
++  table.move(s, 1, 4, 1, d)
++  print("table.move", d[1], d[2], d[3], d[4])
++  d = { "A", "B", "C", "D" }
++  table.move(s, 2, 4, 1, d)
++  print("table.move", d[1], d[2], d[3], d[4])
++  d = { "A", "B", "C", "D" }
++  table.move(s, 2, 3, 4, d)
++  print("table.move", d[1], d[2], d[3], d[4], d[5])
++  table.move(s, 2, 4, 1)
++  print("table.move", s[1], s[2], s[3], s[4])
++  s = { "a", "b", "c", "d" }
++  table.move(s, 2, 3, 4)
++  print("table.move", s[1], s[2], s[3], s[4], s[5])
++end
++
++
++___''
++do
++  local p, t = tproxy{ "a", "b", "c", "d", "e" }
++  print("table.remove", table.remove(p))
++  print("table.remove", next(p), t[1], t[2], t[3], t[4], t[5])
++  print("table.remove", table.remove(p, 1))
++  print("table.remove", next(p), t[1], t[2], t[3], t[4])
++  print("table.remove", table.remove(p, 2))
++  print("table.remove", next(p), t[1], t[2], t[3])
++  print("table.remove", table.remove(p, 3))
++  print("table.remove", next(p), t[1], t[2], t[3])
++  p, t = tproxy{}
++  print("table.remove", table.remove(p))
++  print("table.remove", next(p), next(t))
++  t = { "a", "b", "c", "d", "e" }
++  print("table.remove", table.remove(t))
++  print("table.remove", t[1], t[2], t[3], t[4], t[5])
++  print("table.remove", table.remove(t, 1))
++  print("table.remove", t[1], t[2], t[3], t[4])
++  print("table.remove", table.remove(t, 2))
++  print("table.remove", t[1], t[2], t[3])
++  print("table.remove", table.remove(t, 3))
++  print("table.remove", t[1], t[2], t[3])
++  t = {}
++  print("table.remove", table.remove(t))
++  print("table.remove", next(t))
++end
++
++___''
++do
++  local p, t = tproxy{ 3, 1, 5, 2, 8, 5, 2, 9, 7, 4 }
++  table.sort(p)
++  print("table.sort", next(p))
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  table.sort(p)
++  print("table.sort", next(p))
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  p, t = tproxy{ 9, 8, 7, 6, 5, 4, 3, 2, 1 }
++  table.sort(p)
++  print("table.sort", next(p))
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  table.sort(p, function(a, b) return a > b end)
++  print("table.sort", next(p))
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  p, t = tproxy{ 1, 1, 1, 1, 1 }
++  print("table.sort", next(p))
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  t = { 3, 1, 5, 2, 8, 5, 2, 9, 7, 4 }
++  table.sort(t)
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++  table.sort(t, function(a, b) return a > b end)
++  for i,v in ipairs(t) do
++    print("table.sort", i, v)
++  end
++end
++
++
++___''
++do
++  local p, t = tproxy{ "a", "b", "c" }
++  print("table.unpack", table.unpack(p))
++  print("table.unpack", table.unpack(p, 2))
++  print("table.unpack", table.unpack(p, 1, 2))
++  print("table.unpack", table.unpack(t))
++  print("table.unpack", table.unpack(t, 2))
++  print("table.unpack", table.unpack(t, 1, 2))
++end
++
++
++___''
++print("math.maxinteger", math.maxinteger+1 > math.maxinteger)
++print("math.mininteger", math.mininteger-1 < math.mininteger)
++
++
++___''
++print("math.tointeger", math.tointeger(0))
++print("math.tointeger", math.tointeger(math.pi))
++print("math.tointeger", math.tointeger("hello"))
++print("math.tointeger", math.tointeger(math.maxinteger+2.0))
++print("math.tointeger", math.tointeger(math.mininteger*2.0))
++
++
++___''
++print("math.type", math.type(0))
++print("math.type", math.type(math.pi))
++print("math.type", math.type("hello"))
++
++
++___''
++print("math.ult", math.ult(1, 2), math.ult(2, 1))
++print("math.ult", math.ult(-1, 2), math.ult(2, -1))
++print("math.ult", math.ult(-1, -2), math.ult(-2, -1))
++print("math.ult", pcall(math.ult, "x", 2))
++print("math.ult", pcall(math.ult, 1, 2.1))
++___''
++
++
++if utf8.len then
++  local unpack = table.unpack or unpack
++  local function utf8rt(s)
++    local t = { utf8.codepoint(s, 1, #s) }
++    local ps, cs = {}, {}
++    for p,c in utf8.codes(s) do
++      ps[#ps+1], cs[#cs+1] = p, c
++    end
++    print("utf8.codes", unpack(ps))
++    print("utf8.codes", unpack(cs))
++    print("utf8.codepoint", unpack(t))
++    print("utf8.len", utf8.len(s), #t, #s)
++    print("utf8.char", utf8.char(unpack(t)))
++  end
++  utf8rt("???????")
++  utf8rt("abcdefg")
++  ___''
++  local s = "???????"
++  print("utf8.offset", utf8.offset(s, 1, 1))
++  print("utf8.offset", utf8.offset(s, 2, 1))
++  print("utf8.offset", utf8.offset(s, 3, 1))
++  print("utf8.offset", pcall(utf8.offset, s, 3, 2))
++  print("utf8.offset", utf8.offset(s, 3, 3))
++  print("utf8.offset", utf8.offset(s, -1, 7))
++  print("utf8.offset", utf8.offset(s, -2, 7))
++  print("utf8.offset", utf8.offset(s, -3, 7))
++  print("utf8.offset", utf8.offset(s, -1))
++  ___''
++else
++  print("XXX: utf8 module not available")
++end
++
++
++if string.pack then
++  local format = "bBhHlLjJdc3z"
++  local s = string.pack(format, -128, 255, -32768, 65535, -2147483648, 4294967295, -32768, 65536, 1.25, "abc", "defgh")
++  print("string.unpack", string.unpack(format, s))
++  ___''
++else
++  print("XXX: string packing not available")
++end
++
++
++print("testing Lua API for Lua 5.1 ...")
++
++___''
++print("debug.getuservalue()", F(debug.getuservalue(false)))
++print("debug.setuservalue()", pcall(function()
++  debug.setuservalue(false, {})
++end))
++print("debug.setmetatable()", F(debug.setmetatable({}, {})))
++
++
++___''
++do
++   local t = setmetatable({}, {
++      __pairs = function() return pairs({ a = "a" }) end,
++   })
++   for k,v in pairs(t) do
++      print("pairs()", k, v)
++   end
++end
++
++
++___''
++do
++   local code = "print('hello world')\n"
++   local badcode = "print('blub\n"
++   print("load()", pcall(function() load(true) end))
++   print("load()", F(load(badcode)))
++   print("load()", F(load(code)))
++   print("load()", F(load(code, "[L]")))
++   print("load()", F(load(code, "[L]", "b")))
++   print("load()", F(load(code, "[L]", "t")))
++   print("load()", F(load(code, "[L]", "bt")))
++   local f = load(code, "[L]", "bt", {})
++   print("load()", pcall(f))
++   f = load(code, "[L]", "bt", { print = noprint })
++   print("load()", pcall(f))
++   local bytecode = string.dump(f)
++   print("load()", F(load(bytecode)))
++   print("load()", F(load(bytecode, "[L]")))
++   print("load()", F(load(bytecode, "[L]", "b")))
++   print("load()", F(load(bytecode, "[L]", "t")))
++   print("load()", F(load(bytecode, "[L]", "bt")))
++   f = load(bytecode, "[L]", "bt", {})
++   print("load()", pcall(f))
++   f = load(bytecode, "[L]", "bt", { print = noprint })
++   print("load()", pcall(f))
++   local function make_loader(code)
++      local mid = math.floor( #code/2 )
++      local array = { code:sub(1, mid), code:sub(mid+1) }
++      local i = 0
++      return function()
++         i = i + 1
++         return array[i]
++      end
++   end
++   print("load()", F(load(make_loader(badcode))))
++   print("load()", F(load(make_loader(code))))
++   print("load()", F(load(make_loader(code), "[L]")))
++   print("load()", F(load(make_loader(code), "[L]", "b")))
++   print("load()", F(load(make_loader(code), "[L]", "t")))
++   print("load()", F(load(make_loader(code), "[L]", "bt")))
++   f = load(make_loader(code), "[L]", "bt", {})
++   print("load()", pcall(f))
++   f = load(make_loader(code), "[L]", "bt", { print = noprint })
++   print("load()", pcall(f))
++   print("load()", F(load(make_loader(bytecode))))
++   print("load()", F(load(make_loader(bytecode), "[L]")))
++   print("load()", F(load(make_loader(bytecode), "[L]", "b")))
++   print("load()", F(load(make_loader(bytecode), "[L]", "t")))
++   print("load()", F(load(make_loader(bytecode), "[L]", "bt")))
++   f = load(make_loader(bytecode), "[L]", "bt", {})
++   print("load()", pcall(f))
++   f = load(make_loader(bytecode), "[L]", "bt", { print = noprint })
++   print("load()", pcall(f))
++   writefile("good.lua", code)
++   writefile("bad.lua", badcode)
++   writefile("good.luac", bytecode, true)
++   print("loadfile()", F(loadfile("bad.lua")))
++   print("loadfile()", F(loadfile("good.lua")))
++   print("loadfile()", F(loadfile("good.lua", "b")))
++   print("loadfile()", F(loadfile("good.lua", "t")))
++   print("loadfile()", F(loadfile("good.lua", "bt")))
++   f = loadfile("good.lua", "bt", {})
++   print("loadfile()", pcall(f))
++   f = loadfile("good.lua", "bt", { print = noprint })
++   print("loadfile()", pcall(f))
++   print("loadfile()", F(loadfile("good.luac")))
++   print("loadfile()", F(loadfile("good.luac", "b")))
++   print("loadfile()", F(loadfile("good.luac", "t")))
++   print("loadfile()", F(loadfile("good.luac", "bt")))
++   f = loadfile("good.luac", "bt", {})
++   print("loadfile()", pcall(f))
++   f = loadfile("good.luac", "bt", { print = noprint })
++   print("loadfile()", pcall(f))
++   os.remove("good.lua")
++   os.remove("bad.lua")
++   os.remove("good.luac")
++end
++
++
++___''
++do
++   local function func(throw)
++      if throw then
++         error("argh")
++      else
++         return 1, 2, 3
++      end
++   end
++   local function tb(err) return "|"..err.."|" end
++   print("xpcall()", xpcall(func, debug.traceback, false))
++   print("xpcall()", xpcall(func, debug.traceback, true))
++   print("xpcall()", xpcall(func, tb, true))
++   if mode ~= "module" then
++     local function func2(cb)
++       print("xpcall()", xpcall(cb, debug.traceback, "str"))
++     end
++     local function func3(cb)
++       print("pcall()", pcall(cb, "str"))
++     end
++     local function cb(arg)
++        coroutine.yield(2)
++        return arg
++     end
++     local c = coroutine.wrap(func2)
++     print("xpcall()", c(cb))
++     print("xpcall()", c())
++     local c = coroutine.wrap(func3)
++     print("pcall()", c(cb))
++     print("pcall()", c())
++   end
++end
++
++
++___''
++do
++   local t = setmetatable({ 1 }, { __len = function() return 5 end })
++   print("rawlen()", rawlen(t), rawlen("123"))
++end
++
++
++___''
++print("os.execute()", os.execute("exit 1"))
++io.flush()
++print("os.execute()", os.execute("echo 'hello world!'"))
++io.flush()
++print("os.execute()", os.execute("no_such_file"))
++
++
++___''
++do
++   local t = table.pack("a", nil, "b", nil)
++   print("table.(un)pack()", t.n, table.unpack(t, 1, t.n))
++end
++
++
++___''
++do
++   print("coroutine.running()", F(coroutine.wrap(function()
++      return coroutine.running()
++   end)()))
++   print("coroutine.running()", F(coroutine.running()))
++   local main_co, co1, co2 = coroutine.running()
++   -- coroutine.yield
++   if mode ~= "module" then
++     print("coroutine.yield()", pcall(function()
++        coroutine.yield(1, 2, 3)
++     end))
++   end
++   print("coroutine.yield()", coroutine.wrap(function()
++      coroutine.yield(1, 2, 3)
++   end)())
++   print("coroutine.resume()", coroutine.resume(main_co, 1, 2, 3))
++   co1 = coroutine.create(function(a, b, c)
++      print("coroutine.resume()", a, b, c)
++      return a, b, c
++   end)
++   print("coroutine.resume()", coroutine.resume(co1, 1, 2, 3))
++   co1 = coroutine.create(function()
++      print("coroutine.status()", "[co1] main is", coroutine.status(main_co))
++      print("coroutine.status()", "[co1] co2 is", coroutine.status(co2))
++   end)
++   co2 = coroutine.create(function()
++      print("coroutine.status()", "[co2] main is", coroutine.status(main_co))
++      print("coroutine.status()", "[co2] co2 is", coroutine.status(co2))
++      coroutine.yield()
++      coroutine.resume(co1)
++   end)
++   print("coroutine.status()", coroutine.status(main_co))
++   print("coroutine.status()", coroutine.status(co2))
++   coroutine.resume(co2)
++   print("coroutine.status()", F(coroutine.status(co2)))
++   coroutine.resume(co2)
++   print("coroutine.status()", F(coroutine.status(co2)))
++end
++
++
++___''
++print("math.log()", math.log(1000))
++print("math.log()", math.log(1000, 10))
++
++
++___''
++do
++   local path, prefix = "./?.lua;?/init.lua;../?.lua", "package.searchpath()"
++   print(prefix, package.searchpath("no.such.module", path))
++   print(prefix, package.searchpath("no.such.module", ""))
++   print(prefix, package.searchpath("compat53", path))
++   print(prefix, package.searchpath("no:such:module", path, ":", "|"))
++end
++
++
++___''
++if mode ~= "module" then
++   local function mod_func() return {} end
++   local function my_searcher(name)
++      if name == "my.module" then
++         print("package.searchers", "my.module found")
++         return mod_func
++      end
++   end
++   local function my_searcher2(name)
++      if name == "my.module" then
++         print("package.searchers", "my.module found 2")
++         return mod_func
++      end
++   end
++   table.insert(package.searchers, my_searcher)
++   require("my.module")
++   package.loaded["my.module"] = nil
++   local new_s = { my_searcher2 }
++   for i,f in ipairs(package.searchers) do
++      new_s[i+1] = f
++   end
++   package.searchers = new_s
++   require("my.module")
++end
++
++
++___''
++do
++   print("string.find()", string.find("abc\0abc\0abc", "[^a\0]+"))
++   print("string.find()", string.find("abc\0abc\0abc", "%w+\0", 5))
++   for x in string.gmatch("abc\0def\0ghi", "[^\0]+") do
++      print("string.gmatch()", x)
++   end
++   for x in string.gmatch("abc\0def\0ghi", "%w*\0") do
++      print("string.gmatch()", #x)
++   end
++   print("string.gsub()", string.gsub("abc\0def\0ghi", "[\0]", "X"))
++   print("string.gsub()", string.gsub("abc\0def\0ghi", "%w*\0", "X"))
++   print("string.gsub()", string.gsub("abc\0def\0ghi", "%A", "X"))
++   print("string.match()", string.match("abc\0abc\0abc", "([^\0a]+)"))
++   print("string.match()", #string.match("abc\0abc\0abc", ".*\0"))
++   print("string.rep()", string.rep("a", 0))
++   print("string.rep()", string.rep("b", 1))
++   print("string.rep()", string.rep("c", 4))
++   print("string.rep()", string.rep("a", 0, "|"))
++   print("string.rep()", string.rep("b", 1, "|"))
++   print("string.rep()", string.rep("c", 4, "|"))
++   local _tostring = tostring
++   function tostring(v)
++      if type(v) == "number" then
++         return "(".._tostring(v)..")"
++      else
++         return _tostring(v)
++      end
++   end
++   print("string.format()", string.format("%q", "\"\\\0000\0010\002\r\n0\t0\""))
++   print("string.format()", string.format("%12.3fx%%sxx%.6s", 3.1, {}))
++   print("string.format()", string.format("%-3f %%%s %%s", 3.1, true))
++   print("string.format()", string.format("% 3.2g %%d %%%s", 3.1, nil))
++   print("string.format()", string.format("%+3d %%d %%%%%10.6s", 3, io.stdout))
++   print("string.format()", pcall(function()
++      print("string.format()", string.format("%d %%s", {}))
++   end))
++   tostring = _tostring
++end
++
++
++___''
++do
++   print("io.write()", io.type(io.write("hello world\n")))
++   local f = assert(io.tmpfile())
++   print("file:write()", io.type(f:write("hello world\n")))
++   f:close()
++end
++
++
++___''
++do
++   writefile("data.txt", "123 18.8 hello world\ni'm here\n")
++   io.input("data.txt")
++   print("io.read()", io.read("*n", "*number", "*l", "*a"))
++   io.input("data.txt")
++   print("io.read()", io.read("n", "number", "l", "a"))
++   io.input(io.stdin)
++   if mode ~= "module" then
++     local f = assert(io.open("data.txt", "r"))
++     print("file:read()", f:read("*n", "*number", "*l", "*a"))
++     f:close()
++     f = assert(io.open("data.txt", "r"))
++     print("file:read()", f:read("n", "number", "l", "a"))
++     f:close()
++   end
++   os.remove("data.txt")
++end
++
++
++___''
++do
++   writefile("data.txt", "123 18.8 hello world\ni'm here\n")
++   for a,b in io.lines(self, 2, "*l") do
++      print("io.lines()", a, b)
++      break
++   end
++   for l in io.lines(self) do
++      print("io.lines()", l)
++      break
++   end
++   for n1,n2,rest in io.lines("data.txt", "*n", "n", "*a") do
++      print("io.lines()", n1, n2, rest)
++   end
++   for l in io.lines("data.txt") do
++      print("io.lines()", l)
++   end
++   print("io.lines()", pcall(function()
++      for l in io.lines("data.txt", "*x") do print(l) end
++   end))
++   print("io.lines()", pcall(function()
++      for l in io.lines("no_such_file.txt") do print(l) end
++   end))
++   if mode ~= "module" then
++     local f = assert(io.open(self, "r"))
++     for a,b in f:lines(2, "*l") do
++        print("file:lines()", a, b)
++        break
++     end
++     f:close()
++     f = assert(io.open("data.txt", "r"))
++     for n1,n2,rest in f:lines("*n", "n", "*a") do
++        print("file:lines()", n1, n2, rest)
++     end
++     f:close()
++     f = assert(io.open("data.txt", "r"))
++     for l in f:lines() do
++        print("file:lines()", l)
++     end
++     f:close()
++     print("file:lines()", pcall(function()
++        for l in f:lines() do print(l) end
++     end))
++     print("file:lines()", pcall(function()
++        local f = assert(io.open("data.txt", "r"))
++        for l in f:lines("*l", "*x") do print(l) end
++        f:close()
++     end))
++   end
++   os.remove("data.txt")
++end
++___''
++
++
++print("testing C API ...")
++local mod = require("testmod")
++___''
++print("isinteger", mod.isinteger(1))
++print("isinteger", mod.isinteger(0))
++print("isinteger", mod.isinteger(1234567))
++print("isinteger", mod.isinteger(12.3))
++print("isinteger", mod.isinteger(math.huge))
++print("isinteger", mod.isinteger(math.sqrt(-1)))
++
++
++___''
++print("rotate", mod.rotate(1, 1, 2, 3, 4, 5, 6))
++print("rotate", mod.rotate(-1, 1, 2, 3, 4, 5, 6))
++print("rotate", mod.rotate(4, 1, 2, 3, 4, 5, 6))
++print("rotate", mod.rotate(-4, 1, 2, 3, 4, 5, 6))
++
++
++___''
++print("strtonum", mod.strtonum("+123"))
++print("strtonum", mod.strtonum(" 123 "))
++print("strtonum", mod.strtonum("-1.23"))
++print("strtonum", mod.strtonum(" 123 abc"))
++print("strtonum", mod.strtonum("jkl"))
++
++
++___''
++local a, b, c = mod.requiref()
++print("requiref", type(a), type(b), type(c),
++      a.boolean, b.boolean, c.boolean,
++      type(requiref1), type(requiref2), type(requiref3))
++
++___''
++local proxy, backend = {}, {}
++setmetatable(proxy, { __index = backend, __newindex = backend })
++print("geti/seti", rawget(proxy, 1), rawget(backend, 1))
++print("geti/seti", mod.getseti(proxy, 1))
++print("geti/seti", rawget(proxy, 1), rawget(backend, 1))
++print("geti/seti", mod.getseti(proxy, 1))
++print("geti/seti", rawget(proxy, 1), rawget(backend, 1))
++
++-- tests for Lua 5.1
++___''
++print("tonumber", mod.tonumber(12))
++print("tonumber", mod.tonumber("12"))
++print("tonumber", mod.tonumber("0"))
++print("tonumber", mod.tonumber(false))
++print("tonumber", mod.tonumber("error"))
++
++___''
++print("tointeger", mod.tointeger(12))
++print("tointeger", mod.tointeger(-12))
++print("tointeger", mod.tointeger(12.1))
++print("tointeger", mod.tointeger(12.9))
++print("tointeger", mod.tointeger(-12.1))
++print("tointeger", mod.tointeger(-12.9))
++print("tointeger", mod.tointeger("12"))
++print("tointeger", mod.tointeger("0"))
++print("tointeger", mod.tointeger(math.pi))
++print("tointeger", mod.tointeger(false))
++print("tointeger", mod.tointeger("error"))
++
++___''
++print("len", mod.len("123"))
++print("len", mod.len({ 1, 2, 3}))
++print("len", pcall(mod.len, true))
++local ud, meta = mod.newproxy()
++meta.__len = function() return 5 end
++print("len", mod.len(ud))
++meta.__len = function() return true end
++print("len", pcall(mod.len, ud))
++
++___''
++print("copy", mod.copy(true, "string", {}, 1))
++
++___''
++print("rawgetp/rawsetp", mod.rawxetp())
++print("rawgetp/rawsetp", mod.rawxetp("I'm back"))
++
++___''
++print("globals", F(mod.globals()), mod.globals() == _G)
++
++___''
++local t = {}
++print("getsubtable", F(mod.subtable(t)))
++local x, msg = mod.subtable(t)
++print("getsubtable", F(x, msg, x == t.xxx))
++
++___''
++print("udata", F(mod.udata()))
++print("udata", mod.udata("nosuchtype"))
++
++___''
++print("uservalue", F(mod.uservalue()))
++
++___''
++print("upvalues", mod.getupvalues())
++
++___''
++print("absindex", mod.absindex("hi", true))
++
++___''
++print("arith", mod.arith(2, 1))
++print("arith", mod.arith(3, 5))
++
++___''
++print("compare", mod.compare(1, 1))
++print("compare", mod.compare(2, 1))
++print("compare", mod.compare(1, 2))
++
++___''
++print("tolstring", mod.tolstring("string"))
++local t = setmetatable({}, {
++  __tostring = function(v) return "mytable" end
++})
++print("tolstring", mod.tolstring(t))
++local t = setmetatable({}, {
++  __tostring = function(v) return nil end
++})
++print("tolstring", pcall(mod.tolstring, t))
++local ud, meta = mod.newproxy()
++meta.__name = "XXX"
++print("tolstring", mod.tolstring(ud):gsub(":.*$", ": yyy"))
++
++___''
++print("pushstring", mod.pushstring())
++
++___''
++print("Buffer", mod.buffer())
++
++___''
++print("execresult", mod.exec("exit 0"))
++print("execresult", mod.exec("exit 1"))
++print("execresult", mod.exec("exit 25"))
++
++___''
++do
++  local bin = string.dump(function() end)
++  local modes = { "t", "b", "bt" }
++  local codes = {
++    "", "return true", bin, "invalidsource", "\27invalidbinary"
++  }
++  for _,m in ipairs(modes) do
++    for i,c in ipairs(codes) do
++      print("loadbufferx", m, i, F(mod.loadstring(c, m)))
++    end
++  end
++
++  ___''
++  local bom = "\239\187\191"
++  local shebang = "#!/usr/bin/env lua\n"
++  codes[#codes+1] = bom .. shebang .. "return true"
++  codes[#codes+1] = bom .. shebang .. bin
++  codes[#codes+1] = bom .. shebang .. "invalidsource"
++  codes[#codes+1] = bom .. shebang .. "\027invalidbinary"
++  for _,m in ipairs(modes) do
++    for i,c in ipairs(codes) do
++      print("loadfilex", m, i, F(mod.loadfile(c, m)))
++    end
++  end
++end
++___''
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/tests/testmod.c luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/tests/testmod.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/tests/testmod.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/tests/testmod.c	2019-02-13 11:53:29.078405237 +0100
+@@ -0,0 +1,352 @@
++#include <stdio.h>
++#include <stdlib.h>
++#include "compat-5.3.h"
++
++
++static int test_isinteger (lua_State *L) {
++  lua_pushboolean(L, lua_isinteger(L, 1));
++  return 1;
++}
++
++
++static int test_rotate (lua_State *L) {
++  int r = (int)luaL_checkinteger(L, 1);
++  int n = lua_gettop(L)-1;
++  luaL_argcheck(L, (r < 0 ? -r : r) <= n, 1, "not enough arguments");
++  lua_rotate(L, 2, r);
++  return n;
++}
++
++
++static int test_str2num (lua_State *L) {
++  const char *s = luaL_checkstring(L, 1);
++  size_t len = lua_stringtonumber(L, s);
++  if (len == 0)
++    lua_pushnumber(L, 0);
++  lua_pushinteger(L, (lua_Integer)len);
++  return 2;
++}
++
++
++static int my_mod (lua_State *L ) {
++  lua_newtable(L);
++  lua_pushboolean(L, 1);
++  lua_setfield(L, -2, "boolean");
++  return 1;
++}
++
++static int test_requiref (lua_State *L) {
++  lua_getfield(L, LUA_REGISTRYINDEX, "_LOADED");
++  lua_newtable(L);
++  lua_pushboolean(L, 0);
++  lua_setfield(L, -2, "boolean");
++  lua_setfield(L, -2, "requiref3");
++  lua_pop(L, 1);
++  luaL_requiref(L, "requiref1", my_mod, 0);
++  luaL_requiref(L, "requiref2", my_mod, 1);
++  luaL_requiref(L, "requiref3", my_mod, 1);
++  return 3;
++}
++
++static int test_getseti (lua_State *L) {
++  lua_Integer k = luaL_checkinteger(L, 2);
++  lua_Integer n = 0;
++  if (lua_geti(L, 1, k) == LUA_TNUMBER) {
++    n = lua_tointeger(L, -1);
++  } else {
++    lua_pop(L, 1);
++    lua_pushinteger(L, n);
++  }
++  lua_pushinteger(L, n+1);
++  lua_seti(L, 1, k);
++  return 1;
++}
++
++
++/* additional tests for Lua5.1 */
++#define NUP 3
++
++static int test_newproxy (lua_State *L) {
++  lua_settop(L, 0);
++  lua_newuserdata(L, 0);
++  lua_newtable(L);
++  lua_pushvalue(L, -1);
++  lua_pushboolean(L, 1);
++  lua_setfield(L, -2, "__gc");
++  lua_setmetatable(L, -3);
++  return 2;
++}
++
++static int test_absindex (lua_State *L) {
++  int i = 1;
++  for (i = 1; i <= NUP; ++i)
++    lua_pushvalue(L, lua_absindex(L, lua_upvalueindex(i)));
++  lua_pushvalue(L, lua_absindex(L, LUA_REGISTRYINDEX));
++  lua_pushstring(L, lua_typename(L, lua_type(L, lua_absindex(L, -1))));
++  lua_replace(L, lua_absindex(L, -2));
++  lua_pushvalue(L, lua_absindex(L, -2));
++  lua_pushvalue(L, lua_absindex(L, -4));
++  lua_pushvalue(L, lua_absindex(L, -6));
++  i += 3;
++  lua_pushvalue(L, lua_absindex(L, 1));
++  lua_pushvalue(L, lua_absindex(L, 2));
++  lua_pushvalue(L, lua_absindex(L, 3));
++  i += 3;
++  return i;
++}
++
++static int test_arith (lua_State *L) {
++  lua_settop(L, 2);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPADD);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPSUB);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPMUL);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPDIV);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPMOD);
++  lua_pushvalue(L, 1);
++  lua_pushvalue(L, 2);
++  lua_arith(L, LUA_OPPOW);
++  lua_pushvalue(L, 1);
++  lua_arith(L, LUA_OPUNM);
++  return lua_gettop(L)-2;
++}
++
++static int test_compare (lua_State *L) {
++  luaL_checknumber(L, 1);
++  luaL_checknumber(L, 2);
++  lua_settop(L, 2);
++  lua_pushboolean(L, lua_compare(L, 1, 2, LUA_OPEQ));
++  lua_pushboolean(L, lua_compare(L, 1, 2, LUA_OPLT));
++  lua_pushboolean(L, lua_compare(L, 1, 2, LUA_OPLE));
++  return 3;
++}
++
++static int test_globals (lua_State *L) {
++  lua_pushglobaltable(L);
++  return 1;
++}
++
++static int test_tonumber (lua_State *L) {
++  int isnum = 0;
++  lua_Number n = lua_tonumberx(L, 1, &isnum);
++  if (!isnum)
++    lua_pushnil(L);
++  else
++    lua_pushnumber(L, n);
++  return 1;
++}
++
++static int test_tointeger (lua_State *L) {
++  int isnum = 0;
++  lua_Integer n = lua_tointegerx(L, 1, &isnum);
++  if (!isnum)
++    lua_pushnil(L);
++  else
++    lua_pushinteger(L, n);
++  lua_pushinteger(L, lua_tointeger(L, 1));
++  return 2;
++}
++
++static int test_len (lua_State *L) {
++  luaL_checkany(L, 1);
++  lua_len(L, 1);
++  lua_pushinteger(L, luaL_len(L, 1));
++  return 2;
++}
++
++static int test_copy (lua_State *L) {
++  int args = lua_gettop(L);
++  if (args >= 2) {
++    int i = 0;
++    for (i = args-1; i > 0; --i)
++      lua_copy(L, args, i);
++  }
++  return args;
++}
++
++/* need an address */
++static char const dummy = 0;
++
++static int test_rawxetp (lua_State *L) {
++  if (lua_gettop(L) > 0)
++    lua_pushvalue(L, 1);
++  else
++    lua_pushliteral(L, "hello again");
++  lua_rawsetp(L, LUA_REGISTRYINDEX, &dummy);
++  lua_settop(L, 0);
++  lua_rawgetp(L, LUA_REGISTRYINDEX, &dummy);
++  return 1;
++}
++
++static int test_udata (lua_State *L) {
++  const char *tname = luaL_optstring(L, 1, "utype1");
++  void *u1 = lua_newuserdata(L, 1);
++  int u1pos = lua_gettop(L);
++  void *u2 = lua_newuserdata(L, 1);
++  int u2pos = lua_gettop(L);
++  luaL_newmetatable(L, "utype1");
++  luaL_newmetatable(L, "utype2");
++  lua_pop(L, 2);
++  luaL_setmetatable(L, "utype2");
++  lua_pushvalue(L, u1pos);
++  luaL_setmetatable(L, "utype1");
++  lua_pop(L, 1);
++  (void)u1;
++  (void)u2;
++  lua_pushlightuserdata(L, luaL_testudata(L, u1pos, tname));
++  lua_pushlightuserdata(L, luaL_testudata(L, u2pos, tname));
++  luaL_getmetatable(L, "utype1");
++  lua_getfield(L, -1, "__name");
++  lua_replace(L, -2);
++  return 3;
++}
++
++static int test_subtable (lua_State *L) {
++  luaL_checktype(L, 1, LUA_TTABLE);
++  lua_settop(L, 1);
++  if (luaL_getsubtable(L, 1, "xxx")) {
++    lua_pushliteral(L, "oldtable");
++  } else {
++    lua_pushliteral(L, "newtable");
++  }
++  return 2;
++}
++
++static int test_uservalue (lua_State *L) {
++  void *udata = lua_newuserdata(L, 1);
++  int ui = lua_gettop(L);
++  lua_newtable(L);
++  lua_setuservalue(L, ui);
++  lua_pushinteger(L, lua_getuservalue(L, ui));
++  (void)udata;
++  return 2;
++}
++
++static int test_upvalues (lua_State *L) {
++  int i = 1;
++  for (i = 1; i <= NUP; ++i)
++    lua_pushvalue(L, lua_upvalueindex(i));
++  return NUP;
++}
++
++static int test_tolstring (lua_State *L) {
++  size_t len = 0;
++  luaL_tolstring(L, 1, &len);
++  lua_pushinteger(L, (int)len);
++  return 2;
++}
++
++static int test_pushstring (lua_State *L) {
++  lua_pushstring(L, lua_pushliteral(L, "abc"));
++  lua_pushstring(L, lua_pushlstring(L, "abc", 2));
++  lua_pushstring(L, lua_pushlstring(L, NULL, 0));
++  lua_pushstring(L, lua_pushstring(L, "abc"));
++  lua_pushboolean(L, NULL == lua_pushstring(L, NULL));
++  return 10;
++}
++
++static int test_buffer (lua_State *L) {
++  luaL_Buffer b;
++  char *p = luaL_buffinitsize(L, &b, LUAL_BUFFERSIZE+1);
++  p[0] = 'a';
++  p[1] = 'b';
++  luaL_addsize(&b, 2);
++  luaL_addstring(&b, "c");
++  lua_pushliteral(L, "d");
++  luaL_addvalue(&b);
++  luaL_addchar(&b, 'e');
++  luaL_pushresult(&b);
++  return 1;
++}
++
++static int test_exec (lua_State *L) {
++  const char *cmd = luaL_checkstring(L, 1);
++  return luaL_execresult(L, system(cmd));
++}
++
++static int test_loadstring (lua_State *L) {
++  size_t len = 0;
++  char const* s = luaL_checklstring(L, 1, &len);
++  char const* mode = luaL_optstring(L, 2, "bt");
++  lua_pushinteger(L, luaL_loadbufferx(L, s, len, s, mode));
++  return 2;
++}
++
++static int test_loadfile (lua_State *L) {
++  char filename[L_tmpnam+1] = { 0 };
++  size_t len = 0;
++  char const* s = luaL_checklstring(L, 1, &len);
++  char const* mode = luaL_optstring(L, 2, "bt");
++  if (tmpnam(filename)) {
++    FILE* f = fopen(filename, "wb");
++    if (f) {
++      fwrite(s, 1, len, f);
++      fclose(f);
++      lua_pushinteger(L, luaL_loadfilex(L, filename, mode));
++      remove(filename);
++      return 2;
++    } else
++      remove(filename);
++  }
++  return 0;
++}
++
++
++static const luaL_Reg funcs[] = {
++  { "isinteger", test_isinteger },
++  { "rotate", test_rotate },
++  { "strtonum", test_str2num },
++  { "requiref", test_requiref },
++  { "getseti", test_getseti },
++  { "newproxy", test_newproxy },
++  { "arith", test_arith },
++  { "compare", test_compare },
++  { "tonumber", test_tonumber },
++  { "tointeger", test_tointeger },
++  { "len", test_len },
++  { "copy", test_copy },
++  { "rawxetp", test_rawxetp },
++  { "subtable", test_subtable },
++  { "udata", test_udata },
++  { "uservalue", test_uservalue },
++  { "globals", test_globals },
++  { "tolstring", test_tolstring },
++  { "pushstring", test_pushstring },
++  { "buffer", test_buffer },
++  { "exec", test_exec },
++  { "loadstring", test_loadstring },
++  { "loadfile", test_loadfile },
++  { NULL, NULL }
++};
++
++static const luaL_Reg more_funcs[] = {
++  { "getupvalues", test_upvalues },
++  { "absindex", test_absindex },
++  { NULL, NULL }
++};
++
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++int luaopen_testmod (lua_State *L) {
++  int i = 1;
++  luaL_newlib(L, funcs);
++  for (i = 1; i <= NUP; ++i)
++    lua_pushnumber(L, i);
++  luaL_setfuncs(L, more_funcs, NUP);
++  return 1;
++}
++#ifdef __cplusplus
++}
++#endif
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/.travis.yml luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/.travis.yml
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/deps/lua-compat/.travis.yml	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/deps/lua-compat/.travis.yml	2019-02-13 11:53:29.075071941 +0100
+@@ -0,0 +1,47 @@
++language: c
++compiler: gcc
++
++sudo: false
++
++env:
++  - LUA="lua=5.1"
++  - LUA="lua=5.1" EXTERNAL=true
++  - LUA="lua=5.1" COMPILER="g++"
++  - LUA="lua=5.1" EXTERNAL=true COMPILER="g++"
++  - LUA="luajit=@v2.1 --compat=none"
++  - LUA="luajit=@v2.1 --compat=none" EXTERNAL=true
++  - LUA="luajit=@v2.1 --compat=all"
++  - LUA="luajit=@v2.1 --compat=all" EXTERNAL=true
++  - LUA="lua=5.2"
++  - LUA="lua=5.2" EXTERNAL=true
++  - LUA="lua=5.2" COMPILER="g++"
++  - LUA="lua=5.2" EXTERNAL=true COMPILER="g++"
++
++branches:
++  only:
++    - master
++
++git:
++  depth: 3
++
++notifications:
++  email: false
++
++before_install:
++  - pip install --user hererocks
++  - hererocks old --$LUA
++  - test -e old/bin/lua || (cd old/bin && ln -s luajit* lua)
++  - hererocks new --lua=5.3
++
++install:
++  - export CC="${COMPILER:-gcc}" DEF="" SRC="" CFLAGS="-Wall -Wextra -Ic-api -O2 -fPIC"
++  - if [ "x${EXTERNAL:-}" = xtrue ]; then DEF="-DCOMPAT53_PREFIX=compat53" SRC="c-api/compat-5.3.c"; fi
++  - ${CC} ${CFLAGS} -Iold/include ${DEF} -shared -o old/testmod.so tests/testmod.c ${SRC}
++  - ${CC} ${CFLAGS} -Inew/include ${DEF} -shared -o new/testmod.so tests/testmod.c ${SRC}
++  - gcc ${CFLAGS} -Iold/include ${DEF} -shared -o old/compat53.so ltablib.c lutf8lib.c lstrlib.c ${SRC}
++
++script:
++  - (cd old && bin/lua ../tests/test.lua) > old.txt
++  - (cd new && bin/lua ../tests/test.lua) > new.txt
++  - diff old.txt new.txt || true
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/asn1.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/asn1.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/asn1.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/asn1.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,209 +0,0 @@
+----
+--- Provide asn1_object, asn1_string, asn1_object as lua object.
+--- Sometime when you want to custome x509, you maybe need to use this.
+---
+--- @module asn1
+--- @usage
+---  asn1 = require('openssl').asn1
+---
+-
+-do  -- define module function
+-
+---- Create asn1_object object
+---
+--- @tparam string name_or_oid  short name,long name or oid string
+--- @tparam[opt] boolean no_name  true for only oid string, default is false
+--- @treturn asn1_object mapping to ASN1_OBJECT in openssl
+---
+--- @see asn1_object
+-function new_object() end
+-
+---- Create asn1_object object
+---
+--- @tparam integer nid ident to asn1_object
+--- @treturn asn1_object mapping to ASN1_OBJECT in openssl
+---
+--- @see asn1_object
+-function new_object() end
+-
+---- Create asn1_object object
+---
+--- @tparam table options have sn, ln, oid keys to create asn1_object
+--- @treturn asn1_object mapping to ASN1_OBJECT in openssl
+---
+--- @see asn1_object
+-function new_object() end
+-
+---- Create asn1_string object
+---
+--- <br/><p> asn1_string object support types:   "integer", "enumerated", "bit", "octet", "utf8",
+--- "numeric", "printable", "t61", "teletex", "videotex", "ia5", "graphics", "iso64",
+--- "visible", "general", "unversal", "bmp", "utctime" </p>
+---
+--- @tparam string data to create new asn1_string
+--- @tparam[opt] string type asn1 string type, defult with 'utf8'
+--- @see asn1_string
+-function new_string() end
+-
+---- get nid for txt, which can be short name, long name, or numerical oid
+---
+--- @tparam string txt which get to nid
+--- @treturn integer nid or nil on fail
+-function txt2nid() end
+-
+---- make tag, class number to string
+---
+--- @tparam number clsortag which to string
+--- @tparam string range only accept 'class' or 'tag'
+-function tostring() end
+-
+---- parse der encoded string
+--- @tparam string der string
+--- @tparam[opt=1] number start offset to parse
+--- @tparam[opt=-i] number stop offset to parse
+---  this like string.sub()
+--- @treturn[1] number tag
+--- @treturn[1] number class
+--- @treturn[1] number parsed data start offset
+--- @treturn[1] number parsed data stop offset
+--- @treturn[1] boolean true for constructed data
+--- @treturn[2] nil for fail
+--- @treturn[2] string error msg
+--- @treturn[2] number inner error code
+-function get_object() end
+-
+---- do der encode and return encoded string partly head or full
+--- @tparam number tag
+--- @tparam number class
+--- @tparam[opt=nil] number|string length or date to encode, defualt will make
+--- indefinite length constructed
+--- @tparam[opt=nil] boolean constructed or not
+--- @treturn string der encoded string or head when not give data
+-function put_object() end
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.asn1_object object
+--- @type asn1_object
+---
+-do  -- defint asn1_object
+-
+---- get nid of asn1_object.
+---
+--- @treturn integer nid of asn1_object
+---
+-function nid() end
+-
+---- get name of asn1_object.
+---
+--- @treturn string short name of asn1_object
+--- @treturn string long name of asn1_object
+---
+-function name() end
+-
+---- get short name of asn1_object.
+---
+--- @treturn string short name of asn1_object
+---
+-function sn() end
+-
+---- get long name of asn1_object.
+---
+--- @treturn string long name of asn1_object
+---
+-function ln() end
+-
+---- get text of asn1_object.
+---
+--- @tparam[opt] boolean no_name true for only oid or name, default with false
+--- @treturn string long or short name, even oid of asn1_object
+---
+-function txt() end
+-
+---- compare two asn1_objects, if equals return true
+---
+--- @tparam asn1_object another to compre
+--- @treturn boolean true if equals
+---
+-function __eq(another) end
+-
+---- make a clone of asn1_object
+---
+--- @treturn asn1_object clone for self
+-function dup() end
+-
+---- get data of asn1_object
+---
+--- @treturn string asn1_object data
+-function data() end
+-
+-end
+-
+-
+---- openssl.asn1_string object
+--- @type asn1_string
+-
+-do
+-
+---- get type of asn1_string
+---
+--- @treturn string type of asn1_string
+--- @see new_string
+-function type() end
+-
+---- get data of asn1_string
+---
+--- @treturn string raw data of asn1_string
+-function data() end
+-
+---- set data of asn1_string
+---
+--- @tparam string data set to asn1_string
+--- @treturn boolean success if value set true, or follow by errmsg
+--- @treturn string fail error message
+-function data() end
+-
+---- get data as utf8 encode string
+---
+--- @treturn string utf8 encoded string
+-function toutf8() end
+-
+---- get data as printable encode string
+---
+--- @treturn string printable encoded string
+-function print() end
+-
+---- duplicate a new asn1_string
+---
+--- @treturn asn1_string clone for self
+-function dup() end
+-
+---- get length two asn1_string
+---
+--- @treturn integer length of asn1_string
+--- @usage
+---  local astr = asn1.new_string('ABCD')
+---  print('length:',#astr)
+---  print('length:',astr:length())
+---  assert(#astr==astr:length,"must equals")
+-function length() end
+-
+---- compare two asn1_string, if equals return true
+---
+--- @tparam asn1_string another to compre
+--- @treturn boolean true if equals
+--- @usage
+---  local obj = astr:dup()
+---  assert(obj==astr, "must equals")
+-function __eq(another) end
+-
+---- convert asn1_string to lua string
+---
+--- @treturn string result format match with type:data
+-function __tostring() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/bio.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/bio.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/bio.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/bio.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,147 +0,0 @@
+-------------
+--- Provide bio module.
+--- bio object mapping to BIO in openssl
+--- openssl.bio is a help object, it is useful, but rarely use.
+--- @module bio
+--- @usage
+---  bio = require'openssl'.bio
+-
+-do --define module function
+-
+---- make string as bio object
+--- same with bio.mem, implication by metatable '__call'
+--- @tparam[opt=nil] string data
+--- @treturn bio
+-function openssl.bio() end
+-
+---- make string as bio object
+--- @tparam[opt=nil] string data, it will be memory buffer data
+--- @treturn bio it can be input or output object
+-function mem() end
+-
+---- make tcp bio from socket fd
+--- @tparam number fd
+--- @tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
+--- @treturn bio
+-function socket() end
+-
+---- make dgram bio from socket fd
+--- @tparam number fd
+--- @tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
+--- @treturn bio
+-function dgram() end
+-
+---- make socket or file bio with fd
+--- @tparam number fd
+--- @tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
+--- @treturn bio
+-function fd() end
+-
+---- make file object with file name or path
+--- @tparam string file
+--- @tparam[opt='r'] string mode
+--- @treturn bio
+-function file() end
+-
+---- make tcp client socket
+--- @tparam string host_addr addrees like 'host:port'
+--- @tparam[opt=true] boolean connect default connect immediately
+--- @treturn bio
+-function connect() end
+-
+---- make tcp listen socket 
+--- @tparam string host_port address like 'host:port'
+--- @treturn bio 
+-function accept() end
+-
+---- Create base64 or buffer bio, which can append to an io BIO object
+--- @tparam string mode support 'base64' or 'buffer'
+--- @treturn bio
+-function filter() end
+-
+---- Create digest bio, which can append to an io BIO object
+--- @tparam string mode must be 'digest'
+--- @tparam evp_md|string md_alg
+--- @treturn bio
+-function filter() end
+-
+---- Create ssl bio
+--- @tparam string mode must be 'ssl'
+--- @tparam ssl s
+--- @tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
+--- @treturn bio
+-function filter() end
+-
+---- create cipher filter bio object
+--- @tparam string mode must be 'cipher'
+--- @tparam string key
+--- @tparam string iv
+--- @tparam[opt=true] boolean encrypt
+--- @treturn bio
+-function filter() end
+-
+-end  -- define module
+-
+-
+-do  -- define class
+-
+---- openssl.bio object
+--- @type bio
+---
+-
+-do  -- define bio
+-
+---- setup ready and accept client connect
+--- @tparam[opt=false] boolean setup true for setup accept bio, false or none will accept client connect
+--- @treturn[1] boolean result only when setup is true
+--- @treturn[2] bio accpeted bio object
+-function accept() end 
+-
+---- read data from bio object
+--- @tparam number len
+--- @treturn string string length may be less than param len
+-function read() end
+-
+---- get line from bio object
+--- @tparam[opt=256] number max line len
+--- @treturn string string length may be less than param len
+-function gets() end
+-
+---- write data to bio object
+--- @tparam string data
+--- @treturn number length success write
+-function write() end
+-
+---- put line to bio object
+--- @tparam string data
+--- @treturn number length success write
+-function puts() end
+-
+---- get mem data, only support mem bio object
+--- @treturn string
+-function get_mem() end
+-
+---- push bio append to chain of bio, if want to free a chain use free_all()
+--- @tparam bio append
+--- @treturn bio 
+-function push() end
+-
+---- remove bio from chain
+--- @tparam bio toremove
+-function pop() end
+-
+---- free a chain
+-function free_all() end
+-
+---- close bio
+-function close() end
+-
+---- get type of bio
+--- @treturn string
+-function type() end
+-
+--- reset bio
+--- @TODO string
+-function reset() end
+-
+-end --define class
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/cipher.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/cipher.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/cipher.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/cipher.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,229 +0,0 @@
+---- 
+--- Provide cipher function in lua.
+---
+--- @module cipher
+--- @usage
+---  cipher = require('openssl').cipher
+---
+-
+-do  -- define module function
+-
+---- list all support cipher algs
+---
+--- @tparam[opt] boolean alias include alias names for cipher alg, default true
+--- @treturn[table] all cipher methods
+---
+-function list() end
+-
+-
+---- get evp_cipher object
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @treturn evp_cipher cipher object mapping EVP_MD in openssl
+---
+--- @see evp_cipher
+-function get() end
+-
+---- get evp_cipher_ctx object for encrypt or decrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
+---
+--- @see evp_cipher_ctx
+-function new() end
+-
+---- get evp_cipher_ctx object for encrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
+---
+--- @see evp_cipher_ctx
+-function encrypt_new() end
+-
+---- get evp_cipher_ctx object for decrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
+---
+--- @see evp_cipher_ctx
+-function decrypt_new() end
+-
+---- quick encrypt or decrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string input data to encrypt or decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result
+-function cipher() end
+-
+---- quick encrypt or decrypt,alias to cipher
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string input data to encrypt or decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result
+-function openssl.cipher() end
+-
+---- quick encrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string input data to encrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result encrypt data
+-function encrypt() end
+-
+---- quick decrypt
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string input data to decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result decrypt data
+-function decrypt() end
+- 
+-end
+-
+-do  -- define class
+-
+---- openssl.evp_cipher object
+--- @type evp_cipher
+---
+-do  -- define evp_cipher
+-
+-
+---- get infomation of evp_cipher object
+---
+--- @treturn table info keys include name,block_size,key_length,iv_length,flags,mode
+-function info() end
+-
+---- derive key
+---
+--- @tparam string data derive data
+--- @tparam string[opt] string salt salt will get strong security
+--- @tparam ev_digest|string md digest method used to diver key, default with 'sha1'
+--- @treturn string key
+--- @treturn string iv
+-function BytesToKey() end
+-
+---- do encrypt or decrypt
+---
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string input data to encrypt or decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result
+-function cipher() end
+-
+---- do encrypt
+---
+--- @tparam string input data to encrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result
+-function encrypt() end
+-
+---- do decrypt
+---
+--- @tparam string input data to decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn string result
+-function decrypt() end
+-
+---- get evp_cipher_ctx to encrypt or decrypt 
+---
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx evp_cipher_ctx object
+---
+--- @see evp_cipher_ctx
+-function new() end
+-
+---- get evp_cipher_ctx to encrypt 
+---
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx evp_cipher_ctx object
+---
+--- @see evp_cipher_ctx
+-function encrypt_new() end
+-
+---- get evp_cipher_ctx to decrypt 
+---
+--- @tparam boolean encrypt true for encrypt,false for decrypt
+--- @tparam string key secret key
+--- @tparam[opt] string iv
+--- @tparam[opt] boolean pad true for padding default
+--- @tparam[opt] engine engine custom crypto engine
+--- @treturn evp_cipher_ctx evp_cipher_ctx object
+---
+--- @see evp_cipher_ctx
+-function decrypt_new() end
+-
+-end
+-
+-do  -- define evp_cipher_ctx
+-
+---- openssl.evp_cipher_ctx object
+--- @type evp_cipher_ctx
+---
+- 
+---- get infomation of evp_cipher_ctx object
+---
+--- @treturn table info keys include block_size,key_length,iv_length,flags,mode,nid,type, evp_cipher
+-function info() end
+-  
+---- feed data to do cipher
+---
+--- @tparam string msg data
+--- @treturn string result parture result
+-function update() end
+-
+---- get result of cipher
+---
+--- @treturn string result last result
+-function final() end
+-
+-end
+-
+-end
+-
+-
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/cms.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/cms.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/cms.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/cms.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,142 +0,0 @@
+---- Provide cms function in lua.
+--- cms are based on apps/cms.c from the OpenSSL dist, so for more information, see the documentation for OpenSSL.
+--- cms api need flags, not support "detached", "nodetached", "text", "nointern", "noverify", "nochain", "nocerts",
+--- "noattr", "binary", "nosigs"
+---
+--- Decrypts the S/MIME message in the BIO object and output the results to BIO object. 
+--- recipcert is a CERT for one of the recipients. recipkey specifies the private key matching recipcert.
+--- Headers is an array of headers to prepend to the message, they will not be included in the encoded section.
+---
+--- @module cms
+--- @usage
+---  cms = require('openssl').cms
+---
+-
+-do  -- define module function
+-
+---- create cms object
+--- @treturn cms
+-function create() end
+-
+---- read cms object
+--- @tparam bio input
+--- @tparam[opt=0] number flags
+--- @treturn cms
+-function create() end
+-
+---- create digest cms object
+--- @tparam bio input
+--- @tparam evp_digest|string md_alg
+--- @tparam[opt=0] number flags
+--- @treturn cms
+-function create() end
+-
+---- encrypt with recipt certs
+--- @tparam stack_of_x509 recipt certs
+--- @tparam bio input
+--- @tparam string|evp_cipher cipher_alg
+--- @tparam[opt=0] number flags
+--- @tparam[opt=nil] table options, may have key,keyid, password field which must be string type 
+--- @treturn cms
+-function encrypt() end
+-
+---- decrypt cms message
+--- @tparam cms message
+--- @tparam evp_pkey pkey
+--- @tparam x509 recipt
+--- @tparam bio dcount output object
+--- @tparam bio out output object
+--- @tparam[opt=0] number flags
+--- @tparam[opt=nil] table options may have key, keyid, password field, which must be string type
+--- @treturn boolean
+-function decrypt() end
+-
+---- make signed cms object
+--- @tparam x509 signer cert
+--- @tparam evp_pkey pkey
+--- @tparam stack_of_x509 certs include in the CMS
+--- @tparam bio input_data
+--- @tparam[opt=0] number flags 
+--- @treturn cms object
+-function sign() end
+-
+---- verfiy signed cms object
+--- @tparam cms signed
+--- @tparam string verify_mode, must be 'verify'
+--- @tparam stack_of_x509 others 
+--- @tparam x509_store castore
+--- @tparam bio message
+--- @tparam bio out
+--- @tparam[opt=0] number flags
+--- @treturn boolean result
+-function verify() end
+-
+---- verify digest cms object
+--- @tparam cms digested
+--- @tparam string verify_mode, must be 'digest'
+--- @tparam bio input message
+--- @tparam bio out content
+--- @tparam[opt=0] number flags
+--- @treturn boolean result
+-function verify() end
+-
+---- verify receipt cms object
+--- @tparam cms cms
+--- @tparam string verify_mode must be 'receipt'
+--- @tparam cms source
+--- @tparam stack_of_x509 certs
+--- @tparam x509_store store
+--- @tparam[opt=0] number flags
+--- @treturn boolean result
+-function verify() end
+-
+---- read cms object from input bio or string
+--- @tparam bio|string input 
+--- @tparam[opt='auto'] string format, support 'auto','smime','der','pem'
+---  auto will only try 'der' or 'pem'
+--- @tparam[opt=nil] bio content, only used when format is 'smime'
+--- @treturn cms
+-function read() end
+-
+---- write cms object to bio object
+--- @tparam cms cms
+--- @tparam bio out
+--- @tparam bio in 
+--- @tparam[opt=0] number flags 
+--- @tparam[opt='smime'] string format
+--- @treturn boolean 
+-function write() end
+-
+---- create compress cms object
+--- @tparam bio input 
+--- @tparam string alg, zlib or rle 
+--- @tparam[opt=0] number flags
+--- @treturn cms
+-function compress() end
+-
+---- uncompress cms object
+--- @tparam cms cms
+--- @tparam bio input 
+--- @tparam bio out 
+--- @tparam[opt=0] number flags
+--- @treturn boolean
+-function uncompress() end
+-
+---- create enryptdata cms
+--- @tparam bio input 
+--- @tparam cipher|string cipher_alg
+--- @tparam strig key 
+--- @tparam[opt=0] number flags
+--- @treturn cms object
+-function EncryptedData_encrypt() end
+-
+---- decrypt encryptdata cms
+--- @tparam cms encrypted
+--- @tparam string key
+--- @tparam bio out 
+--- @tparam[opt=0] number flags
+--- @treturn boolean result 
+-function EncryptedData_decrypt() end
+-
+-end
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/config.ld luvi-src-v2.7.6/deps/lua-openssl/ldoc/config.ld
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/config.ld	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/config.ld	1970-01-01 01:00:00.000000000 +0100
+@@ -1,33 +0,0 @@
+-project='lua-openssl'
+-title='lua-openssl Docmentation'
+-description='Openssl binding for Lua'
+-format='discount'
+-backtick_references=false
+-file={
+-	'openssl.lua',
+-	'asn1.lua',
+-	'bio.lua',
+-	'cipher.lua',
+-	'digest.lua',
+-	'hmac.lua',
+-	'pkey.lua',
+-	'x509.lua',
+-	'x509_name.lua',
+-	'x509_extension.lua',
+-	'x509_attr.lua',
+-	'x509_req.lua',
+-	'x509_crl.lua',
+-	'x509_store.lua',
+-	'pkcs7.lua',
+-	'cms.lua',
+-	'pkcs12.lua',
+-	'timestamp.lua',
+-	'ssl.lua',
+-	'sk.lua'
+-}
+-dir='doc'
+-readme='README.md'
+-style='!pale'
+-kind_names={topic='Manual',script='Programs'}
+-examples = {
+-}
+\ No newline at end of file
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/digest.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/digest.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/digest.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/digest.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,156 +0,0 @@
+---- 
+--- Provide digest function in lua.
+---
+--- @module digest
+--- @usage
+---  digest = require('openssl').digest
+---
+-
+-do  -- define module function
+-
+---- list all support digest algs
+---
+--- @tparam[opt] boolean alias include alias names for digest alg, default true
+--- @treturn[table] all methods
+---
+-function list() end
+-
+---- get evp_digest object
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @treturn evp_digest digest object mapping EVP_MD in openssl
+---
+--- @see evp_digest
+-function get() end
+-
+---- get evp_digest_ctx object
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @treturn evp_digest_ctx digest object mapping EVP_MD_CTX in openssl
+---
+--- @see evp_digest_ctx
+-function new() end
+-
+---- quick method to generate digest result
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string msg to compute digest 
+--- @tparam[opt] boolean raw binary result return if set true, or hex encoded string default
+--- @treturn string digest result value
+-function digest() end
+- 
+---- create digest object for sign
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam[opt=nil] engine object
+--- @treturn evp_digest_ctx
+-function signInit() end
+-
+---- create digest object for verify
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam[opt=nil] engine object
+--- @treturn evp_digest_ctx
+-function verifyInit() end
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.evp_digest object
+--- @type evp_digest
+---
+-do  -- define evp_digest
+-
+---- create new evp_digest_ctx
+---
+--- @tparam[opt] engine, nothing will use default engine
+--- @treturn evp_digest_ctx ctx
+--- @see evp_digest_ctx
+-function new() end
+-
+---- get infomation of evp_digest object
+---
+--- @treturn table info keys include nid,name size,block_size,pkey_type,flags
+-function info() end
+-
+---- compute msg digest result
+---
+--- @tparam string msg data to digest
+--- @tparam[opt] engine, eng
+--- @treturn string result a binary hash value for msg
+-function digest() end
+-
+---- create digest object for sign
+---
+--- @tparam[opt=nil] engine object
+--- @treturn evp_digest_ctx
+-function signInit() end
+-
+---- create digest object for verify
+---
+--- @tparam[opt=nil] engine object
+--- @treturn evp_digest_ctx
+-function verifyInit() end
+-
+-end
+-
+-do  -- define evp_digest_ctx
+-
+---- openssl.evp_digest_ctx object
+--- @type evp_digest_ctx
+---
+- 
+---- get infomation of evp_digest_ctx object
+---
+--- @treturn table info keys include size,block_size,digest
+-function info() end
+-
+---- feed data to do digest
+---
+--- @tparam string msg data
+--- @treturn boolean result true for success
+-function update() end
+-
+---- get result of digest
+---
+--- @tparam[opt] string last last part of data
+--- @tparam[opt] boolean raw binary or hex encoded result, default true for binary result
+--- @treturn string val hash result 
+-function final() end
+-
+-
+---- reset evp_diget_ctx to reuse
+---
+-function reset() end
+-
+---- feed data for sign to get signature
+---
+--- @tparam string data to be signed
+--- @treturn boolean result
+-function signUpdate() end
+-
+---- feed data for verify with signature
+---
+--- @tparam string data to be verified
+--- @treturn boolean result
+-function verifyUpdate() end
+-
+---- get result of sign
+---
+--- @tparam evp_pkey private key to do sign
+--- @treturn string singed result
+-function signFinal() end
+-
+---- get verify result
+---
+--- @tparam string signature
+--- @treturn boolean result, true for verify pass
+-function verifyFinal() end
+-
+-end
+-
+-end
+-
+-
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/hmac.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/hmac.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/hmac.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/hmac.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,77 +0,0 @@
+---- 
+--- Provide hmac function in lua.
+---
+--- @module hmac
+--- @usage
+---  hamc = require('openssl').hmac
+---
+-
+-do  -- define module function
+-
+---- compute hmac one step, in module openssl
+---
+--- @tparam evp_digest|string|nid digest digest alg identity
+--- @tparam string key
+--- @tparam[opt] engine engine, nothing with default engine
+--- @treturn string result binary string
+---
+-function openssl.hmac() end
+-
+---- compute hmac one step, in module openssl.hamc
+---
+--- @tparam evp_digest|string|nid digest digest alg identity
+--- @tparam string key
+--- @tparam boolean raw, return binary or hex encoded string, true false binary or hex
+--- @tparam[opt] engine engine, nothing with default engine
+--- @treturn string result binary or hex string
+-function hmac() end
+-
+---- alias for hmac
+---
+--- @tparam evp_digest|string|nid digest digest alg identity
+--- @tparam string key
+--- @tparam boolean raw, return binary or hex encoded string, true false binary or hex
+--- @tparam[opt] engine engine, nothing with default engine
+--- @treturn string result binary or hex string
+-function digest() end
+-
+---- get hamc_ctx object
+---
+--- @tparam string|integer|asn1_object alg name, nid or object identity
+--- @tparam string key secret key
+--- @tparam[opt] engine engine, nothing with default engine
+--- @treturn hamc_ctx hmac object mapping HMAC_CTX in openssl
+---
+--- @see hmac_ctx
+-function new() end
+- 
+-end
+-
+-do  -- define class
+-
+---- openssl.hmac_ctx object
+--- @type hmac_ctx
+---
+-
+-do  -- define hmac_ctx
+-
+---- feed data to do digest
+---
+--- @tparam string msg data
+-function update() end
+-
+---- get result of hmac
+---
+--- @tparam[opt] string last last part of data
+--- @tparam[opt] boolean raw binary or hex encoded result, default true for binary result
+--- @treturn string val hash result 
+-function final() end
+-
+-
+---- reset hmac_ctx to reuse
+---
+-function reset() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/openssl.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/openssl.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/openssl.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/openssl.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,76 +0,0 @@
+----
+--- Provide openssl base function in lua.
+---
+--- @module openssl
+--- @usage
+---  openssl = require('openssl')
+---
+-
+-do  -- define module function
+-
+--- Most lua-openssl function or methods return nil or false when error or
+--- failed, followed by string type error _reason_ and number type error _code_,
+--- _code_ can pass to openssl.error() to get more error information.
+-
+---- hex encode or decode string
+--- @tparam string str
+--- @tparam[opt=true] boolean encode true to encoed, false to decode
+--- @treturn string
+-function hex() end
+-
+---- base64 encode or decode
+--- @tparam string|bio input
+--- @tparam[opt=true] boolean encode true to encoed, false to decode
+--- @tparam[opt=true] boolean NO_NL true with newline, false without newline
+--- @treturn string
+-function base64() end
+-
+---- get method names
+--- @tparam string type support 'cipher','digests','pkeys','comps'
+--- @treturn table as array
+-function list() end
+-
+---- get last or given error infomation
+--- @tparam[opt] number error, default use ERR_get_error() return value
+--- @tparam[opt=false] boolean clear the current thread's error queue.
+--- @treturn number errcode
+--- @treturn string reason
+--- @treturn string library name
+--- @treturn string function name
+--- @treturn boolean is this is fatal error
+-function error() end
+-
+---- get random bytes
+--- @tparam number length
+--- @tparam[opt=false] boolean strong true to generate strong randome bytes
+--- @treturn string
+-function random() end
+-
+---- get random generator state
+--- @tparam boolean result true for sucess
+-function rand_status() end
+-
+---- load rand seed from file
+--- @tparam[opt=nil] string file path to laod seed, default opensl management
+--- @treturn boolean result
+-function rand_load() end
+-
+---- save rand seed to file
+--- @tparam[opt=nil] string file path to save seed, default openssl management
+--- @treturn bool result
+-function rand_write() end
+-
+---- cleanup random genrator
+-function rand_cleanup() end
+-
+---- get openssl engine object
+--- @tparam string engine_id
+--- @treturn engine
+-function engine() end
+-
+--- get lua-openssl version
+--- @tparam[opt] boolean format result will be number when set true, or string
+--- @treturn lua-openssl version, lua version, openssl version
+-function version() end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkcs12.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkcs12.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkcs12.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkcs12.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,28 +0,0 @@
+---- 
+--- Provide pkcs12 function in lua.
+---
+--- @module pkcs12
+--- @usage
+---  pkcs12 = require('openssl').pkcs12
+---
+-
+-do  -- define module function
+-
+---- parse pkcs12 data as lua table
+---
+--- @tparam string|bio input pkcs12 content
+--- @tparam string password for pkcs12
+--- @treturn table result contain 'cert', 'pkey', 'extracerts' keys
+-function read() end
+-
+---- create and export pkcs12 data
+--- @tparam x509 cert
+--- @tparam evp_pkey pkey
+--- @tparam string password
+--- @tparam[opt] string friendlyname
+--- @tparam[opt] table|stak_of_x509 extracerts
+--- @treturn string data
+-function export() end
+-
+-end
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkcs7.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkcs7.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkcs7.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkcs7.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,91 +0,0 @@
+----
+--- Provide pkcs7 function in lua.
+---
+--- @module pkcs7
+--- @usage
+---  pkcs7 = require('openssl').pkcs7
+---
+-
+-do  -- define module function
+-
+---- read pkcs7
+--- read string or bio object, which include pkcs7 content
+--- @tparam bio|string input
+--- @tparam[opt='auto'] format allow 'auto','der','pem','smime'
+---  auto will only try 'der' or 'pem'
+--- @tparam string password for pkcs12
+--- @treturn pkcs7 object or nil
+--- @treturn string content exist only smime format
+-function read() end
+-
+---- sign message with signcert and signpkey to create pkcs7 object
+--- @tparam string|bio msg
+--- @tparam x509 sigcert
+--- @tparam evp_pkey signkey
+--- @tparam[opt] stack_of_x509 cacerts
+--- @tparam[opt=0] number flags
+--- @treturn pkcs7 object
+-function sign() end
+-
+---- verify pkcs7 object, and return msg content, follow by singers
+--- @tparam pkcs7 in
+--- @tparam[opt] stack_of_x509 signercerts
+--- @tparam[opt] x509_store cacerts
+--- @tparam[opt] string|bio msg
+--- @tparam[opt=0] number flags
+--- @treturn[1] string content
+--- @treturn[1] boolean result
+-function verify() end
+-
+---- encrypt message with recipcerts certificates return encrypted pkcs7 object
+--- @tparam string|bio msg
+--- @tparam stack_of_x509 recipcerts
+--- @tparam[opt='rc4'] string|evp_cipher cipher
+--- @tparam[opt] number flags
+-function encrypt() end
+-
+---- decrypt encrypted pkcs7 message
+--- @tparam pkcs7 input
+--- @tparam x509 recipcert
+--- @tparam evp_pkey recipkey
+--- @treturn string decrypt message
+-function decrypt() end
+-
+-end
+-
+-
+-do  -- define class
+-
+---- openssl.pkcs7 object
+--- @type pkcs7
+---
+-
+-do  -- define pkcs7
+-
+---- export pkcs7 as string
+--- @tparam[opt=true] boolean pem default export as pem format, false export as der string
+--- @treturn string
+-function export() end
+-
+---- export pkcs7 as a string
+--- @treturn table  a table has pkcs7 infomation, include type,and other things relate to types
+-function parse() end
+-
+---- verify pkcs7 object, and return msg content, follow by singers
+--- @tparam[opt] stack_of_x509 signercerts
+--- @tparam[opt] x509_store cacerts
+--- @tparam[opt] string|bio msg
+--- @tparam[opt=0] number flags
+--- @treturn string content
+--- @treturn stack_of_x509 signers
+-function verify() end
+-
+---- decrypt encrypted pkcs7 message
+--- @tparam x509 recipcert
+--- @tparam evp_pkey recipkey
+--- @treturn string decrypt message
+-function decrypt() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkey.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkey.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/pkey.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/pkey.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,201 +0,0 @@
+-------------
+--- Provide Public/Private key module.
+--- @module pkey
+--- @usage
+---  pkey = require'openssl'.pkey
+-
+-do --define module function
+-
+---- generate a new ec keypair
+--- @tparam string alg, alg must be 'ec'
+--- @tparam string|number curvename this can be integer as curvename NID
+--- @tparam[opt] integer flags when alg is ec need this.
+--- @treturn evp_pkey object with mapping to EVP_PKEY in openssl
+-function new() end
+-
+---- generate a new keypair
+--- @tparam[opt='rsa'] string alg, accept 'rsa','dsa','dh'
+--- @tparam[opt=1024|512] integer bits, rsa with 1024,dh with 512
+--- @tparam[opt]  when alg is rsa give e value default is 0x10001
+--- @treturn evp_pkey object with mapping to EVP_PKEY in openssl
+-function new() end
+-
+---- create a new keypair by factors of keypair or get public key only
+--- @tparam table factors to create private/public key, key alg only accept accept 'rsa','dsa','dh','ec' and must exist</br>
+---  when arg is rsa, table may with key n,e,d,p,q,dmp1,dmq1,iqmp, both are binary string or openssl.bn<br>
+---  when arg is dsa, table may with key p,q,g,priv_key,pub_key, both are binary string or openssl.bn<br>
+---  when arg is dh, table may with key p,g,priv_key,pub_key, both are binary string or openssl.bn<br>
+---  when arg is ec, table may with D,X,Y,Z,both are binary string or openssl.bn<br>
+--- @treturn evp_pkey object with mapping to EVP_PKEY in openssl
+--- @usage
+---  --create rsa public key
+---    pubkey = new({alg='rsa',n=...,e=...}
+---  --create new rsa
+---    rsa = new({alg='rsa',n=...,q=...,e=...,...}
+-function new() end
+-
+---- get public key from private key object
+--- @tparam evp_pkey priv_key
+--- @treturn evp_pkey pub_key
+--- @see evp_pkey
+-function get_public() end
+-
+---- read public/private key from data
+--- @tparam string|openssl.bio input string data or bio object
+--- @tparam[opt=false] boolean priv prikey set true when input is private key
+--- @tparam[opt='auto'] format format or encoding of input, support 'auto','pem','der'
+--- @tparam[opt] string passhprase when input is private key, or key types 'ec','rsa','dsa','dh'
+--- @treturn evp_pkey public key
+--- @see evp_pkey
+-function read() end
+-
+---- sign message with private key
+--- @tparam evp_pkey key key used to sign message
+--- @tparam string data data be signed
+--- @tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
+--- @treturn string signed message
+-function sign() end
+-
+---- verify signed message with public key
+--- @tparam evp_pkey key key used to verify message
+--- @tparam string data data be signed
+--- @tparam string signature signed result
+--- @tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
+--- @tparam boolean true for pass verify
+-function verify() end
+-
+---- encrypt message with public key
+--- encrypt length of message must not longer than key size, if shorter will do padding,currently supports 6 padding modes.
+--- They are: pkcs1, sslv23, no, oaep, x931, pss.
+--- @tparam evp_pkey key key used to encrypted message
+--- @tparam string data data to be encrypted
+--- @tparam string[opt='pkcs1'] string padding padding mode
+--- @treturn string encrypted message
+-function encrypt() end
+-
+---- decrypt message with private key
+--- pair with encrypt
+--- @tparam evp_pkey key key used to decrypted message
+--- @tparam string data data to be decrypted
+--- @tparam string[opt='pkcs1'] string padding padding mode
+--- @treturn[1] string result
+--- @treturn[2] nil
+-function decrypt() end
+-
+---- seal  and encrypt  message with one public key
+--- data be encrypt with secret key, secret key be encrypt with public key
+--- encrypts data using pubkeys in table, so that only owners of the respective private keys and ekeys can decrypt and read the data.
+--- @tparam table pubkeys public keys to encrypt secret key
+--- @tparam string data data to be encrypted
+--- @tparam[opt='RC4'] cipher|string alg
+--- @treturn string data encrypted
+--- @treturn table ekey secret key encrypted by public key
+--- @treturn stringiv
+-function seal() end
+-
+---- seal and encrypt message with one public key
+--- data be encrypt with secret key, secret key be encrypt with public key
+--- @tparam evp_pkey pubkey public keys to encrypt secret key
+--- @tparam string data data to be encrypted
+--- @tparam[opt='RC4'] cipher|string alg
+--- @treturn string data encrypted
+--- @treturn string skey secret key encrypted by public key
+--- @treturn string iv
+-function seal() end
+-
+---- open and ecrypted seal data with private key
+--- @tparam evp_pkey pkey private key used to open encrypted secret key
+--- @tparam string ekey encrypted secret key
+--- @tparam string string iv
+--- @tparam[opt='RC4'] evp_cipher|string md_alg
+--- @treturn string data decrypted message or nil on failure
+-function open() end
+-
+-end  -- define module
+-
+-
+-do  -- define class
+-
+---- openssl.evp_pkey object
+--- @type evp_pkey
+---
+-
+-do  -- define evp_pkey
+-
+---- export evp_pkey as pem string
+--- @tparam[opt=true] boolean pem default export as pem format, false export as der string
+--- @tparam[opt=false] boolean raw_key true for export low layer key just rsa,dsa,ec, and public key only support RSA
+--- @tparam[opt] string passphrase if given, export key will encrypt with des-cbc-ede,
+---    only need when export private key
+--- @treturn string
+-function export() end
+-
+---- export evp_pkey as der string
+--- @tparam boolean pem set false to export as der string
+--- @tparam[opt=false] boolean raw_key true for export low layer key just rsa,dsa,ec, and public key only support RSA
+--- @tparam[opt] string passphrase if given, export key will encrypt with des-cbc-ede,
+---    only need when export private key
+--- @treturn string
+-function export() end
+-
+---- get key details as table
+--- @treturn table infos with key bits,pkey,type, pkey may be rsa,dh,dsa, show as table with factor hex encoded bignum
+-function parse() end
+-
+---- return key is private or public
+--- @treturn boolean ture is private or public key
+-function is_private() end
+-
+---- compute dh key, check whether then supplied key is a private key
+--- by checking then prime factors whether set
+--- @tparam string remote_public_key
+--- @treturn string
+--- @todo: more check
+-function compute_key() end
+-
+---- sign message with private key
+--- @tparam string data data be signed
+--- @tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
+--- @treturn string signed message
+-function sign() end
+-
+---- verify signed message with public key
+--- @tparam string data data be signed
+--- @tparam string signature signed result
+--- @tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
+--- @treturn boolean true for pass verify
+-function verify() end
+-
+---- encrypt message with public key
+--- encrypt length of message must not longer than key size, if shorter will do padding,currently supports 6 padding modes.
+--- They are: pkcs1, sslv23, no, oaep, x931, pss.
+--- @tparam string data data to be encrypted
+--- @tparam string[opt='pkcs1'] string padding padding mode
+--- @treturn string encrypted message
+-function encrypt() end
+-
+---- decrypt message with private key
+--- pair with encrypt
+--- @tparam string data data to be decrypted
+--- @tparam string[opt='pkcs1'] string padding padding mode
+--- @treturn[1] string result
+--- @treturn[2] nil
+-function decrypt() end
+-
+---- seal and encrypt message with one public key
+--- data be encrypt with secret key, secret key be encrypt with public key
+--- @tparam string data data to be encrypted
+--- @tparam[opt='RC4'] cipher|string alg
+--- @treturn string data encrypted
+--- @treturn string skey secret key encrypted by public key
+--- @treturn string iv
+-function seal() end
+-
+---- open and ecrypted seal data with private key
+--- @tparam string ekey encrypted secret key
+--- @tparam string string iv
+--- @tparam[opt='RC4'] evp_cipher|string md_alg
+--- @treturn string data decrypted message or nil on failure
+-function open() end
+-
+-end --define class
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/sk.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/sk.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/sk.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/sk.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,74 +0,0 @@
+---- 
+--- Provide hmac function in lua.
+-
+---
+--- @module hmac
+--- @usage
+---  hamc = require('openssl').hmac
+---
+-
+-do  -- define module function
+-
+---- read stack_of_x509 from string data or bio input
+--- @tparam string|bio input 
+--- @treturn stack_of_x509
+--- @see stack_of_object
+-function openssl.sk_x509_read() end
+-
+---- contrust stack_of_x509 from table
+--- @tparam table certs x509 object certs
+--- @treturn stack_of_x509
+--- @see stack_of_object
+-function openssl.sk_x509_new() end
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.stack_of_object object
+--- stack_of_x509_extension, stack_of_x509, stack_of_x509_attribute object has same interface.
+--- stack_of_x509 is an important object in lua-openssl, it can be used as a certchain, trusted CA files or unstrust certs.
+--- object not support x509, x509_extension or x509_attribute
+--- @type stack_of_object
+---
+-
+-do  -- define stack_of_object
+-
+---- push an object into stack
+--- @tparam object obj
+--- @treturn stack_of_object self
+-function push() end
+-
+---- pop an object from stack
+--- @treturn object
+-function pop() end
+-
+---- set object at given location
+--- @tparam integer location
+--- @tparam object object
+--- @treturn stack_of_object self
+-function set() end
+-
+---- get object at given location
+--- @tparam integer location
+--- @treturn object obj
+-function get() end
+-
+---- insert object at given location
+--- @tparam object obj
+--- @tparam integer location
+--- @treturn stack_of_x509 self
+-function insert() end
+-
+---- delete object at geiven location
+--- @tparam integer location
+--- @treturn object deleted object
+-function delete() end
+-
+---- convert stack_of_object to table
+--- @@treturn table contain object index start from 1
+-function totable() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/ssl.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/ssl.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/ssl.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/ssl.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,408 +0,0 @@
+----
+--- Provide ssl function in lua.
+---
+--- @module ssl
+--- @usage
+---  hamc = require('openssl').ssl
+---
+-
+-do  -- define module function
+-
+---- create ssl_ctx object, which mapping to SSL_CTX in openssl.
+--- @tparam string protocol support 'SSLv3', 'SSLv23', 'SSLv2', 'TSLv1', 'TSLv1_1','TSLv1_2','DTLSv1', and can be follow by '_server' or '_client'
+--- @tparam[opt] string support_ciphers, if not given, default of openssl will be used
+--- @treturn ssl_ctx
+-function ctx_new() end
+-
+---- get alert_string for ssl state
+--- @tparam number alert
+--- @tparam[opt=false] boolean long
+--- @treturn string alert type
+--- @treturn string desc string, if long set true will return long info
+-function alert_string() end
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.ssl_ctx object
+--- @type ssl_ctx
+---
+-
+-do  -- define ssl_ctx
+-
+---- tell ssl_ctx use private key and certificate, and check private key
+--- @tparam evp_pkey pkey
+--- @tparam x509 cert
+--- @treturn boolean result return true for ok, or nil followed by errmsg and errval
+-function use() end
+-
+---- add client ca cert and option extra chain cert
+--- @tparam x509 clientca
+--- @tparam[opt] table extra_chain_cert_array
+--- @treturn boolean result
+-function add() end
+-
+---- set temp callback
+--- @tparam string keytype, 'dh','ecdh',or 'rsa'
+--- @tparam function tmp_cb
+--- @param[opt] vararg
+-function set_tmp() end
+-
+---- set tmp key content pem format
+--- @tparam string keytype, 'dh','ecdh',or 'rsa'
+--- @tparam string key_pem
+-function set_tmp() end
+-
+---- set ecdh with given curvename as tmp key
+--- @tparam string keytype, must be 'ecdh'
+--- @tparam string curvename
+-function set_tmp() emd
+-
+---- clean given mode
+--- mode support 'enable_partial_write','accept_moving_write_buffer','auto_retry','no_auto_chain','release_buffers'
+--- @tparam boolean clear must be true
+--- @tparam string mode
+--- @param[opt] ...
+--- @treturn string
+--- @treturn ...
+--- @usage
+---  modes = { ssl_ctx:mode('enable_partial_write','accept_moving_write_buffer','auto_retry') },
+---
+---   for  i, v in ipairs(modes)
+---     print(v)
+---  end
+---  --output 'enable_partial_write','accept_moving_write_buffer','auto_retry'
+-function mode() end
+-
+---- get options
+--- @treturn table string list of current options
+-function options() end
+-
+---- set options
+--- @tparam string option, support "microsoft_sess_id_bug", "netscape_challenge_bug", "netscape_reuse_cipher_change_bug",
+--- "sslref2_reuse_cert_type_bug", "microsoft_big_sslv3_buffer", "msie_sslv3_rsa_padding","ssleay_080_client_dh_bug",
+--- "tls_d5_bug","tls_block_padding_bug","dont_insert_empty_fragments","all", please to see ssl_options.h
+--- @treturn table string list of current options after set new option
+-function options() end
+-
+---- clear options
+--- @tparam boolean clear set true to clear options
+--- @tparam string option, support "microsoft_sess_id_bug", "netscape_challenge_bug", "netscape_reuse_cipher_change_bug",
+--- "sslref2_reuse_cert_type_bug", "microsoft_big_sslv3_buffer", "msie_sslv3_rsa_padding","ssleay_080_client_dh_bug",
+--- "tls_d5_bug","tls_block_padding_bug","dont_insert_empty_fragments","all",  please to see ssl_options.h
+--- @treturn table string list of current options after clear some option
+-function options() end
+-
+---- get timeout
+--- @return number
+-function timeout() end
+-
+---- set timeout
+--- @tparam number timeout
+--- @treturn number previous timeout
+-function timeout() end
+-
+---- get quit_shutdown is set or not
+--- Normally when a SSL connection is finished, the parties must send out
+--- "close notify" alert messages using ***SSL:shutdown"*** for a clean shutdown.
+--- @treturn boolean result
+-function quiet_shutdown() end
+-
+---- set quiet_shutdown
+--- @tparam boolean quiet
+--- When setting the "quiet shutdown" flag to 1, ***SSL:shutdown*** will set the internal flags
+--- to SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN. ***SSL:shutdown*** then behaves like
+--- ***SSL:set_shutdown*** called with SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN.
+--- The session is thus considered to be shutdown, but no "close notify" alert
+--- is sent to the peer. This behaviour violates the TLS standard.
+--- The default is normal shutdown behaviour as described by the TLS standard.
+--- @treturn boolean result
+-function quiet_shutdown() end
+-
+---- set verify locations with cafile and capath
+--- ssl_ctx:verify_locations specifies the locations for *ctx*, at
+--- which CA certificates for verification purposes are located. The certificates
+--- available via *CAfile* and *CApath* are trusted.
+--- @tparam string cafile
+--- @tparam string capath
+--- @treturn boolean result
+-function verify_locations() end
+-
+---- get certificate verification store of ssl_ctx
+--- at treturn x509_store store
+-function cert_store() end
+-
+---- set or replaces then certificate verification store of ssl_ctx
+--- @tparam x509_store store
+--- at treturn x509_store store
+-function cert_store() end
+-
+---- get verify depth when cert chain veirition
+--- @treturn number depth
+-function verify_depth() end
+-
+---- set verify depth when cert chain veirition
+--- @tparam number depth
+--- @treturn number depth
+-function verify_depth() end
+-
+---- get verify_mode, return number mode and all string modes list
+--- @treturn number mode_code
+--- @return ...
+- --  none: not verify client cert
+- --  peer: verify client cert
+- --  fail: if client not have cert, will failure
+- --  once: verify client only once.
+--- @usage
+---  mode = {ctx:verify_mode()}
+---  print('integer mode',mode[1])
+---  for i=2, #mode then
+---    print('string mode:'..mode[i])
+---  end
+-function verify_mode() end
+-
+---- set ssl verify mode and callback
+--- @tparam number mode, mode set to ctx, must be ssl.none or ssl.peer, and ssl.peer support combine with ssl.fail or ssl.once
+--- @tparam[opt=nil] function ssl verify callback in lua function, not give will use default openssl callback, when mode is 'none', will be ignore this
+--- verify_cb must be boolean function(verifyarg) prototype, return true to continue or false to end ssl handshake
+--- verifyarg has field 'error', 'error_string','error_depth','current_cert', and 'preverify_ok'
+--- @treturn boolean result
+-function verify_mode() end
+-
+---- set certificate verify callback function
+--- @tparam[opt] function cert_verify_cb with boolean function(verifyargs) prototype, if nil or none will use openssl default callback
+--- verifyargs has field 'error', 'error_string','error_depth','current_cert'
+-function set_cert_verify() end
+-
+---- set certificate verify options
+--- @tparam table verify_cb_flag support field always_continue with boolean value and verify_depth with number value.
+-function set_cert_verify() end
+-
+---- get current session cache mode
+--- @ table modes as array, mode is 'no_auto_clear','server','client','both','off'
+-function session_cache_mode()
+-
+---- set session cache mode,and return old mode
+--- @param mode string support 'no_auto_clear','server','client','both','off',
+--- 'no_auto_clear' can be combine with others, so accept one or two param.
+-function session_cache_mode(...)
+-
+---- create bio object
+--- @tparam string host_addr format like 'host:port'
+--- @tparam[opt=false] boolean server, true listen at host_addr,false connect to host_addr
+--- @tparam[opt=true] boolean autoretry ssl operation autoretry mode
+--- @treturn bio bio object
+-function bio() end
+-
+---- create ssl object
+--- @tparam bio bio
+--- @tparam[opt=false] boolean server, true will make ssl server
+--- @treturn ssl
+-function ssl() end
+-
+---- create ssl object
+--- @tparam bio input
+--- @tparam bio ouput
+--- @tparam[opt=false] boolean server, true will make ssl server
+--- @treturn ssl
+-function ssl() end
+-
+-end
+-
+-do  --define ssl object
+-
+---- openssl.ssl object
+---  All SSL object IO operation methods(connect, accept, handshake, read,
+---  peek or write) return nil or false when fail or error.
+---  When nil returned, it followed by 'ssl' or 'syscall', means SSL layer or
+---  system layer error. When false returned, it followed by number 0,
+---  'want_read','want_write','want_x509_lookup','want_connect','want_accept'.
+---  Numnber 0 means SSL connection closed, others means you should do some
+---  SSL operation.
+--- @type ssl
+-
+---- get value according to what, arg can be list, arg must be in below list
+--- @tparam string arg
+---  certificate:  return SSL certificates
+---  fd: return file or network connect fd
+---  rfd:
+---  wfd:
+---  client_CA_list
+---  read_ahead: -> boolean
+---  shared_ciphers: string
+---  cipher_list -> string
+---  verify_mode: number
+---  verify_depth
+---  state_string
+---  state_string_long
+---  rstate_string
+---  rstate_string_long
+---  iversion
+---  version
+---  default_timeout,
+---  certificates
+---  verify_result
+---  state
+---  state_string
+--- @return according to arg
+-function get() end
+-
+---- set value according to what, arg can be list, arg must be in below list
+--- @tparam string arg
+---  certificate:  return SSL certificates
+---  fd: return file or network connect fd
+---  rfd:
+---  wfd:
+---  client_CA:
+---  read_ahead
+---  cipher_list
+---  verify_depth
+---  purpose:
+---  trust:
+---  verify_result
+---  state
+--- @param value val type accroding to arg
+--- @return value
+-function set() end
+-
+---- tell ssl use private key and certificate, and check private key
+--- @tparam evp_pkey pkey
+--- @tparam[opt] x509 cert
+--- @treturn boolean result return true for ok, or nil followed by errmsg and errval
+-function use() end
+-
+---- get peer certificate and certificate chains
+--- @treturn x509 certificate
+--- @treturn sk_of_x509 chains of peer
+-function peer() end
+-
+---- get socket fd of ssl
+--- @treturn number fd
+-function getfd() end
+-
+---- get current cipher info
+--- @treturn table include name,version,id,bits,algbits and description
+-function current_cipher() end
+-
+---- get current compression name
+--- @treturn string
+-function current_compression() end
+-
+---- get peer certificate verify result
+--- @treturn boolean true for success
+--- @treturn table all certificate in chains verify result
+---  preverify_ok as boolean verify result
+---  error as number error code
+---  error_string as string error message
+---  error_depth as number verify depth
+---  current_cert as x509 certificate to verified
+-function getpeerverification() end
+-
+---- get ssl session
+--- @treturn ssl_session session object
+-function session() end
+-
+---- set ssl session
+--- @tparam string|ssl_session sesion
+---  reuse session would speed up ssl handshake
+--- @treturn boolean result
+-function session() end
+-
+---- duplicate ssl object
+--- @treturn ssl
+-function dup() end
+-
+---- get ssl_ctx associate with current ssl
+--- @treturn ssl_ctx
+-function ctx() end
+-
+---- set ssl_ctx associate to current ssl
+--- @tparam ssl_ctx ctx
+--- @treturn ssl_ctx orgine ssl_ctx object
+-function ctx() end
+-
+---- reset ssl object to allow another connection
+--- @treturn boolean result true for success
+-function clear() end
+-
+---- get want to do
+--- @treturn string 'nothing', 'reading', 'writing', 'x509_lookup'
+--- @treturn number state want
+-function want() end
+-
+---- get number of bytes available inside SSL fro immediate read
+--- treturn number
+-function pending() end
+-
+---- do ssl server accept
+--- @treturn boolean true for success
+--- @treturn string fail reason
+-function accept() end
+-
+---- do ssl client connect
+--- @treturn boolean true for success
+--- @treturn string fail reasion
+-function connect() end
+-
+---- do ssl read
+--- @tparam[opt=4096] number length to read
+--- @treturn string data, nil or false for fail
+--- @treturn string fail reason
+-function read() end
+-
+---- do ssl peak, data can be read again
+--- @tparam[opt=4096] number length to read
+--- @treturn string data, nil or false for fail
+--- @treturn string fail reason
+-function peek() end
+-
+---- do ssl write
+--- @tparam string data
+--- @treturn number count of bytes write successfully
+--- @treturn string fail reason
+-function write() end
+-
+---- do ssl renegotiate
+--- @treturn boolean true for success
+--- @treturn string fail reasion
+-function renegotiate() end
+-
+---- do ssl handshake, support both server and client side
+--- @treturn boolean true for success
+--- @treturn string fail reasion
+-function handshake() end
+-
+---- shutdown SSL connection
+-function shutdown() end
+-
+---- shutdown ssl connect with special mode, disable read or write,
+--- enable or disable quite shutdown
+--- @tparam string mode support 'read','write', 'quite', 'noquite'
+-function shutdown() end
+-
+---- shutdown ssl connection with quite or noquite mode
+--- @tparam boolean mode
+--- @treturn[1] boolean if mode is true, return true or false for quite
+--- @treturn[2] string if mode is false, return 'read' or 'write' for shutdown direction
+-function shutdown() end
+-
+---- do ssl renegotiate_pending
+--- @treturn boolean true for success
+--- @treturn string fail reasion
+-function renegotiate_pending() end
+-
+---- do ssl renegotiate_pending
+--- @treturn boolean true for success
+--- @treturn string fail reasion
+-function renegotiate_pending() end
+-
+---- make ssl to client mode
+-function set_connect_state() end
+-
+---- make ssl to server mode
+-function set_accept_state() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/timestamp.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/timestamp.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/timestamp.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/timestamp.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,334 +0,0 @@
+----
+--- Provide timestamp module.
+--- create and manage x509 certificate sign request
+--- @module ts
+--- @usage
+---  ts = require'openssl'.ts
+---
+-
+-do --define module function
+-
+---- create a new ts_req object.
+--- @tparam[opt=1] integer version
+--- @treturn ts_req timestamp sign request object
+--- @see ts_req
+-function req_new () end
+-
+---- read ts_req object from string or bio data
+--- @tparam string|bio input
+--- @treturn ts_req timestamp sign request object
+--- @see ts_req
+-function req_read() end
+-
+---- read ts_resp object from string or bio input
+--- @tparam string|bio input
+--- @treturn ts_resp object
+-function resp_read() end
+-
+---- create ts_resp_ctx object
+--- @tparam[opt] x509 signer timestamp certificate
+--- @tparam[opt] evp_pkey pkey private key to sign ts_req
+--- @tparam[opt] asn1_object|string|nid identity for default policy object
+--- @treturn ts_resp_ctx object
+-
+-function resp_ctx_new() end
+-
+---- create ts_verify_ctx object
+--- @tparam[opt=nil] string|ts_req reqdata
+--- @treturn ts_verify_ctx object
+-function verify_ctx_new() end
+-
+-end  -- define module
+-
+-do  -- define class
+-
+--------------------------------------------------------------------------------------------
+---- openssl.ts_req object
+--- @type ts_req
+-
+-do  -- define ts_req
+-
+---- export ts_req to string
+--- @treturn string
+-function export () end
+-
+---- get info as table 
+--- @treturn table
+-function info() end
+-
+---- create ts_verify_ctx from ts_req object
+--- @treturn ts_verify_ctx object
+-function to_verify_ctx() end
+-
+---- make a clone of ts_req object
+--- @treturn ts_req
+-function dup() end
+-
+---- get version
+--- @treturn integer
+-function version() end
+-
+---- set version
+--- @tparam integer version
+--- @treturn boolean result
+-function version() end
+-
+---- get cert_req
+--- @treturn boolean true for set or not
+-function cert_req() end
+-
+---- set cert_req
+--- @tparam boolean cert_req 
+--- @treturn boolean result
+-function cert_req() end
+-
+---- get nonce
+--- @treturn bn openssl.bn object
+-function nonce() end
+-
+---- set nonce
+--- @tparam string|bn nonce
+--- @treturn boolean result
+-function nonce() end
+-
+---- get policy_id
+--- @treturn asn1_object
+-function policy_id() end
+-
+---- set policy_id
+--- @tparam asn1_object|number id  identity for asn1_object
+--- @treturn boolean result
+-function policy_id() end
+-
+---- get msg_imprint
+--- @treturn string octet octet string
+--- @treturn table with algorithm and paramater
+-function msg_imprint() end
+-
+---- set msg_imprint
+--- @tparam string data digest value of message 
+--- @tparam[opt='sha'] string|evp_md md_alg
+--- @treturn boolean result
+-function msg_imprint() end
+-
+-end --define class
+-
+-
+---- openssl.ts_resp object
+--- @type ts_resp
+-
+-do  -- define ts_resp
+-
+---- export ts_resp to string
+--- @treturn string
+-function export () end
+-
+---- duplicate ts_resp object
+--- @treturn ts_resp object
+-function dup () end
+-
+---- get info as table
+--- @treturn table 
+-function info() end
+-
+---- get info as table
+--- @treturn table 
+-function tst_info() end
+-
+-end
+-
+---- openssl.ts_verify_ctx object
+--- @type ts_verify_ctx
+-do
+---- verify ts_resp object, pkcs7 token or ts_resp data
+--- @tparam ts_resp|pkcs7|string data
+--- @treturn boolean result
+-function verify() end
+-
+---- get x509_store cacerts
+--- @treturn stack_of_x509
+-function store() end
+-
+---- set x509_store cacerts
+--- @tparam x509_store cacerts
+--- @treturn boolean result
+-function store() end
+-
+---- get flags 
+--- @treturn integer flags
+-function flags() end
+-
+---- set flags
+--- @tparam integer flags
+--- @treturn boolean result
+-function flags() end
+-
+---- get untrust certs
+--- @treturn stack_of_x509 untrust
+-function certs() end
+-
+---- set untrust certs
+--- @tparam stack_of_x509 untrust
+--- @treturn boolean result
+-function certs() end
+-
+---- get data
+--- @treturn bio data object
+-function data() end
+-
+---- set data
+--- @tparam bio data object
+--- @treturn boolean result
+-function data() end
+-
+---- get imprint
+--- @treturn string imprint
+-function imprint() end
+-
+---- set imprint
+--- @tparam string imprint
+--- @treturn boolean result
+-function imprint() end
+-
+-end
+-
+---- openssl.ts_resp_ctx object
+--- @type ts_resp_ctx
+-
+-do
+-
+---- get signer cert and pkey
+--- @treturn x509 cert object or nil
+--- @treturn evp_pkey pkey object or nil
+-function signer() end
+-
+---- set signer cert and pkey
+--- @tparam x509 cert signer cert
+--- @tparam evp_pkey pkey signer pkey
+--- @treturn boolean result
+-function signer() end
+-
+---- get additional certs 
+--- @treturn stack_of_x509 certs object or nil
+-function certs() end
+-
+---- set additional certs 
+--- @tparam stack_of_x509 certs
+--- @treturn boolean result
+-function certs() end
+-
+---- get flags
+--- @treturn integer flags
+-function flags() end
+-
+---- set flags
+--- @tparam integer flags
+--- @treturn boolean result
+-function flags() end
+-
+---- get policies
+--- @treturn stack_of_asn1_object 
+-function policies() end
+-
+---- set policies
+--- @tparam asn1_object|integer|string|stack_of_asn1_object|table policies
+--- @treturn boolean result
+-function policies() end
+-
+---- get accuracy
+--- @treturn integer seconds
+--- @treturn integer millis
+--- @treturn integer micros
+-function accuracy() end
+-
+---- set accuracy
+--- @tparam integer seconds
+--- @tparam integer millis
+--- @tparam integer micros
+--- @treturn boolean result
+-function accuracy() end
+-
+---- get clock_precision_digits
+--- @treturn integer clock_precision_digits
+-function clock_precision_digits() end
+-
+---- set clock_precision_digits
+--- @tparam integer clock_precision_digits
+--- @treturn boolean result
+-function clock_precision_digits() end
+-
+---- set status info
+--- @tparam integer status
+--- @tparam string text
+--- @treturn boolean result
+-function set_status_info() end
+-
+---- set status info cond
+--- @tparam integer status
+--- @tparam string text
+--- @treturn boolean result
+-function set_status_info_cond() end
+-
+---- add failure info 
+--- @tparam integer failure
+--- @treturn result
+-function add_failure_info() end
+-
+---- get all digest method 
+--- @treturn table contains all support digest method
+-function md() end
+-
+---- set support digest method
+--- @tparam table mds support digest method
+--- @treturn boolean result
+-function md() end
+-
+---- add digest
+--- @tparam string|evp_digest md_alg
+--- @treturn boolean result
+-function md() end
+-
+---- get tst_info as table
+--- @treturn table tst_info
+-function tst_info() end
+-
+---- get ts_req object
+--- @treturn rs_req
+-function request() end
+-
+---- set serial generate callback function
+--- @tparam function serial_cb serial_cb with proto funciont(ts_resp_ctx, arg) return openssl.bn end
+--- @usage
+---  function serial_cb(tsa,arg)
+---    local bn = ...
+---    return bn
+---  end
+---  local arg = {}
+---- ts_resp_ctx:set_serial_cb(serial_cb, arg)
+-function set_serial_cb() end
+-
+---- set time callback function
+--- @tparam function time_cb serial_cb with proto funciont(ts_resp_ctx, arg) return sec, usec end
+--- @usage
+---  function time_cb(tsa,arg)
+---    local time = os.time()
+---    local utime = nil
+---    return time,utime
+---  end
+---  local arg = {}
+---- ts_resp_ctx:set_time_cb(time_cb, arg)
+-function set_serial_cb() end
+-
+---- create response for ts_req
+--- @tparam string|bio|ts_req data support string,bio ts_req content or ts_req object
+--- @treturn ts_resp result
+-function create_response() end
+-
+---- sign ts_req and get ts_resp, alias of create_response
+--- @tparam string|bio|ts_req data support string,bio ts_req content or ts_req object
+--- @treturn ts_resp result
+-function sign() end
+-
+-end
+-
+-end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_attr.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_attr.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_attr.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_attr.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,121 +0,0 @@
+---- 
+--- Provide x509_attribute as lua object.
+--- Sometime when you make CSR,TS or X509, you maybe need to use this.
+---
+--- @module x509.attr
+--- @usage
+---  attr = require('openssl').x509.attr
+---
+-
+-do  -- define module function
+-
+---- Create x509_attribute object
+---
+--- @tparam table attribute with object, type and value
+--- @treturn[1] x509_attribute mapping to X509_ATTRIBUTE in openssl
+---
+--- @see x509_attribute_param_table
+-function new_attribute() end
+-
+---- Create stack_of_x509_attribute object, which mapping to STACK_OF(X509_ATTRIBUTE)
+---
+--- @tparam table node_array, each node is a x509_attribute node
+--- @treturn sk_x509_attribute mapping to STACK_OF(X509_ATTRIBUTE) in openssl
+---
+--- @see new_attribute, sk
+-function new_sk_attribute() end
+-
+-end
+-
+-do -- define module table
+-
+---- x509_attribute contrust param table.
+---
+--- @table x509_attribute_param_table
+--- @tfield string|integer|asn1_object object, identify a asn1_object
+--- @tfield string|integer type, same with type in asn1.new_string
+--- @tfield string|asn1_object value, value of attribute
+---
+--- @usage
+--- xattr = x509.attr.new_attribute {
+---   object = asn1_object,
+---   type = Nid_or_String,
+---   value = string or asn1_string value
+--- }
+--- 
+-function new_attribute() end
+-
+---- x509_attribute infomation table
+---
+--- @table x509_attribute_info_table
+--- @tfield asn1_object|object object of asn1_object
+--- @tfield boolean single  true for single value
+--- @tfield table value  if single, value is asn1_type or array have asn1_type node table  
+-
+---- asn1_type object as table
+---
+--- @table asn1_type_table
+--- @tfield string value, value data
+--- @tfield string type, type of value
+--- @tfield string format, value is 'der', only exist when type is not in 'bit','bmp','octet'
+--- 
+-end
+-
+-do  -- define class
+-
+---- openssl.x509_attribute object
+--- @type x509_attribute
+---
+-do  -- defint x509_attribute
+-
+---- get infomation table of x509_attribute.
+---
+--- @treturn[1] table info,  x509_attribute infomation as table
+--- @see x509_attribute_info_table
+-function info() end
+-
+---- clone then asn1_attribute
+---
+--- @treturn x509_attribute attr clone of x509_attribute
+-function dup() end
+-
+---- get type of x509_attribute.
+---
+--- @tparam[opt] integer location which location to get type, default is 0
+--- @treturn[1] table asn1_type, asn1_type as table info
+--- @treturn[2] nil nil, fail return nothing
+---
+--- @see asn1_type_table
+-function type() end
+-
+---- get asn1_object of x509_attribute.
+---
+--- @treturn[1] asn1_object object of x509_attribute
+-function object() end
+-
+---- set asn1_object for x509_attribute.
+---
+--- @tparam asn1_object obj
+--- @treturn[1] boolean true for success
+--- @treturn[2] nil nil when occure error
+--- @treturn[2] string errmsg error message
+-function object() end
+-
+---- get type of x509_attribute
+---
+--- @tparam integer idx location want to get type
+--- @tparam string attrtype attribute type
+--- @treturn asn1_string
+-function data() end
+-
+---- set type of x509_attribute
+---
+--- @tparam string attrtype attribute type
+--- @tparam string data set to asn1_attr
+--- @string data to set
+-function data() end
+-
+-end
+-
+-end
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_crl.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_crl.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_crl.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_crl.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,157 +0,0 @@
+----
+--- Provide x509_crl as lua object.
+--- create and manage x509 certificate sign request
+--- @module x509.crl
+--- @usage
+---  crl = require'openssl'.x509.crl
+---
+-
+-do --define module function
+-
+---- create or generate a new x509_crl object.
+--- Note if not give evp_pkey, will create a new x509_crl object,if give will generate a signed x509_crl object.
+--- @tparam[opt] table revoked_list 
+--- @tparam[opt] x509 cacert ca cert to sign x509_crl
+--- @tparam[opt] evp_pkey capkey private key to sign x509_crl
+--- @tparam[opt] string|evp_md md_alg
+--- @tparam[opt=7*24*3600] number period to generate new crl
+--- @treturn x509_crl object
+--- @see x509_crl
+-function new() end
+-
+---- read x509_crl from string or bio input
+--- @tparam bio|string input input data
+--- @tparam[opt='auto'] string format support 'auto','pem','der'
+--- @treturn x509_crl certificate sign request object
+--- @see x509_crl
+-function read() end
+-
+---- list all support reason info
+--- @treturn table contain support reason node like {lname=...,sname=...,bitnum=...}
+-function reason() end
+-
+-end  -- define module
+-
+-do  -- define class
+-
+---- openssl.x509_crl object
+--- @type x509_crl
+---
+-
+-do  -- define x509_crl
+-
+---- export x509_crl to string
+--- @tparam[opt='pem'] string format
+--- @tparam[opt='true'] boolean noext not export extension
+--- @treturn string
+-function export () end
+-
+---- sign x509_crl
+--- @tparam evp_pkey pkey private key to sign x509
+--- @tparam x509|x509_name cacert or cacert x509_name
+--- @tparam[opt='sha1WithRSAEncryption'] string|md_digest md_alg
+--- @treturn boolean result true for check pass
+-function sign() end
+-
+---- get digest of x509_crl
+--- @tparam[opt='SHA1'] evp_md|string md_alg default use sha1
+--- @treturn string digest result
+-function digest() end
+-
+---- compare with other x509_crl object
+--- @tparam x509_crl other
+--- @treturn boolean result true for equals or false
+--- @usage
+---  x:cmp(y) == (x==y)
+-function cmp() end
+-
+---- make a delta x509_crl object
+--- @tparam x509_crl newer
+--- @tparam evp_pkey pkey
+--- @tparam[opt='sha1'] evp_md|string md_alg
+--- @tparam[opt=0] integer flags
+--- @treturn x509_crl delta result x509_crl object 
+-function diff() end
+-
+---- check x509_crl with evp_pkey
+--- @tparam evp_pkey pkey
+--- @tparam[opt=0] integer flags 
+--- @treturn boolean result true for pass
+-function check() end
+-
+---- parse x509_crl object as table
+--- @tparam[opt=true] shortname default will use short object name
+--- @treturn table result
+-function parse() end
+-
+---- get count of revoked entry
+--- @treturn number count
+--- @usage
+---  assert(#crl==crl:count())
+-function count() end
+-
+---- get revoekd entry
+--- @tparam number index
+--- @treturn table revoekd 
+-function get() end
+-
+---- set version key
+--- @tparam integer version
+--- @treturn boolean result
+-function version() end
+-
+---- get issuer x509_name object
+--- @treturn x509_name
+-function issuer() end
+-
+---- set issuer x509_name object
+--- @tparam x509_name|x509 issuer
+--- @treturn boolean result
+-function issuer() end
+-
+---- get lastUpdate time
+--- @treturn string lastUpdate
+-function lastUpdate() end
+-
+---- set lastUpdate time
+--- @tparam number lastUpdate
+--- @treturn boolean result
+-function lastUpdate() end
+-
+---- get nextUpdate time
+--- @treturn string nextUpdate
+-function nextUpdate() end
+-
+---- set nextUpdate time
+--- @tparam number nextUpdate
+--- @treturn boolean result
+-function nextUpdate() end
+-
+---- get updateTime time
+--- @treturn string lastUpdate
+--- @treturn string nextUpdate
+-function updateTime() end
+-
+---- set updateTime time
+--- @tparam[opt=os.time()] lastUpdate, default use current time
+--- @tparam number periord periord how long time(seconds)
+--- @treturn boolean result
+-function updateTime() end
+-
+---- get extensions of x509_crl
+--- @treturn stack_of_x509_extension extensions
+-function extensions() end
+-
+---- set extensions to x509_crl object
+--- @tparam stack_of_x509_extension extensions add to x509_crl
+--- @treturn boolean result
+-function extensions() end
+-
+---- add revoked entry to x509_crl object
+--- @tparam string|number|bn serial
+--- @tparam number revokedtime
+--- @tparam[opt=0] number|string reason
+--- @treturn boolean result true for add success
+-function add() end
+-
+-end --define class
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_extension.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_extension.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_extension.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_extension.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,142 +0,0 @@
+---- 
+--- Provide x509_extension as lua object.
+--- Sometime when you make CSR,TS or X509, you maybe need to use this.
+---
+--- @module x509.extension
+--- @usage
+---  extension = require('openssl').x509.extension
+---
+-
+-do  -- define module function
+-
+---- Create x509_extension object
+---
+--- @tparam table extension with object, value and critical
+--- @treturn x509_extension mapping to X509_EXTENSION in openssl
+---
+--- @see x509_extension_param_table
+-function new_extension() end
+-
+---- read der encoded x509_extension
+--- @tparam string data der encoded
+--- @treturn x509_extension mappling to X509_EXTENSION in openssl
+-function read_extension() end
+-
+---- Create stack_of_x509_extension object, which mapping to STACK_OF(X509_EXTENSION)
+---
+--- @tparam table node_array, each node is a x509_extension node
+--- @treturn[1] sk_x509_extension mapping to STACK_OF(X509_EXTENSION) in openssl
+---
+--- @see new_extension, sk
+-function new_sk_extension() end
+-
+---- get all x509 certificate supported extensions
+--- @treturn table contain all support extension nid
+--- @treturn table contain all support extension info as table node {lname=..., sname=..., nid=...}
+-function support() end
+-
+---- ask x509_extension object support or not 
+--- @tparam x509_extension extension 
+--- @tparam boolean true for supported, false or not 
+-function support() end
+-
+---- ask nid or name support or not 
+--- @tparam number|string nid_or_name for extension 
+--- @tparam boolean true for supported, false or not 
+-function support() end
+-
+-end
+-
+-do -- define module table
+-
+---- x509_extension contrust param table.
+---
+--- @table x509_extension_param_table
+--- @tfield boolean critical true set critical
+--- @tfield asn1_string value of x509_extension
+--- @tfield string|asn1_object object, object of extension
+---
+--- @usage
+--- xattr = x509.attr.new_extension {
+---   object = asn1_object,
+---   critical = false,
+---   value = string or asn1_string value
+--- }
+-function new_extension() end
+-
+---- x509_extension infomation table
+--- other field is number type, and value table is alter name.(I not understand clearly)
+--- @table x509_extension_info_table
+--- @tfield asn1_object|object object of x509_extension
+--- @tfield boolean|critical true for critical value
+--- @tfield string|value as octet string
+-
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.x509_extension object
+--- @type x509_extension
+---
+-do  -- defint x509_extension
+-
+---- get infomation table of x509_extension.
+---
+--- @tparam[opt] boolean|utf8 true for utf8 default 
+--- @treturn[1] table info,  x509_extension infomation as table
+--- @see x509_extension_info_table
+-function info() end
+-
+---- clone then x509_extension
+---
+--- @treturn x509_extension attr clone of x509_extension
+-function dup() end
+-
+---- get critical of x509_extension.
+---
+--- @treturn boolean true if extension set critical or false
+-function critical() end
+-
+---- set critical of x509_extension.
+---
+--- @tparam boolean critical set to self
+--- @treturn[1] boolean set critical success return true
+--- @treturn[2] nil nil, fail return nothing
+--- @treturn[2] string errmsg reason of fail
+-function critical() end
+-
+---- get asn1_object of x509_extension.
+---
+--- @treturn[1] asn1_object object of x509_extension
+-function object() end
+-
+---- set asn1_object for x509_extension.
+---
+--- @tparam asn1_object obj
+--- @treturn[1] boolean true for success
+--- @treturn[2] nil nil when occure error
+--- @treturn[2] string errmsg error message
+-function object() end
+-
+---- get data of x509_extension
+---
+--- @treturn asn1_string
+-function data() end
+-
+---- set type of x509_extension
+---
+--- @tparam asn1_string data set to self
+--- @treturn[1] boolean true for success
+--- @treturn[2] nil nil when occure error
+--- @treturn[2] string errmsg error message
+-function data() end
+-
+---- export x509_extenion to der encoded string
+--- @treturn string 
+-function export() end
+-
+-end
+-
+-end
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,187 +0,0 @@
+----
+--- Provide x509 module.
+--- create and manage x509 certificate
+--- @module x509
+--- @usage
+---  x509 = require'openssl'.x509
+---
+-
+-do --define module function
+-
+---- create or generate a new x509 object.
+--- @tparam[opt] openssl.bn serial serial number
+--- @tparam[opt] x509_req csr,copy x509_name, pubkey and extension to new object
+--- @tparam[opt] x509_name subject subject name set to x509_req
+--- @tparam[opt] stack_of_x509_extension extensions add to x509
+--- @tparam[opt] stack_of_x509_attribute attributes add to x509
+--- @treturn x509 certificate object
+-function new() end
+-
+---- read x509 from string or bio input
+--- @tparam bio|string input input data
+--- @tparam[opt='auto'] string format support 'auto','pem','der'
+--- @treturn x509 certificate object
+-function read() end
+-
+---- return all supported purpose as table
+--- @treturn table
+-function purpose() end
+-
+---- get special purpose info as table
+--- @tparam number|string purpose id or short name
+--- @treturn table
+-function purpose() end
+-
+---- get support certtypes
+--- @tparam[opt='standard'] string type support 'standard','netscape','extend'
+--- @treturn table if type is 'standard' or 'netscape', contains node with {lname=...,sname=...,bitname=...},
+---                if type is 'extend', contains node with {lname=...,sname=...,nid=...}
+-function certtypes() end
+-
+---- get certificate verify result string message
+--- @tparam number verify_result
+--- @treturn string result message
+-function verify_cert_error_string() end
+-
+-end --define module
+-
+-do  -- define class
+-
+---- openssl.x509 object
+--- @type x509
+---
+-
+-do  -- define x509
+-
+---- export x509_req to string
+--- @tparam[opt='pem'] string format, 'der' or 'pem' default
+--- @tparam[opt='true'] boolean noext not export extension
+--- @treturn string
+-function export() end
+-
+---- parse x509 object as table
+--- @tparam[opt=true] shortname default will use short object name
+--- @treturn table result which all x509 information
+-function parse() end
+-
+---- sign x509
+--- @tparam evp_pkey pkey private key to sign x509
+--- @tparam x509|x509_name cacert or cacert x509_name
+--- @tparam[opt='sha1WithRSAEncryption'] string|md_digest md_alg
+--- @treturn boolean result true for check pass
+-function sign() end
+-
+---- check x509 with evp_pkey
+--- @tparam evp_pkey pkey private key witch match with x509 pubkey
+--- @treturn boolean result true for check pass
+-function check() end
+-
+---- check x509 with ca certchian and option purpose
+--- purpose can be one of: ssl_client, ssl_server, ns_ssl_server, smime_sign, smime_encrypt, crl_sign, any, ocsp_helper, timestamp_sign
+--- @tparam x509_store cacerts 
+--- @tparam x509_store untrusted certs  containing a bunch of certs that are not trusted but may be useful in validating the certificate.
+--- @tparam[opt] string purpose to check supported
+--- @treturn boolean result true for check pass
+--- @treturn integer verify result
+--- @see verify_cert_error_string
+-function check() end
+-
+---- get digest of x509 object
+--- @tparam[opt='sha1'] evp_digest|string md_alg, default use 'sha1'
+--- @treturn string digest result
+-function digest() end
+-
+---- get public key of x509
+--- @treturn evp_pkey public key
+-function pubkey() end
+-
+---- set public key of x509
+--- @tparam evp_pkey pubkey public key set to x509
+--- @treturn boolean result, true for success
+-function pubkey() end
+-
+---- get extensions of x509 object
+--- @tparam[opt=false] boolean asobject, true for return as stack_of_x509_extension or as table
+--- @treturn[1] stack_of_x509_extension object when param set true
+--- @treturn[2] table contain all x509_extension when param set false or nothing
+-function extensions() end
+-
+---- set extension of x509 object
+--- @tparam stack_of_x509_extension extensions
+--- @treturn boolean result true for success
+-function extensions() end
+-
+---- get issuer name of x509
+--- @tparam[opt=false] boolean asobject, true for return as x509_name object, or as table
+--- @treturn[1] x509_name issuer
+--- @treturn[1] table issuer name as table
+-function issuer() end
+-
+---- set issuer name of x509
+--- @tparam x509_name name
+--- @treturn boolean result true for success
+-function issuer() end
+-
+---- get subject name of x509
+--- @tparam[opt=false] boolean asobject, true for return as x509_name object, or as table
+--- @treturn[1] x509_name subject name
+--- @treturn[1] table subject name as table
+-function subject() end
+-
+---- set subject name of x509
+--- @tparam x509_name subject
+--- @treturn boolean result true for success
+-function subject() end
+-
+---- get serial number of x509
+--- @tparam[opt=true] boolean asobject
+--- @treturn[1] bn object
+--- @treturn[2] string result
+-function serial() end
+-
+---- set serial number of x509
+--- @tparam string|number|bn serail
+--- @treturn boolean result true for success
+-function serial() end
+-
+---- get version number of x509
+--- @treturn number version of x509
+-function version() end
+-
+---- set version number of x509
+--- @tparam number version
+--- @treturn boolean result true for result
+-function version() end
+-
+---- get notbefore valid time of x509
+--- @treturn string notbefore time string
+-function notbefore() end
+-
+---- set notbefore valid time of x509
+--- @tparam string|number notbefore
+-function notbefore() end
+-
+---- get notafter valid time of x509
+--- @treturn string notafter time string
+-function notafter() end
+-
+---- set notafter valid time of x509
+--- @tparam string|number notafter
+-function notafter() end
+-
+---- check x509 valid
+--- @tparam[opt] number time, default will use now time
+--- @treturn boolean result true for valid, or for invalid
+--- @treturn string notbefore
+--- @treturn string notafter
+-function validat()
+-
+---- set valid time, notbefore and notafter
+--- @tparam number notbefore
+--- @tparam number notafter
+--- @treturn boolean result, true for success
+-function validat() end
+-
+-end --define x509
+-
+-end --define class
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_name.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_name.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_name.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_name.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,144 +0,0 @@
+---- 
+--- Provide x509_name as lua object.
+--- Sometime when you make CSR,TS or X509, you maybe need to use this.
+---
+--- @module x509.name
+--- @usage
+---  name = require('openssl').x509.name
+---
+-
+-
+-do  -- define module function
+-
+---- Create x509_name object
+---
+--- @tparam table array include name node
+--- @tparam[opt] boolean utf8 encode will be use default
+--- @treturn x509_name mapping to X509_EXTENSION in openssl
+--- @usage
+---  name = require'openssl'.x509.name
+---  subject = name.new{
+---    {C='CN'},
+---    {O='kkhub.com'},
+---    {CN='zhaozg'}
+---  }
+---
+-
+-function new() end
+-
+---- Create x509_name from der string
+---
+--- @tparam string content DER encoded string
+--- @treturn x509_name mapping to X509_NAME in openssl
+---
+-function d2i() end
+-
+-end
+-
+-do -- define module table
+---
+---- x509_name infomation table
+--- other field is number type, and value table is alter name.(I not understand clearly)
+--- @table x509_extension_info_table
+--- @tfield asn1_object|object object of x509_name
+--- @tfield boolean|critical true for critical value
+--- @tfield string|value as octet string
+-
+-
+-end
+-
+-do  -- define class
+-
+---- openssl.x509_name object
+--- @type x509_name
+---
+-do  -- define x509_name
+-
+---- as oneline of x509_name.
+---
+--- @treturn string line, name as oneline text 
+-function oneline() end
+-
+---- get hash code of x509_name
+---
+--- @treturn integer hash hash code of x509_name
+-function hash() end
+-
+---- get digest of x509_name
+---
+--- @tparam string|nid|openssl.evp_md md method of digest
+--- @treturn string digest digest value by given alg of x509_name
+-function digest() end
+-
+---- print x509_name to bio object
+---
+--- @tparam openssl.bio out output bio object
+--- @tparam[opt] integer indent for output
+--- @tparam[opt] integer flags for output
+--- @treturn boolean result, follow by error message
+-function print() end
+-
+---- return x509_name as table
+---
+--- @tparam boolean utf8 true for utf8 encoded string, default
+--- @treturn table names
+--- @see new
+-function info() end
+-
+---- compare two x509_name
+---
+--- @tparam x509_name another to compare with 
+--- @treturn boolean result true for equal or false
+--- @usage
+---
+---  name1 = name.new({...})
+---  name2 = name1:dup()
+---  assert(name1:cmp(name2)==(name1==name2))
+---
+-function cmp() end
+-
+---- get DER encoded string of x509_name.
+---
+--- @treturn string der
+-function i2d() end
+-
+---- get count in x509_name.
+---
+--- @treturn integer count of x509_name
+-function entry_count() end
+-
+---- get text by given asn1_object or nid
+---
+--- @tparam string|integer|asn1_object identid for asn1_object
+--- @tparam[opt=-1] number lastpos retrieve the next index after lastpos
+--- @treturn string
+--- @treturn lastpos
+-function get_text() end
+-
+---- get x509 name entry by index
+--- @tparam integer index start from 0, and less than xn:entry_count()
+--- @tparam[opt=true] boolean utf8
+--- @treturn x509 name entry table
+-function get_entry() end
+-
+---- add name entry 
+---
+--- @tparam string|integer|asn1_object identid for asn1_object
+--- @tparam string data to add
+--- @tparam[opt] boolean utf8 true for use utf8 default
+--- @treturn boolean result true for success or follow by error message
+-function add_entry() end
+-
+---- get index by give asn1_object or nid
+---
+--- @tparam integer location which name entry to delete
+--- @treturn[1] asn1_object object that delete name entry
+--- @treturn[1] asn1_string value that delete name entry
+--- @treturn[2] nil delete nothing 
+-function delete_entry() end
+-
+-
+-end
+-
+-end
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_req.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_req.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_req.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_req.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,119 +0,0 @@
+----
+--- Provide x509_req as lua object.
+--- create and manage x509 certificate sign request
+--- @module x509.req
+--- @usage
+---  req = require'openssl'.x509.req
+---
+-
+-do --define module function
+-
+---- create or generate a new x509_req object.
+--- Note if not give evp_pkey, will create a new x509_req object,or will generate a signed x509_req object.
+--- @tparam[opt] x509_name subject subject name set to x509_req
+--- @tparam[opt] stack_of_x509_extension extensions add to x509_req
+--- @tparam[opt] stack_of_x509_attribute attributes add to x509_req
+--- @tparam[opt] evp_pkey pkey private key sign the x509_req, and set as public key
+--- @tparam[opt='sha1WithRSAEncryption'] evp_digest|string md_alg,  only used when pkey exist, and should fellow pkey
+--- @treturn x509_req certificate sign request object
+--- @see x509_req
+-function new () end
+-
+---- read x509_req from string or bio input
+--- @tparam bio|string input input data
+--- @tparam[opt='auto'] string format support 'auto','pem','der'
+--- @treturn x509_req certificate sign request object
+-function read() end
+-
+-end  -- define module
+-
+-do  -- define class
+-
+---- openssl.x509_req object
+--- @type x509_req
+---
+-
+-do  -- define x509_req
+-
+---- export x509_req to string
+--- @tparam[opt='pem'] string format
+--- @tparam[opt='true'] boolean noext not export extension
+--- @treturn string
+-function export () end
+-
+---- get public key
+--- @treturn evp_pkey public key
+-function public() end
+-
+---- set public key
+--- @tparam evp_pkey pubkey public key set to x509_req
+--- @treturn boolean result
+-function public() end
+-
+---- get version key
+--- @treturn integer
+-function version() end
+-
+---- set version key
+--- @tparam integer version
+--- @treturn boolean result
+-function version() end
+-
+---- get subject x509_name object
+--- @treturn x509_name
+-function subject() end
+-
+---- set subject x509_name object
+--- @tparam x509_name subject
+--- @treturn boolean result
+-function subject() end
+-
+---- remove attribute object from location
+--- @tparam integer location
+--- @tparam nil nil, nil not none
+--- @treturn x509_attribute attribute removed
+-function attribute() end
+-
+---- get attribute object from location
+--- @tparam integer location
+--- @treturn x509_attribute attribute
+-function attribute() end
+-
+---- add attribute to x509_req object
+--- @tparam x509_attribute attribute attribute to add
+--- @treturn boolean result
+-function attribute() end
+-
+---- get total attribute count in x509_req object
+--- @treturn integer
+-function attr_count() end
+-
+---- convert x509_req to x509 object
+--- @treturn x509 object not signed
+--- @fixme memleaks
+-function to_x509()
+-
+---- clone x509_req object
+--- @treturn x509_req object
+-function dup()
+-
+---- check x509_req with evp_pkey
+--- @tparam evp_pkey pkey
+--- @treturn boolean result true for check pass
+-function check() end
+-
+---- verify x509_req signature
+--- @treturn boolean result true for verify pass
+-function verify() end
+-
+---- get digest of x509_req
+--- @tparam[opt='SHA1'] evp_md|string md_alg default use sha1
+--- @treturn string digest result
+-function digest() end
+-
+---- parse x509_req object as table
+--- @tparam[opt=true] shortname default will use short object name
+--- @treturn table result
+-function parse() end
+-
+-end --define class
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_store.lua luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_store.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/ldoc/x509_store.lua	2019-02-13 11:31:40.280635356 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/ldoc/x509_store.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,69 +0,0 @@
+----
+--- Provide x509_store as lua object.
+--- create and manage x509 store object
+--- @module x509.store
+--- @usage
+---  store = require'openssl'.x509.store
+---
+-
+-do --define module function
+-
+---- create or generate a new x509_store object.
+--- @tparam table certs array of x509 objects, all x509 object will add to store, certs can be empty but not nil
+--- @tparam[opt] table crls array of x509_crl objects, all crl object will add to store
+--- @treturn x509_store object
+--- @see x509_store
+-function new() end
+-
+-end  -- define module
+-
+-do  -- define class
+-
+---- openssl.x509_store object
+--- @type x509_store
+---
+-
+-do  -- define x509_store
+-
+-function export () end
+-
+---- set verify depth of certificate chains
+--- @tparam number depth
+--- @treturn boolean result 
+-function depth() end
+-
+---- set verify flags of certificate chains
+--- @tparam number flags
+--- @treturn boolean result 
+-function flags() end
+-
+---- set as trust x509 store
+--- @tparam boolean trust
+--- @treturn boolean result 
+-function trust() end
+-
+---- set prupose of x509 store
+--- @tparam integer purpose
+--- @treturn boolean result
+-function purpose() end
+-
+---- load certificate from file or dir,not given any paramater will load from defaults path
+--- @tparam[opt] string filepath
+--- @tparam[opt] string dirpath
+--- @treturn boolean result
+-function load() end
+-
+---- add x509 certificate or crl to store
+--- paramater support x509 object,x509_crl object or array contains x509,x509_crl object
+--- @treturn boolean result
+-function add(...) end
+-
+---- add lookup path for store
+--- @tparam string path file or dir path to add
+--- @tparam[opt='file'] mode only 'file' or 'dir'
+--- @tparam[opt='default'] format only 'pem', 'der' or 'default'
+--- @treturn boolean result
+-function add_lookup() end
+-
+-end --define class
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/lib/luv/ssl.lua luvi-src-v2.7.6/deps/lua-openssl/lib/luv/ssl.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/lib/luv/ssl.lua	2019-02-13 11:31:40.277302045 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/lib/luv/ssl.lua	2019-02-13 11:53:24.105128513 +0100
+@@ -1,240 +1,246 @@
+-local uv = require('luv')
+-local openssl=require'openssl'
+-local ssl,bio,x509,pkey,csr = openssl.ssl,openssl.bio,openssl.x509,openssl.pkey,openssl.csr
++local uv = require 'luv'
++local openssl = require 'openssl'
++local ssl, bio, x509, pkey, csr = openssl.ssl, openssl.bio, openssl.x509, openssl.pkey, openssl.csr
+ 
+-local bit = require'bit'
++local bit = require 'bit'
+ local print = print
+--- support 
++-- support
+ local M = {}
+ 
+-local function load(path)
+-    local f = io.open(path,'rb')
+-    if f then
+-        local c = f:read('*a')
+-        f:close()
+-        return c
+-    end
++local function load (path)
++  local f = io.open(path, 'rb')
++  if f then
++    local c = f:read '*a'
++    f:close()
++    return c
++  end
+ end
+ 
+-function M.new_ctx(params)
+-    params = params or {}
+-    local protocol = params.protocol or  'SSLv3_client'
+-    local ctx = ssl.ctx_new(protocol, params.ciphers)
+-
+-	local xkey,xcert = nil,nil
+-
+-    if (params.certificate) then
+-        xcert = assert(x509.read(load(params.certificate)))
+-    end
+-
+-	if params.key then
+-		if (type(params.password)=='nil') then
+-			xkey = assert(pkey.read(load(params.key),true,'pem'))
+-		elseif (type(params.password)=='string')  then
+-			xkey = assert(pkey.read(load(params.key),true,'pem',params.password))
+-		elseif (type(params.password)=='function') then
+-			local p = assert(params.password())
+-			xkey = assert(pkey.read(load(params.key),true,'pem',p))
+-		end
+-		assert(ctx:use(xkey, xcert))
+-	end
+-
+-    if(params.cafile or params.capath) then
+-        ctx:verify_locations(params.cafile,params.capath)
+-    end
+-
+-    local unpack = unpack or table.unpack   
+-    if(params.verify) then
+-        ctx:verify_mode(params.verify)
+-    end
+-    if params.options and #params.options>0 then
+-        local args = {}
+-        for i=1,#params.options do
+-            table.insert(arg,params.options[i])
+-        end
+-        ctx:options(ssl.none)
+-    end
+-    
+-    if params.verifyext then
+-        ctx:set_cert_verify(params.verifyext)
+-    end
+-    if params.dhparam then
+-        ctx:set_tmp('dh',params.dhparam)
+-    end
+-    if params.curve then
+-        ctx:set_tmp('ecdh',params.curve)
+-    end
+-	return ctx
++function M.new_ctx (params)
++  params = params or {}
++  local protocol = params.protocol or 'SSLv3_client'
++  local ctx = ssl.ctx_new(protocol, params.ciphers)
++
++  local xkey, xcert = nil, nil
++
++  if params.certificate then
++    local ctx = assert(load(params.certificate))
++    xcert = assert(x509.read(ctx))
++  end
++
++  if params.key then
++    if type(params.password) == 'nil' then
++      xkey = assert(pkey.read(load(params.key), true, 'pem'))
++    elseif type(params.password) == 'string' then
++      xkey = assert(pkey.read(load(params.key), true, 'pem', params.password))
++    elseif type(params.password) == 'function' then
++      local p = assert(params.password())
++      xkey = assert(pkey.read(load(params.key), true, 'pem', p))
++    end
++    assert(ctx:use(xkey, xcert))
++  end
++
++  if params.cafile or params.capath then
++    ctx:verify_locations(params.cafile, params.capath)
++  end
++
++  local unpack = unpack or table.unpack
++  if params.verify then
++    ctx:verify_mode(params.verify)
++  end
++  if params.options and #params.options > 0 then
++    local args = {}
++    for i = 1, #params.options do
++      table.insert(arg, params.options[i])
++    end
++    ctx:options(ssl.none)
++  end
++
++  if params.verifyext then
++    ctx:set_cert_verify(params.verifyext)
++  end
++  if params.dhparam then
++    ctx:set_tmp('dh', params.dhparam)
++  end
++  if params.curve then
++    ctx:set_tmp('ecdh', params.curve)
++  end
++  return ctx
+ end
+ 
+ local S = {}
+ S.__index = {
++  handshake = function (self, connected_cb)
++    if not self.connecting then
++      uv.read_start(self.socket, function (err, chunk)
++          if err then
++            print('ERR', err)
++            self:onerror(err)
++          end
++          if chunk then
++            self.inp:write(chunk)
++            self:handshake(connected_cb)
++          else
++            self:close()
++          end
++        end)
++
++      self.connecting = true
++    end
++    if not self.connected then
++      local ret, err = self.ssl:handshake()
++      if ret == nil then
++        if self.onerror then
++          self:onerror()
++        elseif self.onclose then
++          self:onclose()
++        else
++          self:close()
++        end
++      else
++        local i, o = self.out:pending()
++        if i > 0 then
++          --client handshake
++          uv.write(self.socket, self.out:read(), function ()
++              self:handshake(connected_cb)
++            end)
++          return
++        end
++        if ret == false then
++          return
++        end
+ 
+-    handshake = function(self, connected_cb)
+-		if not self.connecting then
+-            uv.read_start(self.socket, function(err,chunk)
+-                if(err) then 
+-                    print('ERR',err)
+-                    self:onerror(err)
+-                end
+-                if chunk then
+-                    self.inp:write(chunk)
+-                    self:handshake(connected_cb)
+-                else
+-                    self:close()
++        self.connected = true
++        uv.read_stop(self.socket)
++        uv.read_start(self.socket, function (err, chunk)
++            if err then
++              print('ERR', err)
++              self:onerror()
++            end
++            if chunk then
++              local ret, err = self.inp:write(chunk)
++              if ret == nil then
++                if self.onerror then
++                  self.onerror(self)
++                elseif self.onend then
++                  self.onend(self)
+                 end
+-			end)
++                return
++              end
+ 
+-            self.connecting = true
+-		end
+-        if not self.connected then
+-            local ret,err = self.ssl:handshake()
+-            if ret==nil then
+-                if (self.onerror) then
+-                    self:onerror()
+-                elseif (self.onclose) then
+-                    self:onclose()
+-                else
+-                    self:close()
++              while self.connected and self.inp:pending()>0 do
++                if o > 0 then
++                  assert(false, 'never here')
+                 end
+-            else
+-                local i, o = self.out:pending()
+-                if i > 0 then  --????????????
+-                    uv.write(self.socket, self.out:read(), function()
+-                        self:handshake(connected_cb)
+-                    end)
+-                    return
++                local ret, msg = self.ssl:read()
++                if ret then
++                  self:ondata(ret)
+                 end
+-                if (ret==false) then return end
+-                
+-                self.connected = true
+-                uv.read_stop(self.socket)
+-                uv.read_start(self.socket, function(err,chunk)
+-                    if(err) then 
+-                        print('ERR',err)
+-                        self:onerror()
+-                    end
+-                    if chunk then
+-                        local ret,err = self.inp:write(chunk)
+-                        if ret==nil then
+-                            if self.onerror then
+-                                self.onerror(self)
+-                            elseif self.onend then
+-                                self.onend(self)
+-                            end
+-                            return
+-                        end
+-                        
+-                        local i,o = self.inp:pending()
+-                        while i>0 do
+-                            if o > 0 then
+-                                assert(false,'never here')
+-                            end
+-                            local ret, msg = self.ssl:read()
+-                            if ret then
+-                                self:ondata(ret)
+-                            end
+-                            i,o = self.inp:pending()
+-                        end
+-                    else
+-                        self:close()
+-                    end
+-                end)
+-                connected_cb(self)
+-            end
+-
+-            return self.connected
+-        end
+-	end,
+-    shutdown = function(self,callback)
+-        if not self.shutdown then
+-            self.ssl:shutdown()
+-            self.socket:shutdown()
+-            if callback then
+-                callback(self)
+-            end
+-            self.shutdown = true
+-        end
+-    end,
+-    close = function(self)
+-        if self.connected then
+-            if self.onclose then
+-                self.onclose(self)
+-            end
+-            self:shutdown()
+-            if self.ssl then
+-                self.ssl:shutdown()
+-            end
+-            self.ssl = nil
+-            if self.inp then self.inp:close() end
+-            if self.out then self.out:close() end
+-
+-            self.out,self.inp = nil,nil
+-            uv.close(self.socket)
+-            self.connected = nil
+-            self.socket = nil
+-        end
+-    end,
+-    write = function(self,data,cb)
+-        if not self.ssl then
+-            return
+-        end
+-        local ret,err = self.ssl:write(data)
+-        if ret==nil then
+-            if self.onerror then
+-                self.onerror(self)
+-            elseif self.onend then
+-                self.onend(self)
++              end
++            else
++              self:close()
+             end
+-            return
+-        end
+-        local i,o = self.out:pending()
+-        if i>0 then
+-            uv.write(self.socket,self.out:read(),cb)
+-        end
+-        if o > 0 then
+-            assert(false,'never here')
+-        end
++          end)
++        connected_cb(self)
++      end
++
++      return self.connected
++    end
++  end,
++  shutdown = function (self, callback)
++    if not self.shutdown then
++      self.ssl:shutdown()
++      self.socket:shutdown()
++      if callback then
++        callback(self)
++      end
++      self.shutdown = true
++    end
++  end,
++  close = function (self)
++    if self.connected then
++      if self.onclose then
++        self.onclose(self)
++      end
++      self:shutdown()
++      if self.ssl then
++        self.ssl:shutdown()
++      end
++      self.ssl = nil
++      if self.inp then
++        self.inp:close()
++      end
++      if self.out then
++        self.out:close()
++      end
++
++      self.out, self.inp = nil, nil
++      uv.close(self.socket)
++      self.connected = nil
++      self.socket = nil
++    end
++  end,
++  write = function (self, data, cb)
++    if not self.ssl then
++      return
++    end
++    local ret, err = self.ssl:write(data)
++    if ret == nil then
++      if self.onerror then
++        self.onerror(self)
++      elseif self.onend then
++        self.onend(self)
++      end
++      return
++    end
++    local i, o = self.out:pending()
++    if i > 0 then
++      uv.write(self.socket, self.out:read(), cb)
+     end
++    if o > 0 then
++      assert(false, 'never here')
++    end
++  end,
++
+ }
+ 
+-function M.new_ssl(ctx,socket,server)
+-    local s = {}
+-    s.inp,s.out  =  bio.mem(8192),bio.mem(8192)
+-    s.socket    =  socket
+-    s.mode = server and server or false
+-    s.ssl = ctx:ssl(s.inp,s.out,s.mode)
+-	uv.tcp_nodelay(socket,true)
+-    
+-    setmetatable(s,S)
+-    return s
++function M.new_ssl (ctx, socket, server)
++  local s = {}
++  s.inp, s.out = bio.mem(8192), bio.mem(8192)
++  s.socket = socket
++  s.mode = server and server or false
++  s.ssl = ctx:ssl(s.inp, s.out, s.mode)
++  uv.tcp_nodelay(socket, true)
++
++  setmetatable(s, S)
++  return s
+ end
+ 
+-function M.connect(host,port,ctx,connected_cb)
+-    if type(ctx)=='table' then
+-        ctx = ssl.new_ctx(ctx)
+-    end
+-    local socket = uv.new_tcp()
+-    local scli = M.new_ssl(ctx, socket) 
+-    
+-    uv.tcp_connect(socket, host, port, function(self, err)
+-        if err then 
+-            print('ERROR',err)
+-        else
+-            print('SCLI',scli)
+-            scli:handshake(function(self)
+-                if connected_cb then
+-                    connected_cb(self)
+-                end
+-            end)
+-        end
++function M.connect (host, port, ctx, connected_cb)
++  if type(ctx) == 'table' then
++    ctx = ssl.new_ctx(ctx)
++  end
++  local socket = uv.new_tcp()
++  local scli = M.new_ssl(ctx, socket)
++
++  uv.tcp_connect(socket, host, port, function (self, err)
++      if err then
++        print('ERROR', err)
++      else
++        print('SCLI', scli)
++        scli:handshake(function (self)
++            if connected_cb then
++              connected_cb(self)
++            end
++          end)
++      end
+     end)
+ 
+-    return scli   
++  return scli
+ end
+ 
+-function M.error()
+-    return openssl.error(true)
++function M.error ()
++  return openssl.error(true)
+ end
+ 
+ return M
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/Makefile luvi-src-v2.7.6/deps/lua-openssl/Makefile
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/Makefile	2019-02-13 11:31:40.273968734 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/Makefile	2019-02-13 11:53:24.105128513 +0100
+@@ -1,85 +1,121 @@
+-T=openssl
+-
+-PREFIX		?=/usr/local
+-LIB_OPTION	?= -shared 
+-
+-#Lua auto detect
+-LUA_VERSION ?= $(shell pkg-config luajit --print-provides)
+-ifeq ($(LUA_VERSION),)                         ############ Not use luajit
+-LUAV		?= $(shell lua -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
+-LUA_CFLAGS	?= -I$(PREFIX)/include/lua$(LUAV)
+-LUA_LIBS	?= -L$(PREFIX)/lib 
+-LUA_LIBDIR	?= $(PREFIX)/lib/lua/$(LUAV)
+-else
+-LUAV		?= $(shell lua -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
+-LUA_CFLAGS	?= $(shell pkg-config luajit --cflags)
+-LUA_LIBS	?= $(shell pkg-config luajit --libs)
+-LUA_LIBDIR	?= $(PREFIX)/lib/lua/$(LUAV)
+-endif
+-
+-#OS auto detect
+-SYS := $(shell gcc -dumpmachine)
+-
+-ifneq (, $(findstring linux, $(SYS)))
+-# Do linux things
+-LDFLAGS		    = -fPIC -lrt -ldl
+-OPENSSL_LIBS	?= $(shell pkg-config openssl --libs) 
+-OPENSSL_CFLAGS	?= $(shell pkg-config openssl --cflags)
+-CFLAGS		    = -fPIC $(OPENSSL_CFLAGS) $(LUA_CFLAGS)
+-endif
+-ifneq (, $(findstring apple, $(SYS)))
+-# Do darwin things
+-LDFLAGS		    = -fPIC -lrt -ldl
+-OPENSSL_LIBS	?= $(shell pkg-config openssl --libs) 
+-OPENSSL_CFLAGS	?= $(shell pkg-config openssl --cflags)
+-CFLAGS		    = -fPIC $(OPENSSL_CFLAGS) $(LUA_CFLAGS)
+-endif
+-ifneq (, $(findstring mingw, $(SYS)))
+-# Do mingw things
+-V			= $(shell lua -e "v=string.gsub('$(LUAV)','%.','');print(v)")
+-LDFLAGS		= -mwindows -lcrypt32 -lssl -lcrypto -lws2_32 $(PREFIX)/bin/lua$(V).dll 
+-LUA_CFLAGS	= -DLUA_LIB -DLUA_BUILD_AS_DLL -I$(PREFIX)/include/
+-CFLAGS		= $(OPENSSL_CFLAGS) $(LUA_CFLAGS)
+-endif
+-ifneq (, $(findstring cygwin, $(SYS)))
+-# Do cygwin things
+-OPENSSL_LIBS	?= $(shell pkg-config openssl --libs) 
+-OPENSSL_CFLAGS  ?= $(shell pkg-config openssl --cflags)
+-CFLAGS		= -fPIC $(OPENSSL_CFLAGS) $(LUA_CFLAGS)
+-endif
+-#custome config
+-ifeq (.config, $(wildcard .config))
+-include .config
+-endif
+-
+-LIBNAME= $T.so.$V
+-
+-#LIB_OPTION= -bundle -undefined dynamic_lookup #for MacOS X
+-
+-# Compilation directives
+-WARN_MOST	= -Wall -W -Waggregate-return -Wcast-align -Wmissing-prototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
+-WARN		= -Wall -Wno-unused-value
+-WARN_MIN	= 
+-CFLAGS		+= $(WARN_MIN) -DPTHREADS 
+-CC= gcc -g $(CFLAGS) -Ideps
+-
+-
+-OBJS=src/asn1.o src/auxiliar.o src/bio.o src/cipher.o src/cms.o src/compat.o src/crl.o src/csr.o src/dh.o src/digest.o src/dsa.o \
+-src/ec.o src/engine.o src/hmac.o src/lbn.o src/lhash.o src/misc.o src/ocsp.o src/openssl.o src/ots.o src/pkcs12.o src/pkcs7.o    \
+-src/pkey.o src/rsa.o src/ssl.o src/th-lock.o src/util.o src/x509.o src/xattrs.o src/xexts.o src/xname.o src/xstore.o src/xalgor.o src/callback.o 
+-
+-.c.o:
+-	$(CC) -c -o $@ $?
+-
+-all: $T.so
+-	echo $(SYS)
+-
+-$T.so: $(OBJS)
+-	MACOSX_DEPLOYMENT_TARGET="10.3"; export MACOSX_DEPLOYMENT_TARGET; $(CC) $(CFLAGS) $(LIB_OPTION) -o $T.so $(OBJS) $(OPENSSL_LIBS) $(LUA_LIBS) $(LDFLAGS)
+-
+-install: all
+-	mkdir -p $(LUA_LIBDIR)
+-	cp $T.so $(LUA_LIBDIR)
+-
+-clean:
+-	rm -f $T.so $(OBJS) 
++T=openssl
++
++PREFIX		?=/usr/local
++CC		:= $(CROSS)$(CC)
++AR		:= $(CROSS)$(AR)
++LD		:= $(CROSS)$(LD)
++
++#OS auto detect
++ifneq (,$(TARGET_SYS))
++  SYS		:= $(TARGET_SYS)
++else
++  SYS		:= $(shell gcc -dumpmachine)
++endif
++
++#Lua auto detect
++LUA_VERSION	:= $(shell pkg-config luajit --print-provides)
++ifeq ($(LUA_VERSION),)
++  # Not found luajit package, try lua
++  LUA_VERSION	:= $(shell pkg-config lua --print-provides)
++  ifeq ($(LUA_VERSION),)
++    # Not found lua package, try from prefix
++    LUA_VERSION := $(shell lua -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
++    LUA_CFLAGS	?= -I$(PREFIX)/include/lua$(LUA_VERSION)
++    LUA_LIBS	?= -L$(PREFIX)/lib -llua
++    LUA_LIBDIR	?= $(PREFIX)/lib/lua/$(LUA_VERSION)
++  else
++    # Found lua package
++    LUA_VERSION	:= $(shell lua -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
++    LUA_CFLAGS	?= $(shell pkg-config lua --cflags)
++    LUA_LIBS	?= $(shell pkg-config lua --libs)
++    LUA_LIBDIR	?= $(PREFIX)/lib/lua/$(LUA_VERSION)
++  endif
++else
++  # Found luajit package
++  LUA_VERSION	:= $(shell luajit -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
++  LUA_CFLAGS	?= $(shell pkg-config luajit --cflags)
++  LUA_LIBS	?= $(shell pkg-config luajit --libs)
++  LUA_LIBDIR	?= $(PREFIX)/lib/lua/$(LUA_VERSION)
++endif
++
++#OpenSSL auto detect
++OPENSSL_CFLAGS	?= $(shell pkg-config openssl --cflags)
++OPENSSL_LIBS	?= $(shell pkg-config openssl --static --libs)
++
++ifneq (, $(findstring linux, $(SYS)))
++  # Do linux things
++  CFLAGS	 = -fpic
++  LDFLAGS	 = -Wl,--no-undefined -fpic -lrt -ldl -lm
++endif
++
++ifneq (, $(findstring apple, $(SYS)))
++  # Do darwin things
++  CFLAGS	 = -fPIC
++  LDFLAGS	 = -fPIC -undefined dynamic_lookup -ldl
++  #MACOSX_DEPLOYMENT_TARGET="10.3"
++  CC		:= MACOSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET} $(CC)
++endif
++
++ifneq (, $(findstring mingw, $(SYS)))
++  # Do mingw things
++  CFLAGS	 = -DLUA_LIB -DLUA_BUILD_AS_DLL -DWIN32_LEAN_AND_MEAN
++endif
++
++ifneq (, $(findstring cygwin, $(SYS)))
++  # Do cygwin things
++  CFLAGS	 = -fPIC
++endif
++
++ifneq (, $(findstring iOS, $(SYS)))
++  # Do iOS things
++  CFLAGS	 = -fPIC
++  LDFLAGS	 = -fPIC -ldl
++endif
++
++#custom config
++ifeq (.config, $(wildcard .config))
++  include .config
++endif
++
++LIBNAME= $T.so.$V
++
++CFLAGS		+= $(OPENSSL_CFLAGS) $(LUA_CFLAGS) $(TARGET_FLAGS)
++LDFLAGS		+= -shared $(OPENSSL_LIBS) $(LUA_LIBS)
++# Compilation directives
++WARN_MIN	 = -Wall -Wno-unused-value
++WARN		 = -Wall
++WARN_MOST	 = $(WARN) -W -Waggregate-return -Wcast-align -Wmissing-prototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
++CFLAGS		+= -g $(WARN_MIN) -DPTHREADS -Ideps -Ideps/lua-compat -Ideps/auxiliar
++
++
++OBJS=src/asn1.o deps/auxiliar/auxiliar.o src/bio.o src/cipher.o src/cms.o src/compat.o src/crl.o src/csr.o src/dh.o src/digest.o src/dsa.o \
++src/ec.o src/engine.o src/hmac.o src/lbn.o src/lhash.o src/misc.o src/ocsp.o src/openssl.o src/ots.o src/pkcs12.o src/pkcs7.o    \
++src/pkey.o src/rsa.o src/ssl.o src/th-lock.o src/util.o src/x509.o src/xattrs.o src/xexts.o src/xname.o src/xstore.o \
++src/xalgor.o src/callback.o src/srp.o deps/auxiliar/subsidiar.o
++
++.c.o:
++	$(CC) $(CFLAGS) -c -o $@ $?
++
++all: $T.so
++	@echo "Target system: "$(SYS)
++
++$T.so: lib$T.a
++	$(CC) -o $@ src/openssl.o -L. -l$T $(LDFLAGS)
++
++lib$T.a: $(OBJS)
++	$(AR) rcs $@ $?
++
++install: all
++	mkdir -p $(LUA_LIBDIR)
++	cp $T.so $(LUA_LIBDIR)
++
++info:
++	@echo "Target system: "$(SYS)
++	@echo "CC:" $(CC)
++	@echo "AR:" $(AR)
++	@echo "PREFIX:" $(PREFIX)
++
++clean:
++	rm -f $T.so lib$T.a $(OBJS)
++
++# vim: ts=8 sw=8 noet
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/Makefile.win luvi-src-v2.7.6/deps/lua-openssl/Makefile.win
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/Makefile.win	2019-02-13 11:31:40.277302045 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/Makefile.win	2019-02-13 11:53:24.105128513 +0100
+@@ -1,25 +1,31 @@
+-T= openssl
+-
+-include config.win
+-
+-OBJS=src\asn1.obj src\auxiliar.obj src\bio.obj src\cipher.obj src\cms.obj src\compat.obj src\crl.obj src\csr.obj src\dh.obj src\digest.obj src\dsa.obj \
+-src\ec.obj src\engine.obj src\hmac.obj src\lbn.obj src\lhash.obj src\misc.obj src\ocsp.obj src\openssl.obj src\ots.obj src\pkcs12.obj src\pkcs7.obj    \
+-src\pkey.obj src\rsa.obj src\ssl.obj src\th-lock.obj src\util.obj src\x509.obj src\xattrs.obj src\xexts.obj src\xname.obj src\xstore.obj src\xalgor.obj src\callback.obj
+-
+-
+-lib: src\$T.dll
+-
+-.c.obj:
+-	$(CC) /nologo /c /DLUA_BUILD_AS_DLL /DLUA_LIB /Fo$@ $(CFLAGS) $<
+-
+-src\$T.dll: $(OBJS)
+-	link /DLL /out:src\$T.dll $(OBJS) "$(LUA_LIB)" "$(OPENSSL_LIB)" ws2_32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib 
+-	IF EXIST src\$T.dll.manifest mt -manifest src\$T.dll.manifest -outputresource:src\$T.dll;2
+-
+-install: src\$T.dll
+-	IF NOT EXIST "$(LUA_LIBDIR)" mkdir "$(LUA_LIBDIR)"
+-	copy src\$T.dll "$(LUA_LIBDIR)"
+-
+-clean:
+-	del src\$T.dll $(OBJS) src\$T.lib src\$T.exp
+-	IF EXIST src\$T.dll.manifest del src\$T.dll.manifest
+\ No newline@end of file
++T= openssl
++
++include config.win
++
++OBJS= \
++deps\auxiliar\auxiliar.obj src\asn1.obj src\bio.obj src\cipher.obj src\cms.obj \
++src\compat.obj src\crl.obj src\csr.obj src\dh.obj src\digest.obj src\dsa.obj   \
++src\ec.obj src\engine.obj src\hmac.obj src\lbn.obj src\lhash.obj src\misc.obj  \
++src\ocsp.obj src\openssl.obj src\ots.obj src\pkcs12.obj src\pkcs7.obj          \
++src\pkey.obj src\rsa.obj src\ssl.obj src\th-lock.obj src\util.obj src\x509.obj \
++src\xattrs.obj src\xexts.obj src\xname.obj src\xstore.obj src\xalgor.obj       \
++src\callback.obj src\srp.obj deps\auxiliar\subsidiar.obj
++
++
++lib: src\$T.dll
++
++.c.obj:
++	$(CC) /nologo /c /I"deps/lua-compat" /I"deps/auxiliar" /DLUA_BUILD_AS_DLL /DLUA_LIB /Fo$@ $(CFLAGS) $<
++
++src\$T.dll: $(OBJS)
++	link /DLL /out:src\$T.dll $(OBJS) "$(LUA_LIB)" "$(OPENSSL_LIB)" \
++		ws2_32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib 
++	IF EXIST src\$T.dll.manifest mt -manifest src\$T.dll.manifest -outputresource:src\$T.dll;2
++
++install: src\$T.dll
++	IF NOT EXIST "$(LUA_LIBDIR)" mkdir "$(LUA_LIBDIR)"
++	copy src\$T.dll "$(LUA_LIBDIR)"
++
++clean:
++	del src\$T.dll $(OBJS) src\$T.lib src\$T.exp
++	IF EXIST src\$T.dll.manifest del src\$T.dll.manifest
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/openssl-scm-6.rockspec luvi-src-v2.7.6/deps/lua-openssl/openssl-scm-6.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/openssl-scm-6.rockspec	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/openssl-scm-6.rockspec	2019-02-13 11:53:24.105128513 +0100
+@@ -0,0 +1,80 @@
++package = "openssl"
++version = "scm-6"
++
++source = {
++  url = "gitrec://github.com/zhaozg/lua-openssl",
++  tag = "0.7.4"
++}
++
++description = {
++  summary    = "Openssl binding for Lua",
++  homepage   = "https://github.com/zhaozg/lua-openssl",
++  license    = "MIT",
++  maintainer = "George Zhao",
++  detailed   = [[
++  ]],
++}
++
++dependencies = {
++  "luarocks-fetch-gitrec",
++  "lua >= 5.1, < 5.4"
++}
++
++external_dependencies = {
++  OPENSSL = {
++    header = "openssl/evp.h"
++  }
++}
++
++build = {
++  type = "builtin",
++
++  modules = {
++    openssl = {
++      sources = {
++        "deps/auxiliar/auxiliar.c","src/asn1.c","src/bio.c","src/callback.c",
++        "src/cipher.c","src/cms.c","src/compat.c","src/crl.c",
++        "src/csr.c","src/dh.c","src/digest.c","src/dsa.c",
++        "src/ec.c","src/engine.c","src/hmac.c","src/lbn.c",
++        "src/lhash.c","src/misc.c","src/ocsp.c","src/openssl.c",
++        "src/ots.c","src/pkcs7.c","src/pkcs12.c","src/pkey.c",
++        "src/rsa.c","src/ssl.c","src/th-lock.c","src/util.c",
++        "src/x509.c","src/xattrs.c","src/xexts.c","src/xname.c",
++        "src/xalgor.c","src/xstore.c", "src/srp.c",
++        "deps/auxiliar/subsidiar.c"
++      },
++      incdirs = {"$(OPENSSL_DIR)/include", "deps/auxiliar", "deps/lua-compat"},
++      defines = {"PTHREADS"},
++      libraries = {"ssl", "crypto"},
++    }
++  },
++
++  platforms = {
++    windows = {
++      modules = {
++        openssl = {
++          libraries = {"libeay32", "ssleay32", "ws2_32", "kernel32", "user32", "gdi32", "advapi32"},
++          defines = {"LUA_BUILD_AS_DLL", "LUA_LIB", "WIN32_LEAN_AND_MEAN"},
++          incdirs = {"$(OPENSSL_DIR)/include"},
++          libdirs = {"$(OPENSSL_DIR)/lib"},
++        }
++      }
++    },
++    linux = {
++      modules = {
++        openssl = {
++          incdirs = {"$(OPENSSL_DIR)/include"},
++          libdirs = {"$(OPENSSL_DIR)/lib"},
++        }
++      }
++    },
++    macosx = {
++      modules = {
++        openssl = {
++          incdirs = {"$(OPENSSL_DIR)/include"},
++          libdirs = {"$(OPENSSL_DIR)/lib"},
++        }
++      }
++    }
++  },
++}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/README.md luvi-src-v2.7.6/deps/lua-openssl/README.md
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/README.md	2019-02-13 11:31:40.273968734 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/README.md	2019-02-13 11:53:24.105128513 +0100
+@@ -3,12 +3,12 @@ lua-openssl toolkit - A free, MIT-licens
+ [![Build Status](https://travis-ci.org/zhaozg/lua-openssl.svg)](https://travis-ci.org/zhaozg/lua-openssl)
+ [![Build status](https://ci.appveyor.com/api/projects/status/f8xchhlj035yqq88/branch/master?svg=true)](https://ci.appveyor.com/project/zhaozg/lua-openssl/branch/master)
+ 
+-#Index
++# Index
+ 
+ 1. [Introduction](#introduction)
+ 2. [Documentation](#documentation)
+-2. [Howto](#a---howto)
+-3. [Examples](#b--example-usage) 
++2. [Howto](#howto)
++3. [Examples](#example-usage) 
+ 
+ # Introduction
+ 
+@@ -16,17 +16,17 @@ I needed a full OpenSSL binding for Lua,
+ I found the PHP openssl binding is a good implementation, and it inspired me.
+ So I decided to write this OpenSSL toolkit for Lua.
+ 
+-The goal is to fully support the listed items.Below you can find the development progress of lua-openssl. 
++The goal is to fully support the listed items. Below you can find the development progress of lua-openssl: 
+ 
+ * Symmetrical encrypt/decrypt. (Finished)
+ * Message digest. (Finished)
+ * Asymmetrical encrypt/decrypt/sign/verify/seal/open. (Finished)
+ * X509 certificate. (Finished)
+-* PKCS7/CMS. (Developing)
++* PKCS7/CMS. (Finished)
+ * SSL/TLS. (Finished)
+ 
+-Most of the lua-openssl functions require a key or certificate as argument; to make things easy to use OpenSSL,
+-This rule allow you to specify certificates or keys in the following ways:
++Most of the lua-openssl functions require a key or certificate as argument; to make things easy to use OpenSSL.
++This rule allows you to specify certificates or keys in the following ways:
+ 
+ 1. As an openssl.x509 object returned from openssl.x509.read
+ 2. As an openssl.evp_pkey object return from openssl.pkey.read or openssl.pkey.new
+@@ -47,7 +47,7 @@ digest() equals with digest.digest(), sa
+ 
+ ## documentation
+ 
+-Document please see [here](http://zhaozg.github.io/lua-openssl/)
++Document please see [here](http://zhaozg.github.io/lua-openssl/index.html)
+ 
+ ## compat with others
+ 
+@@ -101,26 +101,26 @@ below.
+ 
+ bn library:
+ ```
+- __add(x,y)		compare(x,y)		pow(x,y) 
+- __div(x,y)		div(x,y)			powmod(x,y,m) 
+- __eq(x,y)		divmod(x,y)			random(bits) 
+- __lt(x,y)		gcd(x,y)			rmod(x,y) 
+- __mod(x,y)		invmod(x)			sqr(x) 
+- __mul(x,y)		isneg(x)			sqrmod(x) 
+- __pow(x,y)		isodd(x)			sqrtmod(x) 
+- __sub(x,y)		isone(x)			sub(x,y) 
+- __tostring(x)	isprime(x,[checks])	submod(x,y,m) 
+- __unm(x)		iszero(x)			text(t) 
+- abs(x)			mod(x,y)			tohex(x) 
+- add(x,y)		mul(x,y)			tonumber(x) 
+- addmod(x,y,m)	mulmod(x,y,m)		tostring(x) 
+- aprime(bits)	neg(x)				totext(x) 
+- bits(x)		number(x)			version 
++ __add(x,y)        compare(x,y)          pow(x,y) 
++ __div(x,y)        div(x,y)              powmod(x,y,m) 
++ __eq(x,y)         divmod(x,y)           random(bits) 
++ __lt(x,y)         gcd(x,y)              rmod(x,y) 
++ __mod(x,y)        invmod(x)             sqr(x) 
++ __mul(x,y)        isneg(x)              sqrmod(x) 
++ __pow(x,y)        isodd(x)              sqrtmod(x) 
++ __sub(x,y)        isone(x)              sub(x,y) 
++ __tostring(x)     isprime(x,[checks])   submod(x,y,m) 
++ __unm(x)          iszero(x)             text(t) 
++ abs(x)            mod(x,y)              tohex(x) 
++ add(x,y)          mul(x,y)              tonumber(x) 
++ addmod(x,y,m)     mulmod(x,y,m)         tostring(x) 
++ aprime(bits)      neg(x)                totext(x) 
++ bits(x)           number(x)             version 
+ ```
+ 
+ ## Version
+ 
+-This lua-openssl toolkit works with Lua 5.1 or 5.2, and OpenSSL (0.9.8 or above 1.0.0). 
++This lua-openssl toolkit works with Lua 5.1/5.2 or LuaJIT 2.0/2.1, and OpenSSL (0.9.8 or above 1.0.0). 
+ It is recommended to use the most up-to-date OpenSSL version because of the recent security fixes.
+ 
+ If you want to get the lua-openssl and OpenSSL versions from a Lua script, here is how:
+@@ -129,15 +129,20 @@ If you want to get the lua-openssl and O
+ openssl = require "openssl"
+ lua_openssl_version, lua_version, openssl_version = openssl.version()
+ ```
++## Style
++
++Source code of lua-openssl tidy with [astyle](http://astyle.sourceforge.net/) `--style=allman --indent=spaces=2` 
+ 
+ ## Bugs
+ 
+-Lua-Openssl is heavily updated, if you find bug, please report to [here](https://github.com/zhaozg/lua-openssl/issues/)
++Lua-Openssl is heavily updated, if you find a bug, please report to [here](https://github.com/zhaozg/lua-openssl/issues/)
+ 
+-#A.   Howto
++# Howto
+ 
+ ### Howto 1: Build on Linux/Unix System.
+ 
++    git clone --recurse https://github.com/zhaozg/lua-openssl.git lua-openssl
++    cd lua-openssl
+ 	make
+ 	make install
+ 	make clean
+@@ -147,6 +152,8 @@ Lua-Openssl is heavily updated, if you f
+ Before building, please change the setting in the config.win file.
+ Works with Lua5.1 (should support Lua5.2 by updating the config.win file).
+ 
++    git clone --recurse https://github.com/zhaozg/lua-openssl.git lua-openssl
++    cd lua-openssl
+ 	nmake -f makefile.win
+ 	nmake -f makefile.win install
+ 	nmake -f makefile.win clean
+@@ -154,6 +161,8 @@ Works with Lua5.1 (should support Lua5.2
+ 
+ ### Howto 3: Build on Windows with mingw.
+ 
++    git clone --recurse https://github.com/zhaozg/lua-openssl.git lua-openssl
++    cd lua-openssl
+ 	make
+ 	make install
+ 	make clean
+@@ -170,17 +179,17 @@ _code_ can pass to openssl.error() to ge
+ 
+   All SSL object IO operation methods return nil or false when fail or error.
+ When nil returned, it followed by 'ssl' or 'syscall', means SSL layer or 
+-system layer error. When false returned, it followed by number 0, 'want_read',
+-'want_write','want_x509_lookup','want_connect','want_accept'. Numnber 0 means
+-SSL connection closed, others means you should do some SSL operation.
++system layer error. When false returned, it is followed by number 0, 'want_read',
++'want_write','want_x509_lookup','want_connect','want_accept'. Number 0 means
++SSL connection closed, other numbers means you should do some SSL operation.
+ 
+-  Please remeber that when lua-openssl function or methods failed without 
+-error code, you can get last error by openssl.error(), and repeat call 
++  Please remember that when lua-openssl function or methods fail without an 
++error code, you can get the last error by openssl.error(), and repeat call 
+ openssl.error() will walk through error stacks of current threads. 
+ openssl.error(true) will also clear error stacks after get last error code,
+ this is very useful to free memory when lua-openssl repeat calls or run long times.
+ 
+-#B.  Example usage
++# Example usage
+ 
+ ### Example 1: short encrypt/decrypt
+ 
+@@ -206,7 +215,20 @@ bb = mdc:final()
+ assert(openssl.hex(aa,true)==bb)
+ ```
+ 
+-### Example 3:  Iterate a openssl.stack_of_x509(sk_x509) object
++### Example 3: Quick HMAC hash
++
++```lua
++local hmac = require "openssl".hmac
++
++alg = 'sha256'
++key = '0123456789'
++msg = 'example message'
++
++hmac.hmac(alg, msg, key, true) -- binary/"raw" output
++hmac.hmac(alg, msg, key, false) -- hex output
++```
++
++### Example 4:  Iterate a openssl.stack_of_x509(sk_x509) object
+ 
+ ```lua
+ n = #sk
+@@ -215,7 +237,7 @@ for i=1, n do
+ end
+ ```
+ 
+-### Example 4: read and parse certificate
++### Example 5: read and parse certificate
+ 
+ ```lua
+ local openssl = require('openssl')
+@@ -243,10 +265,10 @@ end
+ test_x509()
+ ```
+ 
+-###Example 5: bio network handle(TCP)
++### Example 5: bio network handle(TCP)
+ 
+  * server
+- 
++
+ ```lua
+ local openssl = require'openssl'
+ local bio = openssl.bio
+@@ -270,6 +292,7 @@ end
+ ```
+ 
+  * client
++
+ ```lua
+ local openssl = require'openssl'
+ local bio = openssl.bio
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/rockspecs/openssl-scm-0.rockspec luvi-src-v2.7.6/deps/lua-openssl/rockspecs/openssl-scm-0.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/rockspecs/openssl-scm-0.rockspec	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/rockspecs/openssl-scm-0.rockspec	1970-01-01 01:00:00.000000000 +0100
+@@ -1,40 +0,0 @@
+-package = "openssl"
+-version = "scm-0"
+-
+-source = {
+-  url = "https://github.com/zhaozg/lua-openssl/archive/master.zip",
+-  dir = "lua-openssl-master",
+-}
+-
+-description = {
+-  summary    = "Openssl binding for Lua",
+-  homepage   = "https://github.com/zhaozg/lua-openssl",
+-  license    = "MIT/X11",
+-  maintainer = "George Zhao",
+-  detailed   = [[
+-  ]],
+-}
+-
+-dependencies = {
+-  "lua >= 5.1, < 5.3"
+-}
+-
+-external_dependencies = {
+-}
+-
+-build = {
+-  type = "builtin",
+-
+-  platforms = {
+-    windows = {
+-      type = "command",
+-      build_command = [[nmake -f makefile.win]],
+-      install_command = [[nmake -f makefile.win install]]
+-    },
+-    unix = {
+-      type = "command",
+-      build_command = [[make]],
+-      install_command = [[make install]]
+-	}
+-  }
+-}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/rockspecs/openssl-scm-1.rockspec luvi-src-v2.7.6/deps/lua-openssl/rockspecs/openssl-scm-1.rockspec
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/rockspecs/openssl-scm-1.rockspec	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/rockspecs/openssl-scm-1.rockspec	1970-01-01 01:00:00.000000000 +0100
+@@ -1,61 +0,0 @@
+-package = "openssl"
+-version = "scm-1"
+-
+-source = {
+-  url = "https://github.com/zhaozg/lua-openssl/archive/master.zip",
+-  dir = "lua-openssl-master",
+-}
+-
+-description = {
+-  summary    = "Openssl binding for Lua",
+-  homepage   = "https://github.com/zhaozg/lua-openssl",
+-  license    = "MIT/X11",
+-  maintainer = "George Zhao",
+-  detailed   = [[
+-  ]],
+-}
+-
+-dependencies = {
+-  "lua >= 5.1, < 5.4"
+-}
+-
+-external_dependencies = {
+-  OPENSSL = {
+-    header = "openssl/evp.h"
+-  }
+-}
+-
+-build = {
+-  type = "builtin",
+-
+-  modules = {
+-    openssl = {
+-      sources = {
+-        "src/asn1.c","src/auxiliar.c","src/bio.c","src/callback.c",
+-        "src/cipher.c","src/cms.c","src/compat.c","src/crl.c",
+-        "src/csr.c","src/dh.c","src/digest.c","src/dsa.c",
+-        "src/ec.c","src/engine.c","src/hmac.c","src/lbn.c",
+-        "src/lhash.c","src/misc.c","src/ocsp.c","src/openssl.c",
+-        "src/ots.c","src/pkcs7.c","src/pkcs12.c","src/pkey.c",
+-        "src/rsa.c","src/ssl.c","src/th-lock.c","src/util.c",
+-        "src/x509.c","src/xattrs.c","src/xexts.c","src/xname.c",
+-        "src/xalgor.c","src/xstore.c",
+-      },
+-      incdirs = {"$(OPENSSL_INCDIR)", "deps"},
+-      libdirs = {"$(OPENSSL_LIBDIR)"},
+-      defines = {"PTHREADS"},
+-      libraries = {"ssl", "crypto"},
+-    }
+-  },
+-
+-  platforms = {
+-    windows = {
+-      modules = {
+-        openssl = {
+-          libraries = {"libeay32", "ssleay32", "ws2_32", "kernel32", "user32", "gdi32", "advapi32"},
+-          defines = {"LUA_BUILD_AS_DLL", "LUA_LIB", "WIN32_LEAN_AND_MEAN"},
+-        }
+-      }
+-    }
+-  },
+-}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/samples/srp.lua luvi-src-v2.7.6/deps/lua-openssl/samples/srp.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/samples/srp.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/samples/srp.lua	2019-02-13 11:53:24.275126573 +0100
+@@ -0,0 +1,43 @@
++local openssl = require'openssl'
++local srp = assert(openssl.srp)
++
++--both
++local GN = srp.get_default_gN('1024');
++
++local function test(username, clipass, srvpass)
++  assert(username)
++  assert(clipass)
++  srvpass = srvpass or clipass
++  --server
++  local salt, v = GN:create_verifier(username,srvpass)
++  print('salt:', salt:tohex())
++  print('verifier:',v:tohex())
++
++  local Bpub, Brnd = GN:calc_b(v)
++  print("Bpnb:",Bpub:tohex())
++  print("Brnd:",Brnd:tohex())
++
++  --client
++  local Apub, Arnd = GN:calc_a()
++  print("Apnb:",Apub:tohex())
++  print("Arnd:",Arnd:tohex())
++
++  --both
++  local u = GN:calc_u(Apub, Bpub)
++  print("u:",u:tohex())
++
++  --client
++  local x = GN.calc_x(salt, username, clipass)
++  local Kclient = GN:calc_client_key(Bpub,x, Arnd, u)
++
++  --server
++  local Kserver = GN:calc_server_key(Apub, v, u, Brnd)
++
++  return Kclient==Kserver
++end
++
++local cnt = 1
++for i=1,cnt do
++assert(test('zhaozg','password','password'))
++assert(not test('zhaozg','password','password1'))
++end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/asn1.c luvi-src-v2.7.6/deps/lua-openssl/src/asn1.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/asn1.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/asn1.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,9 +1,13 @@
+-/*=========================================================================*\
+-* asn1.c
+-* asn1 routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++openssl.asn1 module for lua-openssl binding.
++Provide asn1\_object, asn1\_string, asn1\_object as lua object.
++Sometime when you want to custome x509, you maybe need to use this.
++
++ at module asn1
++ at usage
++  asn1 = require('openssl').asn1
++*/
++
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/asn1.h>
+@@ -15,7 +19,7 @@
+ #define timezone _timezone
+ #endif
+ 
+-static LuaL_Enum asn1_const[] =
++static LuaL_Enumeration asn1_const[] =
+ {
+   /* 0 */
+   {"UNIVERSAL",         V_ASN1_UNIVERSAL},
+@@ -75,10 +79,14 @@ static LuaL_Enum asn1_const[] =
+ #define TAG_IDX_OFFSET  11
+ #define TAG_IDX_LENGTH  31
+ 
+-
++/***
++create asn1_type object
++ at function new_type
++*/
+ static int openssl_asn1type_new(lua_State*L)
+ {
+   ASN1_TYPE* at = ASN1_TYPE_new();
++  ASN1_STRING *s = NULL;
+   int ret = 1;
+   if (lua_isboolean(L, 1))
+   {
+@@ -99,9 +107,8 @@ static int openssl_asn1type_new(lua_Stat
+     const char* octet = luaL_checklstring(L, 1, &size);
+     ret = ASN1_TYPE_set_octetstring(at, (unsigned char*)octet, size);
+   }
+-  else if (auxiliar_isgroup(L, "openssl.asn1group", 1))
++  else if ((s = GET_GROUP(1, ASN1_STRING, "openssl.asn1group")) != NULL)
+   {
+-    ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+     ret = ASN1_TYPE_set1(at, ASN1_STRING_type(s), s);
+   }
+   else
+@@ -115,6 +122,436 @@ static int openssl_asn1type_new(lua_Stat
+   return 1;
+ }
+ 
++/***
++parse der encoded string
++ at function get_object
++ at tparam string der string
++ at tparam[opt=1] number start offset to parse
++ at tparam[opt=-i] number stop offset to parse
++ this like string.sub()
++ at treturn[1] number tag
++ at treturn[1] number class
++ at treturn[1] number parsed data start offset
++ at treturn[1] number parsed data stop offset
++ at treturn[1] boolean true for constructed data
++ at treturn[2] nil for fail
++ at treturn[2] string error msg
++ at treturn[2] number inner error code
++*/
++static int openssl_get_object(lua_State*L)
++{
++  size_t l = 0;
++  const char* asn1s = luaL_checklstring(L, 1, &l);
++  size_t off = posrelat(luaL_optinteger(L, 2, 1), l);
++  size_t length = posrelat(luaL_optinteger(L, 3, l), l);
++
++  const unsigned char *p = (const unsigned char *)asn1s + off - 1;
++  long len = 0;
++  int tag = 0;
++  int class = 0;
++  int ret;
++
++  p = (const unsigned char *)asn1s + off - 1;
++  ret = ASN1_get_object(&p, &len, &tag, &class, length - off + 1);
++  if (ret & 0x80)
++  {
++    lua_pushnil(L);
++    lua_pushstring(L, "arg 1 with error encoding");
++    lua_pushinteger(L, ret);
++    return 3;
++  }
++  lua_pushinteger(L, tag);
++  lua_pushinteger(L, class);
++  lua_pushinteger(L, p - (const unsigned char *)asn1s + 1);
++  lua_pushinteger(L, p + len - (const unsigned char *)asn1s);
++
++  lua_pushboolean(L, ret & V_ASN1_CONSTRUCTED);
++  return 5;
++}
++
++/***
++do der encode and return encoded string partly head or full
++ at function put_object
++ at tparam number tag
++ at tparam number class
++ at tparam[opt=nil] number|string length or date to encode, defualt will make
++indefinite length constructed
++ at tparam[opt=nil] boolean constructed or not
++ at treturn string der encoded string or head when not give data
++*/
++static int openssl_put_object(lua_State*L)
++{
++  int tag = luaL_checkint(L, 1);
++  int cls = luaL_checkint(L, 2);
++  int length = 0;
++  int constructed;
++  unsigned char *p1, *p2;
++  const char* dat = NULL;
++  luaL_Buffer B;
++
++  luaL_argcheck(L,
++                lua_isnoneornil(L, 3) || lua_type(L, 3) == LUA_TNUMBER || lua_isstring(L, 3), 3,
++                "if exist only accept string or number");
++  luaL_argcheck(L, lua_isnoneornil(L, 4) || lua_isboolean(L, 4), 4,
++                "if exist must be boolean type");
++
++  if (lua_isnoneornil(L, 3))
++  {
++    /* constructed == 2 for indefinite length constructed */
++    constructed = 2;
++    length = 0;
++  }
++  else
++  {
++    if (lua_type(L, 3) == LUA_TNUMBER)
++    {
++      length = lua_tointeger(L, 3);
++    }
++    else if (lua_isstring(L, 3))
++    {
++      size_t l;
++      dat = lua_tolstring(L, 3, &l);
++      length = (int)l;
++    }
++
++    constructed = lua_isnoneornil(L, 4) ? 0 : lua_toboolean(L, 4);
++  }
++  luaL_buffinit(L, &B);
++  p1 = (unsigned char *)luaL_prepbuffer(&B);
++  p2 = p1;
++
++  ASN1_put_object(&p2, constructed, length, tag, cls);
++  luaL_addsize(&B, p2 - p1);
++  if (dat)
++  {
++    luaL_addlstring(&B, dat, length);
++  }
++  luaL_pushresult(&B);
++  return 1;
++};
++
++/***
++make tag, class number to string
++
++ at function tostring
++ at tparam number clsortag which to string
++ at tparam string range only accept 'class' or 'tag'
++*/
++static int openssl_asn1_tostring(lua_State*L)
++{
++  int val = luaL_checkint(L, 1);
++  const char* range = luaL_optstring(L, 2, NULL);
++  int i;
++
++  if (range == NULL)
++  {
++    for (i = 0; i < sizeof(asn1_const) / sizeof(LuaL_Enumeration) - 1; i++)
++    {
++      if (asn1_const[i].val == val)
++      {
++        lua_pushstring(L, asn1_const[i + CLS_IDX_OFFSET].name);
++        return 1;
++      }
++    }
++  }
++  else if (strcmp("tag", range) == 0)
++  {
++    for (i = 0; i < TAG_IDX_LENGTH; i++)
++    {
++      if (asn1_const[i + TAG_IDX_OFFSET].val == val)
++      {
++        lua_pushstring(L, asn1_const[i + TAG_IDX_OFFSET].name);
++        return 1;
++      }
++    }
++  }
++  else if (strcmp("class", range) == 0)
++  {
++    for (i = 0; i < CLS_IDX_LENGTH; i++)
++    {
++      if (asn1_const[i + CLS_IDX_OFFSET].val == val)
++      {
++        lua_pushstring(L, asn1_const[i + CLS_IDX_OFFSET].name);
++        return 1;
++      }
++    }
++  }
++
++  return 0;
++}
++
++/***
++Create asn1_string object
++
++<br/><p> asn1_string object support types:   "integer", "enumerated", "bit", "octet", "utf8",
++"numeric", "printable", "t61", "teletex", "videotex", "ia5", "graphics", "iso64",
++"visible", "general", "unversal", "bmp", "utctime" </p>
++
++ at function new_string
++ at tparam string data to create new asn1_string
++ at tparam[opt] string type asn1 string type, defult with 'utf8'
++ at treturn asn1_string
++ at see asn1_string
++*/
++static int openssl_asn1string_new(lua_State* L)
++{
++  size_t size = 0;
++  const char* data = luaL_checklstring(L, 1, &size);
++  int type = luaL_checkint(L, 2);
++  ASN1_STRING *s = ASN1_STRING_type_new(type);
++  ASN1_STRING_set(s, data, size);
++  PUSH_OBJECT(s, "openssl.asn1_string");
++  return 1;
++}
++
++/***
++Create asn1_integer object
++
++ at function new_integer
++ at tparam number|bn integer to create new asn1_integer
++ at treturn asn1_integer
++ at see asn1_integer
++*/
++static int openssl_asn1int_new(lua_State* L)
++{
++  ASN1_INTEGER *ai = ASN1_INTEGER_new();
++  if (lua_isinteger(L, 1))
++  {
++    long v = luaL_checklong(L, 1);
++    ASN1_INTEGER_set(ai, v);
++  }
++  else if (!lua_isnone(L, 1))
++  {
++    BIGNUM *bn = BN_get(L, 1);
++    ai = BN_to_ASN1_INTEGER(bn, ai);
++    BN_free(bn);
++  }
++  PUSH_OBJECT(ai, "openssl.asn1_integer");
++  return 1;
++}
++
++/***
++Create asn1_time object
++ at function new_generalizedtime
++ at tparam none|number|string time
++ at treturn asn1_time
++*/
++static int openssl_asn1generalizedtime_new(lua_State* L)
++{
++  ASN1_GENERALIZEDTIME* a = NULL;
++  int ret = 1;
++  luaL_argcheck(L,
++                1,
++                lua_isnone(L, 1) || lua_isnumber(L, 1) || lua_isstring(L, 1),
++                "must be number, string or none"
++               );
++  a = ASN1_GENERALIZEDTIME_new();
++  if (lua_isnumber(L, 1))
++    ASN1_GENERALIZEDTIME_set(a, luaL_checkinteger(L, 1));
++  else if (lua_isstring(L, 1))
++    ret = ASN1_GENERALIZEDTIME_set_string(a, lua_tostring(L, 1));
++
++  if (ret == 1)
++    PUSH_OBJECT(a, "openssl.asn1_time");
++  else
++    return openssl_pushresult(L, ret);
++  return 1;
++}
++
++/***
++Create asn1_time object
++ at function new_utctime
++ at tparam none|number|string time
++ at treturn asn1_time
++*/
++static int openssl_asn1utctime_new(lua_State* L)
++{
++  ASN1_UTCTIME* a = NULL;
++  int ret = 1;
++  luaL_argcheck(L,
++                1,
++                lua_isnone(L, 1) || lua_isnumber(L, 1) || lua_isstring(L, 1),
++                "must be number, string or none"
++               );
++  a = ASN1_UTCTIME_new();
++  if (lua_isnumber(L, 1))
++  {
++    time_t t = luaL_checkinteger(L, 1);
++    ASN1_TIME_set(a, t);
++  }
++  else if (lua_isstring(L, 1))
++    ret = ASN1_TIME_set_string(a, lua_tostring(L, 1));
++
++  if (ret == 1)
++    PUSH_OBJECT(a, "openssl.asn1_time");
++  else
++    return openssl_pushresult(L, ret);
++  return 1;
++}
++
++/***
++get nid for txt, which can be short name, long name, or numerical oid
++
++ at function txt2nid
++ at tparam string txt which get to nid
++ at treturn integer nid or nil on fail
++*/
++static int openssl_txt2nid(lua_State*L)
++{
++  const char* txt = luaL_checkstring(L, 1);
++  int nid = OBJ_txt2nid(txt);
++  if (nid != NID_undef)
++  {
++    lua_pushinteger(L, nid);
++  }
++  else
++    lua_pushnil(L);
++
++  return 1;
++}
++
++/***
++Create asn1_object object
++
++ at function new_object
++ at tparam string name_or_oid  short name,long name or oid string
++ at tparam[opt] boolean no_name  true for only oid string, default is false
++ at treturn asn1_object mapping to ASN1_OBJECT in openssl
++ at see asn1_object
++*/
++
++/***
++Create asn1_object object
++
++ at function new_object
++ at tparam integer nid ident to asn1_object
++ at treturn asn1_object mapping to ASN1_OBJECT in openssl
++ at see asn1_object
++*/
++
++/***
++Create asn1_object object
++
++ at function new_object
++ at tparam table options have sn, ln, oid keys to create asn1_object
++ at treturn asn1_object mapping to ASN1_OBJECT in openssl
++ at see asn1_object
++*/
++static int openssl_asn1object_new(lua_State* L)
++{
++  if (lua_type(L, 1) == LUA_TNUMBER)
++  {
++    int nid = luaL_checkint(L, 1);
++    ASN1_OBJECT* obj = OBJ_nid2obj(nid);
++    if (obj)
++      PUSH_OBJECT(obj, "openssl.asn1_object");
++    else
++      lua_pushnil(L);
++  }
++  else if (lua_isstring(L, 1))
++  {
++    const char* txt = luaL_checkstring(L, 1);
++    int no_name = lua_isnone(L, 2) ? 0 : lua_toboolean(L, 2);
++
++    ASN1_OBJECT* obj = OBJ_txt2obj(txt, no_name);
++    if (obj)
++      PUSH_OBJECT(obj, "openssl.asn1_object");
++    else
++      lua_pushnil(L);
++  }
++  else if (lua_istable(L, 1))
++  {
++    const char *oid, *sn, *ln;
++    ASN1_OBJECT* obj;
++    int nid;
++
++    lua_getfield(L, 1, "oid");
++    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have oid field or is not string");
++    oid = luaL_checkstring(L, -1);
++    lua_pop(L, 1);
++
++    lua_getfield(L, 1, "sn");
++    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have sn field or is not string");
++    sn = luaL_checkstring(L, -1);
++    lua_pop(L, 1);
++
++    lua_getfield(L, 1, "ln");
++    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have ln field or is not string");
++    ln = luaL_checkstring(L, -1);
++    lua_pop(L, 1);
++
++    if (OBJ_txt2nid(oid) != NID_undef)
++    {
++      luaL_argerror(L, 1, "oid already exist");
++    }
++
++    if (OBJ_sn2nid(sn) != NID_undef)
++    {
++      luaL_argerror(L, 1, "sn already exist");
++    }
++
++    if (OBJ_ln2nid(ln) != NID_undef)
++    {
++      luaL_argerror(L, 1, "ln already exist");
++    }
++
++    nid = OBJ_create(oid, sn, ln);
++    if (nid != NID_undef)
++    {
++      obj = OBJ_nid2obj(nid);
++      PUSH_OBJECT(obj, "openssl.asn1_object");
++    }
++    else
++      luaL_argerror(L, 1, "create object fail");
++  }
++  else
++    luaL_argerror(L, 1, "need accept paramater");
++
++  return 1;
++}
++
++/***
++convert der encoded asn1type string to object
++ at function asn1type_di2
++ at tparam string der
++ at treturn asn1type object for success, and nil for fail
++*/
++static int openssl_asn1type_d2i(lua_State*L)
++{
++  size_t size;
++  const unsigned char* data = (const unsigned char*)luaL_checklstring(L, 1, &size);
++  ASN1_TYPE* at = d2i_ASN1_TYPE(NULL, &data, size);
++  if (at)
++  {
++    PUSH_OBJECT(at, "openssl.asn1_type");
++  }
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static luaL_Reg R[] =
++{
++  {"new_object", openssl_asn1object_new},
++
++  {"new_integer", openssl_asn1int_new},
++  {"new_string", openssl_asn1string_new},
++  {"new_utctime", openssl_asn1utctime_new},
++  {"new_generalizedtime", openssl_asn1generalizedtime_new},
++
++  {"new_type", openssl_asn1type_new},
++  {"d2i_asn1type", openssl_asn1type_d2i},
++
++  {"get_object", openssl_get_object},
++  {"put_object", openssl_put_object},
++
++  {"tostring", openssl_asn1_tostring},
++  {"txt2nid",   openssl_txt2nid},
++
++  {NULL, NULL}
++};
++
++
+ static int openssl_asn1type_type(lua_State*L)
+ {
+   ASN1_TYPE* at = CHECK_OBJECT(1, ASN1_TYPE, "openssl.asn1_type");
+@@ -289,20 +726,6 @@ int openssl_push_asn1type(lua_State* L,
+   return 1;
+ }
+ 
+-static int openssl_asn1type_d2i(lua_State*L)
+-{
+-  size_t size;
+-  const unsigned char* data = (const unsigned char*)luaL_checklstring(L, 1, &size);
+-  ASN1_TYPE* at = d2i_ASN1_TYPE(NULL, &data, size);
+-  if (at)
+-  {
+-    PUSH_OBJECT(at, "openssl.asn1_type");
+-  }
+-  else
+-    lua_pushnil(L);
+-  return 1;
+-}
+-
+ static luaL_Reg asn1type_funcs[] =
+ {
+   {"type",      openssl_asn1type_type},
+@@ -320,23 +743,44 @@ static luaL_Reg asn1type_funcs[] =
+   {NULL,        NULL}
+ };
+ 
+-
+-/*** asn1_object routines ***/
++/***
++openssl.asn1_object object
++ at type asn1_object
++*/
++/***
++get nid of asn1_object.
++
++ at function nid
++ at treturn integer nid of asn1_object
++*/
+ static int openssl_asn1object_nid(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+-  lua_pushinteger(L, o->nid);
++  lua_pushinteger(L, OBJ_obj2nid(o));
+   return 1;
+ }
+ 
++/***
++get name of asn1_object.
++
++ at function name
++ at treturn string short name and followed by long name of asn1_object
++*/
+ static int openssl_asn1object_name(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+-  lua_pushstring(L, o->sn);
+-  lua_pushstring(L, o->ln);
++  int nid = OBJ_obj2nid(o);
++  lua_pushstring(L, OBJ_nid2sn(nid));
++  lua_pushstring(L, OBJ_nid2ln(nid));
+   return 2;
+ }
+ 
++/***
++get long name of asn1_object.
++
++ at function ln
++ at treturn string long name of asn1_object
++*/
+ static int openssl_asn1object_ln(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -348,6 +792,11 @@ static int openssl_asn1object_ln(lua_Sta
+   return 1;
+ }
+ 
++/***
++get short name of asn1_object.
++ at function sn
++ at treturn string short name of asn1_object
++*/
+ static int openssl_asn1object_sn(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -359,6 +808,13 @@ static int openssl_asn1object_sn(lua_Sta
+   return 1;
+ }
+ 
++/***
++get text of asn1_object.
++
++ at function txt
++ at tparam[opt] boolean no_name true for only oid or name, default with false
++ at treturn string long or short name, even oid of asn1_object
++*/
+ static int openssl_asn1object_txt(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -372,6 +828,13 @@ static int openssl_asn1object_txt(lua_St
+   return 1;
+ }
+ 
++/***
++compare two asn1_objects, if equals return true
++
++ at function equals
++ at tparam asn1_object another to compre
++ at treturn boolean true if equals
++*/
+ static int openssl_asn1object_equals(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -381,6 +844,12 @@ static int openssl_asn1object_equals(lua
+   return 1;
+ }
+ 
++/***
++get data of asn1_object
++
++ at function data
++ at treturn string asn1_object data
++*/
+ static int openssl_asn1object_data(lua_State* L)
+ {
+   ASN1_OBJECT* s = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -401,6 +870,12 @@ static int openssl_asn1object_free(lua_S
+   return 0;
+ }
+ 
++/***
++make a clone of asn1_object
++
++ at function dup
++ at treturn asn1_object clone for self
++*/
+ static int openssl_asn1object_dup(lua_State* L)
+ {
+   ASN1_OBJECT* o = CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object");
+@@ -419,6 +894,7 @@ static luaL_Reg asn1obj_funcs[] =
+   {"txt",         openssl_asn1object_txt},
+   {"dup",         openssl_asn1object_dup},
+   {"data",        openssl_asn1object_data},
++  {"equals",      openssl_asn1object_equals},
+ 
+   {"__eq",        openssl_asn1object_equals},
+   {"__gc",        openssl_asn1object_free},
+@@ -427,123 +903,10 @@ static luaL_Reg asn1obj_funcs[] =
+   {NULL,    NULL}
+ };
+ 
+-
+-static int openssl_asn1object_new(lua_State* L)
+-{
+-  if (lua_type(L, 1) == LUA_TNUMBER)
+-  {
+-    int nid = luaL_checkint(L, 1);
+-    ASN1_OBJECT* obj = OBJ_nid2obj(nid);
+-    if (obj)
+-      PUSH_OBJECT(obj, "openssl.asn1_object");
+-    else
+-      lua_pushnil(L);
+-  }
+-  else if (lua_isstring(L, 1))
+-  {
+-    const char* txt = luaL_checkstring(L, 1);
+-    int no_name = lua_isnone(L, 2) ? 0 : lua_toboolean(L, 2);
+-
+-    ASN1_OBJECT* obj = OBJ_txt2obj(txt, no_name);
+-    if (obj)
+-      PUSH_OBJECT(obj, "openssl.asn1_object");
+-    else
+-      lua_pushnil(L);
+-  }
+-  else if (lua_istable(L, 1))
+-  {
+-    const char *oid, *sn, *ln;
+-    ASN1_OBJECT* obj;
+-    int nid;
+-
+-    lua_getfield(L, 1, "oid");
+-    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have oid field or is not string");
+-    oid = luaL_checkstring(L, -1);
+-    lua_pop(L, 1);
+-
+-    lua_getfield(L, 1, "sn");
+-    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have sn field or is not string");
+-    sn = luaL_checkstring(L, -1);
+-    lua_pop(L, 1);
+-
+-    lua_getfield(L, 1, "ln");
+-    luaL_argcheck(L, lua_isstring(L, -1), 1, "not have ln field or is not string");
+-    ln = luaL_checkstring(L, -1);
+-    lua_pop(L, 1);
+-
+-    if (OBJ_txt2nid(oid) != NID_undef)
+-    {
+-      luaL_argerror(L, 1, "oid already exist");
+-    }
+-
+-    if (OBJ_sn2nid(sn) != NID_undef)
+-    {
+-      luaL_argerror(L, 1, "sn already exist");
+-    }
+-
+-    if (OBJ_ln2nid(ln) != NID_undef)
+-    {
+-      luaL_argerror(L, 1, "ln already exist");
+-    }
+-
+-    nid = OBJ_create(oid, sn, ln);
+-    if (nid != NID_undef)
+-    {
+-      obj = OBJ_nid2obj(nid);
+-      PUSH_OBJECT(obj, "openssl.asn1_object");
+-    }
+-    else
+-      luaL_argerror(L, 1, "create object fail");
+-  }
+-  else
+-    luaL_argerror(L, 1, "need accept paramater");
+-
+-  return 1;
+-}
+-
+-static int openssl_txt2nid(lua_State*L)
+-{
+-  const char* txt = luaL_checkstring(L, 1);
+-  int nid = OBJ_txt2nid(txt);
+-  if (nid != NID_undef)
+-  {
+-    lua_pushinteger(L, nid);
+-  }
+-  else
+-    lua_pushnil(L);
+-
+-  return 1;
+-}
+-
+-static int openssl_asn1string_new(lua_State* L)
+-{
+-  size_t size = 0;
+-  const char* data = luaL_checklstring(L, 1, &size);
+-  int type = luaL_checkint(L, 2);
+-  ASN1_STRING *s = ASN1_STRING_type_new(type);
+-  ASN1_STRING_set(s, data, size);
+-  PUSH_OBJECT(s, "openssl.asn1_string");
+-  return 1;
+-}
+-
+-static int openssl_asn1int_new(lua_State* L)
+-{
+-  ASN1_INTEGER *ai = ASN1_INTEGER_new();
+-  if (lua_isinteger(L, 1))
+-  {
+-    long v = luaL_checklong(L, 1);
+-    ASN1_INTEGER_set(ai, v);
+-  }
+-  else if (!lua_isnone(L, 1))
+-  {
+-    BIGNUM *bn = BN_get(L, 1);
+-    ai = BN_to_ASN1_INTEGER(bn, ai);
+-    BN_free(bn);
+-  }
+-  PUSH_OBJECT(ai, "openssl.asn1_integer");
+-  return 1;
+-}
+-
++/***
++openssl.asn1_integer object
++ at type asn1_integer
++*/
+ static int openssl_asn1int_bn(lua_State *L)
+ {
+   ASN1_INTEGER *ai = CHECK_OBJECT(1, ASN1_INTEGER, "openssl.asn1_integer");
+@@ -562,6 +925,14 @@ static int openssl_asn1int_bn(lua_State
+   }
+ }
+ 
++/***
++openssl.asn1_string object
++ at type asn1_string
++*/
++
++/***
++ at function set
++*/
+ static int openssl_asn1group_set(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -637,6 +1008,9 @@ static time_t ASN1_TIME_get(ASN1_TIME* t
+   return mktime(&t) + off;
+ }
+ 
++/***
++ at function get
++*/
+ static int openssl_asn1group_get(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -664,6 +1038,9 @@ static int openssl_asn1group_get(lua_Sta
+   return 0;
+ }
+ 
++/***
++ at function i2d
++*/
+ static int openssl_asn1group_i2d(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -716,6 +1093,9 @@ static int openssl_asn1group_i2d(lua_Sta
+   return 0;
+ }
+ 
++/***
++ at function d2i
++*/
+ static int openssl_asn1group_d2i(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -732,7 +1112,6 @@ static int openssl_asn1group_d2i(lua_Sta
+     else
+       lua_pushvalue(L, 1);
+     return 1;
+-    break;
+   }
+   case V_ASN1_UTCTIME:
+   {
+@@ -763,6 +1142,13 @@ static int openssl_asn1group_d2i(lua_Sta
+   return 0;
+ }
+ 
++/***
++get type of asn1_string
++
++ at function type
++ at treturn string type of asn1_string
++ at see new_string
++*/
+ static int openssl_asn1group_type(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -780,6 +1166,17 @@ static int openssl_asn1group_type(lua_St
+   return 1;
+ }
+ 
++/***
++get length two asn1_string
++
++ at function length
++ at treturn integer length of asn1_string
++ at usage
++  local astr = asn1.new_string('ABCD')
++  print('length:',#astr)
++  print('length:',astr:length())
++  assert(#astr==astr:length,"must equals")
++*/
+ static int openssl_asn1group_length(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -787,6 +1184,21 @@ static int openssl_asn1group_length(lua_
+   return 1;
+ }
+ 
++/***
++get data of asn1_string
++
++ at function data
++ at treturn string raw data of asn1_string
++*/
++
++/***
++set data of asn1_string
++
++ at function data
++ at tparam string data set to asn1_string
++ at treturn boolean success if value set true, or follow by errmsg
++ at treturn string fail error message
++*/
+ static int openssl_asn1group_data(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -802,6 +1214,16 @@ static int openssl_asn1group_data(lua_St
+   return 1;
+ }
+ 
++/***
++compare two asn1_string, if equals return true
++
++ at function equals
++ at tparam asn1_string another to compre
++ at treturn boolean true if equals
++ at usage
++  local obj = astr:dup()
++  assert(obj==astr, "must equals")
++*/
+ static int openssl_asn1group_eq(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -835,6 +1257,12 @@ static int openssl_asn1group_free(lua_St
+   return 0;
+ }
+ 
++/***
++convert asn1_string to lua string
++
++ at function __tostring
++ at treturn string result format match with type:data
++*/
+ static int openssl_asn1group_tostring(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -862,6 +1290,12 @@ static int openssl_asn1group_tostring(lu
+   return 0;
+ }
+ 
++/***
++get data as printable encode string
++
++ at function toprint
++ at treturn string printable encoded string
++*/
+ static int openssl_asn1group_toprint(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -893,6 +1327,12 @@ static int openssl_asn1group_toprint(lua
+   return 1;
+ }
+ 
++/***
++get data as utf8 encode string
++
++ at function toutf8
++ at treturn string utf8 encoded string
++*/
+ static int openssl_asn1group_toutf8(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -906,6 +1346,12 @@ static int openssl_asn1group_toutf8(lua_
+   return 1;
+ }
+ 
++/***
++duplicate a new asn1_string
++
++ at function dup
++ at treturn asn1_string clone for self
++*/
+ static int openssl_asn1group_dup(lua_State* L)
+ {
+   ASN1_STRING* s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+@@ -913,53 +1359,6 @@ static int openssl_asn1group_dup(lua_Sta
+   return 1;
+ }
+ 
+-static int openssl_asn1generalizedtime_new(lua_State* L)
+-{
+-  ASN1_GENERALIZEDTIME* a = NULL;
+-  int ret = 1;
+-  luaL_argcheck(L,
+-                1,
+-                lua_isnone(L, 1) || lua_isnumber(L, 1) || lua_isstring(L, 1),
+-                "must be number, string or none"
+-               );
+-  a = ASN1_GENERALIZEDTIME_new();
+-  if (lua_isnumber(L, 1))
+-    ASN1_GENERALIZEDTIME_set(a, luaL_checkinteger(L, 1));
+-  else if (lua_isstring(L, 1))
+-    ret = ASN1_GENERALIZEDTIME_set_string(a, lua_tostring(L, 1));
+-
+-  if (ret == 1)
+-    PUSH_OBJECT(a, "openssl.asn1_time");
+-  else
+-    return openssl_pushresult(L, ret);
+-  return 1;
+-}
+-
+-static int openssl_asn1utctime_new(lua_State* L)
+-{
+-  ASN1_UTCTIME* a = NULL;
+-  int ret = 1;
+-  luaL_argcheck(L,
+-                1,
+-                lua_isnone(L, 1) || lua_isnumber(L, 1) || lua_isstring(L, 1),
+-                "must be number, string or none"
+-               );
+-  a = ASN1_UTCTIME_new();
+-  if (lua_isnumber(L, 1))
+-  {
+-    time_t t = luaL_checkinteger(L, 1);
+-    ASN1_TIME_set(a, t);
+-  }
+-  else if (lua_isstring(L, 1))
+-    ret = ASN1_TIME_set_string(a, lua_tostring(L, 1));
+-
+-  if (ret == 1)
+-    PUSH_OBJECT(a, "openssl.asn1_time");
+-  else
+-    return openssl_pushresult(L, ret);
+-  return 1;
+-}
+-
+ static int openssl_asn1time_check(lua_State* L)
+ {
+   ASN1_TIME *a = CHECK_OBJECT(1, ASN1_TIME, "openssl.asn1_time");
+@@ -992,7 +1391,7 @@ static luaL_Reg asn1str_funcs[] =
+   {"tostring",  openssl_asn1group_tostring},
+ 
+   {"__len",     openssl_asn1group_length},
+-  {"__tostring", auxiliar_tostring},
++  {"__tostring",auxiliar_tostring},
+ 
+   {"__eq",      openssl_asn1group_eq},
+   {"__gc",      openssl_asn1group_free},
+@@ -1012,157 +1411,8 @@ static luaL_Reg asn1str_funcs[] =
+   {NULL, NULL}
+ };
+ 
+-static int openssl_get_object(lua_State*L)
+-{
+-  size_t l = 0;
+-  const char* asn1s = luaL_checklstring(L, 1, &l);
+-  size_t off = posrelat(luaL_optinteger(L, 2, 1), l);
+-  size_t length = posrelat(luaL_optinteger(L, 3, l), l);
+-
+-  const unsigned char *p = (const unsigned char *)asn1s + off - 1;
+-  long len = 0;
+-  int tag = 0;
+-  int class = 0;
+-  int ret;
+-
+-  p = (const unsigned char *)asn1s + off - 1;
+-  ret = ASN1_get_object(&p, &len, &tag, &class, length - off + 1);
+-  if (ret & 0x80)
+-  {
+-    lua_pushnil(L);
+-    lua_pushstring(L, "arg 1 with error encoding");
+-    lua_pushinteger(L, ret);
+-    return 3;
+-  }
+-  lua_pushinteger(L, tag);
+-  lua_pushinteger(L, class);
+-  lua_pushinteger(L, p - (const unsigned char *)asn1s + 1);
+-  lua_pushinteger(L, p + len - (const unsigned char *)asn1s);
+-
+-  lua_pushboolean(L, ret & V_ASN1_CONSTRUCTED);
+-  return 5;
+-}
+-
+-static int openssl_put_object(lua_State*L)
+-{
+-  int tag = luaL_checkint(L, 1);
+-  int cls = luaL_checkint(L, 2);
+-  int length = 0;
+-  int constructed;
+-  unsigned char *p1, *p2;
+-  const char* dat = NULL;
+-  luaL_Buffer B;
+-
+-  luaL_argcheck(L,
+-                lua_isnoneornil(L, 3) || lua_type(L, 3) == LUA_TNUMBER || lua_isstring(L, 3), 3,
+-                "if exist only accept string or number");
+-  luaL_argcheck(L, lua_isnoneornil(L, 4) || lua_isboolean(L, 4), 4,
+-                "if exist must be boolean type");
+-
+-  if (lua_isnoneornil(L, 3))
+-  {
+-    /* constructed == 2 for indefinite length constructed */
+-    constructed = 2;
+-    length = 0;
+-  }
+-  else
+-  {
+-    if (lua_type(L, 3) == LUA_TNUMBER)
+-    {
+-      length = lua_tointeger(L, 3);
+-    }
+-    else if (lua_isstring(L, 3))
+-    {
+-      size_t l;
+-      dat = lua_tolstring(L, 3, &l);
+-      length = (int)l;
+-    }
+-
+-    constructed = lua_isnoneornil(L, 4) ? 0 : lua_toboolean(L, 4);
+-  }
+-  luaL_buffinit(L, &B);
+-  p1 = (unsigned char *)luaL_prepbuffer(&B);
+-  p2 = p1;
+-
+-  ASN1_put_object(&p2, constructed, length, tag, cls);
+-  luaL_addsize(&B, p2 - p1);
+-  if (dat)
+-  {
+-    luaL_addlstring(&B, dat, length);
+-  }
+-  luaL_pushresult(&B);
+-  return 1;
+-};
+-
+-static int openssl_asn1_tostring(lua_State*L)
+-{
+-  int val = luaL_checkint(L, 1);
+-  const char* range = luaL_optstring(L, 2, NULL);
+-  int i;
+-
+-  if (range == NULL)
+-  {
+-    for (i = 0; i < sizeof(asn1_const) / sizeof(LuaL_Enum) - 1; i++)
+-    {
+-      if (asn1_const[i].val == val)
+-      {
+-        lua_pushstring(L, asn1_const[i + CLS_IDX_OFFSET].name);
+-        return 1;
+-      }
+-    }
+-  }
+-  else if (strcmp("tag", range) == 0)
+-  {
+-    for (i = 0; i < TAG_IDX_LENGTH; i++)
+-    {
+-      if (asn1_const[i + TAG_IDX_OFFSET].val == val)
+-      {
+-        lua_pushstring(L, asn1_const[i + TAG_IDX_OFFSET].name);
+-        return 1;
+-      }
+-    }
+-  }
+-  else if (strcmp("class", range) == 0)
+-  {
+-    for (i = 0; i < CLS_IDX_LENGTH; i++)
+-    {
+-      if (asn1_const[i + CLS_IDX_OFFSET].val == val)
+-      {
+-        lua_pushstring(L, asn1_const[i + CLS_IDX_OFFSET].name);
+-        return 1;
+-      }
+-    }
+-  }
+-
+-  return 0;
+-}
+-
+-static luaL_Reg R[] =
+-{
+-  {"new_object", openssl_asn1object_new},
+-
+-  {"new_integer", openssl_asn1int_new},
+-  {"new_string", openssl_asn1string_new},
+-  {"new_utctime", openssl_asn1utctime_new},
+-  {"new_generalizedtime", openssl_asn1generalizedtime_new},
+-
+-  {"new_type", openssl_asn1type_new},
+-  {"d2i_asn1type", openssl_asn1type_d2i},
+-
+-  {"get_object", openssl_get_object},
+-  {"put_object", openssl_put_object},
+-
+-  {"tostring", openssl_asn1_tostring},
+-
+-  {"txt2nid",   openssl_txt2nid},
+-
+-
+-  {NULL, NULL}
+-};
+-
+ int luaopen_asn1(lua_State *L)
+ {
+-  int i;
+   tzset();
+   auxiliar_newclass(L, "openssl.asn1_object", asn1obj_funcs);
+   auxiliar_newclass(L, "openssl.asn1_type", asn1type_funcs);
+@@ -1182,12 +1432,7 @@ int luaopen_asn1(lua_State *L)
+   lua_pushliteral(L, MYVERSION);
+   lua_settable(L, -3);
+ 
+-  for (i = 0; i < sizeof(asn1_const) / sizeof(LuaL_Enum) - 1; i++)
+-  {
+-    LuaL_Enum e = asn1_const[i];
+-    lua_pushinteger(L, e.val);
+-    lua_setfield(L, -2, e.name);
+-  }
++  auxiliar_enumerate(L, -1, asn1_const);
+ 
+   return 1;
+ }
+@@ -1212,7 +1457,7 @@ int openssl_get_nid(lua_State*L, int idx
+   else if (lua_isuserdata(L, idx))
+   {
+     ASN1_OBJECT* obj = CHECK_OBJECT(idx, ASN1_OBJECT, "openssl.asn1_object");
+-    return obj->nid;
++    return  OBJ_obj2nid(obj);
+   }
+   else
+   {
+@@ -1229,9 +1474,18 @@ int openssl_push_asn1object(lua_State* L
+   return 1;
+ }
+ 
+-int openssl_push_asn1(lua_State* L, ASN1_STRING* string, int type)
++int openssl_push_asn1(lua_State* L, const ASN1_STRING* string, int type)
+ {
+-  if (type == V_ASN1_UNDEF)
++  if (string == NULL)
++  {
++    lua_pushnil(L);
++    return 1;
++  }
++  if ((string->type & V_ASN1_GENERALIZEDTIME) == V_ASN1_GENERALIZEDTIME && type == V_ASN1_UTCTIME)
++    type = V_ASN1_GENERALIZEDTIME;
++  else if ((string->type & V_ASN1_UTCTIME) == V_ASN1_UTCTIME && type == V_ASN1_GENERALIZEDTIME)
++    type = V_ASN1_UTCTIME;
++  else if (type == V_ASN1_UNDEF)
+     type = string->type;
+   if ((string->type & type) != type)
+   {
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/auxiliar.c luvi-src-v2.7.6/deps/lua-openssl/src/auxiliar.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/auxiliar.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/auxiliar.c	1970-01-01 01:00:00.000000000 +0100
+@@ -1,41 +0,0 @@
+-#include "../deps/auxiliar/auxiliar.c"
+-
+-#if LUA_VERSION_NUM==501
+-#define lua_rawlen lua_strlen
+-#define luaL_typeerror luaL_typerror
+-#endif
+-/*=========================================================================*\
+-* Exported functions
+-\*=========================================================================*/
+-
+-int auxiliar_isclass(lua_State *L, const char *classname, int objidx)
+-{
+-  void *p = lua_touserdata(L, objidx);
+-  if (p != NULL)    /* value is a userdata? */
+-  {
+-    if (lua_getmetatable(L, objidx))    /* does it have a metatable? */
+-    {
+-      lua_getfield(L, LUA_REGISTRYINDEX, classname);  /* get correct metatable */
+-      if (lua_rawequal(L, -1, -2))    /* does it have the correct mt? */
+-      {
+-        lua_pop(L, 2);  /* remove both metatables */
+-        return 1;
+-      }
+-      else
+-        lua_pop(L, 2);
+-    }
+-  }
+-  return 0;
+-}
+-
+-int auxiliar_isgroup(lua_State *L, const char *groupname, int objidx)
+-{
+-  void *data = auxiliar_getgroupudata(L, groupname, objidx);
+-  return data != NULL;
+-}
+-
+-int auxiliar_checkoption(lua_State*L, int objidx, const char* def, const char* const slist[], const int ival[])
+-{
+-  int at = luaL_checkoption(L, objidx, def, slist);
+-  return ival[at];
+-}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/auxiliar.h luvi-src-v2.7.6/deps/lua-openssl/src/auxiliar.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/auxiliar.h	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/auxiliar.h	1970-01-01 01:00:00.000000000 +0100
+@@ -1,37 +0,0 @@
+-#ifndef AUXILIAR_H_EXT
+-#define AUXILIAR_H_EXT
+-#include "../deps/auxiliar/auxiliar.h"
+-
+-#define AUXILIAR_SET(L,tidx, lvar, cval, ltype) \
+-  do {                  \
+-  int n = tidx < 0 ? tidx-1 : tidx;   \
+-  lua_push##ltype(L, (cval));       \
+-  lua_setfield(L, n, lvar);       \
+-  } while(0)
+-
+-#define AUXILIAR_SETLSTR(L,tidx, lvar, cval,len)  \
+-  do {                  \
+-  int n = tidx < 0 ? tidx-1 : tidx;   \
+-  lua_pushlstring(L, (const char*)(cval),len);        \
+-  lua_setfield(L, n, lvar);       \
+-  } while(0)
+-
+-#define AUXLIAR_GET(L,tidx, lvar, cvar, ltype)  \
+-  do {                  \
+-  lua_getfield(L, tidx, lvar);      \
+-  cvar = lua_to##ltype(L, -1);      \
+-  lua_pop(L, 1);              \
+-  } while(0)
+-
+-typedef struct
+-{
+-  const char* name;
+-  int val;
+-} LuaL_Enum;
+-
+-int auxiliar_isclass(lua_State *L, const char *classname, int objidx);
+-int auxiliar_isgroup(lua_State *L, const char *groupname, int objidx);
+-
+-int auxiliar_checkoption(lua_State*L, int objidx, const char* def, const char* const slist[], const int ival[]);
+-
+-#endif /* AUXILIAR_H_EXT */
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/bio.c luvi-src-v2.7.6/deps/lua-openssl/src/bio.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/bio.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/bio.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,10 +1,11 @@
+-/*=========================================================================*\
+-* bio.c
+-* bio object for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++bio object for lua-openssl binding,  mapping to BIO in openssl
++openssl.bio is a help object, it is useful, but rarely use.
++
++ at module bio
++ at usage
++  bio = require'openssl'.bio
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/ssl.h>
+@@ -53,7 +54,6 @@ luaL_error(L, "error opening the file(%s
+ PUSH_OBJECT(bio,"openssl.bio");
+ return 1;
+ }
+-
+ */
+ 
+ static const char* close_flags[] =
+@@ -63,6 +63,13 @@ static const char* close_flags[] =
+   NULL
+ };
+ 
++/***
++make string as bio object
++
++ at function mem
++ at tparam[opt=nil] string data, it will be memory buffer data
++ at treturn bio it can be input or output object
++*/
+ static LUA_FUNCTION(openssl_bio_new_mem)
+ {
+   size_t l = 0;
+@@ -78,11 +85,19 @@ static LUA_FUNCTION(openssl_bio_new_mem)
+     BIO_write(bio, d, l);
+   }
+ 
+-  BIO_set_close(bio, BIO_CLOSE);
++  (void)BIO_set_close(bio, BIO_CLOSE);
+   PUSH_OBJECT(bio, "openssl.bio");
+   return 1;
+ }
+ 
++/***
++make tcp bio from socket fd
++
++ at function socket
++ at tparam number fd
++ at tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_socket)
+ {
+   int s = luaL_checkint(L, 1);
+@@ -93,6 +108,14 @@ static LUA_FUNCTION(openssl_bio_new_sock
+   return 1;
+ }
+ 
++/***
++make dgram bio from socket fd
++
++ at function dgram
++ at tparam number fd
++ at tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_dgram)
+ {
+   int s = luaL_checkint(L, 1);
+@@ -102,6 +125,13 @@ static LUA_FUNCTION(openssl_bio_new_dgra
+   return 1;
+ }
+ 
++/***
++make socket or file bio with fd
++ at function fd
++ at tparam number fd
++ at tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_fd)
+ {
+   int fd = luaL_checkint(L, 1);
+@@ -112,6 +142,13 @@ static LUA_FUNCTION(openssl_bio_new_fd)
+   return 1;
+ }
+ 
++/***
++make file object with file name or path
++ at function file
++ at tparam string file
++ at tparam[opt='r'] string mode
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_file)
+ {
+   const char* f = luaL_checkstring(L, 1);
+@@ -123,6 +160,12 @@ static LUA_FUNCTION(openssl_bio_new_file
+   return 1;
+ }
+ 
++/***
++make tcp listen socket
++ at function accept
++ at tparam string host_port address like 'host:port'
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_accept)
+ {
+   const char* port = lua_tostring(L, 1);
+@@ -132,6 +175,13 @@ static LUA_FUNCTION(openssl_bio_new_acce
+   return 1;
+ }
+ 
++/***
++make tcp client socket
++ at function connect
++ at tparam string host_addr addrees like 'host:port'
++ at tparam[opt=true] boolean connect default connect immediately
++ at treturn bio
++*/
+ static int openssl_bio_new_connect(lua_State *L)
+ {
+   const char *host = luaL_checkstring(L, 1);
+@@ -167,7 +217,7 @@ static int openssl_bio_new_connect(lua_S
+       openssl_newvalue(L, bio);
+ 
+       lua_pushboolean(L, 1);
+-      openssl_setvalue(L, bio, "free_all");
++      openssl_valueset(L, bio, "free_all");
+       return 1;
+     }
+     else
+@@ -183,6 +233,36 @@ static int openssl_bio_new_connect(lua_S
+   return 0;
+ }
+ 
++/***
++Create base64 or buffer bio, which can append to an io BIO object
++ at function filter
++ at tparam string mode support 'base64' or 'buffer'
++ at treturn bio
++*/
++/***
++Create digest bio, which can append to an io BIO object
++ at function filter
++ at tparam string mode must be 'digest'
++ at tparam evp_md|string md_alg
++ at treturn bio
++*/
++/***
++Create ssl bio
++ at function filter
++ at tparam string mode must be 'ssl'
++ at tparam ssl s
++ at tparam[opt='noclose'] flag support 'close' or 'noclose' when close or gc
++ at treturn bio
++*/
++/***
++create cipher filter bio object
++ at function filter
++ at tparam string mode must be 'cipher'
++ at tparam string key
++ at tparam string iv
++ at tparam[opt=true] boolean encrypt
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_new_filter)
+ {
+   /* 0         1        2      3      4    5 */
+@@ -213,7 +293,7 @@ static LUA_FUNCTION(openssl_bio_new_filt
+   break;
+   case 3:
+   {
+-    const EVP_MD* md = get_digest(L, 2);
++    const EVP_MD* md = get_digest(L, 2, NULL);
+     bio = BIO_new(BIO_f_md());
+     ret = BIO_set_md(bio, md);
+   }
+@@ -236,7 +316,7 @@ static LUA_FUNCTION(openssl_bio_new_filt
+       openssl_newvalue(L, bio);
+ 
+       lua_pushboolean(L, 1);
+-      openssl_setvalue(L, bio, "free_all");
++      openssl_valueset(L, bio, "free_all");
+     }
+     return 1;
+   }
+@@ -249,6 +329,17 @@ static LUA_FUNCTION(openssl_bio_new_filt
+ }
+ 
+ /* bio object method */
++/***
++openssl.bio object
++ at type bio
++*/
++
++/***
++read data from bio object
++ at function read
++ at tparam number len
++ at treturn string string length may be less than param len
++*/
+ static LUA_FUNCTION(openssl_bio_read)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -280,6 +371,12 @@ static LUA_FUNCTION(openssl_bio_read)
+   return ret;
+ }
+ 
++/***
++get line from bio object
++ at function gets
++ at tparam[opt=256] number max line len
++ at treturn string string length may be less than param len
++*/
+ static LUA_FUNCTION(openssl_bio_gets)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -310,7 +407,12 @@ static LUA_FUNCTION(openssl_bio_gets)
+   return ret;
+ }
+ 
+-
++/***
++write data to bio object
++ at function write
++ at tparam string data
++ at treturn number length success write
++*/
+ static LUA_FUNCTION(openssl_bio_write)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -339,6 +441,12 @@ static LUA_FUNCTION(openssl_bio_write)
+   return ret;
+ }
+ 
++/***
++put line to bio object
++ at function puts
++ at tparam string data
++ at treturn number length success write
++*/
+ static LUA_FUNCTION(openssl_bio_puts)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -365,6 +473,11 @@ static LUA_FUNCTION(openssl_bio_puts)
+   return ret;
+ }
+ 
++/***
++flush buffer of bio object
++ at function flush
++ at treturn boolean true for success, others for fail
++*/
+ static LUA_FUNCTION(openssl_bio_flush)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -382,7 +495,7 @@ static LUA_FUNCTION(openssl_bio_free)
+     all = lua_toboolean(L, 2);
+   else
+   {
+-    openssl_getvalue(L, bio, "free_all");
++    openssl_valueget(L, bio, "free_all");
+     all = lua_toboolean(L, -1);
+     lua_pop(L, 1);
+   }
+@@ -396,6 +509,11 @@ static LUA_FUNCTION(openssl_bio_free)
+   return 0;
+ }
+ 
++/***
++get type of bio
++ at function type
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_bio_type)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -403,6 +521,12 @@ static LUA_FUNCTION(openssl_bio_type)
+   return 1;
+ }
+ 
++/***
++set nonblock for bio object
++ at function nbio
++ at tparam boolean nonblock
++ at treturn boolean result, true for success, others for fail
++*/
+ static LUA_FUNCTION(openssl_bio_nbio)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -428,16 +552,24 @@ static LUA_FUNCTION(openssl_bio_retry)
+   return 1;
+ }
+ 
+-
+-
++/***
++reset bio
++ at function reset
++*/
+ static LUA_FUNCTION(openssl_bio_reset)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+-  BIO_reset(bio);
++  (void)BIO_reset(bio);
+   return 0;
+ }
+ 
+ /* filter bio object */
++/***
++push bio append to chain of bio, if want to free a chain use free_all()
++ at function push
++ at tparam bio append
++ at treturn bio
++*/
+ static LUA_FUNCTION(openssl_bio_push)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -450,23 +582,33 @@ static LUA_FUNCTION(openssl_bio_push)
+   return 1;
+ }
+ 
++/***
++remove bio from chain
++ at function pop
++ at tparam bio toremove
++*/
+ static LUA_FUNCTION(openssl_bio_pop)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+   BIO* end = BIO_pop(bio);
+-  if (end)
++  if (end == NULL)
+   {
+     lua_pushnil(L);
+   }
+   else
+   {
+-    CRYPTO_add(&end->references, 1, CRYPTO_LOCK_BIO);
++    BIO_up_ref(end);
+     PUSH_OBJECT(end, "openssl.bio");
+   }
+   return 1;
+ }
+ 
+ /* mem */
++/***
++get mem data, only support mem bio object
++ at function get_mem
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_bio_get_mem)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -482,7 +624,13 @@ static LUA_FUNCTION(openssl_bio_get_mem)
+ }
+ 
+ /* network socket */
+-
++/***
++setup ready and accept client connect
++ at function accept
++ at tparam[opt=false] boolean setup true for setup accept bio, false or none will accept client connect
++ at treturn[1] boolean result only when setup is true
++ at treturn[2] bio accpeted bio object
++*/
+ static LUA_FUNCTION(openssl_bio_accept)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -498,7 +646,7 @@ static LUA_FUNCTION(openssl_bio_accept)
+       openssl_newvalue(L, nb);
+ 
+       lua_pushboolean(L, 1);
+-      openssl_setvalue(L, nb, "free_all");
++      openssl_valueset(L, nb, "free_all");
+       return 1;
+     }
+     else
+@@ -510,6 +658,10 @@ static LUA_FUNCTION(openssl_bio_accept)
+   return 0;
+ }
+ 
++/***
++shutdown SSL or TCP connection
++ at function shutdown
++*/
+ static LUA_FUNCTION(openssl_bio_shutdown)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -520,14 +672,18 @@ static LUA_FUNCTION(openssl_bio_shutdown
+   }
+   else if (BIO_method_type(bio) & (BIO_TYPE_SOCKET | BIO_TYPE_FD))
+   {
+-    BIO_shutdown_wr(bio);;
++    (void)BIO_shutdown_wr(bio);;
+   }
+   else
+     luaL_error(L, "don't know how to shutdown");
+   return 0;
+ }
+ 
+-
++/***
++get ssl object assosited with bio object
++ at function get_ssl
++ at treturn ssl
++*/
+ static LUA_FUNCTION(openssl_bio_get_ssl)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -543,6 +699,11 @@ static LUA_FUNCTION(openssl_bio_get_ssl)
+   return 0;
+ }
+ 
++/***
++do TCP or SSL connect
++ at function connect
++ at treturn booolean result true for success and others for fail
++*/
+ static LUA_FUNCTION(openssl_bio_connect)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -550,6 +711,11 @@ static LUA_FUNCTION(openssl_bio_connect)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++do handshake of TCP or SSL connection
++ at function handshake
++ at treturn boolean result true for success, and others for fail
++*/
+ static LUA_FUNCTION(openssl_bio_handshake)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -557,6 +723,17 @@ static LUA_FUNCTION(openssl_bio_handshak
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get fd of bio object
++ at function fd
++ at treturn number
++*/
++/***
++set fd of bio object
++ at function fd
++ at tparam number fd
++ at treturn number fd
++*/
+ static LUA_FUNCTION(openssl_bio_fd)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -584,71 +761,68 @@ void BIO_info_callback(BIO *bio, int cmd
+   BIO *b;
+   char buf[256];
+   char *p;
+-  long r = 1;
+   size_t p_maxlen;
+   (void) argl;
+   (void) argp;
+-  if (BIO_CB_RETURN & cmd)
+-    r = ret;
+ 
+-  BIO_snprintf(buf, sizeof buf, "BIO[%08lX]:", (unsigned long)bio);
++  snprintf(buf, sizeof buf, "BIO[%p]:", bio);
+   p = &(buf[14]);
+   p_maxlen = sizeof buf - 14;
+   switch (cmd)
+   {
+   case BIO_CB_FREE:
+-    BIO_snprintf(p, p_maxlen, "Free - %s\n", bio->method->name);
++    snprintf(p, p_maxlen, "Free - %s\n", BIO_method_name(bio));
+     break;
+   case BIO_CB_READ:
+-    if (bio->method->type & BIO_TYPE_DESCRIPTOR)
+-      BIO_snprintf(p, p_maxlen, "read(%d,%lu) - %s fd=%d\n",
+-                   bio->num, (unsigned long)argi,
+-                   bio->method->name, bio->num);
++    if (BIO_method_type(bio) & BIO_TYPE_DESCRIPTOR)
++      snprintf(p, p_maxlen, "read(%lu,%lu) - %s fd=%lu\n",
++               BIO_number_read(bio), (unsigned long)argi,
++               BIO_method_name(bio), BIO_number_read(bio));
+     else
+-      BIO_snprintf(p, p_maxlen, "read(%d,%lu) - %s\n",
+-                   bio->num, (unsigned long)argi,
+-                   bio->method->name);
++      snprintf(p, p_maxlen, "read(%lu,%lu) - %s\n",
++               BIO_number_read(bio), (unsigned long)argi,
++               BIO_method_name(bio));
+     break;
+   case BIO_CB_WRITE:
+-    if (bio->method->type & BIO_TYPE_DESCRIPTOR)
+-      BIO_snprintf(p, p_maxlen, "write(%d,%lu) - %s fd=%d\n",
+-                   bio->num, (unsigned long)argi,
+-                   bio->method->name, bio->num);
++    if (BIO_method_type(bio) & BIO_TYPE_DESCRIPTOR)
++      snprintf(p, p_maxlen, "write(%lu,%lu) - %s fd=%lu\n",
++               BIO_number_written(bio), (unsigned long)argi,
++               BIO_method_name(bio), BIO_number_written(bio));
+     else
+-      BIO_snprintf(p, p_maxlen, "write(%d,%lu) - %s\n",
+-                   bio->num, (unsigned long)argi,
+-                   bio->method->name);
++      snprintf(p, p_maxlen, "write(%lu,%lu) - %s\n",
++               BIO_number_written(bio), (unsigned long)argi,
++               BIO_method_name(bio));
+     break;
+   case BIO_CB_PUTS:
+-    BIO_snprintf(p, p_maxlen, "puts() - %s\n", bio->method->name);
++    snprintf(p, p_maxlen, "puts() - %s\n", BIO_method_name(bio));
+     break;
+   case BIO_CB_GETS:
+-    BIO_snprintf(p, p_maxlen, "gets(%lu) - %s\n", (unsigned long)argi, bio->method->name);
++    snprintf(p, p_maxlen, "gets(%lu) - %s\n", (unsigned long)argi, BIO_method_name(bio));
+     break;
+   case BIO_CB_CTRL:
+-    BIO_snprintf(p, p_maxlen, "ctrl(%lu) - %s\n", (unsigned long)argi, bio->method->name);
++    snprintf(p, p_maxlen, "ctrl(%lu) - %s\n", (unsigned long)argi, BIO_method_name(bio));
+     break;
+   case BIO_CB_RETURN|BIO_CB_READ:
+-    BIO_snprintf(p, p_maxlen, "read return %ld\n", ret);
++    snprintf(p, p_maxlen, "read return %ld\n", ret);
+     break;
+   case BIO_CB_RETURN|BIO_CB_WRITE:
+-    BIO_snprintf(p, p_maxlen, "write return %ld\n", ret);
++    snprintf(p, p_maxlen, "write return %ld\n", ret);
+     break;
+   case BIO_CB_RETURN|BIO_CB_GETS:
+-    BIO_snprintf(p, p_maxlen, "gets return %ld\n", ret);
++    snprintf(p, p_maxlen, "gets return %ld\n", ret);
+     break;
+   case BIO_CB_RETURN|BIO_CB_PUTS:
+-    BIO_snprintf(p, p_maxlen, "puts return %ld\n", ret);
++    snprintf(p, p_maxlen, "puts return %ld\n", ret);
+     break;
+   case BIO_CB_RETURN|BIO_CB_CTRL:
+-    BIO_snprintf(p, p_maxlen, "ctrl return %ld\n", ret);
++    snprintf(p, p_maxlen, "ctrl return %ld\n", ret);
+     break;
+   default:
+-    BIO_snprintf(p, p_maxlen, "bio callback - unknown type (%d)\n", cmd);
++    snprintf(p, p_maxlen, "bio callback - unknown type (%d)\n", cmd);
+     break;
+   }
+ 
+-  b = (BIO *)bio->cb_arg;
++  b = (BIO *)BIO_get_callback_arg(bio);
+   if (b != NULL)
+     BIO_write(b, buf, strlen(buf));
+ #if !defined(OPENSSL_NO_STDIO) && !defined(OPENSSL_SYS_WIN16)
+@@ -657,6 +831,12 @@ void BIO_info_callback(BIO *bio, int cmd
+ #endif
+ }
+ 
++/***
++set callback function of bio information
++ at function set_callback
++ at tparam function callback
++ at treturn boolean result true for success, and others for fail
++*/
+ static LUA_FUNCTION(openssl_bio_set_callback)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -668,6 +848,11 @@ static LUA_FUNCTION(openssl_bio_set_call
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++return pending length of bytes to read and write
++ at function pending
++ at treturn number pending of read, followed by pending of write
++*/
+ static LUA_FUNCTION(openssl_bio_pending)
+ {
+   BIO* bio = CHECK_OBJECT(1, BIO, "openssl.bio");
+@@ -679,6 +864,16 @@ static LUA_FUNCTION(openssl_bio_pending)
+   return 2;
+ }
+ 
++/***
++free a chain
++ at function free_all
++*/
++
++/***
++close bio
++ at function close
++*/
++
+ static luaL_Reg bio_funs[] =
+ {
+   /* generate operation */
+@@ -746,4 +941,3 @@ int luaopen_bio(lua_State *L)
+ 
+   return 1;
+ }
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/callback.c luvi-src-v2.7.6/deps/lua-openssl/src/callback.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/callback.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/callback.c	2019-02-13 11:53:24.275126573 +0100
+@@ -13,17 +13,17 @@ static int verify_cb(int preverify_ok, X
+ {
+   int err = X509_STORE_CTX_get_error(xctx);
+   int depth = X509_STORE_CTX_get_error_depth(xctx);
+-  X509 *current = xctx->current_cert;
++  X509 *current = X509_STORE_CTX_get_current_cert(xctx);
+ 
+   if (L)
+   {
+     /* get verify_cert state */
+-    openssl_getvalue(L, ssl, "verify_cert");
++    openssl_valueget(L, ssl, "verify_cert");
+     if (lua_isnil(L, -1))
+     {
+       lua_newtable(L);
+-      openssl_setvalue(L, ssl, "verify_cert");
+-      openssl_getvalue(L, ssl, "verify_cert");
++      openssl_valueset(L, ssl, "verify_cert");
++      openssl_valueget(L, ssl, "verify_cert");
+     }
+ 
+     /* create current verify state table */
+@@ -42,11 +42,11 @@ static int verify_cb(int preverify_ok, X
+     if (current)
+     {
+       PUSH_OBJECT(current, "openssl.x509");
+-      CRYPTO_add(&current->references, 1, CRYPTO_LOCK_X509);
++      X509_up_ref(current);
+       lua_setfield(L, -2, "current_cert");
+     }
+ 
+-    openssl_getvalue(L, ctx, preverify_ok == -1 ? "cert_verify_cb" : "verify_cb");
++    openssl_valueget(L, ctx, preverify_ok == -1 ? "cert_verify_cb" : "verify_cb");
+     if (lua_isfunction(L, -1))
+     {
+       /* this is set by  SSL_CTX_set_verify */
+@@ -62,7 +62,7 @@ static int verify_cb(int preverify_ok, X
+     else
+     {
+       int always_continue, verify_depth;
+-      openssl_getvalue(L, ctx, "verify_cb_flags");
++      openssl_valueget(L, ctx, "verify_cb_flags");
+       /*
+       int verify_depth;
+       int always_continue;
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/cipher.c luvi-src-v2.7.6/deps/lua-openssl/src/cipher.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/cipher.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/cipher.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,10 +1,10 @@
+-/*=========================================================================*\
+-* cipher.c
+-* cipher module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++cipher module for lua-openssl binding
+ 
++ at module cipher
++ at usage
++  cipher = require('openssl').cipher
++*/
+ #include "openssl.h"
+ #include "private.h"
+ 
+@@ -12,6 +12,13 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++list all support cipher algs
++
++ at function list
++ at tparam[opt] boolean alias include alias names for cipher alg, default true
++ at treturn[table] all cipher methods
++*/
+ static LUA_FUNCTION(openssl_cipher_list)
+ {
+   int alias = lua_isnoneornil(L, 1) ? 1 : lua_toboolean(L, 1);
+@@ -20,6 +27,15 @@ static LUA_FUNCTION(openssl_cipher_list)
+   return 1;
+ }
+ 
++/***
++get evp_cipher object
++
++ at function get
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at treturn evp_cipher cipher object mapping EVP_MD in openssl
++
++ at see evp_cipher
++*/
+ static LUA_FUNCTION(openssl_cipher_get)
+ {
+   if (!lua_isuserdata(L, 1))
+@@ -33,12 +49,24 @@ static LUA_FUNCTION(openssl_cipher_get)
+   }
+   else
+   {
+-    luaL_argcheck(L, auxiliar_isclass(L, "openssl.evp_cipher", 1), 1, "only accept openssl.evp_cipher object");
++    luaL_argcheck(L, auxiliar_getclassudata(L, "openssl.evp_cipher", 1), 1, "only accept openssl.evp_cipher object");
+     lua_pushvalue(L, 1);
+   }
+   return 1;
+ }
+ 
++/***
++quick encrypt
++
++ at function encrypt
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string input data to encrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result encrypt data
++*/
+ static LUA_FUNCTION(openssl_evp_encrypt)
+ {
+   const EVP_CIPHER* cipher = NULL;
+@@ -116,6 +144,18 @@ static LUA_FUNCTION(openssl_evp_encrypt)
+   return 0;
+ }
+ 
++/***
++quick decrypt
++
++ at function decrypt
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string input data to decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result decrypt data
++*/
+ static LUA_FUNCTION(openssl_evp_decrypt)
+ {
+   const EVP_CIPHER* cipher;
+@@ -193,6 +233,19 @@ static LUA_FUNCTION(openssl_evp_decrypt)
+   return 0;
+ }
+ 
++/***
++quick encrypt or decrypt
++
++ at function cipher
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam boolean encrypt true for encrypt,false for decrypt
++ at tparam string input data to encrypt or decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result
++*/
+ static LUA_FUNCTION(openssl_evp_cipher)
+ {
+   const EVP_CIPHER* cipher = NULL;
+@@ -285,6 +338,21 @@ typedef enum
+   DO_DECRYPT = 1
+ } CIPHER_MODE;
+ 
++/***
++get evp_cipher_ctx object for encrypt or decrypt
++
++ at function new
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam boolean encrypt true for encrypt,false for decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
++
++ at see evp_cipher_ctx
++*/
++
+ static LUA_FUNCTION(openssl_cipher_new)
+ {
+   const EVP_CIPHER* cipher = get_cipher(L, 1, NULL);
+@@ -328,6 +396,20 @@ static LUA_FUNCTION(openssl_cipher_new)
+   return 1;
+ }
+ 
++/***
++get evp_cipher_ctx object for encrypt
++
++ at function encrypt_new
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
++
++ at see evp_cipher_ctx
++*/
++
+ static LUA_FUNCTION(openssl_cipher_encrypt_new)
+ {
+   const EVP_CIPHER* cipher  = get_cipher(L, 1, NULL);
+@@ -370,6 +452,20 @@ static LUA_FUNCTION(openssl_cipher_encry
+   return 1;
+ }
+ 
++/***
++get evp_cipher_ctx object for decrypt
++
++ at function decrypt_new
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx cipher object mapping EVP_CIPHER_CTX in openssl
++
++ at see evp_cipher_ctx
++*/
++
+ static LUA_FUNCTION(openssl_cipher_decrypt_new)
+ {
+   const EVP_CIPHER* cipher = get_cipher(L, 1, NULL);
+@@ -424,7 +520,16 @@ static LUA_FUNCTION(openssl_cipher_decry
+   return 0;
+ }
+ 
+-/* evp_cipher method */
++/***
++openssl.evp_cipher object
++ at type evp_cipher
++*/
++/***
++get infomation of evp_cipher object
++
++ at function info
++ at treturn table info keys include name,block_size,key_length,iv_length,flags,mode
++*/
+ static LUA_FUNCTION(openssl_cipher_info)
+ {
+   EVP_CIPHER *cipher = CHECK_OBJECT(1, EVP_CIPHER, "openssl.evp_cipher");
+@@ -438,14 +543,23 @@ static LUA_FUNCTION(openssl_cipher_info)
+   return 1;
+ }
+ 
++/***
++derive key
+ 
++ at function BytesToKey
++ at tparam string data derive data
++ at tparam string[opt] string salt salt will get strong security
++ at tparam ev_digest|string md digest method used to diver key, default with 'sha1'
++ at treturn string key
++ at treturn string iv
++*/
+ static LUA_FUNCTION(openssl_evp_BytesToKey)
+ {
+   EVP_CIPHER* c = CHECK_OBJECT(1, EVP_CIPHER, "openssl.evp_cipher");
+   size_t lsalt, lk;
+   const char* k = luaL_checklstring(L, 2, &lk);
+   const char* salt = luaL_optlstring(L, 3, NULL, &lsalt);
+-  const EVP_MD* m = lua_isnoneornil(L, 4) ? EVP_get_digestbyname("sha1") : get_digest(L, 4);
++  const EVP_MD* m = get_digest(L, 4, "sha256");
+   char key[EVP_MAX_KEY_LENGTH], iv[EVP_MAX_IV_LENGTH];
+   int ret;
+   if (salt != NULL && lsalt < PKCS5_SALT_LEN)
+@@ -457,15 +571,102 @@ static LUA_FUNCTION(openssl_evp_BytesToK
+   ret = EVP_BytesToKey(c, m, (unsigned char*)salt, (unsigned char*)k, lk, 1, (unsigned char*)key, (unsigned char*)iv);
+   if (ret > 1)
+   {
+-    lua_pushlstring(L, key, c->key_len);
+-    lua_pushlstring(L, iv, c->iv_len);
++    lua_pushlstring(L, key, EVP_CIPHER_key_length(c));
++    lua_pushlstring(L, iv, EVP_CIPHER_iv_length(c));
+     return 2;
+   }
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get evp_cipher_ctx to encrypt or decrypt
++
++ at function new
++ at tparam boolean encrypt true for encrypt,false for decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx evp_cipher_ctx object
++
++ at see evp_cipher_ctx
++*/
++
++/***
++get evp_cipher_ctx to encrypt
++
++ at function encrypt_new
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx evp_cipher_ctx object
++
++ at see evp_cipher_ctx
++*/
++
++/***
++get evp_cipher_ctx to decrypt
++
++ at function decrypt_new
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn evp_cipher_ctx evp_cipher_ctx object
++
++ at see evp_cipher_ctx
++*/
++
++/***
++do encrypt or decrypt
++
++ at function cipher
++ at tparam boolean encrypt true for encrypt,false for decrypt
++ at tparam string input data to encrypt or decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result
++*/
++
++/***
++do encrypt
++
++ at function encrypt
++ at tparam string input data to encrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result
++*/
++
++/***
++do decrypt
++
++ at function decrypt
++ at tparam string input data to decrypt
++ at tparam string key secret key
++ at tparam[opt] string iv
++ at tparam[opt] boolean pad true for padding default
++ at tparam[opt] engine engine custom crypto engine
++ at treturn string result
++*/
+ 
+ /* evp_cipher_ctx method */
++/***
++openssl.evp_cipher_ctx object
++ at type evp_cipher_ctx
++*/
++/***
++feed data to do cipher
++
++ at function update
++ at tparam string msg data
++ at treturn string result parture result
++*/
+ static LUA_FUNCTION(openssl_evp_cipher_update)
+ {
+   EVP_CIPHER_CTX* c = CHECK_OBJECT(1, EVP_CIPHER_CTX, "openssl.evp_cipher_ctx");
+@@ -498,6 +699,12 @@ static LUA_FUNCTION(openssl_evp_cipher_u
+   return (ret == 1 ? ret : openssl_pushresult(L, ret));
+ }
+ 
++/***
++get result of cipher
++
++ at function final
++ at treturn string result last result
++*/
+ static LUA_FUNCTION(openssl_evp_cipher_final)
+ {
+   EVP_CIPHER_CTX* c = CHECK_OBJECT(1, EVP_CIPHER_CTX, "openssl.evp_cipher_ctx");
+@@ -527,6 +734,12 @@ static LUA_FUNCTION(openssl_evp_cipher_f
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get infomation of evp_cipher_ctx object
++
++ at function info
++ at treturn table info keys include block_size,key_length,iv_length,flags,mode,nid,type, evp_cipher
++*/
+ static LUA_FUNCTION(openssl_cipher_ctx_info)
+ {
+   EVP_CIPHER_CTX *ctx = CHECK_OBJECT(1, EVP_CIPHER_CTX, "openssl.evp_cipher_ctx");
+@@ -546,10 +759,13 @@ static LUA_FUNCTION(openssl_cipher_ctx_i
+ static LUA_FUNCTION(openssl_cipher_ctx_free)
+ {
+   EVP_CIPHER_CTX *ctx = CHECK_OBJECT(1, EVP_CIPHER_CTX, "openssl.evp_cipher_ctx");
++  if(!ctx)
++    return 0;
+   lua_pushnil(L);
+   lua_rawsetp(L, LUA_REGISTRYINDEX, ctx);
+   EVP_CIPHER_CTX_cleanup(ctx);
+   EVP_CIPHER_CTX_free(ctx);
++  FREE_OBJECT(1);
+   return 0;
+ }
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/cms.c luvi-src-v2.7.6/deps/lua-openssl/src/cms.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/cms.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/cms.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,10 +1,32 @@
+-/*=========================================================================*\
+-* hamc.c
+-* hamc module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++cms module for lua-openssl binding
+ 
++The Cryptographic Message Syntax (CMS) is the IETF's standard for
++cryptographically protected messages. It can be used to digitally sign, digest,
++authenticate or encrypt any form of digital data. CMS is based on the syntax of
++PKCS#7, which in turn is based on the Privacy-Enhanced Mail standard. The
++newest version of CMS is specified in RFC 5652.
++
++The architecture of CMS is built around certificate-based key management, such
++as the profile defined by the PKIX working group. CMS is used as the key
++cryptographic component of many other cryptographic standards, such as S/MIME,
++PKCS #12 and the RFC 3161 Digital timestamping protocol.
++
++OpenSSL is open source software that can encrypt, decrypt, sign and verify,
++compress and uncompress CMS documents.
++
++
++CMS are based on apps/cms.c from the OpenSSL dist, so for more information,
++you better see the documentation for OpenSSL.
++cms api need flags, not support "detached", "nodetached", "text", "nointern",
++"noverify", "nochain", "nocerts", "noattr", "binary", "nosigs"
++
++OpenSSL not give full document about CMS api, so some function will be dangers.
++
++ at module cms
++ at usage
++  cms = require('openssl').cms
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #if OPENSSL_VERSION_NUMBER > 0x00909000L && !defined (LIBRESSL_VERSION_NUMBER)
+@@ -14,35 +36,47 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-static LuaL_Enum cms_flags[] =
++static LuaL_Enumeration cms_flags[] =
+ {
+-  {"text",    0x1},
+-  {"nocerts",   0x2},
+-  {"no_content_verify", 0x04},
+-  {"no_attr_verify",    0x8},
+-  {"nosigs",        (CMS_NO_CONTENT_VERIFY | CMS_NO_ATTR_VERIFY)},
+-  {"nointern",    0x10},
++  {"text",                  0x1},
++  {"nocerts",               0x2},
++  {"no_content_verify",     0x04},
++  {"no_attr_verify",        0x8},
++  {"nosigs",                (CMS_NO_CONTENT_VERIFY | CMS_NO_ATTR_VERIFY)},
++  {"nointern",              0x10},
+   {"no_signer_cert_verify", 0x20},
+-  {"noverify",    0x20},
+-  {"detached",    0x40},
+-  {"binary",      0x80},
+-  {"noattr",      0x100},
+-  {"nosmimecap",    0x200},
+-  {"nooldmimetype", 0x400},
+-  {"crlfeol",     0x800},
+-  {"stream",      0x1000},
+-  {"nocrl",     0x2000},
+-  {"partial",     0x4000},
+-  {"reuse_digest",  0x8000},
+-  {"use_keyid",   0x10000},
+-  {"debug_decrypt", 0x20000},
+-  {NULL,        -1}
++  {"noverify",              0x20},
++  {"detached",              0x40},
++  {"binary",                0x80},
++  {"noattr",                0x100},
++  {"nosmimecap",            0x200},
++  {"nooldmimetype",         0x400},
++  {"crlfeol",               0x800},
++  {"stream",                0x1000},
++  {"nocrl",                 0x2000},
++  {"partial",               0x4000},
++  {"reuse_digest",          0x8000},
++  {"use_keyid",             0x10000},
++  {"debug_decrypt",         0x20000},
++  {NULL,                    -1}
+ };
+ 
++/***
++read cms object from input bio or string
++
++ at function read
++ at tparam bio|string input
++ at tparam[opt='auto'] string format, support 'auto','smime','der','pem'
++  auto will only try 'der' or 'pem'
++ at tparam[opt=nil] bio content, only used when format is 'smime'
++ at treturn cms
++*/
+ static int openssl_cms_read(lua_State *L)
+ {
+   BIO* in = load_bio_object(L, 1);
+   int fmt = luaL_checkoption(L, 2, "auto", format);
++  BIO* data = NULL;
++
+   CMS_ContentInfo *cms = NULL;
+   if (fmt == FORMAT_AUTO)
+   {
+@@ -60,27 +94,38 @@ static int openssl_cms_read(lua_State *L
+   }
+   else if (fmt == FORMAT_SMIME)
+   {
+-    BIO *indata = load_bio_object(L, 3);
+-    cms = SMIME_read_CMS(in, &indata);
++    cms = SMIME_read_CMS(in, &data);
+   }
+ 
+   if (cms)
+   {
+     PUSH_OBJECT(cms, "openssl.cms");
+-    return 1;
++    if(data!=NULL)
++      PUSH_OBJECT(data, "openssl.bn");
++    return data!=NULL? 2 : 1;
+   }
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++write cms object to bio object
+ 
++ at function export
++ at tparam cms cms
++ at tparam[opt] bio data
++ at tparam[opt=0] number flags
++ at tparam[opt='smime'] string format
++ at treturn string
++ at return nil, and followed by error message
++*/
+ static int openssl_cms_write(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+-  BIO *out = load_bio_object(L, 2);
+-  BIO *in = load_bio_object(L, 3);
+-  int flags = luaL_optint(L, 4, 0);
+-  int fmt = luaL_checkoption(L, 5, "smime", format);
++  BIO *in = lua_isnoneornil(L, 2) ? NULL : load_bio_object(L, 2);
++  int flags = luaL_optint(L, 3, 0);
++  int fmt = luaL_checkoption(L, 4, "smime", format);
+   int ret = 0;
++  BIO *out = BIO_new(BIO_s_mem());
+ 
+   if (fmt == FORMAT_SMIME)
+     ret = SMIME_write_CMS(out, cms, in, flags);
+@@ -89,13 +134,45 @@ static int openssl_cms_write(lua_State *
+   else if (fmt == FORMAT_DER)
+   {
+     ret = i2d_CMS_bio_stream(out, cms, in, flags);
+-    //i2d_CMS_bio
+   }
+   else
+     luaL_argerror(L, 5, "only accept smime, pem or der");
++  if (ret==1)
++  {
++    BUF_MEM *mem;
++    BIO_get_mem_ptr(out, &mem);
++    lua_pushlstring(L, mem->data, mem->length);
++  }
++  if(in!=NULL)
++    BIO_free(in);
++  if(out!=NULL)
++    BIO_free(out);
++  if(ret==1)
++    return 1;
+   return openssl_pushresult(L, ret);
+ }
+-
++/***
++create empty cms object
++ at function create
++ at treturn cms
++*/
++
++/***
++create cms object from string or bio object
++ at function create
++ at tparam bio input
++ at tparam[opt=0] number flags
++ at treturn cms
++*/
++
++/***
++create digest cms object
++ at function create
++ at tparam bio input
++ at tparam evp_digest|string md_alg
++ at tparam[opt=0] number flags
++ at treturn cms
++*/
+ static int openssl_cms_create(lua_State*L)
+ {
+   CMS_ContentInfo *cms = NULL;
+@@ -109,7 +186,7 @@ static int openssl_cms_create(lua_State*
+     BIO* in = load_bio_object(L, 1);
+     if (lua_isuserdata(L, 2))
+     {
+-      const EVP_MD* md = get_digest(L, 2);
++      const EVP_MD* md = get_digest(L, 2, NULL);
+       int flags = luaL_optint(L, 3, 0);
+       cms = CMS_digest_create(in, md, flags);
+     }
+@@ -124,7 +201,14 @@ static int openssl_cms_create(lua_State*
+   return 1;
+ }
+ 
+-
++/***
++create compress cms object
++ at function compress
++ at tparam bio input
++ at tparam string alg, zlib or rle
++ at tparam[opt=0] number flags
++ at treturn cms
++*/
+ static int openssl_cms_compress(lua_State *L)
+ {
+   BIO* in = load_bio_object(L, 1);
+@@ -150,6 +234,15 @@ static int openssl_cms_compress(lua_Stat
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++uncompress cms object
++ at function uncompress
++ at tparam cms cms
++ at tparam bio input
++ at tparam bio out
++ at tparam[opt=0] number flags
++ at treturn boolean
++*/
+ static int openssl_cms_uncompress(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+@@ -161,15 +254,26 @@ static int openssl_cms_uncompress(lua_St
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++make signed cms object
++
++ at function sign
++ at tparam x509 signer cert
++ at tparam evp_pkey pkey
++ at tparam bio input_data
++ at tparam[opt] stack_of_x509 certs include in the CMS
++ at tparam[opt=0] number flags
++ at treturn cms object
++*/
+ static int openssl_cms_sign(lua_State *L)
+ {
+   X509* signcert = CHECK_OBJECT(1, X509, "openssl.x509");
+   EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  STACK_OF(X509)* certs = openssl_sk_x509_fromtable(L, 3);
+-  BIO* data = load_bio_object(L, 4);
++  BIO* data = load_bio_object(L, 3);
++  STACK_OF(X509)* certs = openssl_sk_x509_fromtable(L, 4);
+   unsigned int flags = luaL_optint(L, 5, 0);
+   CMS_ContentInfo *cms;
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
++
+   cms = CMS_sign(signcert, pkey, certs, data, flags);
+   if (cms)
+   {
+@@ -179,59 +283,62 @@ static int openssl_cms_sign(lua_State *L
+   return openssl_pushresult(L, 0);
+ }
+ 
++
++/***
++verfiy signed cms object
++ at function verify
++ at tparam cms signed
++ at tparam stack_of_x509 signers
++ at tparam[opt] x509_store store trust certificates store
++ at tparam[opt] bio message
++ at tparam[opt=0] number flags
++ at treturn string content
++ at return nil, and followed by error message
++*/
+ static int openssl_cms_verify(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+-  static const char* verify_mode[] =
+-  {
+-    "verify",  /* 0 */
+-    "digest",  /* 1 */
+-    "receipt",   /* 2 */
+-    NULL
+-  };
+-  int mode = luaL_checkoption(L, 2, NULL, verify_mode);
+-  if (mode == 1)
+-  {
+-    BIO* in = load_bio_object(L, 3);
+-    BIO* out = load_bio_object(L, 4);
+-    unsigned int flags = luaL_optint(L, 5, 0);
+-
+-    int ret = CMS_digest_verify(cms, in, out, flags);
+-    return openssl_pushresult(L, ret);
+-  }
+-  if (mode == 2)
+-  {
+-    CMS_ContentInfo *src = CHECK_OBJECT(3, CMS_ContentInfo, "openssl.cms");
+-    STACK_OF(X509) *other = openssl_sk_x509_fromtable(L, 4);
+-    X509_STORE* store = CHECK_OBJECT(5, X509_STORE, "openssl.x509_store");
+-    unsigned int flags = luaL_optint(L, 6, 0);
+-    int ret = CMS_verify_receipt(cms, src, other, store, flags);
+-    return openssl_pushresult(L, ret);
+-  }
+-  if (mode == 0)
+-  {
+-    STACK_OF(X509) *other = openssl_sk_x509_fromtable(L, 3);
+-    X509_STORE* store = CHECK_OBJECT(4, X509_STORE, "openssl.x509_store");
+-    BIO* in = load_bio_object(L, 5);
+-    BIO* out = load_bio_object(L, 6);
+-    unsigned int flags = luaL_optint(L, 7, 0);
+-    int ret = CMS_verify(cms, other, store, in, out, flags);
+-    return openssl_pushresult(L, ret);
+-  }
+-
+-  return 0;
+-}
+-
+-
++  STACK_OF(X509)* signers = openssl_sk_x509_fromtable(L, 2);
++  X509_STORE* trust = CHECK_OBJECT(3, X509_STORE, "openssl.x509_store");
++  BIO* in = lua_isnoneornil(L, 4) ? NULL : load_bio_object(L, 4);
++  unsigned int flags = luaL_optint(L, 5, 0);
++  BIO* out = BIO_new(BIO_s_mem());
++  int ret = CMS_verify(cms, signers, trust, in, out, flags);
++  if (ret==1)
++  {
++    BUF_MEM *mem;
++    BIO_get_mem_ptr(out, &mem);
++    lua_pushlstring(L, mem->data, mem->length);
++  }
++  if (in!=NULL)
++    BIO_free(in);
++  if (out!=NULL)
++    BIO_free(out);
++  if (ret !=1)
++    ret = openssl_pushresult(L, ret);
++  return ret;
++}
++
++/***
++create enryptdata cms
++ at function EncryptedData_encrypt
++ at tparam bio|string input
++ at tparam strig key
++ at tparam[opt='des-ede3-cbc'] string|evp_cipher cipher_alg
++ at tparam[opt=0] number flags
++ at treturn cms object
++ at return nil, followed by error message
++*/
+ static int openssl_cms_EncryptedData_encrypt(lua_State*L)
+ {
+   BIO* in = load_bio_object(L, 1);
+-  const EVP_CIPHER* ciphers = get_cipher(L, 2, NULL);
+   size_t klen;
+-  const char* key = luaL_checklstring(L, 3, &klen);
++  const char* key = luaL_checklstring(L, 2, &klen);
++  const EVP_CIPHER* ciphers = get_cipher(L, 3, "des-ede3-cbc");
+   unsigned int flags = luaL_optint(L, 4, 0);
+ 
+   CMS_ContentInfo *cms = CMS_EncryptedData_encrypt(in, ciphers, (const unsigned char*) key, klen, flags);
++  BIO_free(in);
+   if (cms)
+   {
+     PUSH_OBJECT(cms, "openssl.cms");
+@@ -240,18 +347,92 @@ static int openssl_cms_EncryptedData_enc
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++decrypt encryptdata cms
++ at function EncryptedData_decrypt
++ at tparam cms encrypted
++ at tparam string key
++ at tparam[opt] bio dcont
++ at tparam[opt=0] number flags
++ at treturn boolean result
++*/
+ static int openssl_cms_EncryptedData_decrypt(lua_State*L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+   size_t klen;
+   const char* key = luaL_checklstring(L, 2, &klen);
+-  BIO* dcont = load_bio_object(L, 3);
+-  BIO* out = load_bio_object(L, 4);
+-  unsigned int flags = luaL_optint(L, 5, 0);
++  BIO* dcont = lua_isnoneornil(L, 3) ? NULL : load_bio_object(L, 3);
++  unsigned int flags = luaL_optint(L, 4, 0);
++  BIO *out = BIO_new(BIO_s_mem());
+ 
+   int ret = CMS_EncryptedData_decrypt(cms, (const unsigned char*)key, klen, dcont, out, flags);
++  if(ret==1)
++  {
++    BUF_MEM *mem;
++    BIO_get_mem_ptr(out, &mem);
++    lua_pushlstring(L, mem->data, mem->length);
++  }
++  if(dcont!=NULL)
++    BIO_free(dcont);
++  BIO_free(out);
++  if(ret!=1)
++    ret = openssl_pushresult(L, ret);
++  return ret;
++}
++
++/***
++create digest cms
++ at function digest_create
++ at tparam bio|string input
++ at tparam[opt='sha256'] string|evp_md digest_alg
++ at tparam[opt=0] number flags
++ at treturn cms object
++ at return nil, followed by error message
++*/
++static int openssl_cms_digest_create(lua_State*L)
++{
++  BIO* in = load_bio_object(L, 1);
++  const EVP_MD* md = get_digest(L, 2, "sha256");
++  unsigned int flags = luaL_optint(L, 3, 0);
+ 
+-  return openssl_pushresult(L, ret);
++  CMS_ContentInfo *cms = CMS_digest_create(in, md, flags);
++  BIO_free(in);
++  if (cms)
++  {
++    PUSH_OBJECT(cms, "openssl.cms");
++    return 1;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++/***
++verify digest cms
++ at function digest_verify
++ at tparam cms digested
++ at tparam[opt] string|bio dcont
++ at tparam[opt=0] number flags
++ at treturn boolean result
++*/
++static int openssl_cms_digest_verify(lua_State*L)
++{
++  CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
++  BIO *dcont = lua_isnoneornil(L, 2) ? NULL : load_bio_object(L, 2);
++  unsigned int flags = luaL_optint(L, 3, 0);
++  BIO *out = BIO_new(BIO_s_mem());
++
++  int ret = CMS_digest_verify(cms, dcont, out, flags);
++  if(ret==1)
++  {
++    BUF_MEM *mem;
++    BIO_get_mem_ptr(out, &mem);
++    lua_pushlstring(L, mem->data, mem->length);
++  }
++  if(dcont!=NULL)
++    BIO_free(dcont);
++  BIO_free(out);
++  if(ret!=1)
++    ret = openssl_pushresult(L, ret);
++  return ret;
+ }
+ 
+ static char *memdup(const char *src, size_t buffer_length)
+@@ -284,19 +465,31 @@ static char *memdup(const char *src, siz
+   return buffer;
+ }
+ 
++/***
++encrypt with recipt certs
++ at function encrypt
++ at tparam stack_of_x509 recipt certs
++ at tparam bio|string input
++ at tparam[opt='des-ede3-cbc'] string|evp_cipher cipher_alg
++ at tparam[opt=0] number flags
++ at tparam[opt=nil] table options, support key, keyid, password fields,
++  and values must be string type
++ at treturn cms
++*/
+ static int openssl_cms_encrypt(lua_State *L)
+ {
+   STACK_OF(X509)* encerts = openssl_sk_x509_fromtable(L, 1);
+   BIO* in = load_bio_object(L, 2);
+-  const EVP_CIPHER* ciphers = get_cipher(L, 3, NULL);
++  const EVP_CIPHER* ciphers = get_cipher(L, 3, "des-ede3-cbc");
+   unsigned int flags = luaL_optint(L, 4, 0);
+-  int ret = 0;
+   CMS_ContentInfo *cms = CMS_encrypt(encerts, in, ciphers, flags);
+-  CMS_RecipientInfo *recipient;
++  int ret = 1;
+   if (cms)
+   {
+     if (lua_istable(L, 5))
+     {
++      CMS_RecipientInfo *recipient;
++
+       lua_getfield(L, 5, "key");
+       lua_getfield(L, 5, "keyid");
+       if (lua_isstring(L, -1) && lua_isstring(L, -2))
+@@ -358,19 +551,32 @@ static int openssl_cms_encrypt(lua_State
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++decrypt cms message
++ at function decrypt
++ at tparam cms message
++ at tparam evp_pkey pkey
++ at tparam x509 recipt
++ at tparam[opt] bio dcount output object
++ at tparam[opt=0] number flags
++ at tparam[opt=nil] table options may have key, keyid, password field,
++  and values must be string type
++ at treturn string decrypted message
++ at return nil, and followed by error message
++*/
+ static int openssl_cms_decrypt(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+   EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+   X509* x509 = CHECK_OBJECT(3, X509, "openssl.x509");
+-  BIO* dcont = load_bio_object(L, 4);
+-  BIO* out = load_bio_object(L, 5);
+-  unsigned int flags = luaL_optint(L, 6, 0);
++  BIO* dcont = lua_isnoneornil(L, 4) ? NULL : load_bio_object(L, 4);
++  unsigned int flags = luaL_optint(L, 5, 0);
+   int ret = 1;
++  BIO* out = BIO_new(BIO_s_mem());
+ 
+-  if (lua_istable(L, 7))
++  if (lua_istable(L, 6))
+   {
+-    lua_getfield(L, 7, "password");
++    lua_getfield(L, 6, "password");
+     if (lua_isstring(L, -1))
+     {
+       unsigned char*passwd = (unsigned char*)lua_tostring(L, -1);
+@@ -383,8 +589,8 @@ static int openssl_cms_decrypt(lua_State
+     lua_pop(L, 1);
+     if (ret)
+     {
+-      lua_getfield(L, 7, "key");
+-      lua_getfield(L, 7, "keyid");
++      lua_getfield(L, 6, "key");
++      lua_getfield(L, 6, "keyid");
+       if (lua_isstring(L, -1) && lua_isstring(L, -2))
+       {
+         size_t keylen, keyidlen;
+@@ -394,30 +600,32 @@ static int openssl_cms_decrypt(lua_State
+       }
+       else if (!lua_isnil(L, -1) || !lua_isnil(L, -2))
+       {
+-        luaL_argerror(L, 7, "key and keyid field must be string");
++        luaL_argerror(L, 6, "key and keyid field must be string");
+       }
+       lua_pop(L, 2);
+     }
+   }
+ 
+   if (ret)
+-  {
+     ret = CMS_decrypt_set1_pkey(cms, pkey, x509);
+-  }
+ 
+   if (ret == 1)
+     ret = CMS_decrypt(cms, NULL, NULL, dcont, out, flags);
+-  return openssl_pushresult(L, ret);
+-}
+ 
++  if (ret == 1)
++  {
++    BUF_MEM *mem;
++    BIO_get_mem_ptr(out, &mem);
++    lua_pushlstring(L, mem->data, mem->length);
++  }
+ 
+-/************************************************************************/
+-static int openssl_cms_type(lua_State *L)
+-{
+-  CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+-  const ASN1_OBJECT *obj = CMS_get0_type(cms);
+-  PUSH_OBJECT(obj, "openssl.object");
++  if (dcont!=NULL)
++    BIO_free(dcont);
++  if (out!=NULL)
++    BIO_free(out);
+ 
++  if (ret!=1)
++    return openssl_pushresult(L, ret);
+   return 1;
+ }
+ 
+@@ -430,24 +638,103 @@ static int openssl_cms_bio_new(lua_State
+   return 1;
+ }
+ 
++static const luaL_Reg R[] =
++{
++  {"read",                  openssl_cms_read},
++  {"write",                 openssl_cms_write},
++
++  {"bio_new",               openssl_cms_bio_new},
++  {"create",                openssl_cms_create},
++
++  {"sign",                  openssl_cms_sign},
++  {"verify",                openssl_cms_verify},
++  {"encrypt",               openssl_cms_encrypt},
++  {"decrypt",               openssl_cms_decrypt},
++
++  {"digest_create",         openssl_cms_digest_create},
++  {"digest_verify",         openssl_cms_digest_verify},
++  {"EncryptedData_encrypt", openssl_cms_EncryptedData_encrypt},
++  {"EncryptedData_decrypt", openssl_cms_EncryptedData_decrypt},
++  {"compress",              openssl_cms_compress},
++  {"uncompress",            openssl_cms_uncompress},
++
++  {NULL,  NULL}
++};
++
++/*****************************************************************************/
++/***
++openssl.cms object
++ at type cms
++ at warning some api undocumented, dangers!!!
++*/
++
++/***
++get type of cms object
++ at function cms
++ at treturn asn1_object type of cms
++*/
++static int openssl_cms_type(lua_State *L)
++{
++  CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
++  const ASN1_OBJECT *obj = CMS_get0_type(cms);
++  PUSH_OBJECT(obj, "openssl.asn1_object");
++
++  return 1;
++}
++
++/***
++do dataInit
++ at function datainit
++ at tparam[opt] bio|string data
++ at treturn bio cmsbio
++ at return nil for fail
++ at warning inner use
++*/
+ static int openssl_cms_datainit(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+-  BIO* icont = load_bio_object(L, 2);
+-  icont = CMS_dataInit(cms, icont);
+-  PUSH_OBJECT(icont, "openssl.bio");
++  BIO* icont = lua_isnoneornil(L, 2) ? NULL : load_bio_object(L, 2);
++  BIO* cbio = CMS_dataInit(cms, icont);
++  if(cbio!=NULL)
++    PUSH_OBJECT(icont, "openssl.bio");
++  else
++    lua_pushnil(L);
++  BIO_free(icont);
+   return 1;
+ }
+ 
++/***
++do dataFinal
++ at function datafnal
++ at tparam bio cmsbio bio returned by datainit
++ at treturn boolean true for success, other value will followed by error message
++ at warning inner use
++*/
+ static int openssl_cms_datafinal(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+   BIO* bio = load_bio_object(L, 2);
+   int ret = CMS_dataFinal(cms, bio);
+   lua_pushboolean(L, ret);
++  BIO_free(bio);
+   return 1;
+ }
+ 
++/***
++get detached state
++ at function detached
++ at treturn boolean true for detached
++ at tparam bio cmsbio bio returned by datainit
++ at treturn boolean true for success, others value will followed by error message
++ at warning inner use
++*/
++/***
++set detached state
++ at function detached
++ at tparam boolean detach
++ at treturn boolean for success, others value will followed by error message
++ at warning inner use
++*/
+ static int openssl_cms_detached(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+@@ -455,29 +742,37 @@ static int openssl_cms_detached(lua_Stat
+   if (lua_isnone(L, 2))
+   {
+     ret = CMS_is_detached(cms);
++    lua_pushboolean(L, ret);
++    return 1;
+   }
+   else
+   {
+     int detached = auxiliar_checkboolean(L, 2);
+     ret = CMS_set_detached(cms, detached);
+   }
+-  lua_pushboolean(L, ret);
+   return 1;
+ }
+ 
++/***
++get content of cms object
++ at function content
++ at treturn string content, if have no content will return nil
++ at warning inner use
++*/
+ static int openssl_cms_content(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+   ASN1_OCTET_STRING** content = CMS_get0_content(cms);
+   if (content && *content)
+   {
+-
+-    lua_pushnil(L);
+-    return 1;
++    ASN1_OCTET_STRING* s = *content;
++    lua_pushlstring(L, (const char*)ASN1_STRING_data(s), ASN1_STRING_length(s));
+   }
+-  lua_pushnil(L);
++  else
++    lua_pushnil(L);
+   return 1;
+ }
++
+ static int openssl_cms_get_signers(lua_State*L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+@@ -489,6 +784,7 @@ static int openssl_cms_get_signers(lua_S
+   }
+   return 0;
+ }
++
+ static int openssl_cms_data(lua_State *L)
+ {
+   CMS_ContentInfo *cms = CHECK_OBJECT(1, CMS_ContentInfo, "openssl.cms");
+@@ -541,47 +837,26 @@ static int openssl_cms_free(lua_State *L
+ 
+ static luaL_Reg cms_ctx_funs[] =
+ {
+-  {"type",  openssl_cms_type},
+-  {"datainit",  openssl_cms_datainit},
+-  {"datafinal", openssl_cms_datafinal},
+-  {"content", openssl_cms_content},
+-  {"data",  openssl_cms_data},
+-  {"signers", openssl_cms_get_signers},
+-
+-  {"detached",  openssl_cms_detached},
+-
+-  { "sign_receipt",  openssl_cms_sign_receipt},
+-  { "get_signers",   openssl_cms_get_signers},
+-
+-  { "bio_new",   openssl_cms_bio_new},
+-
+-  {"final", openssl_cms_final},
+-  {"__tostring",  auxiliar_tostring},
+-  {"__gc",    openssl_cms_free},
+-  {NULL, NULL}
++  {"type",          openssl_cms_type},
++  {"datainit",      openssl_cms_datainit},
++  {"datafinal",     openssl_cms_datafinal},
++  {"content",       openssl_cms_content},
++  {"data",          openssl_cms_data},
++  {"signers",       openssl_cms_get_signers},
++  {"detached",      openssl_cms_detached},
++
++  {"sign_receipt",  openssl_cms_sign_receipt},
++  {"get_signers",   openssl_cms_get_signers},
++
++  {"bio_new",       openssl_cms_bio_new},
++  {"final",         openssl_cms_final},
++
++  {"__tostring",    auxiliar_tostring},
++  {"__gc",          openssl_cms_free},
++  {NULL,            NULL}
+ };
+ 
+ /* int CMS_stream(unsigned char ***boundary, CMS_ContentInfo *cms); */
+-static const luaL_Reg R[] =
+-{
+-  { "read",  openssl_cms_read},
+-  { "write",   openssl_cms_write},
+-
+-  { "bio_new", openssl_cms_bio_new},
+-  { "create", openssl_cms_create},
+-
+-  { "sign",  openssl_cms_sign},
+-  { "verify",  openssl_cms_verify},
+-  { "encrypt",   openssl_cms_encrypt},
+-  { "decrypt",   openssl_cms_decrypt},
+-
+-  { "EncryptedData_encrypt",   openssl_cms_EncryptedData_encrypt},
+-  { "EncryptedData_decrypt",   openssl_cms_EncryptedData_decrypt},
+-  { "compress",  openssl_cms_compress},
+-  { "uncompress",  openssl_cms_uncompress},
+-
+-  {NULL,  NULL}
+-};
+ #endif
+ 
+ int luaopen_cms(lua_State *L)
+@@ -593,9 +868,11 @@ int luaopen_cms(lua_State *L)
+ 
+   lua_newtable(L);
+   luaL_setfuncs(L, R, 0);
+-  lua_pushliteral(L, "version");    /** version */
++  lua_pushliteral(L, "version");
+   lua_pushliteral(L, MYVERSION);
+   lua_settable(L, -3);
++
++  auxiliar_enumerate(L, -1, cms_flags);
+ #else
+   lua_pushnil(L);
+ #endif
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/compat.c luvi-src-v2.7.6/deps/lua-openssl/src/compat.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/compat.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/compat.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,7 +1,533 @@
+-
+ #include <lua.h>
+ #include <lualib.h>
+ #include <lauxlib.h>
+ 
++#include "openssl.h"
++#include "private.h"
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++int BIO_up_ref(BIO *b)
++{
++  CRYPTO_add(&b->references, 1, CRYPTO_LOCK_BIO);
++  return 1;
++}
++int X509_up_ref(X509 *x)
++{
++  CRYPTO_add(&x->references, 1, CRYPTO_LOCK_X509);
++  return 1;
++}
++int X509_STORE_up_ref(X509_STORE *s)
++{
++  CRYPTO_add(&s->references, 1, CRYPTO_LOCK_X509_STORE);
++  return 1;
++}
++int EVP_PKEY_up_ref(EVP_PKEY *pkey)
++{
++  CRYPTO_add(&pkey->references, 1, CRYPTO_LOCK_EVP_PKEY);
++  return 1;
++}
++
++int RSA_bits(const RSA *r)
++{
++  return (BN_num_bits(r->n));
++}
++
++void ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BIGNUM **ps)
++{
++  *pr = sig->r;
++  *ps = sig->s;
++}
++int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
++{
++  if (r == NULL || s == NULL)
++    return 0;
++  BN_free(sig->r);
++  BN_free(sig->s);
++  sig->r = r;
++  sig->s = s;
++  return 1;
++}
++void RSA_get0_key(const RSA *r,
++                  const BIGNUM **n, const BIGNUM **e, const BIGNUM **d)
++{
++  if (n != NULL)
++    *n = r->n;
++  if (e != NULL)
++    *e = r->e;
++  if (d != NULL)
++    *d = r->d;
++}
++
++void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q)
++{
++  if (p != NULL)
++    *p = r->p;
++  if (q != NULL)
++    *q = r->q;
++}
++
++void RSA_get0_crt_params(const RSA *r,
++                         const BIGNUM **dmp1, const BIGNUM **dmq1,
++                         const BIGNUM **iqmp)
++{
++  if (dmp1 != NULL)
++    *dmp1 = r->dmp1;
++  if (dmq1 != NULL)
++    *dmq1 = r->dmq1;
++  if (iqmp != NULL)
++    *iqmp = r->iqmp;
++}
++
++HMAC_CTX *HMAC_CTX_new(void)
++{
++  HMAC_CTX *ctx = OPENSSL_malloc(sizeof(HMAC_CTX));
++
++  if (ctx != NULL)
++  {
++    HMAC_CTX_init(ctx);
++  }
++  return ctx;
++}
++
++void HMAC_CTX_free(HMAC_CTX *ctx)
++{
++  if (ctx != NULL)
++  {
++    HMAC_CTX_cleanup(ctx);
++    OPENSSL_free(ctx);
++  }
++}
++
++#ifndef OPENSSL_NO_DSA
++DSA *EVP_PKEY_get0_DSA(EVP_PKEY *pkey)
++{
++  if (pkey->type != EVP_PKEY_DSA)
++  {
++    return NULL;
++  }
++  return pkey->pkey.dsa;
++}
++
++int DSA_bits(const DSA *dsa)
++{
++  return BN_num_bits(dsa->p);
++}
++
++void DSA_get0_pqg(const DSA *d,
++                  const BIGNUM **p, const BIGNUM **q, const BIGNUM **g)
++{
++  if (p != NULL)
++    *p = d->p;
++  if (q != NULL)
++    *q = d->q;
++  if (g != NULL)
++    *g = d->g;
++}
++
++int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g)
++{
++  /* If the fields p, q and g in d are NULL, the corresponding input
++  * parameters MUST be non-NULL.
++  */
++  if ((d->p == NULL && p == NULL)
++      || (d->q == NULL && q == NULL)
++      || (d->g == NULL && g == NULL))
++    return 0;
++
++  if (p != NULL)
++  {
++    BN_free(d->p);
++    d->p = p;
++  }
++  if (q != NULL)
++  {
++    BN_free(d->q);
++    d->q = q;
++  }
++  if (g != NULL)
++  {
++    BN_free(d->g);
++    d->g = g;
++  }
++
++  return 1;
++}
++
++void DSA_get0_key(const DSA *d,
++                  const BIGNUM **pub_key, const BIGNUM **priv_key)
++{
++  if (pub_key != NULL)
++    *pub_key = d->pub_key;
++  if (priv_key != NULL)
++    *priv_key = d->priv_key;
++}
++
++int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key)
++{
++  /* If the field pub_key in d is NULL, the corresponding input
++  * parameters MUST be non-NULL.  The priv_key field may
++  * be left NULL.
++  */
++  if (d->pub_key == NULL && pub_key == NULL)
++    return 0;
++
++  if (pub_key != NULL)
++  {
++    BN_free(d->pub_key);
++    d->pub_key = pub_key;
++  }
++  if (priv_key != NULL)
++  {
++    BN_free(d->priv_key);
++    d->priv_key = priv_key;
++  }
++
++  return 1;
++}
++#endif
++
++#ifndef OPENSSL_NO_EC
++
++EC_KEY *EVP_PKEY_get0_EC_KEY(EVP_PKEY *pkey)
++{
++  if (pkey->type != EVP_PKEY_EC)
++  {
++    return NULL;
++  }
++  return pkey->pkey.ec;
++}
++
++#endif
++
++#ifndef OPENSSL_NO_DH
++DH *EVP_PKEY_get0_DH(EVP_PKEY *pkey)
++{
++  if (pkey->type != EVP_PKEY_DH)
++  {
++    return NULL;
++  }
++  return pkey->pkey.dh;
++}
++
++int DH_bits(const DH *dh)
++{
++  return BN_num_bits(dh->p);
++}
++
++void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_key)
++{
++  if (pub_key != NULL)
++    *pub_key = dh->pub_key;
++  if (priv_key != NULL)
++    *priv_key = dh->priv_key;
++}
++
++int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key)
++{
++  /* If the field pub_key in dh is NULL, the corresponding input
++  * parameters MUST be non-NULL.  The priv_key field may
++  * be left NULL.
++  */
++  if (dh->pub_key == NULL && pub_key == NULL)
++    return 0;
++
++  if (pub_key != NULL)
++  {
++    BN_free(dh->pub_key);
++    dh->pub_key = pub_key;
++  }
++  if (priv_key != NULL)
++  {
++    BN_free(dh->priv_key);
++    dh->priv_key = priv_key;
++  }
++
++  return 1;
++}
++void DH_get0_pqg(const DH *dh,
++                 const BIGNUM **p, const BIGNUM **q, const BIGNUM **g)
++{
++  if (p != NULL)
++    *p = dh->p;
++  if (q != NULL)
++    *q = dh->q;
++  if (g != NULL)
++    *g = dh->g;
++}
++
++int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
++{
++  /* If the fields p and g in d are NULL, the corresponding input
++  * parameters MUST be non-NULL.  q may remain NULL.
++  */
++  if ((dh->p == NULL && p == NULL)
++      || (dh->g == NULL && g == NULL))
++    return 0;
++
++  if (p != NULL)
++  {
++    BN_free(dh->p);
++    dh->p = p;
++  }
++  if (q != NULL)
++  {
++    BN_free(dh->q);
++    dh->q = q;
++  }
++  if (g != NULL)
++  {
++    BN_free(dh->g);
++    dh->g = g;
++  }
++
++  if (q != NULL)
++  {
++    dh->length = BN_num_bits(q);
++  }
++
++  return 1;
++}
++#endif
++
++#ifndef OPENSSL_NO_RSA
++RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey)
++{
++  if (pkey->type != EVP_PKEY_RSA)
++  {
++    return NULL;
++  }
++  return pkey->pkey.rsa;
++}
++int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
++{
++  /* If the fields n and e in r are NULL, the corresponding input
++  * parameters MUST be non-NULL for n and e.  d may be
++  * left NULL (in case only the public key is used).
++  */
++  if ((r->n == NULL && n == NULL)
++      || (r->e == NULL && e == NULL))
++    return 0;
++
++  if (n != NULL)
++  {
++    BN_free(r->n);
++    r->n = n;
++  }
++  if (e != NULL)
++  {
++    BN_free(r->e);
++    r->e = e;
++  }
++  if (d != NULL)
++  {
++    BN_free(r->d);
++    r->d = d;
++  }
++
++  return 1;
++}
++
++int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q)
++{
++  /* If the fields p and q in r are NULL, the corresponding input
++  * parameters MUST be non-NULL.
++  */
++  if ((r->p == NULL && p == NULL)
++      || (r->q == NULL && q == NULL))
++    return 0;
++
++  if (p != NULL)
++  {
++    BN_free(r->p);
++    r->p = p;
++  }
++  if (q != NULL)
++  {
++    BN_free(r->q);
++    r->q = q;
++  }
++
++  return 1;
++}
++
++int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqmp)
++{
++  /* If the fields dmp1, dmq1 and iqmp in r are NULL, the corresponding input
++  * parameters MUST be non-NULL.
++  */
++  if ((r->dmp1 == NULL && dmp1 == NULL)
++      || (r->dmq1 == NULL && dmq1 == NULL)
++      || (r->iqmp == NULL && iqmp == NULL))
++    return 0;
++
++  if (dmp1 != NULL)
++  {
++    BN_free(r->dmp1);
++    r->dmp1 = dmp1;
++  }
++  if (dmq1 != NULL)
++  {
++    BN_free(r->dmq1);
++    r->dmq1 = dmq1;
++  }
++  if (iqmp != NULL)
++  {
++    BN_free(r->iqmp);
++    r->iqmp = iqmp;
++  }
++
++  return 1;
++}
++#endif
++
++EVP_MD_CTX *EVP_MD_CTX_new(void)
++{
++  return OPENSSL_malloc(sizeof(EVP_MD_CTX));
++}
++int EVP_MD_CTX_reset(EVP_MD_CTX *ctx)
++{
++  return EVP_MD_CTX_cleanup(ctx);
++}
++void EVP_MD_CTX_free(EVP_MD_CTX *ctx)
++{
++  EVP_MD_CTX_cleanup(ctx);
++  OPENSSL_free(ctx);
++}
++
++void X509_REQ_get0_signature(const X509_REQ *req, const ASN1_BIT_STRING **psig,
++                             const X509_ALGOR **palg)
++{
++  if (psig != NULL)
++    *psig = req->signature;
++  if (palg != NULL)
++    *palg = req->sig_alg;
++}
++
++X509_PUBKEY *X509_REQ_get_X509_PUBKEY(X509_REQ *req)
++{
++  return req->req_info->pubkey;
++}
++
++const ASN1_INTEGER *X509_get0_serialNumber(const X509 *a)
++{
++  return a->cert_info->serialNumber;
++}
++
++const STACK_OF(X509_EXTENSION) *X509_get0_extensions(const X509 *x)
++{
++  return x->cert_info->extensions;
++}
++int i2d_re_X509_REQ_tbs(X509_REQ *req, unsigned char **pp)
++{
++  req->req_info->enc.modified = 1;
++  return i2d_X509_REQ_INFO(req->req_info, pp);
++}
++const ASN1_TIME *X509_REVOKED_get0_revocationDate(const X509_REVOKED *x)
++{
++  return x->revocationDate;
++}
++
++const ASN1_INTEGER *X509_REVOKED_get0_serialNumber(const X509_REVOKED *x)
++{
++  return x->serialNumber;
++}
++
++const STACK_OF(X509_EXTENSION) *X509_REVOKED_get0_extensions(const X509_REVOKED *r)
++{
++  return r->extensions;
++}
++const STACK_OF(X509_EXTENSION) *X509_CRL_get0_extensions(const X509_CRL *crl)
++{
++  return crl->crl->extensions;
++}
++
++void X509_CRL_get0_signature(const X509_CRL *crl, const ASN1_BIT_STRING **psig,
++                             const X509_ALGOR **palg)
++{
++  if (psig != NULL)
++    *psig = crl->signature;
++  if (palg != NULL)
++    *palg = crl->sig_alg;
++}
++
++const ASN1_INTEGER *TS_STATUS_INFO_get0_status(const TS_STATUS_INFO *a)
++{
++  return a->status;
++}
++const STACK_OF(ASN1_UTF8STRING) *TS_STATUS_INFO_get0_text(const TS_STATUS_INFO *a)
++{
++  return a->text;
++}
++
++const ASN1_BIT_STRING *TS_STATUS_INFO_get0_failure_info(const TS_STATUS_INFO *a)
++{
++  return a->failure_info;
++}
++
++#if OPENSSL_VERSION_NUMBER < 0x10002000L || defined(LIBRESSL_VERSION_NUMBER)
++int i2d_re_X509_tbs(X509 *x, unsigned char **pp)
++{
++  x->cert_info->enc.modified = 1;
++  return i2d_X509_CINF(x->cert_info, pp);
++}
++
++#if !defined(LIBRESSL_VERSION_NUMBER)
++void X509_get0_signature(CONSTIFY_X509_get0 ASN1_BIT_STRING **psig,
++                         CONSTIFY_X509_get0 X509_ALGOR **palg,
++                         const X509 *x)
++{
++  if (psig)
++    *psig = x->signature;
++  if (palg)
++    *palg = x->sig_alg;
++}
++#endif
++
++int X509_get_signature_nid(const X509 *x)
++{
++  return OBJ_obj2nid(x->sig_alg->algorithm);
++}
++
++#endif /* < 1.0.2 */
++
++
++int TS_VERIFY_CTX_add_flags(TS_VERIFY_CTX *ctx, int f)
++{
++  ctx->flags |= f;
++  return ctx->flags;
++}
++
++int TS_VERIFY_CTX_set_flags(TS_VERIFY_CTX *ctx, int f)
++{
++  ctx->flags = f;
++  return ctx->flags;
++}
++
++BIO *TS_VERIFY_CTX_set_data(TS_VERIFY_CTX *ctx, BIO *b)
++{
++  ctx->data = b;
++  return ctx->data;
++}
++
++X509_STORE *TS_VERIFY_CTX_set_store(TS_VERIFY_CTX *ctx, X509_STORE *s)
++{
++  ctx->store = s;
++  return ctx->store;
++}
++
++STACK_OF(X509) *TS_VERIFY_CTS_set_certs(TS_VERIFY_CTX *ctx,
++                                        STACK_OF(X509) *certs)
++{
++  ctx->certs = certs;
++  return ctx->certs;
++}
++
++unsigned char *TS_VERIFY_CTX_set_imprint(TS_VERIFY_CTX *ctx,
++    unsigned char *hexstr, long len)
++{
++  ctx->imprint = hexstr;
++  ctx->imprint_len = len;
++  return ctx->imprint;
++}
+ 
+-#include "lua-compat/c-api/compat-5.3.c"
++#endif /* < 1.1.0 */
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/config.ld luvi-src-v2.7.6/deps/lua-openssl/src/config.ld
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/config.ld	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/config.ld	2019-02-13 11:53:24.275126573 +0100
+@@ -0,0 +1,9 @@
++project='lua-openssl'
++title='lua-openssl Docmentation'
++description='Openssl binding for Lua'
++format='discount'
++backtick_references=false
++dir='doc'
++readme='README.md'
++style='!pale'
++kind_names={topic='Manual',script='Programs'}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/crl.c luvi-src-v2.7.6/deps/lua-openssl/src/crl.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/crl.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/crl.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,9 +1,10 @@
+-/*=========================================================================*\
+-* crl.c
+-* X509 certificate revoke routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++x509.crl module for lua-openssl binding, provide x509_crl as lua object.
++create and manage x509 certificate sign request
++ at module x509.crl
++ at usage
++  crl = require'openssl'.x509.crl
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #define CRYPTO_LOCK_REF
+@@ -13,18 +14,33 @@
+ int   X509_CRL_cmp(const X509_CRL *a, const X509_CRL *b);
+ int   X509_CRL_match(const X509_CRL *a, const X509_CRL *b);
+ 
++#ifndef CRL_REASON_NONE
++#define CRL_REASON_NONE                         -1;
++#define CRL_REASON_UNSPECIFIED                  0
++#define CRL_REASON_KEY_COMPROMISE               1
++#define CRL_REASON_CA_COMPROMISE                2
++#define CRL_REASON_AFFILIATION_CHANGED          3
++#define CRL_REASON_SUPERSEDED                   4
++#define CRL_REASON_CESSATION_OF_OPERATION       5
++#define CRL_REASON_CERTIFICATE_HOLD             6
++#define CRL_REASON_REMOVE_FROM_CRL              8
++#define CRL_REASON_PRIVILEGE_WITHDRAWN          9
++#define CRL_REASON_AA_COMPROMISE                10
++#endif
++
+ static const BIT_STRING_BITNAME reason_flags[] =
+ {
+-  {0, "Unused", "unused"},
+-  {1, "Key Compromise", "keyCompromise"},
+-  {2, "CA Compromise", "CACompromise"},
+-  {3, "Affiliation Changed", "affiliationChanged"},
+-  {4, "Superseded", "superseded"},
+-  {5, "Cessation Of Operation", "cessationOfOperation"},
+-  {6, "Certificate Hold", "certificateHold"},
+-  {7, "Privilege Withdrawn", "privilegeWithdrawn"},
+-  {8, "AA Compromise", "AACompromise"},
+-  { -1, NULL, NULL}
++  { CRL_REASON_UNSPECIFIED, "Unspecified", "unspecified"},
++  { CRL_REASON_KEY_COMPROMISE,      "Key Compromise", "keyCompromise" },
++  { CRL_REASON_CA_COMPROMISE,       "CA Compromise", "CACompromise" },
++  { CRL_REASON_AFFILIATION_CHANGED, "Affiliation Changed", "affiliationChanged" },
++  { CRL_REASON_SUPERSEDED,          "Superseded", "superseded" },
++  { CRL_REASON_CESSATION_OF_OPERATION, "Cessation Of Operation", "cessationOfOperation" },
++  { CRL_REASON_CERTIFICATE_HOLD,    "Certificate Hold", "certificateHold" },
++  { CRL_REASON_REMOVE_FROM_CRL,     "Remove From CRL", "removeFromCRL" },
++  { CRL_REASON_PRIVILEGE_WITHDRAWN, "Privilege Withdrawn", "privilegeWithdrawn" },
++  { CRL_REASON_AA_COMPROMISE,       "AA Compromise", "AACompromise" },
++  { -1, NULL, NULL }
+ };
+ 
+ static const int reason_num = sizeof(reason_flags) / sizeof(BIT_STRING_BITNAME) - 1;
+@@ -76,6 +92,16 @@ static int reason_get(lua_State*L, int r
+   return reason;
+ }
+ 
++static int openssl_x509_revoked_get_reason(X509_REVOKED *revoked)
++{
++  int crit = 0;
++  int reason;
++  ASN1_ENUMERATED *areason = X509_REVOKED_get_ext_d2i(revoked, NID_crl_reason, &crit, NULL);
++  reason = (crit == -1) ? CRL_REASON_NONE : ASN1_ENUMERATED_get(areason);
++  ASN1_ENUMERATED_free(areason);
++  return reason;
++}
++
+ static X509_REVOKED *create_revoked(const BIGNUM* bn, time_t t, int reason)
+ {
+   X509_REVOKED *revoked = X509_REVOKED_new();
+@@ -86,9 +112,7 @@ static X509_REVOKED *create_revoked(cons
+ 
+   X509_REVOKED_set_revocationDate(revoked, tm);
+   X509_REVOKED_set_serialNumber(revoked, it);
+-#if OPENSSL_VERSION_NUMBER > 0x10000000L
+-  revoked->reason = reason;
+-#else
++
+   {
+     ASN1_ENUMERATED * e = ASN1_ENUMERATED_new();
+     X509_EXTENSION * ext = X509_EXTENSION_new();
+@@ -102,57 +126,44 @@ static X509_REVOKED *create_revoked(cons
+     X509_EXTENSION_free(ext);
+     ASN1_ENUMERATED_free(e);
+   }
+-#endif
++
+   ASN1_TIME_free(tm);
+   ASN1_INTEGER_free(it);
+ 
+   return revoked;
+ }
+ 
+-static LUA_FUNCTION(openssl_crl_add_revocked)
++static int openssl_revoked2table(lua_State*L, X509_REVOKED *revoked)
+ {
+-  X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+-  BIGNUM* sn = BN_get(L, 2);
+-  time_t t = lua_tointeger(L, 3);
+-  int reason = reason_get(L, 4);
++  int reason = openssl_x509_revoked_get_reason(revoked);
++  lua_newtable(L);
++  AUXILIAR_SET(L, -1, "code", reason, number);
++  AUXILIAR_SET(L, -1, "reason", openssl_i2s_revoke_reason(reason), string);
+ 
+-  int ret = 0;
+-  X509_REVOKED* revoked = create_revoked(sn, t, reason);
+-  ret = X509_CRL_add0_revoked(crl, revoked);
+-  lua_pushboolean(L, ret);
+-  BN_free(sn);
+-  return 1;
+-}
++  PUSH_ASN1_INTEGER(L, X509_REVOKED_get0_serialNumber(revoked));
++  lua_setfield(L, -2, "serialNumber");
+ 
+-static int openssl_crl_extensions(lua_State* L)
+-{
+-  X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+-  if (lua_isnone(L, 2))
+-  {
+-    STACK_OF(X509_EXTENSION) *exts = crl->crl->extensions;
+-    if (exts)
+-    {
+-      openssl_sk_x509_extension_totable(L, exts);
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 1;
+-  }
+-  else
+-  {
+-    STACK_OF(X509_EXTENSION) *exts = openssl_sk_x509_extension_fromtable(L, 2);
+-    int i, n;
+-    n = sk_X509_EXTENSION_num(exts);
+-    for (i = 0; i < n; i++)
+-    {
+-      X509_EXTENSION *ext = sk_X509_EXTENSION_value(exts, i);
+-      X509_CRL_add_ext(crl, X509_EXTENSION_dup(ext), i);
+-    };
+-    sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
+-    return openssl_pushresult(L, 1);
+-  }
++  PUSH_ASN1_TIME(L, X509_REVOKED_get0_revocationDate(revoked));
++  lua_setfield(L, -2, "revocationDate");
++
++  lua_pushstring(L, "extensions");
++  openssl_sk_x509_extension_totable(L, X509_REVOKED_get0_extensions(revoked));
++  lua_rawset(L, -3);
++  return 1;
+ }
+ 
++/***
++create or generate a new x509_crl object.
++Note if not give evp_pkey, will create a new x509_crl object,if give will generate a signed x509_crl object.
++ at function new
++ at tparam[opt] table revoked_list
++ at tparam[opt] x509 cacert ca cert to sign x509_crl
++ at tparam[opt] evp_pkey capkey private key to sign x509_crl
++ at tparam[opt] string|evp_md md_alg
++ at tparam[opt=7*24*3600] number period to generate new crl
++ at treturn x509_crl object
++ at see x509_crl
++*/
+ static LUA_FUNCTION(openssl_crl_new)
+ {
+   int i;
+@@ -208,7 +219,7 @@ static LUA_FUNCTION(openssl_crl_new)
+       luaL_argcheck(L, X509_check_private_key(cacert, capkey) == 1, 3, "evp_pkey not match with x509 in #2");
+     }
+   }
+-  md = lua_isnoneornil(L, 4) ? EVP_get_digestbyname("sha1") : get_digest(L, 4);
++  md = get_digest(L, 4, "sha256");;
+   step = lua_isnoneornil(L, 5) ? 7 * 24 * 3600 : luaL_checkint(L, 5);
+ 
+   if (ret == 1)
+@@ -247,6 +258,14 @@ static LUA_FUNCTION(openssl_crl_new)
+   return 1;
+ }
+ 
++/***
++read x509_crl from string or bio input
++ at function read
++ at tparam bio|string input input data
++ at tparam[opt='auto'] string format support 'auto','pem','der'
++ at treturn x509_crl certificate sign request object
++ at see x509_crl
++*/
+ static LUA_FUNCTION(openssl_crl_read)
+ {
+   BIO * in = load_bio_object(L, 1);
+@@ -261,12 +280,12 @@ static LUA_FUNCTION(openssl_crl_read)
+   if (fmt == FORMAT_PEM)
+   {
+     crl = PEM_read_bio_X509_CRL(in, NULL, NULL, NULL);
+-    BIO_reset(in);
++    (void)BIO_reset(in);
+   }
+   else if (fmt == FORMAT_DER)
+   {
+     crl = d2i_X509_CRL_bio(in, NULL);
+-    BIO_reset(in);
++    (void)BIO_reset(in);
+   }
+   BIO_free(in);
+   if (crl)
+@@ -277,6 +296,44 @@ static LUA_FUNCTION(openssl_crl_read)
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++list all support reason info
++ at function reason
++@treturn table contain support reason node like {lname=...,sname=...,bitnum=...}
++*/
++static int openssl_crl_reason(lua_State *L)
++{
++  int i;
++  const BIT_STRING_BITNAME* bitname;
++  lua_newtable(L);
++  for (i = 0, bitname = &reason_flags[i]; bitname->bitnum != -1; i++, bitname = &reason_flags[i])
++  {
++    openssl_push_bit_string_bitname(L, bitname);
++    lua_rawseti(L, -2, i + 1);
++  }
++  return 1;
++}
++
++static luaL_Reg R[] =
++{
++  {"new",       openssl_crl_new },
++  {"read",      openssl_crl_read},
++  {"reason",    openssl_crl_reason},
++
++  {NULL,    NULL}
++};
++
++/***
++openssl.x509_crl object
++ at type x509_crl
++*/
++
++/***
++set version key
++ at function version
++ at tparam integer version
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_crl_version)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -293,6 +350,80 @@ static LUA_FUNCTION(openssl_crl_version)
+   }
+ }
+ 
++/***
++add revoked entry to x509_crl object
++ at function add
++ at tparam string|number|bn serial
++ at tparam number revokedtime
++ at tparam[opt=0] number|string reason
++ at treturn boolean result true for add success
++*/
++static LUA_FUNCTION(openssl_crl_add_revocked)
++{
++  X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
++  BIGNUM* sn = BN_get(L, 2);
++  time_t t = lua_tointeger(L, 3);
++  int reason = reason_get(L, 4);
++
++  int ret = 0;
++  X509_REVOKED* revoked = create_revoked(sn, t, reason);
++  ret = X509_CRL_add0_revoked(crl, revoked);
++  lua_pushboolean(L, ret);
++  BN_free(sn);
++  return 1;
++}
++
++/***
++get extensions of x509_crl
++ at function extensions
++ at treturn stack_of_x509_extension extensions
++*/
++/***
++set extensions to x509_crl object
++ at function extensions
++ at tparam stack_of_x509_extension extensions add to x509_crl
++ at treturn boolean result
++*/
++static int openssl_crl_extensions(lua_State* L)
++{
++  X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
++  if (lua_isnone(L, 2))
++  {
++    const STACK_OF(X509_EXTENSION) *exts = X509_CRL_get0_extensions(crl);
++    if (exts)
++    {
++      openssl_sk_x509_extension_totable(L, exts);
++    }
++    else
++      lua_pushnil(L);
++    return 1;
++  }
++  else
++  {
++    STACK_OF(X509_EXTENSION) *exts = (STACK_OF(X509_EXTENSION) *)openssl_sk_x509_extension_fromtable(L, 2);
++    int i, n;
++    n = sk_X509_EXTENSION_num(exts);
++    for (i = 0; i < n; i++)
++    {
++      X509_EXTENSION *ext = sk_X509_EXTENSION_value(exts, i);
++      X509_CRL_add_ext(crl, X509_EXTENSION_dup(ext), i);
++    };
++    sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
++    return openssl_pushresult(L, 1);
++  }
++}
++
++/***
++get issuer x509_name object
++ at function issuer
++ at treturn x509_name
++*/
++/***
++set issuer x509_name object
++ at function issuer
++ at tparam x509_name|x509 issuer
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_crl_issuer)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -300,13 +431,13 @@ static LUA_FUNCTION(openssl_crl_issuer)
+   {
+     return openssl_push_xname_asobject(L, X509_CRL_get_issuer(crl));
+   }
+-  else if (auxiliar_isclass(L, "openssl.x509_name", 2))
++  else if (auxiliar_getclassudata(L, "openssl.x509_name", 2))
+   {
+     X509_NAME* xn = CHECK_OBJECT(2, X509_NAME, "openssl.x509_name");
+     int ret = X509_CRL_set_issuer_name(crl, xn);
+     return openssl_pushresult(L, ret);
+   }
+-  else if (auxiliar_isclass(L, "openssl.x509", 2))
++  else if (auxiliar_getclassudata(L, "openssl.x509", 2))
+   {
+     X509* x = CHECK_OBJECT(2, X509, "openssl.x509");
+     int ret = X509_CRL_set_issuer_name(crl, X509_get_issuer_name(x));
+@@ -319,6 +450,17 @@ static LUA_FUNCTION(openssl_crl_issuer)
+   return 0;
+ }
+ 
++/***
++get lastUpdate time
++ at function lastUpdate
++ at treturn string lastUpdate
++*/
++/***
++set lastUpdate time
++ at function lastUpdate
++ at tparam number lastUpdate
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_crl_lastUpdate)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -341,6 +483,17 @@ static LUA_FUNCTION(openssl_crl_lastUpda
+   }
+ }
+ 
++/***
++get nextUpdate time
++ at function nextUpdate
++ at treturn string nextUpdate
++*/
++/***
++set nextUpdate time
++ at function nextUpdate
++ at tparam number nextUpdate
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_crl_nextUpdate)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -363,6 +516,18 @@ static LUA_FUNCTION(openssl_crl_nextUpda
+   }
+ }
+ 
++/***
++get updateTime time
++ at function updateTime
++ at treturn string lastUpdate
++*/
++/***
++set updateTime time
++ at function updateTime
++ at tparam[opt=os.time()] lastUpdate, default use current time
++ at tparam number periord periord how long time(seconds)
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_crl_updateTime)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -408,6 +573,11 @@ static LUA_FUNCTION(openssl_crl_updateTi
+   }
+ }
+ 
++/***
++sore crl entry in x509_crl object
++ at function sort
++ at treturn boolean result true for success and others for fail
++*/
+ static LUA_FUNCTION(openssl_crl_sort)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -415,33 +585,61 @@ static LUA_FUNCTION(openssl_crl_sort)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++verify x509_crl object signature
++ at function verify
++ at tparam x509|evp_pkey key ca cert or public to verify signature
++@treturn boolean result true for success and others for fail
++*/
+ static LUA_FUNCTION(openssl_crl_verify)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+-  X509* cacert = CHECK_OBJECT(2, X509, "openssl.x509");
++  EVP_PKEY *pub = NULL;
++  int ret;
++  luaL_argcheck(L,
++                auxiliar_getclassudata(L, "openssl.x509", 2) ||
++                auxiliar_getclassudata(L, "openssl.evp_pkey", 2),
++                2,
++                "must be x509 or evp_pkey object");
++  if (auxiliar_getclassudata(L, "openssl.evp_pkey", 2))
++  {
++    pub = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
++    ret = X509_CRL_verify(crl, pub);
++  }
++  else
++  {
++    X509* cacert = CHECK_OBJECT(2, X509, "openssl.x509");
++    pub = X509_get_pubkey(cacert);
++    ret = X509_CRL_verify(crl, pub);
++    EVP_PKEY_free(pub);
++  }
+ 
+-  int ret = X509_CRL_verify(crl, cacert->cert_info->key->pkey);
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++sign x509_crl
++ at function sign
++ at tparam evp_pkey pkey private key to sign x509
++ at tparam x509|x509_name cacert or cacert x509_name
++ at tparam[opt='sha1WithRSAEncryption'] string|md_digest md_alg
++ at treturn boolean result true for check pass
++*/
+ LUA_FUNCTION(openssl_crl_sign)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+   EVP_PKEY *key = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  const EVP_MD *md = lua_isnoneornil(L, 4)
+-                     ? EVP_get_digestbyname("sha1") : get_digest(L, 4);
+-
++  const EVP_MD *md = get_digest(L, 4, "sha256");
+   int ret = 1;
+ 
+-  luaL_argcheck(L, openssl_pkey_is_private(key), 2, "must be private key");
+-  luaL_argcheck(L, auxiliar_isclass(L, "openssl.x509", 3) || auxiliar_isclass(L, "openssl.x509_name", 3),
++  luaL_argcheck(L, auxiliar_getclassudata(L, "openssl.x509", 3) || auxiliar_getclassudata(L, "openssl.x509_name", 3),
+                 3, "must be openssl.x509 or openssl.x509_name object");
+-  if (auxiliar_isclass(L, "openssl.x509_name", 3))
++  if (auxiliar_getclassudata(L, "openssl.x509_name", 3))
+   {
+     X509_NAME* xn = CHECK_OBJECT(3, X509_NAME, "openssl.x509_name");
+     ret = X509_CRL_set_issuer_name(crl, xn);
+   }
+-  else if (auxiliar_isclass(L, "openssl.x509", 3))
++  else if (auxiliar_getclassudata(L, "openssl.x509", 3))
+   {
+     X509* ca = CHECK_OBJECT(3, X509, "openssl.x509");
+     ret = X509_CRL_set_issuer_name(crl, X509_get_issuer_name(ca));
+@@ -461,13 +659,18 @@ LUA_FUNCTION(openssl_crl_sign)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get digest of x509_crl
++ at function digest
++ at tparam[opt='SHA1'] evp_md|string md_alg default use sha1
++ at treturn string digest result
++*/
+ static LUA_FUNCTION(openssl_crl_digest)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+   byte buf[EVP_MAX_MD_SIZE];
+   unsigned int lbuf = sizeof(buf);
+-  const EVP_MD *md = lua_isnoneornil(L, 2)
+-                     ? EVP_get_digestbyname("sha1") : get_digest(L, 2);
++  const EVP_MD *md = get_digest(L, 2, "sha256");
+ 
+   int ret =  X509_CRL_digest(crl, md, buf, &lbuf);
+   if (ret == 1)
+@@ -478,6 +681,14 @@ static LUA_FUNCTION(openssl_crl_digest)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++compare with other x509_crl object
++ at function cmp
++ at tparam x509_crl other
++ at treturn boolean result true for equals or false
++ at usage
++  x:cmp(y) == (x==y)
++*/
+ static LUA_FUNCTION(openssl_crl_cmp)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -488,17 +699,24 @@ static LUA_FUNCTION(openssl_crl_cmp)
+ }
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined (LIBRESSL_VERSION_NUMBER)
++/***
++make a delta x509_crl object
++ at function diff
++ at tparam x509_crl newer
++ at tparam evp_pkey pkey
++ at tparam[opt='sha1'] evp_md|string md_alg
++ at tparam[opt=0] integer flags
++ at treturn x509_crl delta result x509_crl object
++*/
+ static LUA_FUNCTION(openssl_crl_diff)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+   X509_CRL *newer = CHECK_OBJECT(2, X509_CRL, "openssl.x509_crl");
+   EVP_PKEY* pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
+-  const EVP_MD *md = lua_isnoneornil(L, 4)
+-                     ? EVP_get_digestbyname("sha1") : get_digest(L, 4);
++  const EVP_MD *md = get_digest(L, 4, "sha256");
+   unsigned int flags = luaL_optinteger(L, 5, 0);
+   X509_CRL *diff;
+ 
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 3, "must be private key");
+   diff  =  X509_CRL_diff(crl, newer, pkey, md, flags);
+   if (diff)
+   {
+@@ -508,22 +726,35 @@ static LUA_FUNCTION(openssl_crl_diff)
+     lua_pushnil(L);
+   return 1;
+ }
++
++/***
++check x509_crl with evp_pkey
++ at function check
++ at tparam evp_pkey pkey
++ at tparam[opt=0] integer flags 
++ at treturn boolean result true for pass
++*/
+ static LUA_FUNCTION(openssl_crl_check)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+   EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+   unsigned long flags = luaL_optinteger(L, 3, X509_V_FLAG_SUITEB_128_LOS);
+-  int ret;
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
+-  ret  =  X509_CRL_check_suiteb(crl, pkey, flags);
++  int ret  =  X509_CRL_check_suiteb(crl, pkey, flags);
+   return openssl_pushresult(L, ret == X509_V_OK);
+ }
+ #endif
+ 
++/***
++parse x509_crl object as table
++ at function parse
++ at tparam[opt=true] shortname default will use short object name
++ at treturn table result
++*/
+ static LUA_FUNCTION(openssl_crl_parse)
+ {
+   X509_CRL *crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+   int num, i;
++  const X509_ALGOR *alg;
+ 
+   lua_newtable(L);
+   AUXILIAR_SET(L, -1, "version", X509_CRL_get_version(crl), integer);
+@@ -536,7 +767,7 @@ static LUA_FUNCTION(openssl_crl_parse)
+   }
+ 
+   {
+-    const EVP_MD *digest = EVP_get_digestbyname("sha1");
++    const EVP_MD *digest = EVP_get_digestbyname("sha256");
+     unsigned char md[EVP_MAX_MD_SIZE];
+     unsigned int l = sizeof(md);
+ 
+@@ -558,58 +789,50 @@ static LUA_FUNCTION(openssl_crl_parse)
+   PUSH_ASN1_TIME(L, X509_CRL_get_nextUpdate(crl));
+   lua_setfield(L, -2, "nextUpdate");
+ 
+-  openssl_push_x509_algor(L, crl->crl->sig_alg);
+-  lua_setfield(L, -2, "sig_alg");
+-
+-#if OPENSSL_VERSION_NUMBER > 0x00909000L
+-  if (crl->crl_number)
+   {
+-    PUSH_ASN1_INTEGER(L, crl->crl_number);
+-    lua_setfield(L, -2, "crl_number");
++    const ASN1_BIT_STRING *sig = NULL;
++    const X509_ALGOR *sig_alg = NULL;
++
++    X509_CRL_get0_signature(crl, &sig, &alg);
++    PUSH_OBJECT(sig_alg, "openssl.x509_algor");
++    lua_setfield(L, -2, "sig_alg");
++    PUSH_ASN1_STRING(L, sig);
++    lua_setfield(L, -2, "signature");
+   }
+-#endif
+-  if (crl->crl->extensions)
+   {
+-    lua_pushstring(L, "extensions");
+-    openssl_sk_x509_extension_totable(L, crl->crl->extensions);
+-    lua_rawset(L, -3);
++    ASN1_INTEGER *crl_number = X509_CRL_get_ext_d2i(crl, NID_crl_number, NULL, NULL);
++    if (crl_number)
++    {
++      PUSH_ASN1_INTEGER(L, crl_number);
++      lua_setfield(L, -2, "crl_number");
++    }
+   }
+-
+-  num = sk_X509_REVOKED_num(crl->crl->revoked);
+-  lua_newtable(L);
+-  for (i = 0; i < num; i++)
+   {
+-    X509_REVOKED *revoked = sk_X509_REVOKED_value(crl->crl->revoked, i);
+-    lua_newtable(L);
+-
+-#if OPENSSL_VERSION_NUMBER > 0x10000000L
+-    AUXILIAR_SET(L, -1, "CRLReason", openssl_i2s_revoke_reason(revoked->reason), string);
+-#else
++    const STACK_OF(X509_EXTENSION) *extensions = X509_CRL_get0_extensions(crl);
++    if (extensions)
+     {
+-      int crit = 0;
+-      void* reason = X509_REVOKED_get_ext_d2i(revoked, NID_crl_reason, &crit, NULL);
+-
+-      AUXILIAR_SET(L, -1, "CRLReason", openssl_i2s_revoke_reason(ASN1_ENUMERATED_get(reason)), string);
+-      ASN1_ENUMERATED_free(reason);
++      openssl_sk_x509_extension_totable(L, extensions);
++      lua_setfield(L, -2, "extensions");
+     }
+-#endif
+-    PUSH_ASN1_INTEGER(L, revoked->serialNumber);
+-    lua_setfield(L, -2, "serialNumber");
+-
+-    PUSH_ASN1_TIME(L, revoked->revocationDate);
+-    lua_setfield(L, -2, "revocationDate");
++  }
+ 
+-    if (crl->crl->extensions)
++  {
++    STACK_OF(X509_REVOKED) *revokeds = X509_CRL_get_REVOKED(crl);
++    if (revokeds)
+     {
+-      lua_pushstring(L, "extensions");
+-      openssl_sk_x509_extension_totable(L, crl->crl->extensions);
+-      lua_rawset(L, -3);
+-    }
++      num = sk_X509_REVOKED_num(revokeds);
++      lua_newtable(L);
++      for (i = 0; i < num; i++)
++      {
++        X509_REVOKED *revoked = sk_X509_REVOKED_value(revokeds, i);
++        openssl_revoked2table(L, revoked);
++        lua_rawseti(L, -2, i + 1);
++      }
+ 
+-    lua_rawseti(L, -2, i + 1);
++      lua_setfield(L, -2, "revoked");
++    }
+   }
+ 
+-  lua_setfield(L, -2, "revoked");
+   return 1;
+ }
+ 
+@@ -620,6 +843,13 @@ static LUA_FUNCTION(openssl_crl_free)
+   return 0;
+ }
+ 
++/***
++export x509_crl to string
++ at function export
++ at tparam[opt='pem'] string format
++ at tparam[opt='true'] boolean noext not export extension
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_crl_export)
+ {
+   X509_CRL * crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+@@ -663,49 +893,57 @@ static LUA_FUNCTION(openssl_crl_export)
+   return 1;
+ }
+ 
+-
++/***
++get count of revoked entry
++ at function count
++ at treturn number count
++@usage
++  assert(#crl==crl:count())
++*/
+ static LUA_FUNCTION(openssl_crl_count)
+ {
+   X509_CRL * crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+-  int n = sk_X509_REVOKED_num(crl->crl->revoked);
++  STACK_OF(X509_REVOKED) *revokeds = X509_CRL_get_REVOKED(crl);
++  int n = revokeds ? sk_X509_REVOKED_num(revokeds) : 0;
+   lua_pushinteger(L, n);
+   return 1;
+ }
+ 
++/***
++get revoekd entry
++ at function get
++ at tparam number index
++ at treturn table revoekd 
++*/
+ static LUA_FUNCTION(openssl_crl_get)
+ {
+   X509_CRL * crl = CHECK_OBJECT(1, X509_CRL, "openssl.x509_crl");
+-  int i = luaL_checkint(L, 2);
+-  if (i >= 0 && i < sk_X509_REVOKED_num(crl->crl->revoked))
++  STACK_OF(X509_REVOKED) *revokeds = X509_CRL_get_REVOKED(crl);
++  X509_REVOKED *revoked = NULL;
++  int i = 0;
++  if (lua_isinteger(L, 2))
++  {
++    i = lua_tointeger(L, 2);
++    luaL_argcheck(L, (i >= 0 && i < sk_X509_REVOKED_num(revokeds)), 2, "Out of range");
++    revoked = sk_X509_REVOKED_value(revokeds, i);
++  }
++  else
+   {
+-    X509_REVOKED *revoked = sk_X509_REVOKED_value(crl->crl->revoked, i);
+-
+-    lua_newtable(L);
+-
+-#if OPENSSL_VERSION_NUMBER > 0x10000000L
+-    AUXILIAR_SET(L, -1, "reason", openssl_i2s_revoke_reason(revoked->reason), string);
+-#else
+-    {
+-      int crit = 0;
+-      void* reason = X509_REVOKED_get_ext_d2i(revoked, NID_crl_reason, &crit, NULL);
+-
+-      AUXILIAR_SET(L, -1, "reason", openssl_i2s_revoke_reason(ASN1_ENUMERATED_get(reason)), string);
+-      ASN1_ENUMERATED_free(reason);
+-    }
+-#endif
+-    PUSH_ASN1_INTEGER(L, revoked->serialNumber);
+-    lua_setfield(L, -2, "serialNumber");
+-
+-    PUSH_ASN1_TIME(L, revoked->revocationDate);
+-    lua_setfield(L, -2, "revocationDate");
+-
+-    if (crl->crl->extensions)
++    ASN1_STRING *sn = CHECK_OBJECT(2, ASN1_STRING, "openssl.asn1_integer");
++    int cnt = sk_X509_REVOKED_num(revokeds);
++    for (i = 0; i < cnt; i++)
+     {
+-      lua_pushstring(L, "extensions");
+-      openssl_sk_x509_extension_totable(L, crl->crl->extensions);
+-      lua_rawset(L, -3);
++      X509_REVOKED *rev = sk_X509_REVOKED_value(revokeds, i);
++      if (ASN1_STRING_cmp(X509_REVOKED_get0_serialNumber(rev), sn) == 0)
++      {
++        revoked = rev;
++        break;
++      }
+     }
+-    return 1;
++  }
++  if (revoked)
++  {
++    openssl_revoked2table(L, revoked);
+   }
+   else
+     lua_pushnil(L);
+@@ -752,55 +990,38 @@ static luaL_Reg crl_funcs[] =
+ static int openssl_revoked_info(lua_State* L)
+ {
+   X509_REVOKED* revoked = CHECK_OBJECT(1, X509_REVOKED, "openssl.x509_revoked");
+-  lua_newtable(L);
+-
+-#if OPENSSL_VERSION_NUMBER > 0x10000000L
+-  AUXILIAR_SET(L, -1, "reason", openssl_i2s_revoke_reason(revoked->reason), string);
+-#else
+-  {
+-    int crit = 0;
+-    void* reason = X509_REVOKED_get_ext_d2i(revoked, NID_crl_reason, &crit, NULL);
+-
+-    AUXILIAR_SET(L, -1, "reason", openssl_i2s_revoke_reason(ASN1_ENUMERATED_get(reason)), string);
+-    ASN1_ENUMERATED_free(reason);
+-  }
+-#endif
+-  PUSH_ASN1_INTEGER(L, revoked->serialNumber);
+-  lua_setfield(L, -2, "serialNumber");
+-
+-  PUSH_ASN1_TIME(L, revoked->revocationDate);
+-  lua_setfield(L, -2, "revocationDate");
+-
+-  if (revoked->extensions)
+-  {
+-    lua_pushstring(L, "extensions");
+-    openssl_sk_x509_extension_totable(L, revoked->extensions);
+-    lua_rawset(L, -3);
+-  }
+-  return 1;
++  return openssl_revoked2table(L, revoked);
+ };
+ 
+ static int openssl_revoked_reason(lua_State* L)
+ {
+   X509_REVOKED* revoked = CHECK_OBJECT(1, X509_REVOKED, "openssl.x509_revoked");
+-#if OPENSSL_VERSION_NUMBER > 0x00909000L
+-  lua_pushstring(L, openssl_i2s_revoke_reason(revoked->reason));
+-  lua_pushinteger(L, revoked->reason);
+-  return 2;
+-#else
+-  /*
++  if (lua_isnone(L, 2))
+   {
+-    int crit = 0;
+-    void* reason = X509_REVOKED_get_ext_d2i(revoked, NID_crl_reason, &crit, NULL);
+-    lua_pushstring(L, openssl_i2s_revoke_reason(ASN1_ENUMERATED_get(reason)).lname);
+-    lua_pushinteger(revoked->reason);
+-    ASN1_ENUMERATED_free(reason);
+-  }*/
++    int reason = openssl_x509_revoked_get_reason(revoked);
++    lua_pushinteger(L, reason);
++    lua_pushstring(L, openssl_i2s_revoke_reason(reason));
++    return 2;
++  }
++  else
++  {
++    int reason = reason_get(L, 2);
++    ASN1_ENUMERATED * e = ASN1_ENUMERATED_new();
++    X509_EXTENSION * ext = X509_EXTENSION_new();
++
++    ASN1_ENUMERATED_set(e, reason);
++
++    X509_EXTENSION_set_data(ext, e);
++    X509_EXTENSION_set_object(ext, OBJ_nid2obj(NID_crl_reason));
++    X509_REVOKED_add_ext(revoked, ext, 0);
++
++    X509_EXTENSION_free(ext);
++    ASN1_ENUMERATED_free(e);
++  }
+   return 0;
+-#endif
+ }
+ 
+-static time_t ASN1_GetTimeT(ASN1_TIME* time)
++static time_t ASN1_GetTimeT(const ASN1_TIME* time)
+ {
+   struct tm t;
+   const char* str = (const char*) time->data;
+@@ -841,27 +1062,29 @@ static time_t ASN1_GetTimeT(ASN1_TIME* t
+ static int openssl_revoked_revocationDate(lua_State* L)
+ {
+   X509_REVOKED* revoked = CHECK_OBJECT(1, X509_REVOKED, "openssl.x509_revoked");
+-  PUSH_ASN1_TIME(L, revoked->revocationDate);
+-  lua_pushinteger(L, (LUA_INTEGER)ASN1_GetTimeT(revoked->revocationDate));
++  const ASN1_TIME* time = X509_REVOKED_get0_revocationDate(revoked);
++  lua_pushinteger(L, (LUA_INTEGER)ASN1_GetTimeT(time));
++  PUSH_ASN1_TIME(L, time);
+   return 2;
+ }
+ 
+ static int openssl_revoked_serialNumber(lua_State* L)
+ {
+   X509_REVOKED* revoked = CHECK_OBJECT(1, X509_REVOKED, "openssl.x509_revoked");
+-  BIGNUM *bn = ASN1_INTEGER_to_BN(revoked->serialNumber, NULL);
+-  PUSH_ASN1_INTEGER(L, revoked->serialNumber);
++  const ASN1_INTEGER *serialNumber = X509_REVOKED_get0_serialNumber(revoked);
++  BIGNUM *bn = ASN1_INTEGER_to_BN(serialNumber, NULL);
+   PUSH_OBJECT(bn, "openssl.bn");
++  PUSH_ASN1_INTEGER(L, serialNumber);
+   return 2;
+ }
+ 
+ static int openssl_revoked_extensions(lua_State* L)
+ {
+   X509_REVOKED* revoked = CHECK_OBJECT(1, X509_REVOKED, "openssl.x509_revoked");
+-
+-  if (revoked->extensions)
++  const STACK_OF(X509_EXTENSION) *exts = X509_REVOKED_get0_extensions(revoked);
++  if (exts)
+   {
+-    openssl_sk_x509_extension_totable(L, revoked->extensions);
++    openssl_sk_x509_extension_totable(L, exts);
+   }
+   else
+     lua_pushnil(L);
+@@ -889,27 +1112,6 @@ static luaL_Reg revoked_funcs[] =
+   {NULL,    NULL}
+ };
+ 
+-static int openssl_crl_reason(lua_State *L)
+-{
+-  int i;
+-  const BIT_STRING_BITNAME* bitname;
+-  lua_newtable(L);
+-  for (i = 0, bitname = &reason_flags[i]; bitname->bitnum != -1; i++, bitname = &reason_flags[i])
+-  {
+-    openssl_push_bit_string_bitname(L, bitname);
+-    lua_rawseti(L, -2, i + 1);
+-  }
+-  return 1;
+-}
+-
+-static luaL_Reg R[] =
+-{
+-  {"new",       openssl_crl_new },
+-  {"read",      openssl_crl_read},
+-  {"reason",    openssl_crl_reason},
+-  {NULL,    NULL}
+-};
+-
+ IMP_LUA_SK(X509_CRL, x509_crl)
+ 
+ int luaopen_x509_crl(lua_State *L)
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/csr.c luvi-src-v2.7.6/deps/lua-openssl/src/csr.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/csr.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/csr.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,12 +1,21 @@
+-/*=========================================================================*\
+-* csr.c
+-* X509 certificate sign request routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++x509.req module for lua-openssl binding, provide x509_req as lua object.
++create and manage x509 certificate sign request
++ at module x509.req
++ at usage
++  req = require'openssl'.x509.req
++*/
++
+ #include "openssl.h"
+ #include "private.h"
+ 
++/***
++read x509_req from string or bio input
++ at function read
++ at tparam bio|string input input data
++ at tparam[opt='auto'] string format support 'auto','pem','der'
++ at treturn x509_req certificate sign request object
++*/
+ static LUA_FUNCTION(openssl_csr_read)
+ {
+   BIO * in = load_bio_object(L, 1);
+@@ -21,12 +30,12 @@ static LUA_FUNCTION(openssl_csr_read)
+   if (fmt == FORMAT_PEM)
+   {
+     csr = PEM_read_bio_X509_REQ(in, NULL, NULL, NULL);
+-    BIO_reset(in);
++    (void)BIO_reset(in);
+   }
+   else if (fmt == FORMAT_DER)
+   {
+     csr = d2i_X509_REQ_bio(in, NULL);
+-    BIO_reset(in);
++    (void)BIO_reset(in);
+   }
+   BIO_free(in);
+ 
+@@ -38,18 +47,95 @@ static LUA_FUNCTION(openssl_csr_read)
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++create or generate a new x509_req object.
++Note if not give evp_pkey, will create a new x509_req object,or will generate a signed x509_req object.
++ at function new
++ at tparam[opt] x509_name subject subject name set to x509_req
++ at tparam[opt] stack_of_x509_extension extensions add to x509_req
++ at tparam[opt] stack_of_x509_attribute attributes add to x509_req
++ at tparam[opt] evp_pkey pkey private key sign the x509_req, and set as public key
++ at tparam[opt='sha1WithRSAEncryption'] evp_digest|string md_alg,  only used when pkey exist, and should fellow pkey
++ at treturn x509_req certificate sign request object
++ at see x509_req
++*/
++static LUA_FUNCTION(openssl_csr_new)
++{
++  X509_REQ *csr = X509_REQ_new();
++  int i;
++  int n = lua_gettop(L);
++  int ret = X509_REQ_set_version(csr, 0L);
++
++  for (i = 1; ret == 1 && i <= n; i++)
++  {
++    luaL_argcheck(L,
++                  auxiliar_getclassudata(L, "openssl.x509_name", i) ||
++                  auxiliar_getclassudata(L, "openssl.evp_pkey", i),
++                  i, "must be x509_name or evp_pkey");
++    if (auxiliar_getclassudata(L, "openssl.x509_name", i))
++    {
++      X509_NAME * subject = CHECK_OBJECT(i, X509_NAME, "openssl.x509_name");
++      ret = X509_REQ_set_subject_name(csr, subject);
++    }
++    if (auxiliar_getclassudata(L, "openssl.evp_pkey", i))
++    {
++      EVP_PKEY *pkey;
++      const EVP_MD *md;
++      luaL_argcheck(L, i == n || i == n - 1, i, "must is evp_pkey object");
++
++      pkey = CHECK_OBJECT(i, EVP_PKEY, "openssl.evp_pkey");
++
++      if (i == n - 1)
++        md = get_digest(L, n, NULL);
++      else
++        md = EVP_get_digestbyname("sha256");
++
++      ret = X509_REQ_set_pubkey(csr, pkey);
++      if (ret == 1)
++      {
++        ret = X509_REQ_sign(csr, pkey, md);
++        if (ret > 0)
++          ret = 1;
++      }
++      break;
++    }
++  };
+ 
+-static X509 *X509_REQ_to_X509_a(X509_REQ *r, int days, EVP_PKEY *pkey)
++  if (ret == 1)
++    PUSH_OBJECT(csr, "openssl.x509_req");
++  else
++  {
++    X509_REQ_free(csr);
++    return openssl_pushresult(L, ret);
++  }
++  return 1;
++}
++
++static luaL_Reg R[] =
++{
++  {"new",       openssl_csr_new },
++  {"read",      openssl_csr_read  },
++
++  {NULL,    NULL}
++};
++
++/***
++openssl.x509_req object
++ at type x509_req
++*/
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++static X509 *X509_REQ_to_X509_ex(X509_REQ *r, int days, EVP_PKEY *pkey, const EVP_MD* md)
+ {
+   X509 *ret = NULL;
+   X509_CINF *xi = NULL;
+   X509_NAME *xn;
+-  EVP_PKEY* pubkey;
++  EVP_PKEY *pubkey = NULL;
++  int res;
+ 
+   if ((ret = X509_new()) == NULL)
+   {
+     X509err(X509_F_X509_REQ_TO_X509, ERR_R_MALLOC_FAILURE);
+-    goto err;
++    return NULL;
+   }
+ 
+   /* duplicate the request */
+@@ -57,10 +143,12 @@ static X509 *X509_REQ_to_X509_a(X509_REQ
+ 
+   if (sk_X509_ATTRIBUTE_num(r->req_info->attributes) != 0)
+   {
+-    if ((xi->version = M_ASN1_INTEGER_new()) == NULL) goto err;
+-    if (!ASN1_INTEGER_set(xi->version, 2)) goto err;
+-    /*    xi->extensions=ri->attributes; <- bad, should not ever be done
+-        ri->attributes=NULL; */
++    if ((xi->version = M_ASN1_INTEGER_new()) == NULL)
++      goto err;
++    if (!ASN1_INTEGER_set(xi->version, 2))
++      goto err;
++    /*-     xi->extensions=ri->attributes; <- bad, should not ever be done
++    ri->attributes=NULL; */
+   }
+ 
+   xn = X509_REQ_get_subject_name(r);
+@@ -71,12 +159,17 @@ static X509 *X509_REQ_to_X509_a(X509_REQ
+ 
+   if (X509_gmtime_adj(xi->validity->notBefore, 0) == NULL)
+     goto err;
+-  if (X509_gmtime_adj(xi->validity->notAfter, (long)60 * 60 * 24 * days) == NULL)
++  if (X509_gmtime_adj(xi->validity->notAfter, (long)60 * 60 * 24 * days) ==
++      NULL)
+     goto err;
++
+   pubkey = X509_REQ_get_pubkey(r);
+-  X509_set_pubkey(ret, pubkey);
++  res = X509_set_pubkey(ret, pubkey);
+   EVP_PKEY_free(pubkey);
+-  if (!X509_sign(ret, pkey, EVP_get_digestbyobj(r->sig_alg->algorithm)))
++
++  if (!md)
++    goto err;
++  if (!res || !X509_sign(ret, pkey, md))
+     goto err;
+   if (0)
+   {
+@@ -86,16 +179,24 @@ err:
+   }
+   return (ret);
+ }
++#endif
+ 
++/***
++convert x509_req to x509 object
++ at function to_x509
++ at treturn x509 object not signed
++*/
+ static LUA_FUNCTION(openssl_csr_to_x509)
+ {
+   X509_REQ * csr  = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+   EVP_PKEY * pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+   int days = luaL_optint(L, 3, 365);
+-  X509* cert = X509_REQ_to_X509_a(csr, days, pkey);
+-
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
+-
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++  const EVP_MD* md = get_digest(L, 4, "sha256");
++  X509* cert = X509_REQ_to_X509_ex(csr, days, pkey, md);
++#else
++  X509* cert = X509_REQ_to_X509(csr, days, pkey);
++#endif
+   if (cert)
+   {
+     PUSH_OBJECT(cert, "openssl.x509");
+@@ -104,6 +205,13 @@ static LUA_FUNCTION(openssl_csr_to_x509)
+   return openssl_pushresult(L, 0);
+ }
+ 
++/***
++export x509_req to string
++ at function export
++ at tparam[opt='pem'] string format
++ at tparam[opt='true'] boolean noext not export extension
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_csr_export)
+ {
+   X509_REQ * csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -151,17 +259,19 @@ static LUA_FUNCTION(openssl_csr_export)
+   return 1;
+ }
+ 
++/***
++get digest of x509_req
++ at function digest
++ at tparam[opt='SHA1'] evp_md|string md_alg default use sha1
++ at treturn string digest result
++*/
+ static LUA_FUNCTION(openssl_csr_digest)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+-  const EVP_MD *md = NULL;
+   unsigned char buf[EVP_MAX_MD_SIZE];
+   unsigned int len = sizeof(buf);
+   int ret;
+-  if (lua_isnoneornil(L, 2))
+-    md = EVP_get_digestbyname("SHA1");
+-  else
+-    md = get_digest(L, 2);
++  const EVP_MD *md = get_digest(L, 2, "sha256");
+ 
+   ret = X509_REQ_digest(csr, md, buf, &len);
+   if (ret == 1)
+@@ -172,16 +282,25 @@ static LUA_FUNCTION(openssl_csr_digest)
+   return openssl_pushresult(L, ret);
+ };
+ 
++/***
++check x509_req with evp_pkey
++ at function check
++ at tparam evp_pkey pkey
++ at treturn boolean result true for check pass
++*/
+ static LUA_FUNCTION(openssl_csr_check)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+   EVP_PKEY *pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  int ret;
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
+-  ret = X509_REQ_check_private_key(csr, pkey);
++  int ret = X509_REQ_check_private_key(csr, pkey);
+   return openssl_pushresult(L, ret);
+ };
+ 
++/***
++clone x509_req object
++ at function dup
++ at treturn x509_req object
++*/
+ static LUA_FUNCTION(openssl_csr_dup)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -190,6 +309,11 @@ static LUA_FUNCTION(openssl_csr_dup)
+   return 1;
+ };
+ 
++/***
++verify x509_req signature
++ at function verify
++@treturn boolean result true for verify pass
++*/
+ static LUA_FUNCTION(openssl_csr_verify)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -204,129 +328,115 @@ static LUA_FUNCTION(openssl_csr_verify)
+   return 1;
+ };
+ 
+-static LUA_FUNCTION(openssl_csr_new)
+-{
+-  X509_REQ *csr = X509_REQ_new();
+-  int i;
+-  int n = lua_gettop(L);
+-  int ret = X509_REQ_set_version(csr, 0L);
+-
+-  for (i = 1; ret == 1 && i <= n; i++)
+-  {
+-    luaL_argcheck(L,
+-                  auxiliar_isclass(L, "openssl.x509_name", i) ||
+-                  auxiliar_isclass(L, "openssl.evp_pkey", i),
+-                  i, "must be x509_name");
+-    if (auxiliar_isclass(L, "openssl.x509_name", i))
+-    {
+-      X509_NAME * subject = CHECK_OBJECT(i, X509_NAME, "openssl.x509_name");
+-      ret = X509_REQ_set_subject_name(csr, subject);
+-    }
+-    if (auxiliar_isclass(L, "openssl.evp_pkey", i))
+-    {
+-      EVP_PKEY *pkey;
+-      const EVP_MD *md;
+-      luaL_argcheck(L, i == n || i == n - 1, i, "must is evp_pkey object");
+-
+-      pkey = CHECK_OBJECT(i, EVP_PKEY, "openssl.evp_pkey");
+-
+-      luaL_argcheck(L, openssl_pkey_is_private(pkey), i, "must be private key");
+-
+-      if (i == n - 1)
+-        md = get_digest(L, n);
+-      else
+-        md = EVP_get_digestbyname("sha1");
+-
+-      ret = X509_REQ_set_pubkey(csr, pkey);
+-      if (ret == 1)
+-      {
+-        ret = X509_REQ_sign(csr, pkey, md);
+-        if (ret > 0)
+-          ret = 1;
+-      }
+-      break;
+-    }
+-  };
+-
+-  if (ret == 1)
+-    PUSH_OBJECT(csr, "openssl.x509_req");
+-  else
+-  {
+-    X509_REQ_free(csr);
+-    return openssl_pushresult(L, ret);
+-  }
+-  return 1;
+-}
++/***
++sign x509_req object
+ 
++ at function sign
++ at tparam evp_pkey pkey private key which to sign x509_req object
++ at tparam number|string|evp_md md message digest alg used to sign
++ at treturn boolean result true for suceess
++*/
+ static LUA_FUNCTION(openssl_csr_sign)
+ {
+   X509_REQ * csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+-  EVP_PKEY *pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  if (openssl_pkey_is_private(pkey))
++  EVP_PKEY *pubkey = X509_REQ_get_pubkey(csr);
++  if (auxiliar_getclassudata(L, "openssl.evp_pkey", 2))
+   {
+-    const EVP_MD* md = lua_isnone(L, 3) ? EVP_get_digestbyname("sha1") : get_digest(L, 3);
+-    int ret = X509_REQ_set_pubkey(csr, pkey);
+-    if (ret == 1)
++    EVP_PKEY *pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
++    const EVP_MD* md = get_digest(L, 3, "sha256");
++    int ret = 1;
++    if (pubkey == NULL)
+     {
+-      ret = X509_REQ_sign(csr, pkey, md);
+-      if (ret > 0)
+-        ret = 1;
++      BIO* bio = BIO_new(BIO_s_mem());
++      if ((ret = i2d_PUBKEY_bio(bio, pkey)) == 1)
++      {
++        pubkey = d2i_PUBKEY_bio(bio, NULL);
++        if (pubkey)
++        {
++          ret = X509_REQ_set_pubkey(csr, pubkey);
++          EVP_PKEY_free(pubkey);
++        }
++        else
++        {
++          ret = 0;
++        }
++      }
++      BIO_free(bio);
+     }
+-
+-    return openssl_pushresult(L, 1);
+-  }
+-  else if (lua_isnoneornil(L, 3) && X509_REQ_set_pubkey(csr, pkey))
+-  {
+-    unsigned char* tosign = NULL;
+-    const ASN1_ITEM *it = ASN1_ITEM_rptr(X509_REQ_INFO);
+-    int inl = ASN1_item_i2d((void*)csr->req_info, &tosign, it);
+-    if (inl > 0 && tosign)
++    else
+     {
+-      lua_pushlstring(L, (const char*)tosign, inl);
+-      OPENSSL_free(tosign);
+-      return 1;
++      EVP_PKEY_free(pubkey);
+     }
+-    return openssl_pushresult(L, 0);
++    if (ret == 1)
++      ret = X509_REQ_sign(csr, pkey, md);
++    return openssl_pushresult(L, ret);
+   }
+-  else
++  else if (lua_isstring(L, 2))
+   {
+     size_t siglen;
+-    const unsigned char* sigdata = (const unsigned char*)luaL_checklstring(L, 3, &siglen);
+-    const EVP_MD* md = get_digest(L, 4);
++    unsigned char* sigdata = (unsigned char*)luaL_checklstring(L, 2, &siglen);
++    const EVP_MD* md = get_digest(L, 3, NULL);
++    ASN1_BIT_STRING *sig = NULL;
++    X509_ALGOR *alg = NULL;
+ 
++    luaL_argcheck(L, pubkey != NULL, 1, "has not set public key!!!");
++
++    X509_REQ_get0_signature(csr, (const ASN1_BIT_STRING **)&sig, (const X509_ALGOR **)&alg);
+     /* (pkey->ameth->pkey_flags & ASN1_PKEY_SIGPARAM_NULL) ? V_ASN1_NULL : V_ASN1_UNDEF, */
+-    X509_ALGOR_set0(csr->sig_alg, OBJ_nid2obj(md->pkey_type), V_ASN1_NULL, NULL);
++    X509_ALGOR_set0((X509_ALGOR *)alg, OBJ_nid2obj(EVP_MD_pkey_type(md)), V_ASN1_NULL, NULL);
+ 
+-    if (csr->signature->data != NULL)
+-      OPENSSL_free(csr->signature->data);
+-    csr->signature->data = OPENSSL_malloc(siglen);
+-    memcpy(csr->signature->data, sigdata, siglen);
+-    csr->signature->length = siglen;
++    ASN1_BIT_STRING_set((ASN1_BIT_STRING *)sig, sigdata, siglen);
+     /*
+     * In the interests of compatibility, I'll make sure that the bit string
+     * has a 'not-used bits' value of 0
+     */
+-    csr->signature->flags &= ~(ASN1_STRING_FLAG_BITS_LEFT | 0x07);
+-    csr->signature->flags |= ASN1_STRING_FLAG_BITS_LEFT;
++    sig->flags &= ~(ASN1_STRING_FLAG_BITS_LEFT | 0x07);
++    sig->flags |= ASN1_STRING_FLAG_BITS_LEFT;
+     lua_pushboolean(L, 1);
+     return 1;
+   }
++  else
++  {
++    int inl;
++    unsigned char* tosign = NULL;
++    luaL_argcheck(L, pubkey != NULL, 1, "has not set public key!!!");
++
++    inl = i2d_re_X509_REQ_tbs(csr, &tosign);
++    if (inl > 0 && tosign)
++    {
++      lua_pushlstring(L, (const char*)tosign, inl);
++      OPENSSL_free(tosign);
++      return 1;
++    }
++    return openssl_pushresult(L, 0);
++  }
+ }
+ 
++/***
++parse x509_req object as table
++ at function parse
++ at tparam[opt=true] shortname default will use short object name
++ at treturn table result
++*/
+ static LUA_FUNCTION(openssl_csr_parse)
+ {
+-  X509_REQ * csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+-
+-  X509_NAME * subject = X509_REQ_get_subject_name(csr);
++  X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
++  X509_NAME *subject = X509_REQ_get_subject_name(csr);
+   STACK_OF(X509_EXTENSION) *exts  = X509_REQ_get_extensions(csr);
+ 
+   lua_newtable(L);
++  {
++    const ASN1_BIT_STRING *sig = NULL;
++    const X509_ALGOR *alg = NULL;
+ 
+-  openssl_push_asn1(L, csr->signature, V_ASN1_BIT_STRING);
+-  lua_setfield(L, -2, "signature");
+-
+-  openssl_push_x509_algor(L, csr->sig_alg);
+-  lua_setfield(L, -2, "sig_alg");
++    X509_REQ_get0_signature(csr, &sig, &alg);
++    openssl_push_asn1(L, sig, V_ASN1_BIT_STRING);
++    lua_setfield(L, -2, "signature");
++
++    alg = X509_ALGOR_dup((X509_ALGOR *)alg);
++    PUSH_OBJECT(alg, "openssl.x509_algor");
++    lua_setfield(L, -2, "sig_alg");
++  }
+ 
+   lua_newtable(L);
+   AUXILIAR_SET(L, -1, "version", X509_REQ_get_version(csr), integer);
+@@ -341,14 +451,16 @@ static LUA_FUNCTION(openssl_csr_parse)
+   }
+ 
+   {
+-    X509_REQ_INFO* ri = csr->req_info;
+-    int i, c;
++    X509_PUBKEY *xpub = X509_REQ_get_X509_PUBKEY(csr);
++    ASN1_OBJECT *oalg = NULL;
++    int c;
+     EVP_PKEY *pubkey = X509_REQ_get_pubkey(csr);
+ 
+     lua_newtable(L);
+     c = X509_REQ_get_attr_count(csr);
+     if (c > 0)
+     {
++      int i;
+       lua_newtable(L);
+       for (i = 0; i < c ; i++)
+       {
+@@ -361,10 +473,13 @@ static LUA_FUNCTION(openssl_csr_parse)
+     }
+ 
+     lua_newtable(L);
+-    openssl_push_asn1object(L, ri->pubkey->algor->algorithm);
+-    lua_setfield(L, -2, "algorithm");
++    if (X509_PUBKEY_get0_param(&oalg, NULL, NULL, NULL, xpub))
++    {
++      openssl_push_asn1object(L, oalg);
++      lua_setfield(L, -2, "algorithm");
++    }
+ 
+-    AUXILIAR_SETOBJECT(L, pubkey , "openssl.evp_pkey", -1, "pubkey");
++    AUXILIAR_SETOBJECT(L, pubkey, "openssl.evp_pkey", -1, "pubkey");
+     lua_setfield(L, -2, "pubkey");
+ 
+     lua_setfield(L, -2, "req_info");
+@@ -380,6 +495,18 @@ static LUA_FUNCTION(openssl_csr_free)
+   return 0;
+ }
+ 
++/***
++get public key
++ at function public
++ at treturn evp_pkey public key
++*/
++
++/***
++set public key
++ at function public
++ at tparam evp_pkey pubkey public key set to x509_req
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_csr_public)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -397,6 +524,17 @@ static LUA_FUNCTION(openssl_csr_public)
+   }
+ }
+ 
++/***
++get version key
++ at function version
++ at treturn integer
++*/
++/***
++set version key
++ at function version
++ at tparam integer version
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_csr_version)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -413,6 +551,17 @@ static LUA_FUNCTION(openssl_csr_version)
+   }
+ }
+ 
++/***
++get subject x509_name object
++ at function subject
++ at treturn x509_name
++*/
++/***
++set subject x509_name object
++ at function subject
++ at tparam x509_name subject
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_csr_subject)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -433,6 +582,19 @@ static LUA_FUNCTION(openssl_csr_subject)
+   }
+ }
+ 
++/***
++get extensions of x509_req object
++ at function extensions
++ at tparam[opt=false] boolean asobject, true for return as stack_of_x509_extension or as table
++ at treturn stack_of_x509_extension object when param set true
++ at treturn table contain all x509_extension when param set false or nothing
++*/
++/***
++set extension of x509_req object
++ at function extensions
++ at tparam stack_of_x509_extension extensions
++ at treturn boolean result true for success
++*/
+ static LUA_FUNCTION(openssl_csr_extensions)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -457,10 +619,29 @@ static LUA_FUNCTION(openssl_csr_extensio
+   }
+ }
+ 
++/***
++remove attribute object from location
++ at function attribute
++ at tparam integer location
++ at tparam nil nil, nil not none
++ at treturn x509_attribute attribute removed
++*/
++/***
++get attribute object from location
++ at function attribute
++ at tparam integer location
++ at treturn x509_attribute attribute
++*/
++/***
++add attribute to x509_req object
++ at function attribute
++ at tparam x509_attribute attribute attribute to add
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_csr_attribute)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+-  if (auxiliar_isclass(L, "openssl.x509_attribute", 2))
++  if (auxiliar_getclassudata(L, "openssl.x509_attribute", 2))
+   {
+     X509_ATTRIBUTE *attr = CHECK_OBJECT(2, X509_ATTRIBUTE, "openssl.x509_attribute");
+     int ret = X509_REQ_add1_attr(csr, attr);
+@@ -517,6 +698,11 @@ static LUA_FUNCTION(openssl_csr_attribut
+   return 0;
+ }
+ 
++/***
++get total attribute count in x509_req object
++ at function attr_count
++ at treturn integer
++*/
+ static LUA_FUNCTION(openssl_csr_attr_count)
+ {
+   X509_REQ *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+@@ -553,14 +739,6 @@ static luaL_Reg csr_cfuns[] =
+   {NULL,        NULL  }
+ };
+ 
+-static luaL_Reg R[] =
+-{
+-  {"new",       openssl_csr_new },
+-  {"read",      openssl_csr_read  },
+-
+-  {NULL,    NULL}
+-};
+-
+ int luaopen_x509_req(lua_State *L)
+ {
+   auxiliar_newclass(L, "openssl.x509_req", csr_cfuns);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/dh.c luvi-src-v2.7.6/deps/lua-openssl/src/dh.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/dh.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/dh.c	2019-02-13 11:53:24.275126573 +0100
+@@ -7,19 +7,12 @@
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/dh.h>
++#include <openssl/engine.h>
+ 
+ #define MYNAME    "dh"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-#define lua_boxpointer(L,u) \
+-  (*(void **)(lua_newuserdata(L, sizeof(void *))) = (u))
+-
+-#define PUSH_BN(x)                  \
+-lua_boxpointer(L,x);                \
+-luaL_getmetatable(L,"openssl.bn");  \
+-lua_setmetatable(L,-2)
+-
+ static LUA_FUNCTION(openssl_dh_free)
+ {
+   DH* dh = CHECK_OBJECT(1, DH, "openssl.dh");
+@@ -29,19 +22,45 @@ static LUA_FUNCTION(openssl_dh_free)
+ 
+ static LUA_FUNCTION(openssl_dh_parse)
+ {
++  const BIGNUM *p = NULL, *q = NULL, *g = NULL, *pub = NULL, *pri = NULL;
+   DH* dh = CHECK_OBJECT(1, DH, "openssl.dh");
+   lua_newtable(L);
+-  OPENSSL_PKEY_GET_BN(dh->p, p);
+-  OPENSSL_PKEY_GET_BN(dh->g, g);
+-  OPENSSL_PKEY_GET_BN(dh->priv_key, priv_key);
+-  OPENSSL_PKEY_GET_BN(dh->pub_key, pub_key);
++
++  lua_pushinteger(L, DH_size(dh));
++  lua_setfield(L, -2, "size");
++
++  lua_pushinteger(L, DH_bits(dh));
++  lua_setfield(L, -2, "bits");
++
++  DH_get0_pqg(dh, &p, &q, &g);
++  DH_get0_key(dh, &pub, &pri);
++
++  OPENSSL_PKEY_GET_BN(p, p);
++  OPENSSL_PKEY_GET_BN(q, q);
++  OPENSSL_PKEY_GET_BN(g, g);
++  OPENSSL_PKEY_GET_BN(pub, pub_key);
++  OPENSSL_PKEY_GET_BN(pri, priv_key);
+ 
+   return 1;
+ }
+ 
++static int openssl_dh_set_method(lua_State *L)
++{
++  DH* dh = CHECK_OBJECT(1, DH, "openssl.dh");
++  ENGINE *e = CHECK_OBJECT(2, ENGINE, "openssl.engine");
++  const DH_METHOD *m = ENGINE_get_DH(e);
++  if (m)
++  {
++    int r = DH_set_method(dh, m);
++    return openssl_pushresult(L, r);
++  }
++  return 0;
++}
++
+ static luaL_Reg dh_funs[] =
+ {
+   {"parse",       openssl_dh_parse},
++  {"set_method",  openssl_dh_set_method},
+ 
+   {"__gc",        openssl_dh_free},
+   {"__tostring",  auxiliar_tostring},
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/digest.c luvi-src-v2.7.6/deps/lua-openssl/src/digest.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/digest.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/digest.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,17 +1,27 @@
+-/*=========================================================================*\
+-* digest.c
+-* digest module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++digest module for lua-openssl binding
+ 
++ at module digest
++ at usage
++  digest = require('openssl').digest
++*/
+ #include "openssl.h"
+ #include "private.h"
++#if defined(LIBRESSL_VERSION_NUMBER)
++#include <openssl/engine.h>
++#endif
+ 
+ #define MYNAME    "digest"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++list all support digest algs
++
++ at function list
++ at tparam[opt] boolean alias include alias names for digest alg, default true
++ at treturn[table] all methods
++*/
+ static LUA_FUNCTION(openssl_digest_list)
+ {
+   int aliases = lua_isnoneornil(L, 1) ? 1 : lua_toboolean(L, 1);
+@@ -20,26 +30,43 @@ static LUA_FUNCTION(openssl_digest_list)
+   return 1;
+ };
+ 
++/***
++get evp_digest object
++
++ at function get
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at treturn evp_digest digest object mapping EVP_MD in openssl
++
++ at see evp_digest
++*/
+ static LUA_FUNCTION(openssl_digest_get)
+ {
+-  const EVP_MD* md = get_digest(L, 1);
++  const EVP_MD* md = get_digest(L, 1, NULL);
+ 
+-  if (md)
+-    PUSH_OBJECT((void*)md, "openssl.evp_digest");
+-  else
+-    lua_pushnil(L);
++  PUSH_OBJECT((void*)md, "openssl.evp_digest");
+   return 1;
+ }
+ 
++/***
++get evp_digest_ctx object
++
++ at function new
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at treturn evp_digest_ctx digest object mapping EVP_MD_CTX in openssl
++
++ at see evp_digest_ctx
++*/
+ static LUA_FUNCTION(openssl_digest_new)
+ {
+-  const EVP_MD* md = get_digest(L, 1);
+-  if (md)
++  const EVP_MD* md = get_digest(L, 1, NULL);
++  int ret;
++  ENGINE* e = lua_isnoneornil(L, 2) ? NULL : CHECK_OBJECT(2, ENGINE, "openssl.engine");
++  EVP_MD_CTX* ctx = EVP_MD_CTX_create();
++  if (ctx!=NULL)
+   {
+-    int ret;
+-    ENGINE* e =  (!lua_isnoneornil(L, 2)) ? CHECK_OBJECT(2, ENGINE, "openssl.engine") : NULL;
+-    EVP_MD_CTX* ctx = EVP_MD_CTX_create();
+     EVP_MD_CTX_init(ctx);
++    lua_pushlightuserdata(L, e);
++    lua_rawsetp(L, LUA_REGISTRYINDEX, ctx);
+     ret = EVP_DigestInit_ex(ctx, md, e);
+     if (ret == 1)
+     {
+@@ -50,15 +77,30 @@ static LUA_FUNCTION(openssl_digest_new)
+       EVP_MD_CTX_destroy(ctx);
+       return openssl_pushresult(L, ret);
+     }
+-  }
+-  else
++  }else
+     lua_pushnil(L);
+   return 1;
+ }
+ 
++/***
++quick method to generate digest result
++
++ at function digest
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string msg to compute digest
++ at tparam[opt] boolean raw binary result return if set true, or hex encoded string default
++ at treturn string digest result value
++*/
+ static LUA_FUNCTION(openssl_digest)
+ {
+-  const EVP_MD *md = NULL;
++  const EVP_MD *md;
++  ENGINE *eng;
++  size_t inl;
++  const char* in;
++  unsigned char buf[EVP_MAX_MD_SIZE];
++  unsigned int  blen = sizeof(buf);
++  int raw, status;
++
+   if (lua_istable(L, 1))
+   {
+     if (lua_getmetatable(L, 1) && lua_equal(L, 1, -1))
+@@ -69,45 +111,106 @@ static LUA_FUNCTION(openssl_digest)
+     else
+       luaL_error(L, "call function with invalid state");
+   }
+-  if (lua_isstring(L, 1))
++
++  md = get_digest(L, 1, NULL);
++  in = luaL_checklstring(L, 2, &inl);
++  raw = (lua_isnoneornil(L, 3)) ? 0 : lua_toboolean(L, 3);
++  eng = (lua_isnoneornil(L, 4) ? 0 : CHECK_OBJECT(4, ENGINE, "openssl.engine"));
++
++  status = EVP_Digest(in, inl, buf, &blen, md, eng);
++  if (status)
+   {
+-    md = EVP_get_digestbyname(lua_tostring(L, 1));
++    if (raw)
++      lua_pushlstring(L, (const char*)buf, blen);
++    else
++    {
++      char hex[2 * EVP_MAX_MD_SIZE + 1];
++      to_hex((const char*)buf, blen, hex);
++      lua_pushstring(L, hex);
++    }
+   }
+-  else if (auxiliar_isclass(L, "openssl.evp_digest", 1))
++  else
++    luaL_error(L, "EVP_Digest method fail");
++  return 1;
++};
++
++/***
++create digest object for sign
++
++ at function signInit
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam[opt=nil] engine object
++ at treturn evp_digest_ctx
++*/
++static LUA_FUNCTION(openssl_signInit)
++{
++  const EVP_MD *md = get_digest(L, 1, NULL);
++  EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
++  ENGINE*     e = lua_gettop(L) > 2 ? CHECK_OBJECT(3, ENGINE, "openssl.engine") : NULL;
++  EVP_MD_CTX *ctx = EVP_MD_CTX_create();
++  if (ctx)
+   {
+-    md = CHECK_OBJECT(1, EVP_MD, "openssl.evp_digest");
++    int ret;
++    EVP_MD_CTX_init(ctx);
++    ret = EVP_DigestSignInit(ctx, NULL, md, e, pkey);
++    if (ret)
++    {
++      PUSH_OBJECT(ctx, "openssl.evp_digest_ctx");
++    }
++    else
++      return openssl_pushresult(L, ret);
+   }
+   else
+-    luaL_error(L, "argument #1 must be a string identity digest method or an openssl.evp_digest object");
++    lua_pushnil(L);
++  return 1;
++}
++
++/***
++create digest object for verify
+ 
+-  if (md)
++ at function verifyInit
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam[opt=nil] engine object
++ at treturn evp_digest_ctx
++*/
++static LUA_FUNCTION(openssl_verifyInit)
++{
++  const EVP_MD *md = get_digest(L, 1, NULL);
++  EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
++  ENGINE*     e = lua_gettop(L) > 2 ? CHECK_OBJECT(3, ENGINE, "openssl.engine") : NULL;
++  EVP_PKEY_CTX *pctx = 0;
++  EVP_MD_CTX *ctx = EVP_MD_CTX_create();
++
++  if (ctx)
+   {
+-    size_t inl;
+-    unsigned char buf[EVP_MAX_MD_SIZE];
+-    unsigned int  blen = sizeof(buf);
+-    const char* in = luaL_checklstring(L, 2, &inl);
+-    int raw = (lua_isnoneornil(L, 3)) ? 0 : lua_toboolean(L, 3);
+-    int status = EVP_Digest(in, inl, buf, &blen, md, NULL);
+-    if (status)
++    int ret;
++    EVP_MD_CTX_init(ctx);
++    ret = EVP_DigestVerifyInit(ctx, &pctx, md, e, pkey);
++    if (ret)
+     {
+-      if (raw)
+-        lua_pushlstring(L, (const char*)buf, blen);
+-      else
+-      {
+-        char hex[2 * EVP_MAX_MD_SIZE + 1];
+-        to_hex((const char*) buf, blen, hex);
+-        lua_pushstring(L, hex);
+-      }
++      PUSH_OBJECT(ctx, "openssl.evp_digest_ctx");
+     }
+     else
+-      luaL_error(L, "EVP_Digest method fail");
++      return openssl_pushresult(L, ret);
+   }
+   else
+-    luaL_error(L, "argument #1 is not a valid digest algorithm or openssl.evp_digest object");
++    lua_pushnil(L);
+   return 1;
+-};
++}
+ 
+-/*** evp_digest method ***/
++/***
++openssl.evp_digest object
++ at type evp_digest
++*/
++
++/***
++compute msg digest result
++
++ at function digest
++ at tparam string msg data to digest
++ at tparam[opt] engine, eng
++ at treturn string result a binary hash value for msg
++*/
+ static LUA_FUNCTION(openssl_digest_digest)
+ {
+   size_t inl;
+@@ -128,6 +231,12 @@ static LUA_FUNCTION(openssl_digest_diges
+   return 1;
+ }
+ 
++/***
++get infomation of evp_digest object
++
++ at function info
++ at treturn table info keys include nid,name size,block_size,pkey_type,flags
++*/
+ static LUA_FUNCTION(openssl_digest_info)
+ {
+   EVP_MD *md = CHECK_OBJECT(1, EVP_MD, "openssl.evp_digest");
+@@ -142,10 +251,18 @@ static LUA_FUNCTION(openssl_digest_info)
+   return 1;
+ }
+ 
++/***
++create new evp_digest_ctx
++
++ at function new
++ at tparam[opt] engine, eng
++ at treturn evp_digest_ctx ctx
++ at see evp_digest_ctx
++*/
+ static LUA_FUNCTION(openssl_evp_digest_init)
+ {
+   EVP_MD* md = CHECK_OBJECT(1, EVP_MD, "openssl.evp_digest");
+-  ENGINE*     e = lua_gettop(L) > 1 ? CHECK_OBJECT(2, ENGINE, "openssl.engine") : NULL;
++  ENGINE*     e = lua_isnoneornil(L, 2) ? NULL : CHECK_OBJECT(2, ENGINE, "openssl.engine");
+ 
+   EVP_MD_CTX* ctx = EVP_MD_CTX_create();
+   if (ctx)
+@@ -168,8 +285,33 @@ static LUA_FUNCTION(openssl_evp_digest_i
+   return 1;
+ }
+ 
+-/** openssl.evp_digest_ctx method */
++/***
++create digest object for sign
+ 
++ at function signInit
++ at tparam[opt=nil] engine object
++ at treturn evp_digest_ctx
++*/
++
++/***
++create digest object for verify
++
++ at function verifyInit
++ at tparam[opt=nil] engine object
++ at treturn evp_digest_ctx
++*/
++
++/***
++openssl.evp_digest_ctx object
++ at type evp_digest_ctx
++*/
++
++/***
++get infomation of evp_digest_ctx object
++
++ at function info
++ at treturn table info keys include size,block_size,digest
++*/
+ static LUA_FUNCTION(openssl_digest_ctx_info)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+@@ -182,7 +324,13 @@ static LUA_FUNCTION(openssl_digest_ctx_i
+   return 1;
+ }
+ 
++/***
++feed data to do digest
+ 
++ at function update
++ at tparam string msg data
++ at treturn boolean result true for success
++*/
+ static LUA_FUNCTION(openssl_evp_digest_update)
+ {
+   size_t inl;
+@@ -195,6 +343,14 @@ static LUA_FUNCTION(openssl_evp_digest_u
+   return 1;
+ }
+ 
++/***
++get result of digest
++
++ at function final
++ at tparam[opt] string last last part of data
++ at tparam[opt] boolean raw binary or hex encoded result, default true for binary result
++ at treturn string val hash result
++*/
+ static LUA_FUNCTION(openssl_evp_digest_final)
+ {
+   EVP_MD_CTX* c = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+@@ -248,16 +404,28 @@ static LUA_FUNCTION(openssl_evp_digest_f
+ static LUA_FUNCTION(openssl_digest_ctx_free)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
++  lua_pushnil(L);
++  lua_rawsetp(L, LUA_REGISTRYINDEX, ctx);
+   EVP_MD_CTX_destroy(ctx);
+   return 0;
+ }
+ 
++/***
++reset evp_diget_ctx to reuse
++
++ at function reset
++*/
+ static LUA_FUNCTION(openssl_digest_ctx_reset)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+   const EVP_MD *md = EVP_MD_CTX_md(ctx);
+-  ENGINE* e = ctx->engine;
+-  int ret = EVP_MD_CTX_cleanup(ctx);
++
++  ENGINE* e = NULL;
++  int ret;
++
++  lua_rawgetp(L, LUA_REGISTRYINDEX, ctx);
++  e = (ENGINE*)lua_topointer(L, -1);
++  ret = EVP_MD_CTX_reset(ctx);
+   if (ret)
+   {
+     EVP_MD_CTX_init(ctx);
+@@ -266,6 +434,11 @@ static LUA_FUNCTION(openssl_digest_ctx_r
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++clone evp_diget_ctx
++
++ at function clone
++*/
+ static LUA_FUNCTION(openssl_digest_ctx_clone)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+@@ -289,9 +462,23 @@ static LUA_FUNCTION(openssl_digest_ctx_c
+   return 1;
+ }
+ 
++/***
++retrieve md data
++
++ at function data
++ at treturn string md_data
++*/
++
++/***
++restore md data
++
++ at function data
++ at tparam string md_data
++*/
+ static LUA_FUNCTION(openssl_digest_ctx_data)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   if (lua_isnone(L, 2))
+   {
+     lua_pushlstring(L, ctx->md_data, ctx->digest->ctx_size);
+@@ -308,55 +495,34 @@ static LUA_FUNCTION(openssl_digest_ctx_d
+     else
+       luaL_error(L, "data with wrong data");
+   }
+-
+-  return 0;
+-}
+-
+-static LUA_FUNCTION(openssl_signInit)
+-{
+-  const EVP_MD *md = get_digest(L, 1);
+-  EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  ENGINE*     e = lua_gettop(L) > 2 ? CHECK_OBJECT(3, ENGINE, "openssl.engine") : NULL;
+-  EVP_PKEY_CTX *pctx;
+-  EVP_MD_CTX *ctx = EVP_MD_CTX_create();
+-  if (ctx)
++#else
++  size_t ctx_size = EVP_MD_meth_get_app_datasize(EVP_MD_CTX_md(ctx));
++  if (lua_isnone(L, 2))
+   {
+-    int ret = EVP_DigestSignInit(ctx, &pctx, md, e, pkey);
+-    if (ret)
+-    {
+-      PUSH_OBJECT(ctx, "openssl.evp_digest_ctx");
+-    }
+-    else
+-      return openssl_pushresult(L, ret);
++    lua_pushlstring(L, EVP_MD_CTX_md_data(ctx), ctx_size);
++    return 1;
+   }
+   else
+-    lua_pushnil(L);
+-  return 1;
+-}
+-
+-static LUA_FUNCTION(openssl_verifyInit)
+-{
+-  const EVP_MD *md = get_digest(L, 1);
+-  EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  ENGINE*     e = lua_gettop(L) > 2 ? CHECK_OBJECT(3, ENGINE, "openssl.engine") : NULL;
+-  EVP_PKEY_CTX *pctx = 0;
+-  EVP_MD_CTX *ctx = EVP_MD_CTX_create();
+-  luaL_argcheck(L, !openssl_pkey_is_private(pkey), 2, "need public key");
+-  if (ctx)
+   {
+-    int ret = EVP_DigestVerifyInit(ctx, &pctx, md, e, pkey);
+-    if (ret)
++    const char* d = luaL_checklstring(L, 2, &ctx_size);
++    if (ctx_size == (size_t)EVP_MD_meth_get_app_datasize(EVP_MD_CTX_md(ctx)))
+     {
+-      PUSH_OBJECT(ctx, "openssl.evp_digest_ctx");
++      memcpy(EVP_MD_CTX_md_data(ctx), d, ctx_size);
+     }
+     else
+-      return openssl_pushresult(L, ret);
++      luaL_error(L, "data with wrong data");
+   }
+-  else
+-    lua_pushnil(L);
+-  return 1;
++#endif
++  return 0;
+ }
+ 
++/***
++feed data for sign to get signature
++
++ at function verifyUpdate
++ at tparam string data to be signed
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_signUpdate)
+ {
+   size_t l;
+@@ -367,6 +533,13 @@ static LUA_FUNCTION(openssl_signUpdate)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++feed data for verify with signature
++
++ at function verifyUpdate
++ at tparam string data to be verified
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_verifyUpdate)
+ {
+   size_t l;
+@@ -377,6 +550,13 @@ static LUA_FUNCTION(openssl_verifyUpdate
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get result of sign
++
++ at function signFinal
++ at tparam evp_pkey private key to do sign
++ at treturn string singed result
++*/
+ static LUA_FUNCTION(openssl_signFinal)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+@@ -393,12 +573,19 @@ static LUA_FUNCTION(openssl_signFinal)
+     lua_pushlstring(L, (char *)sigbuf, siglen);
+   }
+   free(sigbuf);
+-  EVP_MD_CTX_cleanup(ctx);
++  EVP_MD_CTX_reset(ctx);
+   if (ret == 1)
+     return 1;
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get verify result
++
++ at function verifyFinal
++ at tparam string signature
++ at treturn boolean result, true for verify pass
++*/
+ static LUA_FUNCTION(openssl_verifyFinal)
+ {
+   EVP_MD_CTX *ctx = CHECK_OBJECT(1, EVP_MD_CTX, "openssl.evp_digest_ctx");
+@@ -409,9 +596,9 @@ static LUA_FUNCTION(openssl_verifyFinal)
+   if (pkey)
+     ret = EVP_VerifyFinal(ctx, (const unsigned char*) signature, signature_len, pkey);
+   else
+-    ret = EVP_DigestVerifyFinal(ctx, (const unsigned char*) signature, signature_len);
++    ret = EVP_DigestVerifyFinal(ctx, (unsigned char*) signature, signature_len);
+ 
+-  EVP_MD_CTX_cleanup(ctx);
++  EVP_MD_CTX_reset(ctx);
+   return openssl_pushresult(L, ret);
+ }
+ 
+@@ -442,7 +629,7 @@ static luaL_Reg digest_ctx_funs[] =
+ 
+   {"signUpdate",  openssl_signUpdate},
+   {"signFinal",   openssl_signFinal},
+-  {"verifyUpdate", openssl_verifyUpdate},
++  {"verifyUpdate",openssl_verifyUpdate},
+   {"verifyFinal", openssl_verifyFinal},
+ 
+   {"__tostring",  auxiliar_tostring},
+@@ -452,13 +639,13 @@ static luaL_Reg digest_ctx_funs[] =
+ 
+ static const luaL_Reg R[] =
+ {
+-  { "__call",     openssl_digest},
+-  { "list",       openssl_digest_list},
+-  { "get",        openssl_digest_get},
+-  { "new",        openssl_digest_new},
+-  { "digest",     openssl_digest},
++  {"__call",     openssl_digest},
++  {"list",       openssl_digest_list},
++  {"get",        openssl_digest_get},
++  {"new",        openssl_digest_new},
++  {"digest",     openssl_digest},
+ 
+-  {"signInit", openssl_signInit},
++  {"signInit",   openssl_signInit},
+   {"verifyInit", openssl_verifyInit},
+ 
+   {NULL,  NULL}
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/dsa.c luvi-src-v2.7.6/deps/lua-openssl/src/dsa.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/dsa.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/dsa.c	2019-02-13 11:53:24.275126573 +0100
+@@ -7,19 +7,12 @@
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/dsa.h>
++#include <openssl/engine.h>
+ 
+ #define MYNAME    "dsa"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-#define lua_boxpointer(L,u) \
+-  (*(void **)(lua_newuserdata(L, sizeof(void *))) = (u))
+-
+-#define PUSH_BN(x)                  \
+-lua_boxpointer(L,x);                \
+-luaL_getmetatable(L,"openssl.bn");  \
+-lua_setmetatable(L,-2)
+-
+ static LUA_FUNCTION(openssl_dsa_free)
+ {
+   DSA* dsa = CHECK_OBJECT(1, DSA, "openssl.dsa");
+@@ -29,19 +22,44 @@ static LUA_FUNCTION(openssl_dsa_free)
+ 
+ static LUA_FUNCTION(openssl_dsa_parse)
+ {
++  const BIGNUM *p = NULL, *q = NULL, *g = NULL, *pub = NULL, *pri = NULL;
+   DSA* dsa = CHECK_OBJECT(1, DSA, "openssl.rsa");
+   lua_newtable(L);
+-  OPENSSL_PKEY_GET_BN(dsa->p, p);
+-  OPENSSL_PKEY_GET_BN(dsa->q, q);
+-  OPENSSL_PKEY_GET_BN(dsa->g, g);
+-  OPENSSL_PKEY_GET_BN(dsa->priv_key, priv_key);
+-  OPENSSL_PKEY_GET_BN(dsa->pub_key, pub_key);
++
++  lua_pushinteger(L, DSA_size(dsa));
++  lua_setfield(L, -2, "size");
++
++  lua_pushinteger(L, DSA_bits(dsa));
++  lua_setfield(L, -2, "bits");
++
++  DSA_get0_pqg(dsa, &p, &q, &g);
++  DSA_get0_key(dsa, &pub, &pri);
++
++  OPENSSL_PKEY_GET_BN(p, p);
++  OPENSSL_PKEY_GET_BN(q, q);
++  OPENSSL_PKEY_GET_BN(g, g);
++  OPENSSL_PKEY_GET_BN(pri, priv_key);
++  OPENSSL_PKEY_GET_BN(pub, pub_key);
+   return 1;
+ }
+ 
++static int openssl_dsa_set_method(lua_State *L)
++{
++  DSA* dsa = CHECK_OBJECT(1, DSA, "openssl.dsa");
++  ENGINE *e = CHECK_OBJECT(2, ENGINE, "openssl.engine");
++  const DSA_METHOD *m = ENGINE_get_DSA(e);
++  if (m)
++  {
++    int r = DSA_set_method(dsa, m);
++    return openssl_pushresult(L, r);
++  }
++  return 0;
++}
++
+ static luaL_Reg dsa_funs[] =
+ {
+   {"parse",       openssl_dsa_parse},
++  {"set_method",  openssl_dsa_set_method},
+ 
+   {"__gc",        openssl_dsa_free},
+   {"__tostring",  auxiliar_tostring},
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/ec.c luvi-src-v2.7.6/deps/lua-openssl/src/ec.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/ec.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/ec.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,25 +1,15 @@
+-/*=========================================================================*\
+-* ec.c
+-* EC routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++ec module for lua-openssl binding
++ at module ec
++*/
+ #include "openssl.h"
+ #include "private.h"
++#include <openssl/engine.h>
+ 
+ #define MYNAME    "ec"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-#define lua_boxpointer(L,u) \
+-  (*(void **)(lua_newuserdata(L, sizeof(void *))) = (u))
+-
+-#define PUSH_BN(x) \
+-lua_boxpointer(L,x);  \
+-luaL_getmetatable(L,"openssl.bn");  \
+-lua_setmetatable(L,-2);
+-
+-
+ #ifndef OPENSSL_NO_EC
+ 
+ static int openssl_ecpoint_affine_coordinates(lua_State *L)
+@@ -57,6 +47,7 @@ static int openssl_eckey_group(lua_State
+   {
+     const EC_POINT* p = EC_GROUP_get0_generator(g);
+     p = EC_POINT_dup(p, g);
++    g = EC_GROUP_dup(g);
+     PUSH_OBJECT(g, "openssl.ec_group");
+     PUSH_OBJECT(p, "openssl.ec_point");
+     return 2;
+@@ -149,6 +140,22 @@ static int openssl_ec_group_asn1_flag(lu
+   return 0;
+ }
+ 
++static point_conversion_form_t openssl_point_conversion_form(lua_State *L, int i, const char* defval)
++{
++  const char* options[] = {"compressed", "uncompressed", "hybrid", NULL};
++  int f = luaL_checkoption(L, 2, defval, options);
++  point_conversion_form_t form = 0;
++  if (f == 0)
++    form = POINT_CONVERSION_COMPRESSED;
++  else if (f == 1)
++    form = POINT_CONVERSION_UNCOMPRESSED;
++  else if (f == 2)
++    form = POINT_CONVERSION_HYBRID;
++  else
++    luaL_argerror(L, i, "not accept value point_conversion_form");
++  return form;
++}
++
+ static int openssl_ec_group_point_conversion_form(lua_State*L)
+ {
+   EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
+@@ -169,16 +176,7 @@ static int openssl_ec_group_point_conver
+   }
+   else if (lua_isstring(L, 2))
+   {
+-    const char* options[] = {"compressed", "uncompressed", "hybrid", NULL};
+-    int f = luaL_checkoption(L, 2, NULL, options);
+-    if (f == 0)
+-      form = POINT_CONVERSION_COMPRESSED;
+-    else if (f == 1)
+-      form = POINT_CONVERSION_UNCOMPRESSED;
+-    else if (f == 2)
+-      form = POINT_CONVERSION_HYBRID;
+-    else
+-      luaL_argerror(L, 2, "not accept value point_conversion_form");
++    form = openssl_point_conversion_form(L, 2, NULL);
+     EC_GROUP_set_point_conversion_form(group, form);
+   }
+   else if (lua_isnumber(L, 2))
+@@ -206,7 +204,7 @@ EC_GROUP* openssl_get_ec_group(lua_State
+   }
+   else if (lua_isuserdata(L, ec_name_idx))
+   {
+-    if (auxiliar_isclass(L, "openssl.evp_pkey", ec_name_idx))
++    if (auxiliar_getclassudata(L, "openssl.evp_pkey", ec_name_idx))
+     {
+       EVP_PKEY* pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+       EC_KEY* ec_key = EVP_PKEY_get1_EC_KEY(pkey);
+@@ -216,7 +214,7 @@ EC_GROUP* openssl_get_ec_group(lua_State
+         EC_KEY_free(ec_key);
+       }
+     }
+-    else if (auxiliar_isclass(L, "openssl.ec_key", ec_name_idx))
++    else if (auxiliar_getclassudata(L, "openssl.ec_key", ec_name_idx))
+     {
+       EC_KEY* ec_key = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
+       g = (EC_GROUP*)EC_KEY_get0_group(ec_key);
+@@ -291,15 +289,131 @@ EC_GROUP* openssl_get_ec_group(lua_State
+   return g;
+ }
+ 
++static int openssl_ec_group_point_new(lua_State *L)
++{
++  EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  EC_POINT* point = EC_POINT_new(group);
++  PUSH_OBJECT(point, "openssl.ec_point");
++  return 1;
++}
++
++static int openssl_ec_point_dup(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  const EC_POINT* point = CHECK_OBJECT(2, EC_POINT, "openssl.ec_point");
++
++  EC_POINT *new = EC_POINT_dup(point, group);
++  PUSH_OBJECT(new, "openssl.ec_point");
++  return 1;
++}
++
++static int openssl_ec_point_oct2point(lua_State *L)
++{
++  const EC_GROUP* group  = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  size_t size = 0;
++  const unsigned char* oct = (const unsigned char*)luaL_checklstring(L, 2, &size);
++  EC_POINT* point  = EC_POINT_new(group);
++
++  int ret = EC_POINT_oct2point(group, point, oct, size, NULL);
++  if(ret==1)
++    PUSH_OBJECT(point, "openssl.ec_point");
++  else
++    ret = openssl_pushresult(L, ret);
++  return ret;
++}
++
++static int openssl_ec_point_point2oct(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  const EC_POINT* point = CHECK_OBJECT(2, EC_POINT, "openssl.ec_point");
++  point_conversion_form_t form = openssl_point_conversion_form(L, 3, NULL);
++  size_t size = EC_POINT_point2oct(group, point, form, NULL, 0, NULL);
++  if(size>0)
++  {
++    unsigned char* oct = (unsigned char*)OPENSSL_malloc(size);
++    size = EC_POINT_point2oct(group, point, form, oct, size, NULL);
++    if(size>0)
++      lua_pushlstring(L, (const char*)oct, size);
++    else
++      lua_pushnil(L);
++    OPENSSL_free(oct);
++    return 1;
++  }
++  return 0;
++}
++
++static int openssl_ec_point_bn2point(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  BIGNUM *bn = CHECK_OBJECT(2, BIGNUM, "openssl.bn");
++  EC_POINT* pnt = EC_POINT_bn2point(group, bn, NULL, NULL);
++  if(pnt)
++    PUSH_OBJECT(pnt, "openssl.ec_point");
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static int openssl_ec_point_point2bn(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  const EC_POINT* point = CHECK_OBJECT(2, EC_POINT, "openssl.ec_point");
++  point_conversion_form_t form = openssl_point_conversion_form(L, 3, NULL);
++
++  BIGNUM *bn = EC_POINT_point2bn(group, point, form, NULL, NULL);
++  if(bn)
++    PUSH_OBJECT(bn, "openssl.bn");
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static int openssl_ec_point_hex2point(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  const char* hex = luaL_checkstring(L, 2);
++
++  EC_POINT* pnt = EC_POINT_hex2point(group, hex, NULL, NULL);
++  if(pnt)
++    PUSH_OBJECT(pnt, "openssl.ec_point");
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static int openssl_ec_point_point2hex(lua_State *L)
++{
++  const EC_GROUP* group = CHECK_OBJECT(1, EC_GROUP, "openssl.ec_group");
++  const EC_POINT* point = CHECK_OBJECT(2, EC_POINT, "openssl.ec_point");
++  point_conversion_form_t form = openssl_point_conversion_form(L, 3, NULL);
++
++  const char* hex = EC_POINT_point2hex(group, point, form, NULL);
++  if(hex)
++    lua_pushstring(L, hex);
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++
+ static luaL_Reg ec_group_funs[] =
+ {
+-  {"__tostring", auxiliar_tostring},
+-  {"affine_coordinates", openssl_ecpoint_affine_coordinates},
+-  {"parse", openssl_ec_group_parse},
+-  {"asn1_flag", openssl_ec_group_asn1_flag},
+-  {"point_conversion_form", openssl_ec_group_point_conversion_form},
++  {"__tostring",            auxiliar_tostring},
++  {"__gc",                  openssl_ec_group_free},
+ 
+-  {"__gc", openssl_ec_group_free},
++  {"affine_coordinates",    openssl_ecpoint_affine_coordinates},
++  {"parse",                 openssl_ec_group_parse},
++  {"asn1_flag",             openssl_ec_group_asn1_flag},
++
++  {"point_conversion_form", openssl_ec_group_point_conversion_form},
++  {"point_new",             openssl_ec_group_point_new},
++  {"point_dup",             openssl_ec_point_dup},
++  {"point2oct",             openssl_ec_point_point2oct},
++  {"oct2point",             openssl_ec_point_oct2point},
++  {"point2bn",              openssl_ec_point_point2bn},
++  {"bn2point",              openssl_ec_point_bn2point},
++  {"point2hex",             openssl_ec_point_point2hex},
++  {"hex2point",             openssl_ec_point_hex2point},
+ 
+   { NULL, NULL }
+ };
+@@ -309,41 +423,89 @@ static int openssl_ecdsa_sign(lua_State*
+ {
+   EC_KEY* ec = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
+   size_t l;
+-  const char* s = luaL_checklstring(L, 2, &l);
+-  ECDSA_SIG* sig = ECDSA_do_sign((const unsigned char*)s, l, ec);
+-  if (sig)
++  const char* sdata = luaL_checklstring(L, 2, &l);
++  ECDSA_SIG* sig = ECDSA_do_sign((const unsigned char*)sdata, l, ec);
++  int der = lua_isnone(L, 3) ? 1 : lua_toboolean(L, 3);
++  int ret = 0;
++
++  if (der)
+   {
+-    PUSH_BN(BN_dup(sig->r));
+-    PUSH_BN(BN_dup(sig->s));
+-    ECDSA_SIG_free(sig);
+-    return 2;
++    unsigned char*p = NULL;
++    l = i2d_ECDSA_SIG(sig, &p);
++    if (l > 0)
++    {
++      lua_pushlstring(L, (const char*)p, l);
++      OPENSSL_free(p);
++      ret = 1;
++    }
+   }
+-  return 0;
++  else
++  {
++    const BIGNUM *r = NULL, *s = NULL;
++    ECDSA_SIG_get0(sig, &r, &s);
++
++    r = BN_dup(r);
++    s = BN_dup(s);
++
++    PUSH_OBJECT(r, "openssl.bn");
++    PUSH_OBJECT(s, "openssl.bn");
++    ret = 2;
++  }
++  ECDSA_SIG_free(sig);
++  return ret;
+ }
+ 
+ static int openssl_ecdsa_verify(lua_State*L)
+ {
+-  size_t l;
++  size_t l, sigl;
+   int ret;
+   EC_KEY* ec = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
+   const char* dgst = luaL_checklstring(L, 2, &l);
+-  BIGNUM *r = CHECK_OBJECT(3, BIGNUM, "openssl.bn");
+-  BIGNUM *s = CHECK_OBJECT(4, BIGNUM, "openssl.bn");
+-
+-  ECDSA_SIG* sig = ECDSA_SIG_new();
+-  BN_copy(sig->r, r);
+-  BN_copy(sig->s, s);
+-
+-  ret = ECDSA_do_verify((const unsigned char*)dgst, l, sig, ec);
+-  if (ret == -1)
+-    lua_pushnil(L);
++  int top = lua_gettop(L);
++  if (top == 3)
++  {
++    const char* s = luaL_checklstring(L, 3, &sigl);
++    ECDSA_SIG* sig = d2i_ECDSA_SIG(NULL, (const unsigned char**)&s, sigl);
++    ret = ECDSA_do_verify((const unsigned char*)dgst, l, sig, ec);
++    if (ret == -1)
++      ret = openssl_pushresult(L, -1);
++    else
++    {
++      lua_pushboolean(L, ret);
++      ret = 1;
++    }
++    ECDSA_SIG_free(sig);
++    return ret;
++  }
+   else
+-    lua_pushboolean(L, ret);
+-  ECDSA_SIG_free(sig);
+-  return 1;
++  {
++    BIGNUM *r = BN_get(L, 3);
++    BIGNUM *s = BN_get(L, 4);
++    ECDSA_SIG* sig = ECDSA_SIG_new();
++    ECDSA_SIG_set0(sig, r, s);
++    ret = ECDSA_do_verify((const unsigned char*)dgst, l, sig, ec);
++    if (ret == -1)
++      ret = openssl_pushresult(L, -1);
++    else
++    {
++      lua_pushboolean(L, ret);
++      ret = 1;
++    }
++    ECDSA_SIG_free(sig);
++    return ret;
++  }
++}
++
++/* ec_point */
++static int openssl_ec_point_copy(lua_State *L)
++{
++  EC_POINT* self = CHECK_OBJECT(1, EC_POINT, "openssl.ec_point");
++  EC_POINT* to = CHECK_OBJECT(2, EC_POINT, "openssl.ec_point");
++  int ret = EC_POINT_copy(to, self);
++  return openssl_pushresult(L, ret);
+ }
+ 
+-static int openssl_ec_point_free(lua_State*L)
++static int openssl_ec_point_free(lua_State *L)
+ {
+   EC_POINT* p = CHECK_OBJECT(1, EC_POINT, "openssl.ec_point");
+   EC_POINT_free(p);
+@@ -398,11 +560,119 @@ static int openssl_ec_key_parse(lua_Stat
+   return 1;
+ };
+ 
++# ifndef OPENSSL_NO_ECDH
++static const int KDF1_SHA1_len = 20;
++static void *KDF1_SHA1(const void *in, size_t inlen, void *out,
++                       size_t *outlen)
++{
++#  ifndef OPENSSL_NO_SHA
++  if (*outlen < SHA_DIGEST_LENGTH)
++    return NULL;
++  else
++    *outlen = SHA_DIGEST_LENGTH;
++  return SHA1(in, inlen, out);
++#  else
++  return NULL;
++#  endif                        /* OPENSSL_NO_SHA */
++}
++# endif                         /* OPENSSL_NO_ECDH */
++
++# define MAX_ECDH_SIZE 256
++
++static int openssl_ecdh_compute_key(lua_State*L)
++{
++  EC_KEY *ec = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
++  EC_KEY *peer = CHECK_OBJECT(2, EC_KEY, "openssl.ec_key");
++
++  int field_size, outlen, secret_size_a;
++  unsigned char secret_a[MAX_ECDH_SIZE];
++  void *(*kdf) (const void *in, size_t inlen, void *out, size_t *xoutlen);
++  field_size =
++    EC_GROUP_get_degree(EC_KEY_get0_group(ec));
++  if (field_size <= 24 * 8)
++  {
++    outlen = KDF1_SHA1_len;
++    kdf = KDF1_SHA1;
++  }
++  else
++  {
++    outlen = (field_size + 7) / 8;
++    kdf = NULL;
++  }
++  secret_size_a =
++    ECDH_compute_key(secret_a, outlen,
++                     EC_KEY_get0_public_key(peer),
++                     ec, kdf);
++  lua_pushlstring(L, (const char*)secret_a, secret_size_a);
++  return 1;
++}
++
++static int openssl_ecdsa_set_method(lua_State *L)
++{
++  EC_KEY *ec = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
++  ENGINE *e = CHECK_OBJECT(2, ENGINE, "openssl.engine");
++#if defined(LIBRESSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER < 0x10100000L
++  const ECDSA_METHOD *m = ENGINE_get_ECDSA(e);
++  if (m)
++  {
++    int r = ECDSA_set_method(ec, m);
++    return openssl_pushresult(L, r);
++  }
++#else
++  const EC_KEY_METHOD *m = ENGINE_get_EC(e);
++  if (m)
++  {
++    int r = EC_KEY_set_method(ec, m);
++    return openssl_pushresult(L, r);
++  }
++#endif
++  return 0;
++}
++
++static int openssl_ec_key_export(lua_State *L)
++{
++  EC_KEY *ec = CHECK_OBJECT(1, EC_KEY, "openssl.ec_key");
++  unsigned char* der = NULL;
++  int len = i2d_ECPrivateKey(ec, &der);
++  if(len>0)
++    lua_pushlstring(L, (const char*)der, len);
++  else
++    lua_pushnil(L);
++  if(der)
++    OPENSSL_free(der);
++  return 1;
++}
++
++static int openssl_ec_key_read(lua_State *L)
++{
++  size_t len = 0;
++  const unsigned char* der = (const unsigned char*)luaL_checklstring(L, 1, &len);
++
++  EC_KEY* ec = d2i_ECPrivateKey(NULL, &der, len);
++  if(ec)
++    PUSH_OBJECT(ec, "openssl.ec_key");
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++#ifdef EC_EXT
++EC_EXT_DEFINE
++#endif
++
+ static luaL_Reg ec_key_funs[] =
+ {
++  {"export",      openssl_ec_key_export},
+   {"parse",       openssl_ec_key_parse},
+   {"sign",        openssl_ecdsa_sign},
+   {"verify",      openssl_ecdsa_verify},
++  {"compute_key", openssl_ecdh_compute_key},
++  {"set_method",  openssl_ecdsa_set_method},
++
++#ifdef EC_EXT
++  EC_EXT
++#endif
++
+   {"__gc",        openssl_ec_key_free},
+   {"__tostring",  auxiliar_tostring},
+ 
+@@ -411,8 +681,9 @@ static luaL_Reg ec_key_funs[] =
+ 
+ static luaL_Reg ec_point_funs[] =
+ {
+-  {"__tostring", auxiliar_tostring},
+-  {"__gc", openssl_ec_point_free},
++  {"__tostring",  auxiliar_tostring},
++  {"__gc",        openssl_ec_point_free},
++  {"copy",        openssl_ec_point_copy},
+ 
+   { NULL, NULL }
+ };
+@@ -452,8 +723,9 @@ static LUA_FUNCTION(openssl_ec_list_curv
+ 
+ static luaL_Reg R[] =
+ {
+-  {"list", openssl_ec_list_curve_name},
+-  {"group", openssl_eckey_group},
++  {"read",     openssl_ec_key_read},
++  {"list",     openssl_ec_list_curve_name},
++  {"group",    openssl_eckey_group},
+ 
+   { NULL, NULL }
+ };
+@@ -462,7 +734,7 @@ int luaopen_ec(lua_State *L)
+ {
+   auxiliar_newclass(L, "openssl.ec_point",   ec_point_funs);
+   auxiliar_newclass(L, "openssl.ec_group",   ec_group_funs);
+-  auxiliar_newclass(L, "openssl.ec_key",   ec_key_funs);
++  auxiliar_newclass(L, "openssl.ec_key",     ec_key_funs);
+ 
+   lua_newtable(L);
+   luaL_setfuncs(L, R, 0);
+@@ -474,4 +746,3 @@ int luaopen_ec(lua_State *L)
+ }
+ 
+ #endif
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/engine.c luvi-src-v2.7.6/deps/lua-openssl/src/engine.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/engine.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/engine.c	2019-02-13 11:53:24.275126573 +0100
+@@ -8,18 +8,28 @@
+ #include <openssl/engine.h>
+ #include "openssl.h"
+ #include "private.h"
++#include <openssl/ssl.h>
+ 
+ enum
+ {
+   TYPE_RSA,
+   TYPE_DSA,
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   TYPE_ECDH,
+   TYPE_ECDSA,
++#else
++  TYPE_EC,
++#endif
+   TYPE_DH,
+   TYPE_RAND,
+-  TYPE_STORE,
+   TYPE_CIPHERS,
+   TYPE_DIGESTS,
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++  TYPE_STORE,
++#else
++  TYPE_PKEY_METHODS,
++  TYPE_PKEY_ASN1_METHODS,
++#endif
+   TYPE_COMPLETE
+ };
+ 
+@@ -140,6 +150,7 @@ static int openssl_engine_register(lua_S
+       else
+         ENGINE_register_DSA(eng);
+       break;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     case TYPE_ECDH:
+       if (unregister)
+         ENGINE_unregister_ECDH(eng);
+@@ -152,6 +163,14 @@ static int openssl_engine_register(lua_S
+       else
+         ENGINE_register_ECDSA(eng);
+       break;
++#else
++    case TYPE_EC:
++      if (unregister)
++        ENGINE_unregister_EC(eng);
++      else
++        ENGINE_register_EC(eng);
++      break;
++#endif
+     case TYPE_DH:
+       if (unregister)
+         ENGINE_unregister_DH(eng);
+@@ -164,12 +183,27 @@ static int openssl_engine_register(lua_S
+       else
+         ENGINE_register_RAND(eng);
+       break;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     case TYPE_STORE:
+       if (unregister)
+         ENGINE_unregister_STORE(eng);
+       else
+         ENGINE_register_STORE(eng);
+       break;
++#else
++    case TYPE_PKEY_METHODS:
++      if (unregister)
++        ENGINE_unregister_pkey_meths(eng);
++      else
++        ENGINE_register_pkey_meths(eng);
++      break;
++    case TYPE_PKEY_ASN1_METHODS:
++      if (unregister)
++        ENGINE_unregister_pkey_asn1_meths(eng);
++      else
++        ENGINE_register_pkey_asn1_meths(eng);
++      break;
++#endif
+     case TYPE_CIPHERS:
+       if (unregister)
+         ENGINE_unregister_ciphers(eng);
+@@ -201,22 +235,20 @@ static int openssl_engine_register(lua_S
+ static int openssl_engine_ctrl(lua_State*L)
+ {
+   ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
+-
++  int ret = 0;
+   if (lua_isnumber(L, 2))
+   {
+     int cmd = luaL_checkint(L, 2);
+     if (lua_isnoneornil(L, 3))
+     {
+-      int ret = ENGINE_cmd_is_executable(eng, cmd);
+-      lua_pushboolean(L, ret);
++      ret = ENGINE_cmd_is_executable(eng, cmd);
+     }
+     else
+     {
+       long i = (long)luaL_checknumber(L, 3);
+       void* p = lua_touserdata(L, 4);
+       void* arg = lua_isnoneornil(L, 5) ? NULL : lua_touserdata(L, 5);
+-      int ret = ENGINE_ctrl(eng, cmd, i, p, arg);
+-      lua_pushboolean(L, ret);
++      ret = ENGINE_ctrl(eng, cmd, i, p, arg);
+     }
+   }
+   else
+@@ -225,27 +257,35 @@ static int openssl_engine_ctrl(lua_State
+     if (lua_isnumber(L, 3))
+     {
+       long i = (long)luaL_checknumber(L, 3);
+-      void* p = lua_touserdata(L, 4);
+-      void* arg = lua_isnoneornil(L, 5) ? NULL : lua_touserdata(L, 5);
+-      int opt = luaL_optint(L, 6, 0);
+-      int ret = ENGINE_ctrl_cmd(eng, cmd, i, p, arg, opt);
+-      lua_pushboolean(L, ret);
++      if (lua_isstring(L, 4))
++      {
++        const char* s = lua_tostring(L, 4);
++        void* arg = lua_isnoneornil(L, 5) ? NULL : lua_touserdata(L, 5);
++        int opt = luaL_optint(L, 6, 0);
++        ret = ENGINE_ctrl_cmd(eng, cmd, i, (void*)s, arg, opt);
++      }
++      else
++      {
++        void* p = lua_touserdata(L, 4);
++        void* arg = lua_isnoneornil(L, 5) ? NULL : lua_touserdata(L, 5);
++        int opt = luaL_optint(L, 6, 0);
++        ret = ENGINE_ctrl_cmd(eng, cmd, i, p, arg, opt);
++      }
+     }
+     else
+     {
+       const char* arg  = luaL_optstring(L, 3, NULL);
+       int opt = luaL_optint(L, 4, 0);
+-      int ret = ENGINE_ctrl_cmd_string(eng, cmd, arg, opt);
+-      lua_pushboolean(L, ret);
++      ret = ENGINE_ctrl_cmd_string(eng, cmd, arg, opt);
+     }
+   }
+-  return 1;
++  return openssl_pushresult(L, ret);
+ }
+ 
+ static int openssl_engine_gc(lua_State*L)
+ {
+   ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
+-  (void*) eng;
++  (void) eng;
+   return 0;
+ }
+ 
+@@ -297,11 +337,11 @@ static int openssl_engine_flags(lua_Stat
+   lua_pushinteger(L, ENGINE_get_flags(eng));
+   return 1;
+ }
++
+ /*
+ int ENGINE_set_ex_data(ENGINE *e, int idx, void *arg);
+ void *ENGINE_get_ex_data(const ENGINE *e, int idx);
+ */
+-
+ static int openssl_engine_init(lua_State*L)
+ {
+   ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
+@@ -310,7 +350,6 @@ static int openssl_engine_init(lua_State
+   return 1;
+ }
+ 
+-
+ static int openssl_engine_finish(lua_State*L)
+ {
+   ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
+@@ -319,7 +358,6 @@ static int openssl_engine_finish(lua_Sta
+   return 1;
+ }
+ 
+-
+ static int openssl_engine_set_default(lua_State*L)
+ {
+   ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
+@@ -340,8 +378,7 @@ static int openssl_engine_set_default(lu
+     }
+     else
+       luaL_error(L, "#2 must be a number or string");
+-    lua_pushboolean(L, ret);
+-    return 1;
++    return openssl_pushresult(L, ret);
+   }
+ 
+   while (first <= top)
+@@ -355,12 +392,18 @@ static int openssl_engine_set_default(lu
+     case TYPE_DSA:
+       ret = ENGINE_set_default_DSA(eng);
+       break;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     case TYPE_ECDH:
+       ret = ENGINE_set_default_ECDH(eng);
+       break;
+     case TYPE_ECDSA:
+       ret = ENGINE_set_default_ECDSA(eng);
+       break;
++#else
++    case TYPE_EC:
++      ret = ENGINE_set_default_EC(eng);
++      break;
++#endif
+     case TYPE_DH:
+       ret = ENGINE_set_default_DH(eng);
+       break;
+@@ -384,36 +427,156 @@ static int openssl_engine_set_default(lu
+       return 1;
+     }
+   }
+-  lua_pushboolean(L, ret);
+-  return 1;
++  return openssl_pushresult(L, ret);
++};
++
++static int openssl_engine_set_rand_engine(lua_State *L)
++{
++  ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
++  int ret = RAND_set_rand_engine(eng);
++  return openssl_pushresult(L, ret);
++}
++
++static int openssl_engine_load_private_key(lua_State *L)
++{
++  ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
++  const char* key_id = luaL_checkstring(L, 2);
++  EVP_PKEY *pkey = ENGINE_load_private_key(eng, key_id, NULL, NULL);
++  if (pkey != NULL)
++  {
++    PUSH_OBJECT(pkey, "openssl.evp_pkey");
++    return 1;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++static int openssl_engine_load_public_key(lua_State *L)
++{
++  ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
++  const char* key_id = luaL_checkstring(L, 2);
++  EVP_PKEY *pkey = ENGINE_load_public_key(eng, key_id, NULL, NULL);
++  if (pkey != NULL)
++  {
++    PUSH_OBJECT(pkey, "openssl.evp_pkey");
++    return 1;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++static int openssl_engine_load_ssl_client_cert(lua_State *L)
++{
++  ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
++  SSL* s = CHECK_OBJECT(2, SSL, "openssl.ssl");
++  STACK_OF(X509_NAME) *ca_dn = SSL_get_client_CA_list(s);
++
++  X509 *pcert = NULL;
++  EVP_PKEY *pkey = NULL;
++  STACK_OF(X509) *pothers = NULL;
++
++  int ret = ENGINE_load_ssl_client_cert(eng, s, ca_dn,
++                                        &pcert, &pkey, &pothers, NULL, NULL);
++  if (ret == 1)
++  {
++    PUSH_OBJECT(pcert, "openssl.x509");
++    if (pkey != NULL)
++    {
++      PUSH_OBJECT(pkey, "openssl.pkey");
++      ret++;
++    }
++    if (pothers != NULL)
++    {
++      openssl_sk_x509_totable(L, pothers);
++      ret++;
++    }
++    return ret;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++struct _engine_exdata
++{
++  int l;
++  unsigned char p[1];
+ };
+ 
++static int openssl_engine_ex_data(lua_State *L)
++{
++  ENGINE* eng = CHECK_OBJECT(1, ENGINE, "openssl.engine");
++  int idx;
++  int ret;
++  if (lua_isnoneornil(L, 2))
++  {
++    idx = ENGINE_get_ex_new_index(0, NULL, NULL, NULL, NULL);
++    if (idx == -1)
++    {
++      lua_pushnil(L);
++      return 1;
++    }
++    lua_pushinteger(L, idx);
++    return 1;
++  }
++  idx = luaL_checkinteger(L, 2);
++  if (lua_isnoneornil(L, 3))
++  {
++    void *p = ENGINE_get_ex_data(eng, idx);
++    if (p)
++    {
++      struct _engine_exdata *ex = p;
++      lua_pushlstring(L, (const char*)ex->p, ex->l);
++    }
++    else
++      lua_pushnil(L);
++    return 1;
++  }
++  else
++  {
++    size_t l;
++    const char *s = luaL_checklstring(L, 3, &l);
++    struct _engine_exdata *ex = OPENSSL_malloc(sizeof(struct _engine_exdata)+l);
++    ex->l = l;
++    memcpy(ex->p, s, l);
++    ret = ENGINE_set_ex_data(eng, idx, ex);
++    if (ret != 1)
++    {
++      OPENSSL_free(ex);
++      lua_pushnil(L);
++    }
++    else
++      lua_pushboolean(L, 1);
++    return 1;
++  }
++}
++
+ static luaL_Reg eng_funcs[] =
+ {
+   {"next",      openssl_engine_next},
+   {"prev",      openssl_engine_prev},
+   {"add",       openssl_engine_add},
+-  {"remove",      openssl_engine_remove},
+-  {"register",    openssl_engine_register},
++  {"remove",    openssl_engine_remove},
++  {"register",  openssl_engine_register},
+   {"ctrl",      openssl_engine_ctrl},
+   {"id",        openssl_engine_id},
+   {"name",      openssl_engine_name},
+   {"flags",     openssl_engine_flags},
+ 
+-  {"init",      openssl_engine_init},
+-  {"finish",      openssl_engine_finish},
++  {"ex_data",               openssl_engine_ex_data},
++  {"set_rand_engine",       openssl_engine_set_rand_engine},
++  {"load_private_key",      openssl_engine_load_private_key},
++  {"load_public_key",       openssl_engine_load_public_key },
++  {"load_ssl_client_cert",  openssl_engine_load_ssl_client_cert},
++
++  {"init",          openssl_engine_init},
++  {"finish",        openssl_engine_finish},
+   {"set_default",   openssl_engine_set_default},
+ 
+-  {"__gc",      openssl_engine_gc},
++  {"__gc",          openssl_engine_gc},
+   {"__tostring",    auxiliar_tostring},
+ 
+   {NULL,      NULL},
+ };
+ 
+-
+ int openssl_register_engine(lua_State* L)
+ {
+   auxiliar_newclass(L, "openssl.engine", eng_funcs);
+   return 0;
+ }
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/hmac.c luvi-src-v2.7.6/deps/lua-openssl/src/hmac.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/hmac.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/hmac.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,33 +1,127 @@
+-/*=========================================================================*\
+-* hamc.c
+-* hamc module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++hamc module for lua-openssl binding
+ 
++ at module hmac
++ at author  george zhao <zhaozg(at)gmail.com>
++ at usage
++  hamc = require('openssl').hmac
++*/
+ #include "openssl.h"
+ #include "private.h"
+-#include <openssl/hmac.h>
+ 
+ #define MYNAME    "hmac"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++get hamc_ctx object
++
++ at function new
++ at tparam string|integer|asn1_object alg name, nid or object identity
++ at tparam string key secret key
++ at tparam[opt] engine engine, nothing with default engine
++ at treturn hamc_ctx hmac object mapping HMAC_CTX in openssl
++
++ at see hmac_ctx
++*/
+ static int openssl_hmac_new(lua_State *L)
+ {
+-  const EVP_MD *type = get_digest(L, 1);
++  const EVP_MD *type = get_digest(L, 1, NULL);
+   size_t l;
+   const char *k = luaL_checklstring(L, 2, &l);
+   ENGINE* e = lua_isnoneornil(L, 3) ? NULL : CHECK_OBJECT(3, ENGINE, "openssl.engine");
+ 
+-  HMAC_CTX *c = OPENSSL_malloc(sizeof(HMAC_CTX));
+-  HMAC_CTX_init(c);
++  HMAC_CTX *c = HMAC_CTX_new();
+   HMAC_Init_ex(c, k, (int)l, type, e);
+   PUSH_OBJECT(c, "openssl.hmac_ctx");
+ 
+   return 1;
+ }
+ 
++static int openssl_hmac_free(lua_State *L)
++{
++  HMAC_CTX *c = CHECK_OBJECT(1, HMAC_CTX, "openssl.hmac_ctx");
++  if(!c)
++    return 0;
++  HMAC_CTX_free(c);
++  FREE_OBJECT(1);
++  return 0;
++}
++
++/***
++compute hmac one step, in module openssl.hamc
++
++ at function hmac
++ at tparam evp_digest|string|nid digest digest alg identity
++ at tparam string message
++ at tparam string key
++ at treturn string result binary string
++*/
++/***
++alias for hmac
++
++ at function digest
++ at tparam evp_digest|string|nid digest digest alg identity
++ at tparam string message
++ at tparam string key
++ at treturn string result binary string
++*/
++static int openssl_hmac(lua_State *L)
++{
++  if (lua_istable(L, 1))
++  {
++    if (lua_getmetatable(L, 1) && lua_equal(L, 1, -1))
++    {
++      lua_pop(L, 1);
++      lua_remove(L, 1);
++    }
++    else
++      luaL_error(L, "call function with invalid state");
++  }
++  {
++
++    const EVP_MD *type = get_digest(L, 1, NULL);
++    size_t len;
++    const char *dat = luaL_checklstring(L, 2, &len);
++    size_t l;
++    const char *k = luaL_checklstring(L, 3, &l);
++    int raw = (lua_isnoneornil(L, 4)) ? 0 : lua_toboolean(L, 4);
++    ENGINE* e = lua_isnoneornil(L, 5) ? NULL : CHECK_OBJECT(5, ENGINE, "openssl.engine");
++
++    unsigned char digest[EVP_MAX_MD_SIZE];
++
++    HMAC_CTX *c = HMAC_CTX_new();
++    HMAC_Init_ex(c, k, (int)l, type, e);
++
++    HMAC_Update(c, (unsigned char *)dat, len);
++    len = EVP_MAX_MD_SIZE;
++    HMAC_Final(c, digest, (unsigned int*)&len);
++
++    HMAC_CTX_free(c);
++
++    if (raw)
++      lua_pushlstring(L, (char *)digest, len);
++    else
++    {
++      char hex[2 * EVP_MAX_MD_SIZE + 1];
++      to_hex((const char*)digest, len, hex);
++      lua_pushstring(L, hex);
++    }
++  }
++  return 1;
++}
++
++/***
++openssl.hmac_ctx object
++ at type hmac_ctx
++*/
++
++/***
++feed data to do digest
++
++ at function update
++ at tparam string msg data
++*/
+ static int openssl_hmac_update(lua_State *L)
+ {
+   HMAC_CTX *c = CHECK_OBJECT(1, HMAC_CTX, "openssl.hmac_ctx");
+@@ -38,6 +132,14 @@ static int openssl_hmac_update(lua_State
+   return 0;
+ }
+ 
++/***
++get result of hmac
++
++ at function final
++ at tparam[opt] string last last part of data
++ at tparam[opt] boolean raw binary or hex encoded result, default true for binary result
++ at treturn string val hash result
++*/
+ static int openssl_hmac_final(lua_State *L)
+ {
+   HMAC_CTX *c = CHECK_OBJECT(1, HMAC_CTX, "openssl.hmac_ctx");
+@@ -70,6 +172,11 @@ static int openssl_hmac_final(lua_State
+   return 1;
+ }
+ 
++/***
++reset hmac_ctx to reuse
++
++ at function reset
++*/
+ static int openssl_hmac_reset(lua_State *L)
+ {
+   HMAC_CTX *c = CHECK_OBJECT(1, HMAC_CTX, "openssl.hmac_ctx");
+@@ -77,61 +184,6 @@ static int openssl_hmac_reset(lua_State
+   return openssl_pushresult(L, ret);
+ }
+ 
+-static int openssl_hmac_free(lua_State *L)
+-{
+-  HMAC_CTX *c = CHECK_OBJECT(1, HMAC_CTX, "openssl.hmac_ctx");
+-  HMAC_CTX_cleanup(c);
+-  OPENSSL_free(c);
+-  return 0;
+-}
+-
+-static int openssl_hmac(lua_State *L)
+-{
+-  if (lua_istable(L, 1))
+-  {
+-    if (lua_getmetatable(L, 1) && lua_equal(L, 1, -1))
+-    {
+-      lua_pop(L, 1);
+-      lua_remove(L, 1);
+-    }
+-    else
+-      luaL_error(L, "call function with invalid state");
+-  }
+-  {
+-
+-    const EVP_MD *type = get_digest(L, 1);
+-    size_t len;
+-    const char *dat = luaL_checklstring(L, 2, &len);
+-    size_t l;
+-    const char *k = luaL_checklstring(L, 3, &l);
+-    int raw = (lua_isnoneornil(L, 4)) ? 0 : lua_toboolean(L, 4);
+-    ENGINE* e = lua_isnoneornil(L, 5) ? NULL : CHECK_OBJECT(5, ENGINE, "openssl.engine");
+-
+-    unsigned char digest[EVP_MAX_MD_SIZE];
+-
+-    HMAC_CTX ctx;
+-    HMAC_CTX *c = &ctx;
+-    HMAC_CTX_init(c);
+-    HMAC_Init_ex(c, k, (int)l, type, e);
+-
+-    HMAC_Update(c, (unsigned char *)dat, len);
+-    len = EVP_MAX_MD_SIZE;
+-    HMAC_Final(c, digest, (unsigned int*)&len);
+-
+-    HMAC_CTX_cleanup(c);
+-
+-    if (raw)
+-      lua_pushlstring(L, (char *)digest, len);
+-    else
+-    {
+-      char hex[2 * EVP_MAX_MD_SIZE + 1];
+-      to_hex((const char*)digest, len, hex);
+-      lua_pushstring(L, hex);
+-    }
+-  }
+-  return 1;
+-}
+-
+ static luaL_Reg hmac_ctx_funs[] =
+ {
+   {"update",  openssl_hmac_update},
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/lbn.c luvi-src-v2.7.6/deps/lua-openssl/src/lbn.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/lbn.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/lbn.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,9 +1,10 @@
+-/*
+-* lbn.c
+-* big-number library for Lua 5.1 based on OpenSSL bn
+-* Luiz Henrique de Figueiredo <lhf@tecgraf.puc-rio.br>
+-* 11 Nov 2010 22:56:45
+-* This code is hereby placed in the public domain.
++/***
++big-number library for Lua 5.1 based on OpenSSL bn
++
++ at module bn
++ at author Luiz Henrique de Figueiredo <lhf@tecgraf.puc-rio.br>
++ at license This code is hereby placed in the public domain.
++ at warning verson 11 Nov 2010 22:56:45
+ */
+ 
+ #include <stdlib.h>
+@@ -22,17 +23,11 @@
+ 
+ #include "private.h"
+ 
+-#define lua_boxpointer(L,u) \
+-  (*(void **)(lua_newuserdata(L, sizeof(void *))) = (u))
+-
+ #define MYNAME    "bn"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2010 / "\
+       "based on OpenSSL " SHLIB_VERSION_NUMBER
+ #define MYTYPE    "openssl.bn"
+ 
+-
+-static BN_CTX *ctx = NULL;
+-
+ static void error(lua_State *L, const char *message)
+ {
+   luaL_error(L, "(bn) %s %s", message, ERR_reason_error_string(ERR_get_error()));
+@@ -42,9 +37,7 @@ static BIGNUM *Bnew(lua_State *L)
+ {
+   BIGNUM *x = BN_new();
+   if (x == NULL) error(L, "BN_new failed");
+-  lua_boxpointer(L, x);
+-  luaL_getmetatable(L, MYTYPE);
+-  lua_setmetatable(L, -2);
++  PUSH_BN(x);
+   return x;
+ }
+ 
+@@ -183,7 +176,9 @@ static int Bsqr(lua_State *L)     /** sq
+ {
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_sqr(c, a, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -236,7 +231,9 @@ static int Bmul(lua_State *L)     /** mu
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mul(c, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -246,7 +243,9 @@ static int Bdiv(lua_State *L)     /** di
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *q = Bnew(L);
+   BIGNUM *r = NULL;
++  BN_CTX *ctx = BN_CTX_new();
+   BN_div(q, r, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -256,7 +255,9 @@ static int Bmod(lua_State *L)     /** mo
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *q = NULL;
+   BIGNUM *r = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_div(q, r, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -265,7 +266,9 @@ static int Brmod(lua_State *L)      /**
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *r = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_nnmod(r, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -275,7 +278,9 @@ static int Bdivmod(lua_State *L)    /**
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *q = Bnew(L);
+   BIGNUM *r = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_div(q, r, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 2;
+ }
+ 
+@@ -284,7 +289,9 @@ static int Bgcd(lua_State *L)     /** gc
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_gcd(c, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -293,7 +300,9 @@ static int Bpow(lua_State *L)     /** po
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_exp(c, a, b, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -303,7 +312,9 @@ static int Baddmod(lua_State *L)    /**
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *m = Bget(L, 3);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_add(c, a, b, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -313,7 +324,9 @@ static int Bsubmod(lua_State *L)    /**
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *m = Bget(L, 3);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_sub(c, a, b, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -323,7 +336,9 @@ static int Bmulmod(lua_State *L)    /**
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *m = Bget(L, 3);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_mul(c, a, b, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -333,7 +348,9 @@ static int Bpowmod(lua_State *L)    /**
+   BIGNUM *b = Bget(L, 2);
+   BIGNUM *m = Bget(L, 3);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_exp(c, a, b, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -342,7 +359,9 @@ static int Bsqrmod(lua_State *L)    /**
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *m = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_sqr(c, a, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -351,7 +370,9 @@ static int Binvmod(lua_State *L)    /**
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *m = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_inverse(c, a, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -360,7 +381,9 @@ static int Bsqrtmod(lua_State *L)   /**
+   BIGNUM *a = Bget(L, 1);
+   BIGNUM *m = Bget(L, 2);
+   BIGNUM *c = Bnew(L);
++  BN_CTX *ctx = BN_CTX_new();
+   BN_mod_sqrt(c, a, m, ctx);
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -387,7 +410,9 @@ static int Bisprime(lua_State *L)   /**
+ {
+   int checks = luaL_optint(L, 2, BN_prime_checks);
+   BIGNUM *a = Bget(L, 1);
++  BN_CTX *ctx = BN_CTX_new();
+   lua_pushboolean(L, BN_is_prime_fasttest_ex(a, checks, ctx, 1, NULL));
++  BN_CTX_free(ctx);
+   return 1;
+ }
+ 
+@@ -450,7 +475,6 @@ static const luaL_Reg R[] =
+ 
+ int luaopen_bn(lua_State *L)
+ {
+-  ctx = BN_CTX_new();
+   ERR_load_BN_strings();
+   RAND_seed(MYVERSION, sizeof(MYVERSION));
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/lhash.c luvi-src-v2.7.6/deps/lua-openssl/src/lhash.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/lhash.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/lhash.c	2019-02-13 11:53:24.275126573 +0100
+@@ -8,6 +8,7 @@
+ #include "private.h"
+ #include <openssl/conf.h>
+ 
++#if 0
+ static void table2data(lua_State*L, int idx, BIO* bio)
+ {
+   lua_pushnil(L);
+@@ -27,6 +28,7 @@ static void table2data(lua_State*L, int
+     lua_pop(L, 1);
+   }
+ }
++#endif
+ 
+ static LUA_FUNCTION(openssl_lhash_read)
+ {
+@@ -44,7 +46,6 @@ static LUA_FUNCTION(openssl_lhash_read)
+     lua_pushfstring(L, "ERROR at LINE %d", eline);
+     return luaL_argerror(L, 1, lua_tostring(L, -1));
+   }
+-  return 0;
+ }
+ 
+ 
+@@ -128,19 +129,25 @@ static void dump_value_doall_arg(CONF_VA
+     }
+   }
+ }
+-#if OPENSSL_VERSION_NUMBER >= 0x10000002L
++
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && defined(LIBRESSL_VERSION_NUMBER)==0
++IMPLEMENT_LHASH_DOALL_ARG_CONST(CONF_VALUE, lua_State);
++#elif OPENSSL_VERSION_NUMBER >= 0x10000002L
+ static IMPLEMENT_LHASH_DOALL_ARG_FN(dump_value, CONF_VALUE, lua_State)
+ #endif
++#if defined(LIBRESSL_VERSION_NUMBER)==0
+ #define LHM_lh_doall_arg(type, lh, fn, arg_type, arg) \
+   lh_doall_arg(CHECKED_LHASH_OF(type, lh), fn, CHECKED_PTR_OF(arg_type, arg))
+-
++#endif
+ 
+ static LUA_FUNCTION(openssl_lhash_parse)
+ {
+   LHASH* lhash = CHECK_OBJECT(1, LHASH, "openssl.lhash");
+ 
+   lua_newtable(L);
+-#if OPENSSL_VERSION_NUMBER >= 0x10000002L
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && defined(LIBRESSL_VERSION_NUMBER)==0
++  lh_CONF_VALUE_doall_lua_State(lhash, dump_value_doall_arg, L);
++#elif OPENSSL_VERSION_NUMBER >= 0x10000002L
+   lh_CONF_VALUE_doall_arg(lhash, LHASH_DOALL_ARG_FN(dump_value), lua_State, L);
+ #else
+   lh_doall_arg(lhash, (LHASH_DOALL_ARG_FN_TYPE)dump_value_doall_arg, L);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/misc.c luvi-src-v2.7.6/deps/lua-openssl/src/misc.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/misc.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/misc.c	2019-02-13 11:53:24.275126573 +0100
+@@ -25,10 +25,10 @@ BIO* load_bio_object(lua_State* L, int i
+     /* read only */
+     bio = (BIO*)BIO_new_mem_buf((void*)ctx, l);
+   }
+-  else if (auxiliar_isclass(L, "openssl.bio", idx))
++  else if (auxiliar_getclassudata(L, "openssl.bio", idx))
+   {
+     bio = CHECK_OBJECT(idx, BIO, "openssl.bio");
+-    CRYPTO_add(&bio->references, 1, CRYPTO_LOCK_BIO);
++    BIO_up_ref(bio);
+   }
+   else
+     luaL_argerror(L, idx, "only support string or openssl.bio");
+@@ -39,29 +39,40 @@ int  bio_is_der(BIO* bio)
+ {
+   byte head[1];
+   int len = BIO_read(bio, head, sizeof(head));
+-  BIO_reset(bio);
++  (void)BIO_reset(bio);
+   if (len == sizeof(head) && head[0] == 0x30)
+-  {
+     return 1;
+-  }
+ 
+   return 0;
+ }
+ 
+-const EVP_MD* get_digest(lua_State* L, int idx)
++const EVP_MD* get_digest(lua_State* L, int idx, const char* def_alg)
+ {
+   const EVP_MD* md = NULL;
+-  if (lua_isstring(L, idx))
++  switch (lua_type(L, idx))
++  {
++  case LUA_TSTRING:
+     md = EVP_get_digestbyname(lua_tostring(L, idx));
+-  else if (lua_isnumber(L, idx))
++    break;
++  case LUA_TNUMBER:
+     md = EVP_get_digestbynid(lua_tointeger(L, idx));
+-  else if (auxiliar_isclass(L, "openssl.asn1_object", idx))
+-    md = EVP_get_digestbyobj(CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object"));
+-  else if (auxiliar_isclass(L, "openssl.evp_digest", idx))
+-    md = CHECK_OBJECT(idx, EVP_MD, "openssl.evp_digest");
+-  else
++    break;
++  case LUA_TUSERDATA:
++    if (auxiliar_getclassudata(L, "openssl.asn1_object", idx))
++      md = EVP_get_digestbyobj(CHECK_OBJECT(idx, ASN1_OBJECT, "openssl.asn1_object"));
++    else if (auxiliar_getclassudata(L, "openssl.evp_digest", idx))
++      md = CHECK_OBJECT(idx, EVP_MD, "openssl.evp_digest");
++    break;
++  case LUA_TNONE:
++  case LUA_TNIL:
++    if (def_alg != NULL)
++      md = EVP_get_digestbyname(def_alg);
++    break;
++  }
++
++  if (md==NULL)
+   {
+-    luaL_error(L, "argument #1 must be a string, NID number or asn1_object identity digest method");
++    luaL_argerror(L, idx, "must be a string, NID number or asn1_object identity digest method");
+   }
+ 
+   return md;
+@@ -70,20 +81,30 @@ const EVP_MD* get_digest(lua_State* L, i
+ const EVP_CIPHER* get_cipher(lua_State*L, int idx, const char* def_alg)
+ {
+   const EVP_CIPHER* cipher = NULL;
+-  if (lua_isstring(L, idx))
++
++  switch (lua_type(L, idx))
++  {
++  case LUA_TSTRING:
+     cipher = EVP_get_cipherbyname(lua_tostring(L, idx));
+-  else if (lua_isnumber(L, idx))
++    break;
++  case LUA_TNUMBER:
+     cipher = EVP_get_cipherbynid(lua_tointeger(L, idx));
+-  else if (auxiliar_isclass(L, "openssl.asn1_object", idx))
+-    cipher = EVP_get_cipherbyobj(CHECK_OBJECT(1, ASN1_OBJECT, "openssl.asn1_object"));
+-  else if (auxiliar_isclass(L, "openssl.evp_cipher", idx))
+-    cipher = CHECK_OBJECT(idx, EVP_CIPHER, "openssl.evp_cipher");
+-  else if (lua_isnoneornil(L, idx) && def_alg)
+-    cipher = EVP_get_cipherbyname(def_alg);
+-  else
++    break;
++  case LUA_TUSERDATA:
++    if (auxiliar_getclassudata(L, "openssl.asn1_object", idx))
++      cipher = EVP_get_cipherbyobj(CHECK_OBJECT(idx, ASN1_OBJECT, "openssl.asn1_object"));
++    else if (auxiliar_getclassudata(L, "openssl.evp_cipher", idx))
++      cipher = CHECK_OBJECT(idx, EVP_CIPHER, "openssl.evp_cipher");
++    break;
++  case LUA_TNONE:
++  case LUA_TNIL:
++    if (def_alg != NULL)
++      cipher = EVP_get_cipherbyname(def_alg);
++    break;
++  }
++
++  if (cipher==NULL)
+     luaL_argerror(L, idx, "must be a string, NID number or asn1_object identity cipher method");
+-  if (cipher == NULL)
+-    luaL_argerror(L, idx, "not valid cipher alg");
+ 
+   return cipher;
+ }
+@@ -105,6 +126,11 @@ BIGNUM *BN_get(lua_State *L, int i)
+   }
+   case LUA_TUSERDATA:
+     BN_copy(x, CHECK_OBJECT(i, BIGNUM, "openssl.bn"));
++    break;
++  case LUA_TNIL:
++    BN_free(x);
++    x = NULL;
++    break;
+   }
+   return x;
+ }
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/ocsp.c luvi-src-v2.7.6/deps/lua-openssl/src/ocsp.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/ocsp.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/ocsp.c	2019-02-13 11:53:24.275126573 +0100
+@@ -36,7 +36,7 @@ static int openssl_ocsp_request_new(lua_
+     ASN1_BIT_STRING *ikey = X509_get0_pubkey_bitstr(issuer);
+ 
+     OCSP_CERTID *id = NULL;
+-    OCSP_ONEREQ *one;
++    OCSP_ONEREQ *one = NULL;
+     char buf[1024];
+     int nonce = lua_gettop(L) > 2 ? auxiliar_checkboolean(L, 3) : 0;
+     req = OCSP_REQUEST_new();
+@@ -48,7 +48,7 @@ static int openssl_ocsp_request_new(lua_
+       for (i = 1; i <= len; i++)
+       {
+         lua_rawgeti(L, 2, i);
+-        if (auxiliar_isclass(L, "openssl.x509", -1))
++        if (auxiliar_getclassudata(L, "openssl.x509", -1))
+         {
+           X509 *cert = CHECK_OBJECT(2, X509, "openssl.x509");
+           id = OCSP_cert_to_id(NULL, cert, issuer);
+@@ -65,18 +65,32 @@ static int openssl_ocsp_request_new(lua_
+           {
+             id = OCSP_cert_id_new(EVP_sha1(), iname, ikey, sno);
+             one = OCSP_request_add0_id(req, id);
+-          };
++          }
+           ASN1_INTEGER_free(sno);
+           BIO_free(bio);
+         }
++        if (!one)
++        {
++          OCSP_CERTID_free(id);
++          OCSP_REQUEST_free(req);
++          req = NULL;
++          lua_pop(L, 1);
++          break;
++        }
+         lua_pop(L, 1);
+       }
+     }
+-    else if (auxiliar_isclass(L, "openssl.x509", 2))
++    else if (auxiliar_getclassudata(L, "openssl.x509", 2))
+     {
+       X509 *cert = CHECK_OBJECT(2, X509, "openssl.x509");
+       id = OCSP_cert_to_id(NULL, cert, issuer);
+       one = OCSP_request_add0_id(req, id);
++      if (!one)
++      {
++        OCSP_CERTID_free(id);
++        OCSP_REQUEST_free(req);
++        req = NULL;
++      }
+     }
+     else
+     {
+@@ -87,7 +101,13 @@ static int openssl_ocsp_request_new(lua_
+       {
+         id = OCSP_cert_id_new(EVP_sha1(), iname, ikey, sno);
+         one = OCSP_request_add0_id(req, id);
+-      };
++        if (!one)
++        {
++          OCSP_CERTID_free(id);
++          OCSP_REQUEST_free(req);
++          req = NULL;
++        }
++      }
+       ASN1_INTEGER_free(sno);
+       BIO_free(bio);
+     }
+@@ -108,15 +128,12 @@ static int openssl_ocsp_request_new(lua_
+ static int openssl_ocsp_request_export(lua_State*L)
+ {
+   OCSP_REQUEST *req = CHECK_OBJECT(1, OCSP_REQUEST, "openssl.ocsp_request");
+-  int pem = 1;
++  int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
+   int ret = 0;
+   BIO* bio;
+   BUF_MEM *buf;
+-  if (lua_gettop(L) > 1)
+-    pem = auxiliar_checkboolean(L, 2);
+ 
+   bio = BIO_new(BIO_s_mem());
+-  /*
+   if (pem)
+   {
+     ret = PEM_write_bio_OCSP_REQUEST(bio, req);
+@@ -125,8 +142,6 @@ static int openssl_ocsp_request_export(l
+   {
+     ret = i2d_OCSP_REQUEST_bio(bio, req);
+   }
+-  */
+-  ret = i2d_OCSP_REQUEST_bio(bio, req);
+   if (ret)
+   {
+     BIO_get_mem_ptr(bio, &buf);
+@@ -153,8 +168,6 @@ static int openssl_ocsp_request_sign(lua
+   int ret;
+   int sflags = 0;
+ 
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 3, "must be private key");
+-
+   if (lua_isnoneornil(L, 4))
+   {
+     sflags = OCSP_NOCERTS;
+@@ -172,16 +185,47 @@ static int openssl_ocsp_request_sign(lua
+   return 1;
+ }
+ 
++static int openssl_push_ocsp_certid(lua_State*L, OCSP_CERTID* cid)
++{
++  ASN1_OCTET_STRING *iNameHash = NULL;
++  ASN1_OBJECT *md = NULL;
++  ASN1_OCTET_STRING *ikeyHash = NULL;
++  ASN1_INTEGER *serial = NULL;
++
++  int ret = OCSP_id_get0_info(&iNameHash, &md, &ikeyHash, &serial, cid);
++  if (ret == 1)
++  {
++    lua_newtable(L);
++
++    PUSH_ASN1_OCTET_STRING(L, iNameHash);
++    lua_setfield(L, -2, "issuerNameHash");
++
++    PUSH_ASN1_OCTET_STRING(L, ikeyHash);
++    lua_setfield(L, -2, "issuerKeyHash");
++
++    PUSH_ASN1_INTEGER(L, serial);
++    lua_setfield(L, -2, "serialNumber");
++
++    PUSH_OBJECT(md, "openssl.asn1_object");
++    lua_setfield(L, -2, "hashAlgorithm");
++  }
++  else
++    lua_pushnil(L);
++  return 1;
++}
+ 
+ static int openssl_ocsp_request_parse(lua_State*L)
+ {
+   OCSP_REQUEST *req = CHECK_OBJECT(1, OCSP_REQUEST, "openssl.ocsp_request");
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   OCSP_REQINFO *inf = req->tbsRequest;
+   OCSP_SIGNATURE *sig = req->optionalSignature;
+-
++#endif
+   BIO* bio = BIO_new(BIO_s_mem());
+   int i, num;
+   lua_newtable(L);
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   AUXILIAR_SET(L, -1, "version", ASN1_INTEGER_get(inf->version), integer);
+   if (inf->requestorName)
+   {
+@@ -189,39 +233,33 @@ static int openssl_ocsp_request_parse(lu
+     lua_setfield(L, -2, "requestorName");
+   }
+   num = sk_OCSP_ONEREQ_num(inf->requestList);
++#endif
++
++  num = OCSP_request_onereq_count(req);
+   lua_newtable(L);
+   for (i = 0; i < num; i++)
+   {
+-    OCSP_ONEREQ *one = sk_OCSP_ONEREQ_value(inf->requestList, i);
+-    OCSP_CERTID *a = one->reqCert;
+-    lua_newtable(L);
+-    {
+-      openssl_push_x509_algor(L, a->hashAlgorithm);
+-      lua_setfield(L, -2, "hashAlgorithm");
+-
+-      PUSH_ASN1_OCTET_STRING(L, a->issuerNameHash);
+-      lua_setfield(L, -2, "issuerNameHash");
+-
+-      PUSH_ASN1_OCTET_STRING(L, a->issuerKeyHash);
+-      lua_setfield(L, -2, "issuerKeyHash");
+-
+-      PUSH_ASN1_INTEGER(L, a->serialNumber);
+-      lua_setfield(L, -2, "serialNumber");
+-    }
++    OCSP_ONEREQ *one = OCSP_request_onereq_get0(req, i);
++    OCSP_CERTID *cid = OCSP_onereq_get0_id(one);
++    openssl_push_ocsp_certid(L, cid);
+     lua_rawseti(L, -2, i + 1);
+   }
+   lua_setfield(L, -2, "requestList");
+ 
+-  if (inf->requestExtensions)
++  num = OCSP_REQUEST_get_ext_count(req);
++  lua_newtable(L);
++  for (i = 0; i < num; i++)
+   {
+-    lua_pushstring(L, "extensions");
+-    openssl_sk_x509_extension_totable(L, inf->requestExtensions);
+-    lua_rawset(L, -3);
++    X509_EXTENSION* e = OCSP_REQUEST_get_ext(req, i);
++    PUSH_OBJECT(e, "openssl.x509_extension");
++    lua_rawseti(L, -2, i + 1);
+   }
++  lua_setfield(L, -2, "extensions");
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   if (sig)
+   {
+-    BIO_reset(bio);
++    (void)BIO_reset(bio);
+     X509_signature_print(bio, sig->signatureAlgorithm, sig->signature);
+     for (i = 0; i < sk_X509_num(sig->certs); i++)
+     {
+@@ -229,7 +267,7 @@ static int openssl_ocsp_request_parse(lu
+       PEM_write_bio_X509(bio, sk_X509_value(sig->certs, i));
+     }
+   }
+-
++#endif
+   BIO_free(bio);
+   return 1;
+ }
+@@ -268,7 +306,6 @@ static int openssl_ocsp_response(lua_Sta
+ 
+     int i, id_count, type;
+     BIO* bio = NULL;
+-    luaL_argcheck(L, openssl_pkey_is_private(rkey), 4, "must be private key");
+ 
+     type = lua_type(L, 5);
+     if (type != LUA_TFUNCTION && type != LUA_TTABLE)
+@@ -305,7 +342,7 @@ static int openssl_ocsp_response(lua_Sta
+       if (lua_istable(L, 5))
+       {
+         BUF_MEM *buf;
+-        BIO_reset(bio);
++        (void)BIO_reset(bio);
+         i2a_ASN1_INTEGER(bio, serial);
+ 
+         BIO_get_mem_ptr(bio, &buf);
+@@ -406,15 +443,12 @@ static int openssl_ocsp_response(lua_Sta
+ static int openssl_ocsp_response_export(lua_State*L)
+ {
+   OCSP_RESPONSE *res = CHECK_OBJECT(1, OCSP_RESPONSE, "openssl.ocsp_response");
+-  int pem = 1;
++  int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
+   int ret = 0;
+   BIO* bio;
+   BUF_MEM *buf;
+-  if (lua_gettop(L) > 1)
+-    pem = auxiliar_checkboolean(L, 2);
+ 
+   bio = BIO_new(BIO_s_mem());
+-  /*
+   if (pem)
+   {
+     ret = PEM_write_bio_OCSP_RESPONSE(bio, res);
+@@ -423,8 +457,6 @@ static int openssl_ocsp_response_export(
+   {
+     ret = i2d_OCSP_RESPONSE_bio(bio, res);
+   }
+-  */
+-  ret = i2d_OCSP_RESPONSE_bio(bio, res);
+   if (ret)
+   {
+     BIO_get_mem_ptr(bio, &buf);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/openssl.c luvi-src-v2.7.6/deps/lua-openssl/src/openssl.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/openssl.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/openssl.c	2019-02-13 11:53:24.275126573 +0100
+@@ -1,10 +1,11 @@
+-/*=========================================================================*\
+-* openssl.c
+-* lua-openssl binding
+-*
+-* This product includes PHP software, freely available from <http://www.php.net/software/>
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++lua-openssl binding, provide openssl base function in lua.
++
++ at module openssl
++ at usage
++  openssl = require('openssl')
++*/
++
+ #include "openssl.h"
+ #include <openssl/ssl.h>
+ #include <openssl/asn1.h>
+@@ -12,6 +13,12 @@
+ #include <openssl/opensslconf.h>
+ #include "private.h"
+ 
++/***
++get lua-openssl version
++ at function version
++ at tparam[opt] boolean format result will be number when set true, or string
++ at treturn lua-openssl version, lua version, openssl version
++*/
+ static int openssl_version(lua_State*L)
+ {
+   int num = lua_isnoneornil(L, 1) ? 0 : auxiliar_checkboolean(L, 1);
+@@ -20,7 +27,6 @@ static int openssl_version(lua_State*L)
+     lua_pushinteger(L, LOPENSSL_VERSION_NUM);
+     lua_pushinteger(L, LUA_VERSION_NUM);
+     lua_pushinteger(L, OPENSSL_VERSION_NUMBER);
+-
+   }
+   else
+   {
+@@ -31,6 +37,13 @@ static int openssl_version(lua_State*L)
+   return 3;
+ }
+ 
++/***
++hex encode or decode string
++ at function hex
++ at tparam string str
++ at tparam[opt=true] boolean encode true to encoed, false to decode
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_hex)
+ {
+   size_t l = 0;
+@@ -59,6 +72,14 @@ static LUA_FUNCTION(openssl_hex)
+   return 1;
+ }
+ 
++/***
++base64 encode or decode
++ at function base64
++ at tparam string|bio input
++ at tparam[opt=true] boolean encode true to encoed, false to decode
++ at tparam[opt=true] boolean NO_NL true with newline, false without newline
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_base64)
+ {
+   BIO *inp = load_bio_object(L, 1);
+@@ -75,7 +96,7 @@ static LUA_FUNCTION(openssl_base64)
+     BIO_push(b64, out);
+     BIO_get_mem_ptr(inp, &mem);
+     BIO_write(b64, mem->data, mem->length);
+-    BIO_flush(b64);
++    (void)BIO_flush(b64);
+   }
+   else
+   {
+@@ -84,7 +105,7 @@ static LUA_FUNCTION(openssl_base64)
+     BIO_push(b64, inp);
+     while ((inlen = BIO_read(b64, inbuf, 512)) > 0)
+       BIO_write(out, inbuf, inlen);
+-    BIO_flush(out);
++    (void)BIO_flush(out);
+   }
+ 
+   BIO_get_mem_ptr(out, &mem);
+@@ -108,6 +129,12 @@ static void list_callback(const OBJ_NAME
+   lua_rawseti(L, -2, idx + 1);
+ }
+ 
++/***
++get method names
++ at function list
++ at tparam string type support 'cipher','digests','pkeys','comps'
++ at treturn table as array
++*/
+ static LUA_FUNCTION(openssl_list)
+ {
+   static int options[] =
+@@ -124,6 +151,22 @@ static LUA_FUNCTION(openssl_list)
+   return 1;
+ }
+ 
++/***
++get last or given error infomation
++
++Most lua-openssl function or methods return nil or false when error or
++failed, followed by string type error _reason_ and number type error _code_,
++_code_ can pass to openssl.error() to get more error information.
++
++ at function error
++ at tparam[opt] number error, default use ERR_get_error() return value
++ at tparam[opt=false] boolean clear the current thread's error queue.
++ at treturn number errcode
++ at treturn string reason
++ at treturn string library name
++ at treturn string function name
++ at treturn boolean is this is fatal error
++*/
+ static LUA_FUNCTION(openssl_error_string)
+ {
+   unsigned long val;
+@@ -159,13 +202,21 @@ static LUA_FUNCTION(openssl_error_string
+   return ret;
+ }
+ 
++/***
++load rand seed from file
++ at function rand_load
++ at tparam[opt=nil] string file path to laod seed, default opensl management
++ at treturn boolean result
++*/
+ static int openssl_random_load(lua_State*L)
+ {
+   const char *file = luaL_optstring(L, 1, NULL);
+   char buffer[MAX_PATH];
++  int len;
+ 
+   if (file == NULL)
+     file = RAND_file_name(buffer, sizeof buffer);
++#ifndef OPENSSL_NO_EGD
+   else if (RAND_egd(file) > 0)
+   {
+     /* we try if the given filename is an EGD socket.
+@@ -173,8 +224,9 @@ static int openssl_random_load(lua_State
+     lua_pushboolean(L, 1);
+     return 1;
+   }
+-
+-  if (file == NULL || !RAND_load_file(file, 2048))
++#endif
++  len = luaL_optinteger(L, 2, 2048);
++  if (file == NULL || !RAND_load_file(file, len))
+   {
+     return openssl_pushresult(L, 0);
+   }
+@@ -183,25 +235,39 @@ static int openssl_random_load(lua_State
+   return 1;
+ }
+ 
++/***
++save rand seed to file
++ at function rand_write
++ at tparam[opt=nil] string file path to save seed, default openssl management
++ at treturn bool result
++*/
+ static int openssl_random_write(lua_State *L)
+ {
+   const char *file = luaL_optstring(L, 1, NULL);
+   char buffer[MAX_PATH];
+-  int n;
+ 
+-  if (!file && !(file = RAND_file_name(buffer, sizeof buffer)))
++  if (file == NULL && (file = RAND_file_name(buffer, sizeof buffer)) == NULL)
+     return openssl_pushresult(L, 0);
+ 
+-  n = RAND_write_file(file);
++  RAND_write_file(file);
+   return openssl_pushresult(L, 1);
+ }
+ 
++/***
++get random generator state
++ at function rand_status
++ at tparam boolean result true for sucess
++*/
+ static int openssl_random_status(lua_State *L)
+ {
+   lua_pushboolean(L, RAND_status());
+   return 1;
+ }
+ 
++/***
++cleanup random genrator
++ at function rand_cleanup
++*/
+ static int openssl_random_cleanup(lua_State *L)
+ {
+   (void) L;
+@@ -209,6 +275,13 @@ static int openssl_random_cleanup(lua_St
+   return 0;
+ }
+ 
++/***
++get random bytes
++ at function random
++ at tparam number length
++ at tparam[opt=false] boolean strong true to generate strong randome bytes
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_random_bytes)
+ {
+   long length = luaL_checkint(L, 1);
+@@ -251,6 +324,42 @@ static LUA_FUNCTION(openssl_random_bytes
+   return 1;
+ }
+ 
++/***
++set FIPS mode
++ at function FIPS_mode
++ at tparam boolean fips true enable FIPS mode, false disable it.
++ at treturn boolean success
++*/
++
++/***
++get FIPS mode
++ at function FIPS_mode
++ at treturn boolean return true when FIPS mode enabled, false when FIPS mode disabled.
++*/
++static int openssl_fips_mode(lua_State *L)
++{
++#if defined(LIBRESSL_VERSION_NUMBER)
++  return 0;
++#else
++  int ret =0, on = 0;
++  if(lua_isnone(L, 1))
++  {
++    on = FIPS_mode();
++    lua_pushboolean(L, on);
++    return 1;
++  }
++
++  on = auxiliar_checkboolean(L, 1);
++  ret = FIPS_mode_set(on);
++  if(ret)
++    lua_pushboolean(L, ret);
++  else
++    ret = openssl_pushresult(L, ret);
++  return ret;
++#endif
++}
++
++#ifndef OPENSSL_NO_CRYPTO_MDEBUG
+ static int openssl_mem_leaks(lua_State*L)
+ {
+   BIO *bio = BIO_new(BIO_s_mem());
+@@ -263,15 +372,23 @@ static int openssl_mem_leaks(lua_State*L
+   BIO_free(bio);
+   return 1;
+ }
++#endif
+ 
++/***
++get openssl engine object
++ at function engine
++ at tparam string engine_id
++ at treturn engine
++*/
+ static const luaL_Reg eay_functions[] =
+ {
+   {"version",     openssl_version},
+   {"list",        openssl_list},
+   {"hex",         openssl_hex},
+   {"base64",      openssl_base64},
++#ifndef OPENSSL_NO_CRYPTO_MDEBUG
+   {"mem_leaks",   openssl_mem_leaks},
+-
++#endif
+   {"rand_status", openssl_random_status},
+   {"rand_load",   openssl_random_load},
+   {"rand_write",  openssl_random_write},
+@@ -280,6 +397,7 @@ static const luaL_Reg eay_functions[] =
+ 
+   {"error",       openssl_error_string},
+   {"engine",      openssl_engine},
++  {"FIPS_mode",   openssl_fips_mode},
+ 
+   {NULL, NULL}
+ };
+@@ -289,10 +407,46 @@ void CRYPTO_thread_setup(void);
+ void CRYPTO_thread_cleanup(void);
+ #endif
+ 
++static int luaclose_openssl(lua_State *L)
++{
++#if !defined(LIBRESSL_VERSION_NUMBER)
++  FIPS_mode_set(0);
++#endif
++#if defined(OPENSSL_THREADS)
++  CRYPTO_thread_cleanup();
++#endif
++  CRYPTO_set_locking_callback(NULL);
++  CRYPTO_set_id_callback(NULL);
++
++  ENGINE_cleanup();
++  CONF_modules_unload(1);
++
++  ERR_free_strings();
++  EVP_cleanup();
++
++  CRYPTO_cleanup_all_ex_data();
++#ifndef OPENSSL_NO_CRYPTO_MDEBUG
++#if !(defined(OPENSSL_NO_STDIO) || defined(OPENSSL_NO_FP_API))
++#if defined(LIBRESSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER < 0x10101000L
++  CRYPTO_mem_leaks_fp(stderr);
++#else
++  if(CRYPTO_mem_leaks_fp(stderr)!=1)
++  {
++    fprintf(stderr,
++            "Please report a bug on https://github.com/zhaozg/lua-openssl."
++            "And if can, please provide a reproduce method and minimal code.\n"
++            "\n\tThank You.");
++  }
++#endif
++#endif /* OPENSSL_NO_STDIO or OPENSSL_NO_FP_API */
++#endif /* OPENSSL_NO_CRYPTO_MDEBUG */
++  return 0;
++}
++
+ LUALIB_API int luaopen_openssl(lua_State*L)
+ {
+-  static int init = 0;
+-  if (init == 0)
++  static void* init = NULL;
++  if (init == NULL)
+   {
+ #if defined(OPENSSL_THREADS)
+     CRYPTO_thread_setup();
+@@ -309,15 +463,26 @@ LUALIB_API int luaopen_openssl(lua_State
+     ENGINE_load_dynamic();
+     ENGINE_load_openssl();
+ #ifdef LOAD_ENGINE_CUSTOM
+-    LOAD_ENGINE_CUSTOM();
++    LOAD_ENGINE_CUSTOM
+ #endif
+ #ifdef OPENSSL_SYS_WINDOWS
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     RAND_screen();
+ #endif
+-    init = 1;
++#endif
+   }
+ 
+   lua_newtable(L);
++  if(init==NULL)
++  {
++    init = lua_newuserdata(L, sizeof(int));
++    lua_newtable(L);
++    lua_pushcfunction(L, luaclose_openssl);
++    lua_setfield(L, -2, "__gc");
++    lua_setmetatable(L, -2);
++    lua_setfield(L, -2, "__guard");
++  }
++
+   luaL_setfuncs(L, eay_functions, 0);
+ 
+   openssl_register_lhash(L);
+@@ -382,6 +547,11 @@ LUALIB_API int luaopen_openssl(lua_State
+   luaopen_dh(L);
+   lua_setfield(L, -2, "dh");
+ 
++#ifndef OPENSSL_NO_SRP
++  luaopen_srp(L);
++  lua_setfield(L, -2, "srp");
++#endif
++
+ #ifdef ENABLE_OPENSSL_GLOBAL
+   lua_pushvalue(L, -1);
+   lua_setglobal(L, "openssl");
+@@ -389,4 +559,3 @@ LUALIB_API int luaopen_openssl(lua_State
+ 
+   return 1;
+ }
+-
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/openssl.h luvi-src-v2.7.6/deps/lua-openssl/src/openssl.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/openssl.h	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/openssl.h	2019-02-13 11:53:24.275126573 +0100
+@@ -11,6 +11,7 @@
+ #include <lualib.h>
+ #include <lauxlib.h>
+ #include "auxiliar.h"
++#include "subsidiar.h"
+ 
+ #include <assert.h>
+ #include <string.h>
+@@ -26,7 +27,8 @@
+ #include <openssl/pkcs12.h>
+ #include <openssl/opensslv.h>
+ #include <openssl/bn.h>
+-
++#include <openssl/hmac.h>
++#include <openssl/ts.h>
+ 
+ /*-
+ * Numeric release version identifier:
+@@ -42,19 +44,16 @@
+ * 0.9.3a         0x0090301f
+ * 0.9.4          0x0090400f
+ * 1.2.3z         0x102031af
+-*
+-* For continuity reasons (because 0.9.5 is already out, and is coded
+-* 0x00905100), between 0.9.5 and 0.9.6 the coding of the patch level
+-* part is slightly different, by setting the highest bit.  This means
+-* that 0.9.5a looks like this: 0x0090581f.  At 0.9.6, we can start
+-* with 0x0090600S...
+-*
+-* (Prior to 0.9.3-dev a different scheme was used: 0.9.2b is 0x0922.)
+-* (Prior to 0.9.5a beta1, a different scheme was used: MMNNFFRBB for
+-*  major minor fix final patch/beta)
+ */
+-#define LOPENSSL_VERSION_NUM  0x00500001
+-#define LOPENSSL_VERSION  "0.5.1"
++
++/*History
++  2017-04-18  update to 0.7.1
++  2017-08-04  update to 0.7.3
++*/
++
++/*                              MNNFFPPS  */
++#define LOPENSSL_VERSION_NUM  0x00703000
++#define LOPENSSL_VERSION  "0.7.3"
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+ #include <openssl/lhash.h>
+@@ -78,14 +77,13 @@ __pragma(warning(pop))
+ /* Common */
+ #include <time.h>
+ #ifndef MAX_PATH
+-#define MAX_PATH PATH_MAX
++#define MAX_PATH 260
+ #endif
+ 
+ #ifdef NETWARE
+ #define timezone _timezone  /* timezone is called _timezone in LibC */
+ #endif
+ 
+-
+ #ifdef WIN32
+ #define snprintf _snprintf
+ #ifndef strcasecmp
+@@ -93,8 +91,13 @@ __pragma(warning(pop))
+ #endif
+ #endif
+ 
+-#define LUA_FUNCTION(X) int X(lua_State *L)
++#ifdef _MSC_VER
++# ifndef inline
++#  define inline __inline
++# endif
++#endif
+ 
++#define LUA_FUNCTION(X) int X(lua_State *L)
+ 
+ int openssl_s2i_revoke_reason(const char*s);
+ 
+@@ -127,6 +130,25 @@ void openssl_add_method(const OBJ_NAME *
+ #define CHECK_OBJECT(n,type,name) *(type**)auxiliar_checkclass(L,name,n)
+ #define CHECK_GROUP(n,type,name)  *(type**)auxiliar_checkgroup(L,name,n)
+ 
++static inline void* openssl_getclass(lua_State *L, const char* name, int idx)
++{
++  void **p = (void**)auxiliar_getclassudata(L, name, idx);
++  if(p)
++    return *p;
++  return NULL;
++}
++
++static inline void* openssl_getgroup(lua_State *L, const char* name, int idx)
++{
++  void **p = (void**)auxiliar_getgroupudata(L, name, idx);
++  if(p)
++    return *p;
++  return NULL;
++}
++
++#define GET_OBJECT(n,type,name) ((type*)openssl_getclass(L,name,n))
++#define GET_GROUP(n,type,name)  ((type*)openssl_getgroup(L,name,n))
++
+ #define PUSH_OBJECT(o, tname)                                   \
+   MULTI_LINE_MACRO_BEGIN                                        \
+   if(o) {                                                       \
+@@ -135,8 +157,11 @@ void openssl_add_method(const OBJ_NAME *
+   } else lua_pushnil(L);                                        \
+   MULTI_LINE_MACRO_END
+ 
++#define FREE_OBJECT(i)  (*(void**)lua_touserdata(L, i) = NULL)
++
+ int openssl_register_lhash(lua_State* L);
+ int openssl_register_engine(lua_State* L);
+ 
+-#endif
++LUA_FUNCTION(luaopen_srp);
+ 
++#endif
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/ots.c luvi-src-v2.7.6/deps/lua-openssl/src/ots.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/ots.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/ots.c	2019-02-13 11:53:24.298459641 +0100
+@@ -1,9 +1,10 @@
+-/*=========================================================================*\
+-* ots.c
+-* timestamp module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++timestamp module for lua-openssl binding
++create and manage x509 certificate sign request
++ at module ts
++ at usage
++  ts = require'openssl'.ts
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include <stdint.h>
+@@ -14,6 +15,202 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++create a new ts_req object.
++ at function req_new
++ at tparam[opt=1] integer version
++ at treturn ts_req timestamp sign request object
++ at see ts_req
++*/
++static LUA_FUNCTION(openssl_ts_req_new)
++{
++  TS_REQ *ts_req = TS_REQ_new();
++  long version = luaL_optinteger(L, 1, 1);
++
++  int ret = TS_REQ_set_version(ts_req, version);
++  if (ret == 1)
++  {
++    PUSH_OBJECT(ts_req, "openssl.ts_req");
++    return 1;
++  }
++  TS_REQ_free(ts_req);
++  return 0;
++}
++
++/***
++read ts_req object from string or bio data
++ at function req_read
++ at tparam string|bio input
++ at treturn ts_req timestamp sign request object
++ at see ts_req
++*/
++static LUA_FUNCTION(openssl_ts_req_read)
++{
++  BIO *in = load_bio_object(L, 1);
++  TS_REQ *ts_req = d2i_TS_REQ_bio(in, NULL);
++  BIO_free(in);
++  if (ts_req)
++  {
++    PUSH_OBJECT(ts_req, "openssl.ts_req");
++    return 1;
++  }
++  return 0;
++}
++
++/***
++read ts_resp object from string or bio input
++ at function resp_read
++ at tparam string|bio input
++ at treturn ts_resp object
++*/
++static LUA_FUNCTION(openssl_ts_resp_read)
++{
++  BIO* in = load_bio_object(L, 1);
++  TS_RESP *res = d2i_TS_RESP_bio(in, NULL);
++  BIO_free(in);
++  if (res)
++  {
++    PUSH_OBJECT(res, "openssl.ts_resp");
++  }
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++/***
++create ts_resp_ctx object
++ at function resp_ctx_new
++ at tparam[opt] x509 signer timestamp certificate
++ at tparam[opt] evp_pkey pkey private key to sign ts_req
++ at tparam[opt] asn1_object|string|nid identity for default policy object
++ at treturn ts_resp_ctx object
++*/
++static LUA_FUNCTION(openssl_ts_resp_ctx_new)
++{
++  TS_RESP_CTX* ctx = TS_RESP_CTX_new();
++  int i = 0;
++  int n = lua_gettop(L);
++  X509 *signer = NULL;
++  EVP_PKEY *pkey = NULL;
++  ASN1_OBJECT *obj = NULL;
++  int ret = 1;
++
++  for (i = 1; i <= n; i++)
++  {
++    if (auxiliar_getclassudata(L, "openssl.x509", i))
++    {
++      signer = CHECK_OBJECT(i, X509, "openssl.x509");
++    }
++    else if (auxiliar_getclassudata(L, "openssl.evp_pkey", i))
++    {
++      pkey = CHECK_OBJECT(i, EVP_PKEY, "openssl.evp_pkey");
++    }
++    else if (auxiliar_getclassudata(L, "openssl.asn1_object", i))
++    {
++      obj = CHECK_OBJECT(i, ASN1_OBJECT, "openssl.asn1_object");
++    }
++    else if (lua_isnumber(L, i) || lua_isstring(L, i))
++    {
++      int nid = openssl_get_nid(L, i);
++      luaL_argcheck(L, nid != NID_undef, i, "invalid asn1_object or object id");
++      obj = OBJ_nid2obj(nid);
++    }
++    else
++      luaL_argerror(L, i, "not accept parameter");
++  }
++  if (signer && pkey)
++  {
++    ret = X509_check_private_key(signer, pkey);
++    if (ret != 1)
++    {
++      luaL_error(L, "singer cert and private key not match");
++    }
++  }
++  if (ret == 1 && obj != NULL)
++    ret = TS_RESP_CTX_set_def_policy(ctx, obj);
++
++  if (ret == 1 && signer)
++    ret = TS_RESP_CTX_set_signer_cert(ctx, signer);
++  if (ret == 1 && pkey)
++    ret = TS_RESP_CTX_set_signer_key(ctx, pkey);
++
++  if (ret == 1)
++  {
++    PUSH_OBJECT(ctx, "openssl.ts_resp_ctx");
++    openssl_newvalue(L, ctx);
++  }
++  else
++  {
++    TS_RESP_CTX_free(ctx);
++    ctx = NULL;
++    lua_pushnil(L);
++  }
++  return 1;
++}
++
++/***
++create ts_verify_ctx object
++ at function verify_ctx_new
++ at tparam[opt=nil] string|ts_req reqdata
++ at treturn ts_verify_ctx object
++*/
++static LUA_FUNCTION(openssl_ts_verify_ctx_new)
++{
++  TS_VERIFY_CTX *ctx = NULL;
++  if (lua_isnone(L, 1))
++  {
++    ctx = TS_VERIFY_CTX_new();
++  }
++  else if (lua_isstring(L, 1))
++  {
++    BIO* bio = load_bio_object(L, 1);
++    TS_REQ* req = d2i_TS_REQ_bio(bio, NULL);
++    BIO_free(bio);
++    if (req)
++    {
++      ctx = TS_REQ_to_TS_VERIFY_CTX(req, NULL);
++      TS_REQ_free(req);
++    }
++    else
++    {
++      luaL_argerror(L, 1, "must be ts_req data or object or nil");
++    }
++  }
++  else
++  {
++    TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
++    ctx = TS_REQ_to_TS_VERIFY_CTX(req, NULL);
++  }
++  if (ctx)
++  {
++    PUSH_OBJECT(ctx, "openssl.ts_verify_ctx");
++  }
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static luaL_Reg R[] =
++{
++  {"req_new",         openssl_ts_req_new},
++  {"req_read",        openssl_ts_req_read},
++  {"resp_read",       openssl_ts_resp_read},
++
++  {"resp_ctx_new",    openssl_ts_resp_ctx_new },
++  {"verify_ctx_new",  openssl_ts_verify_ctx_new },
++
++  {NULL,    NULL}
++};
++
++/***
++openssl.ts_req object
++ at type ts_req
++*/
++/***
++make a clone of ts_req object
++ at function dup
++ at treturn ts_req
++*/
+ static int openssl_ts_req_dup(lua_State*L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -22,6 +219,17 @@ static int openssl_ts_req_dup(lua_State*
+   return 1;
+ }
+ 
++/***
++get cert_req
++ at function cert_req
++ at treturn boolean true for set or not
++*/
++/***
++set cert_req
++ at function cert_req
++ at tparam boolean cert_req
++ at treturn boolean result
++*/
+ static int openssl_ts_req_cert_req(lua_State *L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -38,6 +246,17 @@ static int openssl_ts_req_cert_req(lua_S
+   }
+ }
+ 
++/***
++get nonce
++ at function nonce
++ at treturn bn openssl.bn object
++*/
++/***
++set nonce
++ at tparam string|bn nonce
++ at treturn boolean result
++ at function nonce
++*/
+ static int openssl_ts_req_nonce(lua_State*L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -61,6 +280,17 @@ static int openssl_ts_req_nonce(lua_Stat
+   }
+ }
+ 
++/***
++get policy_id
++ at function policy_id
++ at treturn asn1_object
++*/
++/***
++set policy_id
++ at function policy_id
++ at tparam asn1_object|number id  identity for asn1_object
++ at treturn boolean result
++*/
+ static int openssl_ts_req_policy_id(lua_State*L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -68,21 +298,39 @@ static int openssl_ts_req_policy_id(lua_
+   {
+     ASN1_OBJECT* obj = TS_REQ_get_policy_id(req);
+     openssl_push_asn1object(L, obj);
+-    ASN1_OBJECT_free(obj);
+     return 1;
+   }
+   else
+   {
+-    int nid = openssl_get_nid(L, 2);
+-    ASN1_OBJECT* obj;
++    ASN1_OBJECT* obj = NULL;
+     int ret;
+-    luaL_argcheck(L, nid != NID_undef, 2, "must be asn1_object object identified");
+-    obj = OBJ_nid2obj(nid);
++    if (auxiliar_getclassudata(L, "openssl.asn1_object", 2))
++    {
++      obj = CHECK_OBJECT(2, ASN1_OBJECT, "openssl.asn1_object");
++    }
++    else
++    {
++      int nid = openssl_get_nid(L, 2);
++      luaL_argcheck(L, nid != NID_undef, 2, "must be asn1_object object identified");
++      obj = OBJ_nid2obj(nid);
++    }
++
+     ret = TS_REQ_set_policy_id(req, obj);
+     return openssl_pushresult(L, ret);
+   }
+ }
+ 
++/***
++get version
++ at treturn integer
++ at function version
++*/
++/***
++set version
++ at tparam integer version
++ at treturn boolean result
++ at function version
++*/
+ static int openssl_ts_req_version(lua_State*L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -99,6 +347,19 @@ static int openssl_ts_req_version(lua_St
+   }
+ }
+ 
++/***
++get msg_imprint
++ at function msg_imprint
++ at treturn string octet octet string
++ at treturn table with algorithm and paramater
++*/
++/***
++set msg_imprint
++ at function msg_imprint
++ at tparam string data digest value of message
++ at tparam[opt='sha'] string|evp_md md_alg
++ at treturn boolean result
++*/
+ static int openssl_ts_req_msg_imprint(lua_State*L)
+ {
+   TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -110,9 +371,8 @@ static int openssl_ts_req_msg_imprint(lu
+       ASN1_OCTET_STRING *s = TS_MSG_IMPRINT_get_msg(msg);
+       X509_ALGOR *a = TS_MSG_IMPRINT_get_algo(msg);
+       PUSH_ASN1_OCTET_STRING(L, s);
+-      openssl_push_x509_algor(L, a);
+-      ASN1_OCTET_STRING_free(s);
+-      X509_ALGOR_free(a);
++      a = X509_ALGOR_dup(a);
++      PUSH_OBJECT(a, "openssl.x509_algor");
+       return 2;
+     }
+     return 1;
+@@ -121,9 +381,7 @@ static int openssl_ts_req_msg_imprint(lu
+   {
+     size_t size;
+     const char* data = luaL_checklstring(L, 2, &size);
+-    const EVP_MD* md = lua_isnoneornil(L, 3)
+-                       ? EVP_get_digestbyname("sha1")
+-                       : get_digest(L, 3);
++    const EVP_MD* md = get_digest(L, 3, "sha256");
+     TS_MSG_IMPRINT *msg = TS_MSG_IMPRINT_new();
+     int ret = TS_MSG_IMPRINT_set_msg(msg, (unsigned char*)data, size);
+     if (ret == 1)
+@@ -144,28 +402,11 @@ static int openssl_ts_req_msg_imprint(lu
+   }
+ };
+ 
+-static LUA_FUNCTION(openssl_ts_req_new)
+-{
+-  TS_REQ *ts_req = TS_REQ_new();
+-  long version = luaL_optinteger(L, 1, 1);
+-
+-  int ret = TS_REQ_set_version(ts_req, version);
+-  if (ret == 1)
+-  {
+-    PUSH_OBJECT(ts_req, "openssl.ts_req");
+-    return 1;
+-  }
+-  TS_REQ_free(ts_req);
+-  return 0;
+-}
+-
+-static LUA_FUNCTION(openssl_ts_req_gc)
+-{
+-  TS_REQ *req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+-  TS_REQ_free(req);
+-  return 0;
+-}
+-
++/***
++create ts_verify_ctx from ts_req object
++ at function to_verify_ctx
++ at treturn ts_verify_ctx object
++*/
+ static LUA_FUNCTION(openssl_ts_req_to_verify_ctx)
+ {
+   TS_REQ *req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -174,19 +415,11 @@ static LUA_FUNCTION(openssl_ts_req_to_ve
+   return 1;
+ }
+ 
+-static LUA_FUNCTION(openssl_ts_req_read)
+-{
+-  BIO *in = load_bio_object(L, 1);
+-  TS_REQ *ts_req = d2i_TS_REQ_bio(in, NULL);
+-  BIO_free(in);
+-  if (ts_req)
+-  {
+-    PUSH_OBJECT(ts_req, "openssl.ts_req");
+-    return 1;
+-  }
+-  return 0;
+-}
+-
++/***
++export ts_req to string
++ at function export
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_ts_req_export)
+ {
+   TS_REQ *ts_req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -201,6 +434,11 @@ static LUA_FUNCTION(openssl_ts_req_expor
+   return 0;
+ }
+ 
++/***
++get info as table
++ at function info
++@treturn table
++*/
+ static LUA_FUNCTION(openssl_ts_req_info)
+ {
+   TS_REQ *req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+@@ -217,41 +455,52 @@ static LUA_FUNCTION(openssl_ts_req_info)
+     STACK_OF(X509_EXTENSION) *extensions; /* [0] OPTIONAL */
+   } TS_REQ;
+ #endif
+-  PUSH_ASN1_INTEGER(L, req->version);
++  lua_pushinteger(L, TS_REQ_get_version(req));
+   lua_setfield(L, -2, "version");
+ 
+-  AUXILIAR_SET(L, -1, "cert_req", req->cert_req, boolean);
++  AUXILIAR_SET(L, -1, "cert_req", TS_REQ_get_cert_req(req), boolean);
+ 
+-  if (req->policy_id)
++  if (TS_REQ_get_policy_id(req))
+   {
+-    openssl_push_asn1object(L, req->policy_id);
++    openssl_push_asn1object(L, TS_REQ_get_policy_id(req));
+     lua_setfield(L, -2, "policy_id");
+   }
+-  if (req->nonce)
++  if (TS_REQ_get_nonce(req))
+   {
+-    PUSH_ASN1_INTEGER(L, req->nonce);
++    PUSH_ASN1_INTEGER(L, TS_REQ_get_nonce(req));
+     lua_setfield(L, -2, "nonce");
+   }
+ 
+   lua_newtable(L);
+   {
+-    ASN1_OCTET_STRING *os = req->msg_imprint->hashed_msg;
+-    AUXILIAR_SETLSTR(L, -1, "content", (const char*)os->data, os->length);
+-    openssl_push_x509_algor(L, req->msg_imprint->hash_algo);
++    TS_MSG_IMPRINT *msg_inprint = TS_REQ_get_msg_imprint(req);
++    ASN1_OCTET_STRING *os = TS_MSG_IMPRINT_get_msg(msg_inprint);
++    X509_ALGOR *alg = TS_MSG_IMPRINT_get_algo(msg_inprint);
++
++    AUXILIAR_SETLSTR(L, -1, "hashed_msg", (const char*)os->data, os->length);
++    alg = X509_ALGOR_dup(alg);
++    PUSH_OBJECT(alg, "openssl.x509_algor");
+     lua_setfield(L, -2, "hash_algo");
+   }
+   lua_setfield(L, -2, "msg_imprint");
+ 
+-  if (req->extensions)
++  if (TS_REQ_get_exts(req))
+   {
+     lua_pushstring(L, "extensions");
+-    openssl_sk_x509_extension_totable(L, req->extensions);
++    openssl_sk_x509_extension_totable(L, TS_REQ_get_exts(req));
+     lua_rawset(L, -3);
+   }
+ 
+   return 1;
+ }
+ 
++static LUA_FUNCTION(openssl_ts_req_gc)
++{
++  TS_REQ *req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
++  TS_REQ_free(req);
++  return 0;
++}
++
+ static luaL_Reg ts_req_funs[] =
+ {
+   {"dup",           openssl_ts_req_dup},
+@@ -271,43 +520,10 @@ static luaL_Reg ts_req_funs[] =
+   { NULL, NULL }
+ };
+ 
+-/***********************************************************/
+-static ASN1_INTEGER *tsa_serial_cb(TS_RESP_CTX *ctx, void *data)
+-{
+-  lua_State *L = (lua_State*) data;
+-  ASN1_INTEGER *serial = NULL;
+-
+-  lua_rawgetp(L, LUA_REGISTRYINDEX, ctx);
+-  if (lua_isnil(L, -1))
+-  {
+-    TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
+-                                "could not generate serial number");
+-
+-    return NULL;
+-  }
+-
+-  if (lua_pcall(L, 0, 1, 0) == 0)
+-  {
+-    lua_Integer i = luaL_checkinteger(L, -1);
+-    serial = ASN1_INTEGER_new();
+-    ASN1_INTEGER_set(serial, (long)i);
+-    return serial;
+-  }
+-  TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
+-                              "could not generate serial number");
+-
+-  return NULL;
+-
+-  /* Acquire an exclusive lock for the serial file. */
+-  /*********************************************************
+-   * Merge server id and serial number                     *
+-   * example : server_id = 0x0F , serial = 2               *
+-   *           result = 0x0F2                              *
+-   * Modification made by JOUVE <opentsa@jouve-hdi.com>    *
+-   *********************************************************/
+-}
+-
+-/**************************************************************/
++/***
++openssl.ts_resp object
++ at type ts_resp
++*/
+ static LUA_FUNCTION(openssl_ts_resp_gc)
+ {
+   TS_RESP *res = CHECK_OBJECT(1, TS_RESP, "openssl.ts_resp");
+@@ -315,6 +531,11 @@ static LUA_FUNCTION(openssl_ts_resp_gc)
+   return 0;
+ }
+ 
++/***
++duplicate ts_resp object
++ at function dup
++ at treturn ts_resp object
++*/
+ static LUA_FUNCTION(openssl_ts_resp_dup)
+ {
+   TS_RESP *res = CHECK_OBJECT(1, TS_RESP, "openssl.ts_resp");
+@@ -323,8 +544,14 @@ static LUA_FUNCTION(openssl_ts_resp_dup)
+   return 1;
+ }
+ 
++/***
++export ts_resp to string
++ at function export
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_ts_resp_export)
+ {
++  int ret = 0;
+   TS_RESP *res = CHECK_OBJECT(1, TS_RESP, "openssl.ts_resp");
+   BIO *bio = BIO_new(BIO_s_mem());
+   if (i2d_TS_RESP_bio(bio, res))
+@@ -332,21 +559,42 @@ static LUA_FUNCTION(openssl_ts_resp_expo
+     BUF_MEM *bptr = NULL;
+     BIO_get_mem_ptr(bio, &bptr);
+     lua_pushlstring(L, bptr->data, bptr->length);
+-    BIO_free(bio);
+-    return 1;
++    ret = 1;
+   }
+-  return 0;
++  BIO_free(bio);
++  return ret;
+ }
+ 
+-static int openssl_push_ts_accuracy(lua_State*L, const TS_ACCURACY* accuracy)
++static int openssl_push_ts_accuracy(lua_State*L, const TS_ACCURACY* accuracy, int asobj)
+ {
+-  lua_newtable(L);
+-  PUSH_ASN1_INTEGER(L, accuracy->micros);
+-  lua_setfield(L, -2, "micros");
+-  PUSH_ASN1_INTEGER(L, accuracy->millis);
+-  lua_setfield(L, -2, "millis");
+-  PUSH_ASN1_INTEGER(L, accuracy->seconds);
+-  lua_setfield(L, -2, "seconds");
++  if (accuracy)
++  {
++    if (asobj)
++    {
++      unsigned char *pbuf = NULL;
++      int len = i2d_TS_ACCURACY(accuracy, &pbuf);
++      if (len > 0)
++      {
++        lua_pushlstring(L, (const char*)pbuf, len);
++        OPENSSL_free(pbuf);
++      }
++      else
++        lua_pushnil(L);
++    }
++    else
++    {
++      lua_newtable(L);
++
++      PUSH_ASN1_INTEGER(L, TS_ACCURACY_get_micros(accuracy));
++      lua_setfield(L, -2, "micros");
++      PUSH_ASN1_INTEGER(L, TS_ACCURACY_get_millis(accuracy));
++      lua_setfield(L, -2, "millis");
++      PUSH_ASN1_INTEGER(L, TS_ACCURACY_get_seconds(accuracy));
++      lua_setfield(L, -2, "seconds");
++    }
++  }
++  else
++    lua_pushnil(L);
+ 
+   return 1;
+ }
+@@ -358,7 +606,8 @@ static int openssl_push_ts_msg_imprint(l
+   lua_newtable(L);
+   if (alg)
+   {
+-    openssl_push_x509_algor(L, alg);
++    alg = X509_ALGOR_dup(alg);
++    PUSH_OBJECT(alg, "openssl.x509_algor");
+     lua_setfield(L, -2, "algo");
+   }
+   if (str)
+@@ -373,62 +622,53 @@ static int openssl_push_ts_msg_imprint(l
+ static int openssl_push_ts_tst_info(lua_State*L, TS_TST_INFO* info)
+ {
+   lua_newtable(L);
+-  if (info->version)
+-  {
+-    PUSH_ASN1_INTEGER(L, info->version);
+-    lua_setfield(L, -2, "version");
+-  }
+-  if (info->policy_id)
+-  {
+-    openssl_push_asn1object(L, info->policy_id);
+-    lua_setfield(L, -2, "policy_id");
+-  }
+-  if (info->msg_imprint)
+-  {
+-    openssl_push_ts_msg_imprint(L, info->msg_imprint);
+-    lua_setfield(L, -2, "msg_imprint");
+-  }
+-  if (info->serial)
+-  {
+-    PUSH_ASN1_INTEGER(L, info->serial);
+-    lua_setfield(L, -2, "serial");
+-  }
+-  if (info->time)
+-  {
+-    openssl_push_asn1(L, info->time, V_ASN1_GENERALIZEDTIME);
+-    lua_setfield(L, -2, "time");
+-  }
+-  if (info->accuracy)
+-  {
+-    openssl_push_ts_accuracy(L, info->accuracy);
+-    lua_setfield(L, -2, "accuracy");
+-  }
+ 
+-  AUXILIAR_SET(L, -1, "ordering", info->ordering, boolean);
++  lua_pushinteger(L, TS_TST_INFO_get_version(info));
++  lua_setfield(L, -2, "version");
+ 
+-  if (info->nonce)
+-  {
+-    PUSH_ASN1_INTEGER(L, info->nonce);
+-    lua_setfield(L, -2, "nonce");
+-  }
+-  if (info->tsa)
+-  {
+-    openssl_push_general_name(L, info->tsa);
+-    lua_setfield(L, -2, "tsa");
+-  }
+-  if (info->extensions)
++  openssl_push_asn1object(L, TS_TST_INFO_get_policy_id(info));
++  lua_setfield(L, -2, "policy_id");
++
++  openssl_push_ts_msg_imprint(L, TS_TST_INFO_get_msg_imprint(info));
++  lua_setfield(L, -2, "msg_imprint");
++
++  PUSH_ASN1_INTEGER(L, TS_TST_INFO_get_serial(info));
++  lua_setfield(L, -2, "serial");
++
++  openssl_push_asn1(L, TS_TST_INFO_get_time(info), V_ASN1_GENERALIZEDTIME);
++  lua_setfield(L, -2, "time");
++
++  openssl_push_ts_accuracy(L, TS_TST_INFO_get_accuracy(info), 1);
++  lua_setfield(L, -2, "accuracy");
++
++  AUXILIAR_SET(L, -1, "ordering", TS_TST_INFO_get_ordering(info), boolean);
++
++  PUSH_ASN1_INTEGER(L, TS_TST_INFO_get_nonce(info));
++  lua_setfield(L, -2, "nonce");
++
++  openssl_push_general_name(L, TS_TST_INFO_get_tsa(info));
++  lua_setfield(L, -2, "tsa");
++
++  if (TS_TST_INFO_get_exts(info))
+   {
+     lua_pushstring(L, "extensions");
+-    openssl_sk_x509_extension_totable(L, info->extensions);
++    openssl_sk_x509_extension_totable(L, TS_TST_INFO_get_exts(info));
+     lua_rawset(L, -3);
+   }
++
+   return 1;
+ }
+ 
++/***
++get info as table
++ at function tst_info
++ at treturn table
++*/
+ static LUA_FUNCTION(openssl_ts_resp_tst_info)
+ {
+   TS_RESP *resp = CHECK_OBJECT(1, TS_RESP, "openssl.ts_resp");
+-  TS_TST_INFO *info = resp->tst_info;
++  TS_TST_INFO *info = TS_RESP_get_tst_info(resp);
++
+   if (info)
+     openssl_push_ts_tst_info(L, info);
+   else
+@@ -436,6 +676,11 @@ static LUA_FUNCTION(openssl_ts_resp_tst_
+   return 1;
+ }
+ 
++/***
++get info as table
++ at function info
++ at treturn table
++*/
+ static LUA_FUNCTION(openssl_ts_resp_info)
+ {
+   TS_RESP *res = CHECK_OBJECT(1, TS_RESP, "openssl.ts_resp");
+@@ -443,26 +688,28 @@ static LUA_FUNCTION(openssl_ts_resp_info
+   lua_newtable(L);
+ 
+   {
+-    lua_newtable(L);
++    TS_STATUS_INFO *si = TS_RESP_get_status_info(res);
++    const ASN1_BIT_STRING *failure_info = TS_STATUS_INFO_get0_failure_info(si);
+ 
+-    PUSH_ASN1_INTEGER(L, res->status_info->status);
++    lua_newtable(L);
++    PUSH_ASN1_INTEGER(L, TS_STATUS_INFO_get0_status(si));
+     lua_setfield(L, -2, "status");
+ 
+-    if (res->status_info->failure_info)
++    if (failure_info)
+     {
+-      openssl_push_asn1(L, res->status_info->failure_info, V_ASN1_BIT_STRING);
++      openssl_push_asn1(L, failure_info, V_ASN1_BIT_STRING);
+       lua_setfield(L, -2, "failure_info");
+     }
+ 
+-    if (res->status_info->text)
++    if (TS_STATUS_INFO_get0_text(si))
+     {
+-      STACK_OF(ASN1_UTF8STRING) * sk = res->status_info->text;
++      const STACK_OF(ASN1_UTF8STRING) * sk = TS_STATUS_INFO_get0_text(si);
+       int i = 0, n = 0;
+       lua_newtable(L);
+-      n = SKM_sk_num(ASN1_UTF8STRING, sk);
++      n = sk_ASN1_UTF8STRING_num(sk);
+       for (i = 0; i < n; i++)
+       {
+-        ASN1_UTF8STRING *x =  SKM_sk_value(ASN1_UTF8STRING, sk, i);
++        ASN1_UTF8STRING *x = sk_ASN1_UTF8STRING_value(sk, i);
+         lua_pushlstring(L, (const char*)x->data, x->length);
+         lua_rawseti(L, -2, i + 1);
+       }
+@@ -473,35 +720,21 @@ static LUA_FUNCTION(openssl_ts_resp_info
+   }
+ 
+ 
+-  if (res->token)
++  if (TS_RESP_get_token(res))
+   {
+-    PKCS7* token = PKCS7_dup(res->token);
++    PKCS7* token = PKCS7_dup(TS_RESP_get_token(res));
+     AUXILIAR_SETOBJECT(L, token, "openssl.pkcs7", -1, "token");
+   }
+ 
+-  if (res->tst_info)
++  if (TS_RESP_get_tst_info(res))
+   {
+-    openssl_push_ts_tst_info(L, res->tst_info);
++    openssl_push_ts_tst_info(L, TS_RESP_get_tst_info(res));
+     lua_setfield(L, -2, "tst_info");
+   }
+ 
+   return 1;
+ }
+ 
+-static LUA_FUNCTION(openssl_ts_resp_read)
+-{
+-  BIO* in = load_bio_object(L, 1);
+-  TS_RESP *res = d2i_TS_RESP_bio(in, NULL);
+-  BIO_free(in);
+-  if (res)
+-  {
+-    PUSH_OBJECT(res, "openssl.ts_resp");
+-  }
+-  else
+-    lua_pushnil(L);
+-  return 1;
+-}
+-
+ static luaL_Reg ts_resp_funs[] =
+ {
+   {"dup",           openssl_ts_resp_dup},
+@@ -516,7 +749,22 @@ static luaL_Reg ts_resp_funs[] =
+ };
+ 
+ /********************************************************/
+-
++/***
++openssl.ts_resp_ctx object
++ at type ts_resp_ctx
++*/
++/***
++create response for ts_req
++ at function create_response
++ at tparam string|bio|ts_req data support string,bio ts_req content or ts_req object
++ at treturn ts_resp result
++*/
++/***
++sign ts_req and get ts_resp, alias of create_response
++ at function sign
++ at tparam string|bio|ts_req data support string,bio ts_req content or ts_req object
++ at treturn ts_resp result
++*/
+ static LUA_FUNCTION(openssl_ts_create_response)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -545,268 +793,189 @@ static LUA_FUNCTION(openssl_ts_create_re
+   return 1;
+ }
+ 
+-static LUA_FUNCTION(openssl_ts_resp_ctx_new)
+-{
+-  TS_RESP_CTX* ctx = TS_RESP_CTX_new();
+-  int i = 0;
+-  int n = lua_gettop(L);
+-  X509 *signer = NULL;
+-  EVP_PKEY *pkey = NULL;
+-  int nid = NID_undef;
+-  int ret = 1;
+-
+-  for (i = 1; i <= n; i++)
+-  {
+-    if (auxiliar_isclass(L, "openssl.x509", i))
+-    {
+-      signer = CHECK_OBJECT(i, X509, "openssl.x509");
+-    }
+-    else if (auxiliar_isclass(L, "openssl.evp_pkey", i))
+-    {
+-      pkey = CHECK_OBJECT(i, EVP_PKEY, "openssl.evp_pkey");
+-      luaL_argcheck(L, openssl_pkey_is_private(pkey), i, "must be private key");
+-    }
+-    else if (lua_isnumber(L, i) || lua_isstring(L, i) || auxiliar_isclass(L, "openssl.asn1_object", i))
+-    {
+-      nid = openssl_get_nid(L, i);
+-      luaL_argcheck(L, nid != NID_undef, i, "invalid asn1_object or object id");
+-    }
+-    else
+-      luaL_argerror(L, i, "not accept paramater");
+-  }
+-  if (signer && pkey)
+-  {
+-    ret = X509_check_private_key(signer, pkey);
+-    if (ret != 1)
+-    {
+-      luaL_error(L, "singer cert and private key not match");
+-    }
+-  }
+-  if (ret == 1 && nid != NID_undef)
+-    ret = TS_RESP_CTX_set_def_policy(ctx, OBJ_nid2obj(nid));
+-
+-  if (ret == 1 && signer)
+-    ret = TS_RESP_CTX_set_signer_cert(ctx, signer);
+-  if (ret == 1 && pkey)
+-    ret = TS_RESP_CTX_set_signer_key(ctx, pkey);
+-
+-  if (ret == 1)
+-  {
+-    PUSH_OBJECT(ctx, "openssl.ts_resp_ctx");
+-    openssl_newvalue(L, ctx);
+-  }
+-  else
+-  {
+-    TS_RESP_CTX_free(ctx);
+-    ctx = NULL;
+-    lua_pushnil(L);
+-  }
+-  return 1;
+-}
+-
++/***
++get signer cert and pkey
++ at function signer
++ at treturn x509 cert object or nil
++ at treturn evp_pkey pkey object or nil
++*/
++/***
++set signer cert and pkey
++ at function signer
++ at tparam x509 cert signer cert
++ at tparam evp_pkey pkey signer pkey
++@treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_singer)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->signer_cert)
+-    {
+-      X509* x = ctx->signer_cert;
+-      x = X509_dup(x);
+-      PUSH_OBJECT(x, "openssl.x509");
+-    }
+-    else
+-      lua_pushnil(L);
+-    if (ctx->signer_key)
+-    {
+-      EVP_PKEY* pkey = ctx->signer_key;
+-      CRYPTO_add(&pkey->references, 1, CRYPTO_LOCK_EVP_PKEY);
+-      PUSH_OBJECT(pkey, "openssl.evp_pkey");
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 2;
+-  }
+-  else
++  X509 *signer = CHECK_OBJECT(2, X509, "openssl.x509");
++  EVP_PKEY *pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
++  int ret = X509_check_private_key(signer, pkey);
++  if (ret != 1)
+   {
+-    X509 *signer = CHECK_OBJECT(2, X509, "openssl.x509");
+-    EVP_PKEY *pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
+-    int ret;
+-    luaL_argcheck(L, openssl_pkey_is_private(pkey), 3, "must be private key");
+-    ret = X509_check_private_key(signer, pkey);
+-    if (ret != 1)
+-    {
+-      luaL_error(L, "signer cert and private key not match");
+-    }
+-    if (ret == 1)
+-      ret = TS_RESP_CTX_set_signer_cert(ctx, signer);
+-    if (ret == 1)
+-      ret = TS_RESP_CTX_set_signer_key(ctx, pkey);
+-    return openssl_pushresult(L, ret);
++    luaL_error(L, "signer cert and private key not match");
+   }
++  if (ret == 1)
++    ret = TS_RESP_CTX_set_signer_cert(ctx, signer);
++  if (ret == 1)
++    ret = TS_RESP_CTX_set_signer_key(ctx, pkey);
++  return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set additional certs
++ at function certs
++ at tparam table certs array of certificates
++ at treturn boolean success
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_certs)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->certs)
+-    {
+-      openssl_sk_x509_totable(L, ctx->certs);
+-    }
+-    else
+-    {
+-      lua_pushnil(L);
+-    };
+-  }
+-  else
+-  {
+-    if (ctx->certs)
+-    {
+-      sk_X509_pop_free(ctx->certs, X509_free);
+-    }
+-    ctx->certs = openssl_sk_x509_fromtable(L, 2);
+-    lua_pushboolean(L, 1);
+-  }
+-  return 1;
++  STACK_OF(X509) *certs = openssl_sk_x509_fromtable(L, 2);
++  TS_RESP_CTX_set_certs(ctx, certs);
++  return 0;
+ }
+ 
++/***
++set default policy
++ at function default_policy
++ at tparam asn1_object|integer|string policy
++ at treturn boolean success
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_default_policy)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->default_policy)
+-      openssl_push_asn1object(L, ctx->default_policy);
+-    else
+-      lua_pushnil(L);
+-  }
+-  else
+-  {
+-    int nid = openssl_get_nid(L, 2);
+-    if (ctx->default_policy)
+-      ASN1_OBJECT_free(ctx->default_policy);
+-    ctx->default_policy = OBJ_nid2obj(nid);
+-    lua_pushboolean(L, 1);
+-  }
+-  return 1;
++  int nid = openssl_get_nid(L, 2);
++  int ret = TS_RESP_CTX_set_def_policy(ctx, OBJ_nid2obj(nid));
++  return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set policies
++ at function policies
++ at tparam asn1_object|integer|string|stack_of_asn1_object|table policies
++ at treturn boolean success
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_policies)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
++  ASN1_OBJECT *obj = NULL;
++  int ret = 1;
++  int nid;
++  int i;
++  int n = lua_gettop(L);
++  luaL_argcheck(L, n > 1, 2, "need one or more asn1_object");
++  for (i = 2; i <= n && ret == 1; i++)
+   {
+-    if (ctx->policies)
++    if (lua_istable(L, i))
+     {
+-      int i, n;
+-      lua_newtable(L);
+-      n = sk_ASN1_OBJECT_num(ctx->policies);
+-      for (i = 0; i < n; i++)
++      int j, k;
++      k = lua_rawlen(L, i);
++      for (j = 1; j <= k && ret == 1; j++)
+       {
+-        ASN1_OBJECT* obj = sk_ASN1_OBJECT_value(ctx->policies, i);
+-        lua_pushinteger(L, i + 1);
+-        PUSH_OBJECT(obj, "openssl.asn1_object");
+-        lua_rawset(L, -3);
+-      }
+-    }
+-    else
+-      lua_pushnil(L);
+-  }
+-  else
+-  {
+-    if (lua_istable(L, 2))
+-    {
++        lua_rawgeti(L, i, j);
++        if (auxiliar_getclassudata(L, "openssl.asn1_object", -1))
++        {
++          obj = CHECK_OBJECT(-1, ASN1_OBJECT, "openssl.asn1_object");
++        }
++        else
++        {
++          nid = openssl_get_nid(L, -1);
++          obj = nid!=NID_undef ? OBJ_nid2obj(nid) : NULL;
++        }
+ 
+-    }
+-    else
+-    {
+-      int n = lua_gettop(L);
+-      int ret = 1;
+-      int nid;
+-      int i;
+-      for (i = 2; i <= n && ret == 1; i++)
+-      {
+-        if (lua_istable(L, i))
++        lua_pop(L, 1);
++
++        if (obj)
+         {
+-          int j, k;
+-          k = lua_rawlen(L, i);
+-          for (j = 1; j <= k && ret == 1; j++)
+-          {
+-            lua_rawgeti(L, i, j);
+-            nid = openssl_get_nid(L, -1);
+-            lua_pop(L, 1);
+-
+-            if (nid != NID_undef)
+-            {
+-              ret = TS_RESP_CTX_add_policy(ctx, OBJ_nid2obj(nid));
+-            }
+-            else
+-            {
+-              lua_pushfstring(L, "index %d is invalid asn1_object or object id", j);
+-              luaL_argerror(L, i, lua_tostring(L, -1));
+-            }
+-          }
++          ret = TS_RESP_CTX_add_policy(ctx, obj);
+         }
+         else
+         {
+-          nid = openssl_get_nid(L, i);
+-          if (nid != NID_undef)
+-          {
+-            ret = TS_RESP_CTX_add_policy(ctx, OBJ_nid2obj(nid));
+-          }
+-          else
+-            luaL_argerror(L, i, "invalid asn1_object or id");
++          lua_pushfstring(L, "index %d is invalid asn1_object or object id", j);
++          luaL_argerror(L, i, lua_tostring(L, -1));
+         }
+       }
+-      return openssl_pushresult(L, ret);
++    }
++    else
++    {
++      if (auxiliar_getclassudata(L, "openssl.asn1_object", i))
++      {
++        obj = CHECK_OBJECT(i, ASN1_OBJECT, "openssl.asn1_object");
++      }
++      else
++      {
++        nid = openssl_get_nid(L, i);
++        obj = nid != NID_undef ? OBJ_nid2obj(nid) : NULL;
++      }
++      if (obj)
++      {
++        ret = TS_RESP_CTX_add_policy(ctx, obj);
++      }
++      else
++        luaL_argerror(L, i, "invalid asn1_object or id");
+     }
+   }
+-  return 1;
++  return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get accuracy
++ at function accuracy
++ at treturn integer seconds
++ at treturn integer millis
++ at treturn integer micros
++*/
++/***
++set accuracy
++ at function accuracy
++ at tparam integer seconds
++ at tparam integer millis
++ at tparam integer micros
++@treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_accuracy)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushinteger(L, ASN1_INTEGER_get(ctx->seconds));
+-    lua_pushinteger(L, ASN1_INTEGER_get(ctx->millis));
+-    lua_pushinteger(L, ASN1_INTEGER_get(ctx->micros));
+-    return 3;
+-  }
+-  else
+-  {
+-    int seconds = luaL_checkint(L, 2);
+-    int millis  = luaL_checkint(L, 3);
+-    int micros  = luaL_checkint(L, 4);
+-    int ret = TS_RESP_CTX_set_accuracy(ctx, seconds, millis, micros);
+-    return openssl_pushresult(L, ret);
+-  }
++  int seconds = luaL_checkint(L, 2);
++  int millis = luaL_checkint(L, 3);
++  int micros = luaL_checkint(L, 4);
++  int ret = TS_RESP_CTX_set_accuracy(ctx, seconds, millis, micros);
++  return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get clock_precision_digits
++ at function clock_precision_digits
++ at treturn integer clock_precision_digits
++*/
++/***
++set clock_precision_digits
++ at function clock_precision_digits
++ at tparam integer clock_precision_digits
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_clock_precision_digits)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushinteger(L, ctx->clock_precision_digits);
+-    return 1;
+-  }
+-  else
+-  {
+-    int ret;
+-    int clock_precision_digits = luaL_checkint(L, 2);
+-    if (clock_precision_digits > TS_MAX_CLOCK_PRECISION_DIGITS)
+-      clock_precision_digits = TS_MAX_CLOCK_PRECISION_DIGITS;
+-    if (clock_precision_digits < 0)
+-      clock_precision_digits = 0;
+-    ret = TS_RESP_CTX_set_clock_precision_digits(ctx, clock_precision_digits);
+-    return openssl_pushresult(L, ret);
+-  }
++  int ret;
++  int clock_precision_digits = luaL_checkint(L, 2);
++  if (clock_precision_digits > TS_MAX_CLOCK_PRECISION_DIGITS)
++    clock_precision_digits = TS_MAX_CLOCK_PRECISION_DIGITS;
++  if (clock_precision_digits < 0)
++    clock_precision_digits = 0;
++  ret = TS_RESP_CTX_set_clock_precision_digits(ctx, clock_precision_digits);
++  return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set status info
++ at function set_status_info
++ at tparam integer status
++ at tparam string text
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_set_status_info)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -816,6 +985,13 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set status info cond
++ at function set_status_info_cond
++ at tparam integer status
++ at tparam string text
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_set_status_info_cond)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -825,6 +1001,12 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++add failure info
++ at function add_failure_info
++ at tparam integer failure
++ at treturn result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_add_failure_info)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -833,51 +1015,35 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get flags
++ at function flags
++@treturn integer flags
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_flags)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushinteger(L, ctx->flags);
+-  }
+-  else if (lua_isnumber(L, 2))
+-  {
+-    int flags = luaL_checkint(L, 2);
+-    ctx->flags = flags;
+-    lua_pushboolean(L, 1);
+-  }
+-  else if (lua_isstring(L, 2))
+-  {
+-    /* TS_RESP_CTX_add_flags(ctx, ) */
+-    luaL_error(L, "not support");
+-  }
+-  else
+-    luaL_error(L, "not support");
+-  return 1;
++  int flags = luaL_checkint(L, 2);
++  TS_RESP_CTX_add_flags(ctx, flags);
++  return 0;
+ }
+ 
++/***
++set support digest method
++ at function md
++ at tparam table mds support digest method
++ at treturn boolean result
++*/
++/***
++add digest
++ at function md
++ at tparam string|evp_digest md_alg
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_md)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->mds)
+-    {
+-      int i;
+-      int n = sk_EVP_MD_num(ctx->mds);
+-      lua_newtable(L);
+-      for (i = 0; i < n; i++)
+-      {
+-        EVP_MD* md = sk_EVP_MD_value(ctx->mds, i);
+-        PUSH_OBJECT(md, "openssl.evp_digest");
+-        lua_rawseti(L, -2, i + 1);
+-      }
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 1;
+-  }
+-  else if (lua_istable(L, 2))
++  if (lua_istable(L, 2))
+   {
+     int i;
+     int n = lua_rawlen(L, 2);
+@@ -886,7 +1052,7 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+     {
+       const EVP_MD* md;
+       lua_rawgeti(L, 2, i);
+-      md = get_digest(L, -1);
++      md = get_digest(L, -1, NULL);
+       lua_pop(L, 1);
+       if (md)
+       {
+@@ -903,12 +1069,17 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+   }
+   else
+   {
+-    const EVP_MD* md = get_digest(L, 2);
++    const EVP_MD* md = get_digest(L, 2, NULL);
+     int ret = TS_RESP_CTX_add_md(ctx, md);
+     return openssl_pushresult(L, ret);
+   }
+ }
+ 
++/***
++get tst_info as table
++ at function tst_info
++ at treturn table tst_info
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_tst_info)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -923,6 +1094,11 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+   return 1;
+ }
+ 
++/***
++get ts_req object
++ at function request
++ at treturn rs_req
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_request)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+@@ -938,9 +1114,7 @@ static LUA_FUNCTION(openssl_ts_resp_ctx_
+ 
+ typedef struct
+ {
+-  lua_State* L;
+   int callback;
+-  int ctx;
+   int cb_arg;
+ } TS_CB_ARG;
+ 
+@@ -949,112 +1123,186 @@ static const char* serial_cb_key = "seri
+ 
+ static ASN1_INTEGER* openssl_serial_cb(TS_RESP_CTX*ctx, void*data)
+ {
+-  TS_CB_ARG *arg = (TS_CB_ARG*)data;
+-  lua_State* L = arg->L;
+-  ASN1_INTEGER *ai = NULL;
+   int err;
+-  (void)ctx;
++  TS_CB_ARG *arg;
++  lua_State* L = data;
++
++  openssl_valueget(L, ctx, serial_cb_key);
++  if (!lua_isuserdata(L, -1))
++  {
++    TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
++                                "Error during serial number generation.");
++    TS_RESP_CTX_add_failure_info(ctx, TS_INFO_ADD_INFO_NOT_AVAILABLE);
++
++    lua_pop(L, 1);
++    return NULL;
++  }
++  arg = lua_touserdata(L, -1);
++  lua_pop(L, 1); /* remove openssl_valueget returned value */
++
+   lua_rawgeti(L, LUA_REGISTRYINDEX, arg->callback);
+-  lua_rawgeti(L, LUA_REGISTRYINDEX, arg->ctx);
+   lua_rawgeti(L, LUA_REGISTRYINDEX, arg->cb_arg);
+-  err = lua_pcall(L, 2, 1, 0);
++  err = lua_pcall(L, 1, 1, 0);
+   if (err == 0)
+   {
++    ASN1_INTEGER *ai = NULL;
+     BIGNUM *bn = BN_get(L, -1);
+-    lua_pop(L, 1);
++    lua_pop(L, 1);  /* remove callback returned value */
+     if (bn)
+     {
+       ai = BN_to_ASN1_INTEGER(bn, NULL);
+       BN_free(bn);
+     }
+     if (ai == NULL)
+-      luaL_error(L, "serial_cb not return openssl.bn");
++    {
++      TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
++                                  "Error during serial number generation.");
++      TS_RESP_CTX_add_failure_info(ctx, TS_INFO_ADD_INFO_NOT_AVAILABLE);
++      luaL_error(L, "Error during serial number generation.");
++    }
++    return ai;
+   }
+   else
++  {
+     lua_error(L);
+-  return ai;
++  }
++  return NULL;
+ };
+ 
++/***
++set serial generate callback function
++ at function set_serial_cb
++ at tparam function serial_cb serial_cb with proto funciont(ts_resp_ctx, arg) return openssl.bn end
++ at usage
++  function serial_cb(tsa,arg)
++    local bn = ...
++    return bn
++  end
++  local arg = {}
++  ts_resp_ctx:set_serial_cb(serial_cb, arg)
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_set_serial_cb)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  int cbref, argref;
+   TS_CB_ARG* arg = NULL;
++  int top = lua_gettop(L);
++
+   luaL_checktype(L, 2, LUA_TFUNCTION);
++  arg = (TS_CB_ARG*)lua_newuserdata(L, sizeof(TS_CB_ARG));
+ 
+   lua_pushvalue(L, 2);
+-  cbref = luaL_ref(L, LUA_REGISTRYINDEX);
+-  lua_pushvalue(L, 3);
+-  argref = luaL_ref(L, LUA_REGISTRYINDEX);
+-
+-  arg = (TS_CB_ARG*)lua_newuserdata(L, sizeof(TS_CB_ARG));
+-  arg->callback = cbref;
+-  arg->cb_arg = argref;
+-  arg->L = L;
+-  lua_pushvalue(L, 1);
+-  arg->ctx = luaL_ref(L, LUA_REGISTRYINDEX);
+-  openssl_setvalue(L, ctx, "serial_cb");
++  arg->callback = luaL_ref(L, LUA_REGISTRYINDEX);
++  if (top > 2)
++    lua_pushvalue(L, 3);
++  else
++    lua_pushnil(L);
++  arg->cb_arg = luaL_ref(L, LUA_REGISTRYINDEX);
+ 
+-  TS_RESP_CTX_set_serial_cb(ctx, openssl_serial_cb, arg);
++  openssl_valueset(L, ctx, serial_cb_key);
++  TS_RESP_CTX_set_serial_cb(ctx, openssl_serial_cb, L);
+   return 0;
+ };
+ 
+ static int openssl_time_cb(TS_RESP_CTX *ctx, void *data, long *sec, long *usec)
+ {
+-  TS_CB_ARG *arg = (TS_CB_ARG*)data;
+-  lua_State* L = arg->L;
+   int err;
+-  (void) ctx;
++  TS_CB_ARG *arg;
++  lua_State* L = data;
++
++  openssl_valueget(L, ctx, time_cb_key);
++  if (!lua_isuserdata(L, -1))
++  {
++    TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
++                                "could not get current time");
++    lua_pop(L, 1);  /* remove openssl_valueget returned value */
++    return 0;
++  }
++  arg = lua_touserdata(L, -1);
++  lua_pop(L, 1);  /* remove openssl_valueget returned value */
++
+   lua_rawgeti(L, LUA_REGISTRYINDEX, arg->callback);
+-  lua_rawgeti(L, LUA_REGISTRYINDEX, arg->ctx);
+   lua_rawgeti(L, LUA_REGISTRYINDEX, arg->cb_arg);
+-  err = lua_pcall(L, 2, 2, 0);
++  err = lua_pcall(L, 1, 2, 0);
+   if (err == 0)
+   {
+-    if (lua_isnil(L, -2))
+-    {
+-      lua_pop(L, 2);
+-      return 0;
+-    }
+-    else
++    if (lua_isnumber(L, -2))
+     {
+       *sec = (long)luaL_checkinteger(L, -2);
+       *usec = (long)luaL_optinteger(L, -1, 0);
+-      lua_pop(L, 2);
++      lua_pop(L, 2);  /* remove callback returned value */
+       return 1;
+     }
++    lua_pop(L, 2);    /* remove callback returned value */
++
++    TS_RESP_CTX_set_status_info(ctx, TS_STATUS_REJECTION,
++                                "could not get current time");
++    return 0;
+   }
+   else
++  {
+     lua_error(L);
++  }
+   return 0;
+ }
+ 
++/***
++set time callback function
++ at function set_time_cb
++ at tparam function time_cb serial_cb with proto funciont(ts_resp_ctx, arg) return sec, usec end
++ at usage
++  function time_cb(tsa,arg)
++    local time = os.time()
++    local utime = nil
++    return time,utime
++  end
++  local arg = {}
++  ts_resp_ctx:set_time_cb(time_cb, arg)
++*/
+ static LUA_FUNCTION(openssl_ts_resp_ctx_set_time_cb)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
+-  int cbref, argref;
+   TS_CB_ARG* arg = NULL;
++  int top = lua_gettop(L);
+   luaL_checktype(L, 2, LUA_TFUNCTION);
++  arg = (TS_CB_ARG*)lua_newuserdata(L, sizeof(TS_CB_ARG));
+ 
+   lua_pushvalue(L, 2);
+-  cbref = luaL_ref(L, LUA_REGISTRYINDEX);
+-  lua_pushvalue(L, 3);
+-  argref = luaL_ref(L, LUA_REGISTRYINDEX);
++  arg->callback = luaL_ref(L, LUA_REGISTRYINDEX);
++  if (top > 2)
++    lua_pushvalue(L, 3);
++  else
++    lua_pushnil(L);
++  arg->cb_arg = luaL_ref(L, LUA_REGISTRYINDEX);
+ 
+-  arg = (TS_CB_ARG*)lua_newuserdata(L, sizeof(TS_CB_ARG));
+-  arg->callback = cbref;
+-  arg->cb_arg = argref;
+-  lua_pushvalue(L, 1);
+-  arg->ctx = luaL_ref(L, LUA_REGISTRYINDEX);
+-  arg->L = L;
+-  lua_rawsetp(L, LUA_REGISTRYINDEX, ctx);
+-  TS_RESP_CTX_set_time_cb(ctx, openssl_time_cb, arg);
++  openssl_valueset(L, ctx, time_cb_key);
++#if defined(LIBRESSL_VERSION_NUMBER)
++  ctx->time_cb = openssl_time_cb;
++  ctx->time_cb_data = L;
++#else
++  TS_RESP_CTX_set_time_cb(ctx, openssl_time_cb, L);
++#endif
+   return 0;
+ }
+ 
+ static LUA_FUNCTION(openssl_ts_resp_ctx_gc)
+ {
+   TS_RESP_CTX *ctx = CHECK_OBJECT(1, TS_RESP_CTX, "openssl.ts_resp_ctx");
++  openssl_valueget(L, ctx, time_cb_key);
++  if (lua_isuserdata(L, -1))
++  {
++    TS_CB_ARG *arg = lua_touserdata(L, -1);
++    luaL_unref(L, LUA_REGISTRYINDEX, arg->callback);
++    luaL_unref(L, LUA_REGISTRYINDEX, arg->cb_arg);
++  }
++  lua_pop(L, 1);
++  openssl_valueget(L, ctx, serial_cb_key);
++  if (lua_isuserdata(L, -1))
++  {
++    TS_CB_ARG *arg = lua_touserdata(L, -1);
++    luaL_unref(L, LUA_REGISTRYINDEX, arg->callback);
++    luaL_unref(L, LUA_REGISTRYINDEX, arg->cb_arg);
++  }
++  lua_pop(L, 1);
+   openssl_freevalue(L, ctx);
+   TS_RESP_CTX_free(ctx);
+   return 0;
+@@ -1095,180 +1343,125 @@ static luaL_Reg ts_resp_ctx_funs[] =
+ 
+ /********************************************************************/
+ 
+-static LUA_FUNCTION(openssl_ts_verify_ctx_new)
+-{
+-  TS_VERIFY_CTX *ctx = NULL;
+-  if (lua_isnone(L, 1))
+-  {
+-    ctx = TS_VERIFY_CTX_new();
+-    ctx->flags |= TS_VFY_SIGNATURE;
+-  }
+-  else if (lua_isstring(L, 1))
+-  {
+-    BIO* bio = load_bio_object(L, 1);
+-    TS_REQ* req = d2i_TS_REQ_bio(bio, NULL);
+-    BIO_free(bio);
+-    if (req)
+-    {
+-      ctx = TS_REQ_to_TS_VERIFY_CTX(req, NULL);
+-      TS_REQ_free(req);
+-    }
+-    else
+-    {
+-      luaL_argerror(L, 1, "must be ts_req data or object or nil");
+-    }
+-  }
+-  else
+-  {
+-    TS_REQ* req = CHECK_OBJECT(1, TS_REQ, "openssl.ts_req");
+-    ctx = TS_REQ_to_TS_VERIFY_CTX(req, NULL);
+-  }
+-  if (ctx)
+-  {
+-    PUSH_OBJECT(ctx, "openssl.ts_verify_ctx");
+-  }
+-  else
+-    lua_pushnil(L);
+-  return 1;
+-}
+-
++/***
++openssl.ts_verify_ctx object
++ at type ts_verify_ctx
++*/
++/***
++get x509_store cacerts
++ at function store
++ at treturn stack_of_x509
++*/
++/***
++set x509_store cacerts
++ at tparam x509_store cacerts
++ at treturn boolean result
++ at function store
++*/
+ static int openssl_ts_verify_ctx_store(lua_State*L)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    /*
+-    if (ctx->store)
+-    {
+-      STACK_OF(X509) *cas =  X509_STORE_get1_certs(ctx->store, NULL);
+-      openssl_sk_x509_totable(L, cas);
+-    }
+-    else
+-    */
+-    lua_pushnil(L);
+-  }
+-  else
+-  {
+-    X509_STORE* store = CHECK_OBJECT(2, X509_STORE, "openssl.x509_store");
+-    if (ctx->store)
+-      openssl_xstore_free(ctx->store);
+-
+-    CRYPTO_add(&store->references, 1, CRYPTO_LOCK_X509_STORE);
+-    ctx->store = store;
+-    ctx->flags |= TS_VFY_SIGNER | TS_VFY_SIGNATURE;
+-    lua_pushboolean(L, 1);
+-  }
+-  return 1;
+-}
+-
+-static int openssl_ts_verify_ctx_certs(lua_State*L)
+-{
+-  TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->certs)
+-    {
+-      openssl_sk_x509_totable(L, ctx->certs);
+-    }
+-    else
+-      lua_pushnil(L);
+-  }
+-  else
+-  {
+-    if (ctx->certs)
+-      sk_X509_pop_free(ctx->certs, X509_free);
+-
+-    ctx->certs = openssl_sk_x509_fromtable(L, 2);
+-    lua_pushboolean(L, 1);
+-  }
+-  return 1;
++  X509_STORE* store = CHECK_OBJECT(2, X509_STORE, "openssl.x509_store");
++  X509_STORE_up_ref(store);
++  TS_VERIFY_CTX_set_store(ctx, store);
++  return 0;
+ }
+ 
++/***
++get flags
++ at function flags
++ at treturn integer flags
++*/
++/***
++set flags
++ at function flags
++ at tparam integer flags
++ at treturn boolean result
++*/
+ static int openssl_ts_verify_ctx_flags(lua_State*L)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushinteger(L, ctx->flags);
+-    return 1;
+-  }
+-  else
+-  {
+-    ctx->flags = luaL_checkinteger(L, 2);
+-  }
+-  return 0;
++  int flags = luaL_checkint(L, 2);
++  int add = lua_isnoneornil(L, 3) ? 0 : lua_toboolean(L, 3);
++  if (add)
++    flags = TS_VERIFY_CTX_add_flags(ctx, flags);
++  else
++    flags = TS_VERIFY_CTX_set_flags(ctx, flags);
++  lua_pushinteger(L, flags);
++  return 1;
+ }
+ 
++/***
++get data
++ at function data
++ at treturn bio data object
++*/
++/***
++set data
++ at function data
++ at tparam bio data object
++ at treturn boolean result
++*/
+ static int openssl_ts_verify_ctx_data(lua_State*L)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    if (ctx->data)
+-    {
+-      BIO* bio = ctx->data;
+-      CRYPTO_add(&bio->references, 1, CRYPTO_LOCK_BIO);
+-      PUSH_OBJECT(bio, "openssl.bio");
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 1;
+-  }
+-  else
+-  {
+-    BIO* bio = load_bio_object(L, 2);
+-    if (ctx->data)
+-      BIO_free(ctx->data);
+-    ctx->data = bio;
+-    ctx->flags |= TS_VFY_DATA;
+-    lua_pushboolean(L, 1);
+-    return 1;
+-  }
++  BIO* bio = load_bio_object(L, 2);
++  BIO_up_ref(bio);
++  TS_VERIFY_CTX_set_data(ctx, bio);
++  return 0;
+ }
+ 
++/***
++get imprint
++ at function imprint
++ at treturn string imprint
++*/
++/***
++set imprint
++ at function imprint
++ at tparam string imprint
++ at treturn boolean result
++*/
+ static int openssl_ts_verify_ctx_imprint(lua_State*L)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushlstring(L, (const char*)ctx->imprint, ctx->imprint_len);
+-    return 1;
+-  }
+-  else
+-  {
+-    size_t imprint_len;
+-    const char* imprint = luaL_checklstring(L, 2, &imprint_len);
+-
+-    ctx->imprint = OPENSSL_malloc(imprint_len);
+-    memcpy(ctx->imprint, imprint, imprint_len);;
+-    ctx->imprint_len = imprint_len;
+-    ctx->flags |= TS_VFY_IMPRINT;
+-    lua_pushboolean(L, 1);
+-    return 1;
+-  }
++  size_t imprint_len;
++  const char* imprint = luaL_checklstring(L, 2, &imprint_len);
++  unsigned char* to = OPENSSL_malloc(imprint_len);
++  memcpy(to, imprint, imprint_len);
++  TS_VERIFY_CTX_set_imprint(ctx, to, imprint_len);
++  return 0;
+ }
+ 
+ static LUA_FUNCTION(openssl_ts_verify_ctx_gc)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+-  if (ctx->store)
+-    openssl_xstore_free(ctx->store);
+-
++  /* hack openssl bugs */
++#if OPENSSL_VERSION_NUMBER < 0x10002000L || defined(LIBRESSL_VERSION_NUMBER)
++  if (ctx->store->references > 1)
++    CRYPTO_add(&ctx->store->references, -1, CRYPTO_LOCK_X509_STORE);
+   ctx->store = NULL;
++#endif
+   TS_VERIFY_CTX_free(ctx);
+   return 0;
+ }
+ 
++/***
++verify ts_resp object, pkcs7 token or ts_resp data
++ at function verify
++ at tparam ts_resp|pkcs7|string data
++ at treturn boolean result
++*/
+ static LUA_FUNCTION(openssl_ts_verify_ctx_verify)
+ {
+   TS_VERIFY_CTX *ctx = CHECK_OBJECT(1, TS_VERIFY_CTX, "openssl.ts_verify_ctx");
+   int ret = 0;
+-  if (auxiliar_isclass(L, "openssl.ts_resp", 2))
++  if (auxiliar_getclassudata(L, "openssl.ts_resp", 2))
+   {
+     TS_RESP *response = CHECK_OBJECT(2, TS_RESP, "openssl.ts_resp");
+     ret = TS_RESP_verify_response(ctx, response);
+   }
+-  else if (auxiliar_isclass(L, "openssl.pkcs7", 2))
++  else if (auxiliar_getclassudata(L, "openssl.pkcs7", 2))
+   {
+     PKCS7 *token = CHECK_OBJECT(2, PKCS7, "openssl.pkcs7");
+     ret = TS_RESP_verify_token(ctx, token);
+@@ -1296,12 +1489,10 @@ static LUA_FUNCTION(openssl_ts_verify_ct
+ static luaL_Reg ts_verify_ctx_funs[] =
+ {
+   {"store",             openssl_ts_verify_ctx_store},
+-  {"certs",             openssl_ts_verify_ctx_certs},
+   {"flags",             openssl_ts_verify_ctx_flags},
+   {"verify",            openssl_ts_verify_ctx_verify},
+   {"data",              openssl_ts_verify_ctx_data},
+   {"imprint",           openssl_ts_verify_ctx_imprint},
+-//  {"info",              openssl_ts_verify_ctx_info},
+ 
+   {"__tostring",        auxiliar_tostring},
+   {"__gc",              openssl_ts_verify_ctx_gc},
+@@ -1309,17 +1500,6 @@ static luaL_Reg ts_verify_ctx_funs[] =
+   { NULL, NULL }
+ };
+ 
+-static luaL_Reg R[] =
+-{
+-  {"req_new",         openssl_ts_req_new},
+-  {"req_read",        openssl_ts_req_read},
+-  {"resp_read",       openssl_ts_resp_read},
+-
+-  {"resp_ctx_new",    openssl_ts_resp_ctx_new },
+-  {"verify_ctx_new",  openssl_ts_verify_ctx_new },
+-
+-  {NULL,    NULL}
+-};
+ #endif
+ int luaopen_ts(lua_State *L)
+ {
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkcs12.c luvi-src-v2.7.6/deps/lua-openssl/src/pkcs12.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkcs12.c	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/pkcs12.c	2019-02-13 11:53:24.298459641 +0100
+@@ -11,6 +11,25 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++Provide pkcs12 function in lua.
++
++ at module pkcs12
++ at usage
++  pkcs12 = require('openssl').pkcs12
++*/
++
++/***
++create and export pkcs12 data
++
++ at function export
++ at tparam x509 cert
++ at tparam evp_pkey pkey
++ at tparam string password
++ at tparam[opt] string friendlyname
++ at tparam[opt] table|stak_of_x509 extracerts
++ at treturn string data
++*/
+ static LUA_FUNCTION(openssl_pkcs12_export)
+ {
+   X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -65,6 +84,14 @@ static LUA_FUNCTION(openssl_pkcs12_expor
+   return ret;
+ }
+ 
++/***
++parse pkcs12 data as lua table
++
++ at function read
++ at tparam string|bio input pkcs12 content
++ at tparam string password for pkcs12
++ at treturn table result contain 'cert', 'pkey', 'extracerts' keys
++*/
+ static LUA_FUNCTION(openssl_pkcs12_read)
+ {
+   PKCS12 * p12 = NULL;
+@@ -114,7 +141,7 @@ static LUA_FUNCTION(openssl_pkcs12_read)
+ static luaL_Reg R[] =
+ {
+   {"read",    openssl_pkcs12_read },
+-  {"export",    openssl_pkcs12_export  },
++  {"export",  openssl_pkcs12_export },
+ 
+   {NULL,    NULL}
+ };
+@@ -124,7 +151,7 @@ int luaopen_pkcs12(lua_State *L)
+   lua_newtable(L);
+   luaL_setfuncs(L, R, 0);
+ 
+-  lua_pushliteral(L, "version");    /** version */
++  lua_pushliteral(L, "version");
+   lua_pushliteral(L, MYVERSION);
+   lua_settable(L, -3);
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkcs7.c luvi-src-v2.7.6/deps/lua-openssl/src/pkcs7.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkcs7.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/pkcs7.c	2019-02-13 11:53:24.298459641 +0100
+@@ -1,10 +1,10 @@
+-/*=========================================================================*\
+-* pkcs7.c
+-* PKCS7 module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++PKCS7 module for lua-openssl binding
+ 
++ at module pkcs7
++ at usage
++  pkcs7 = require('openssl').pkcs7
++*/
+ #include "openssl.h"
+ #include "private.h"
+ 
+@@ -12,6 +12,16 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
++/***
++read string or bio object, which include pkcs7 content
++
++ at function read
++ at tparam bio|string input
++ at tparam[opt='auto'] format allow 'auto','der','pem','smime'
++ auto will only try 'der' or 'pem'
++ at treturn pkcs7 object or nil
++ at treturn string content exist only smime format
++*/
+ static LUA_FUNCTION(openssl_pkcs7_read)
+ {
+   BIO* bio = load_bio_object(L, 1);
+@@ -27,12 +37,12 @@ static LUA_FUNCTION(openssl_pkcs7_read)
+   if (fmt == FORMAT_DER)
+   {
+     p7 = d2i_PKCS7_bio(bio, NULL);
+-    BIO_reset(bio);
++    (void)BIO_reset(bio);
+   }
+   else if (fmt == FORMAT_PEM)
+   {
+     p7 = PEM_read_bio_PKCS7(bio, NULL, NULL, NULL);
+-    BIO_reset(bio);
++    (void)BIO_reset(bio);
+   }
+   else if (fmt == FORMAT_SMIME)
+   {
+@@ -57,11 +67,18 @@ static LUA_FUNCTION(openssl_pkcs7_read)
+ }
+ 
+ #if OPENSSL_VERSION_NUMBER > 0x10000000L
++/***
++create new empty pkcs7 object, which support flexble sign methods.
+ 
++ at function new
++ at tparam[opt=NID_pkcs7_signed] int oid given pkcs7 type
++ at tparam[opt=NID_pkcs7_data] int content given pkcs7 content type
++ at treturn pkcs7 object
++*/
+ static LUA_FUNCTION(openssl_pkcs7_new)
+ {
+   int type = luaL_optint(L, 1, NID_pkcs7_signed);
+-  int content_nid = luaL_optint(L, 1, NID_pkcs7_data);
++  int content_nid = luaL_optint(L, 2, NID_pkcs7_data);
+ 
+   PKCS7 *p7 = PKCS7_new();
+   if (p7)
+@@ -81,23 +98,6 @@ static LUA_FUNCTION(openssl_pkcs7_new)
+   return 0;
+ }
+ 
+-static LUA_FUNCTION(openssl_pkcs7_sign_add_signer)
+-{
+-  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+-  X509 *signcert = CHECK_OBJECT(2, X509, "openssl.x509");
+-  EVP_PKEY *pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
+-  const EVP_MD* md = get_digest(L, 4);
+-  long flags = luaL_optint(L, 5, 0);
+-  PKCS7_SIGNER_INFO *signer = 0;
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 3, "must be private key");
+-  luaL_argcheck(L, X509_check_private_key(signcert, pkey), 3,
+-                "sigcert and private key not match");
+-
+-  signer = PKCS7_sign_add_signer(p7, signcert, pkey, md, flags);
+-  (void) signer;
+-  return openssl_pushresult(L, signcert != NULL ? 1 : 0);
+-}
+-
+ static LUA_FUNCTION(openssl_pkcs7_add)
+ {
+   PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+@@ -107,10 +107,10 @@ static LUA_FUNCTION(openssl_pkcs7_add)
+   luaL_argcheck(L, lua_isuserdata(L, 2), 2, "must supply certificate or crl object");
+   for (i = 2; i <= n; i++)
+   {
+-    luaL_argcheck(L, auxiliar_isclass(L, "openssl.x509", i) || auxiliar_isclass(L, "openssl.x509_crl", i),
++    luaL_argcheck(L, auxiliar_getclassudata(L, "openssl.x509", i) || auxiliar_getclassudata(L, "openssl.x509_crl", i),
+                   i, "must supply certificate or crl object");
+ 
+-    if (auxiliar_isclass(L, "openssl.x509", i))
++    if (auxiliar_getclassudata(L, "openssl.x509", i))
+     {
+       X509* x = CHECK_OBJECT(i, X509, "openssl.x509");
+       ret = PKCS7_add_certificate(p7, x);
+@@ -179,12 +179,11 @@ static BIO *PKCS7_find_digest(EVP_MD_CTX
+       return bio;
+     bio = BIO_next(bio);
+   }
+-  return NULL;
+ }
+ 
+ static int PKCS7_SIGNER_INFO_sign_0(PKCS7_SIGNER_INFO *si)
+ {
+-  EVP_MD_CTX mctx;
++  EVP_MD_CTX *mctx;
+   EVP_PKEY_CTX *pctx;
+   unsigned char *abuf = NULL;
+   int alen;
+@@ -195,8 +194,9 @@ static int PKCS7_SIGNER_INFO_sign_0(PKCS
+   if (md == NULL)
+     return 0;
+ 
+-  EVP_MD_CTX_init(&mctx);
+-  if (EVP_DigestSignInit(&mctx, &pctx, md, NULL, si->pkey) <= 0)
++  mctx = EVP_MD_CTX_new();
++  EVP_MD_CTX_init(mctx);
++  if (EVP_DigestSignInit(mctx, &pctx, md, NULL, si->pkey) <= 0)
+     goto err;
+ 
+   if (EVP_PKEY_CTX_ctrl(pctx, -1, EVP_PKEY_OP_SIGN,
+@@ -210,17 +210,17 @@ static int PKCS7_SIGNER_INFO_sign_0(PKCS
+                        ASN1_ITEM_rptr(PKCS7_ATTR_SIGN));
+   if (!abuf)
+     goto err;
+-  if (EVP_DigestSignUpdate(&mctx, abuf, alen) <= 0)
++  if (EVP_DigestSignUpdate(mctx, abuf, alen) <= 0)
+     goto err;
+   OPENSSL_free(abuf);
+   abuf = NULL;
+-  if (EVP_DigestSignFinal(&mctx, NULL, &siglen) <= 0)
++  if (EVP_DigestSignFinal(mctx, NULL, &siglen) <= 0)
+     goto err;
+   abuf = OPENSSL_malloc(siglen);
+   if (!abuf)
+     goto err;
+ 
+-  if (EVP_DigestSignFinal(&mctx, abuf, &siglen) <= 0)
++  if (EVP_DigestSignFinal(mctx, abuf, &siglen) <= 0)
+     goto err;
+   if (EVP_PKEY_CTX_ctrl(pctx, -1, EVP_PKEY_OP_SIGN,
+                         EVP_PKEY_CTRL_PKCS7_SIGN, 1, si) <= 0)
+@@ -229,7 +229,7 @@ static int PKCS7_SIGNER_INFO_sign_0(PKCS
+     goto err;
+   }
+ 
+-  EVP_MD_CTX_cleanup(&mctx);
++  EVP_MD_CTX_free(mctx);
+ 
+   ASN1_STRING_set0(si->enc_digest, abuf, siglen);
+ 
+@@ -238,7 +238,7 @@ static int PKCS7_SIGNER_INFO_sign_0(PKCS
+ err:
+   if (abuf)
+     OPENSSL_free(abuf);
+-  EVP_MD_CTX_cleanup(&mctx);
++  EVP_MD_CTX_free(mctx);
+   return 0;
+ 
+ }
+@@ -307,34 +307,31 @@ static char *memdup(const char *src, siz
+   return buffer;
+ }
+ 
+-static LUA_FUNCTION(openssl_pkcs7_sign_digest)
+-{
+-  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+-  size_t l;
+-  const char* data = luaL_checklstring(L, 2, &l);
+-  long flags = luaL_optint(L, 3, 0);
+-  int hash = lua_isnoneornil(L, 4) ? 0 : lua_toboolean(L, 4);
+ 
++static int openssl_pkcs7_dataFinal(PKCS7 *p7, BIO *bio)
++{
+   int ret = 0;
+   int i, j;
+-
+-  const EVP_MD* md;
++  BIO *btmp;
+   PKCS7_SIGNER_INFO *si;
+-  EVP_MD_CTX mdc;
++  EVP_MD_CTX *mdc, *ctx_tmp;
+   STACK_OF(X509_ATTRIBUTE) *sk;
+   STACK_OF(PKCS7_SIGNER_INFO) *si_sk = NULL;
+   ASN1_OCTET_STRING *os = NULL;
+ 
+-  if (p7->d.ptr == NULL)
++  if (p7 == NULL)
+   {
+-    luaL_error(L, "pkcs7 without content");
++    PKCS7err(PKCS7_F_PKCS7_DATAFINAL, PKCS7_R_INVALID_NULL_POINTER);
+     return 0;
+   }
+ 
+-  flags |= PKCS7_DETACHED;
+-  PKCS7_set_detached(p7, 1);
+-
+-  EVP_MD_CTX_init(&mdc);
++  if (p7->d.ptr == NULL)
++  {
++    PKCS7err(PKCS7_F_PKCS7_DATAFINAL, PKCS7_R_NO_CONTENT);
++    return 0;
++  }
++  ctx_tmp = EVP_MD_CTX_new();
++  EVP_MD_CTX_init(ctx_tmp);
+   i = OBJ_obj2nid(p7->type);
+   p7->state = PKCS7_S_HEADER;
+ 
+@@ -349,7 +346,11 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+     os = p7->d.signed_and_enveloped->enc_data->enc_data;
+     if (!os)
+     {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+       os = M_ASN1_OCTET_STRING_new();
++#else
++      os = ASN1_OCTET_STRING_new();
++#endif
+       if (!os)
+       {
+         PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_MALLOC_FAILURE);
+@@ -363,7 +364,11 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+     os = p7->d.enveloped->enc_data->enc_data;
+     if (!os)
+     {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+       os = M_ASN1_OCTET_STRING_new();
++#else
++      os = ASN1_OCTET_STRING_new();
++#endif
+       if (!os)
+       {
+         PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_MALLOC_FAILURE);
+@@ -378,7 +383,11 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+     /* If detached data then the content is excluded */
+     if (PKCS7_type_is_data(p7->d.sign->contents) && p7->detached)
+     {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+       M_ASN1_OCTET_STRING_free(os);
++#else
++      ASN1_OCTET_STRING_free(os);
++#endif
+       os = NULL;
+       p7->d.sign->contents->d.data = NULL;
+     }
+@@ -389,7 +398,11 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+     /* If detached data then the content is excluded */
+     if (PKCS7_type_is_data(p7->d.digest->contents) && p7->detached)
+     {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+       M_ASN1_OCTET_STRING_free(os);
++#else
++      ASN1_OCTET_STRING_free(os);
++#endif
+       os = NULL;
+       p7->d.digest->contents->d.data = NULL;
+     }
+@@ -407,24 +420,21 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+       si = sk_PKCS7_SIGNER_INFO_value(si_sk, i);
+       if (si->pkey == NULL)
+         continue;
++
+       j = OBJ_obj2nid(si->digest_alg->algorithm);
+-      md = EVP_get_digestbynid(j);
+-      EVP_DigestInit_ex(&mdc, md, NULL);
+ 
+-      if (hash)
+-      {
+-        if (l == (size_t) mdc.digest->ctx_size)
+-        {
+-          memcpy(mdc.md_data, data, l);
+-        }
+-        else
+-        {
+-          EVP_MD_CTX_cleanup(&mdc);
+-          luaL_argerror(L, 2, "data with wrong length");
+-        }
+-      }
+-      else
+-        EVP_DigestUpdate(&mdc, data, l);
++      btmp = bio;
++
++      btmp = PKCS7_find_digest(&mdc, btmp, j);
++
++      if (btmp == NULL)
++        goto err;
++
++      /*
++      * We now have the EVP_MD_CTX, lets do the signing.
++      */
++      if (!EVP_MD_CTX_copy_ex(ctx_tmp, mdc))
++        goto err;
+ 
+       sk = si->auth_attr;
+ 
+@@ -434,7 +444,7 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+       */
+       if (sk_X509_ATTRIBUTE_num(sk) > 0)
+       {
+-        if (!do_pkcs7_signed_attrib(si, &mdc))
++        if (!do_pkcs7_signed_attrib(si, ctx_tmp))
+           goto err;
+       }
+       else
+@@ -446,7 +456,7 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+         if (!abuf)
+           goto err;
+ 
+-        if (!EVP_SignFinal(&mdc, abuf, &abuflen, si->pkey))
++        if (!EVP_SignFinal(ctx_tmp, abuf, &abuflen, si->pkey))
+         {
+           PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_EVP_LIB);
+           goto err;
+@@ -459,20 +469,16 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+   {
+     unsigned char md_data[EVP_MAX_MD_SIZE];
+     unsigned int md_len;
+-    md = EVP_get_digestbynid(OBJ_obj2nid(p7->d.digest->md->algorithm));
+-    EVP_DigestInit_ex(&mdc, md, NULL);
+-    if (l == (size_t) mdc.digest->ctx_size)
+-    {
+-      memcpy(mdc.md_data, data, l);
+-    }
+-    else
+-    {
+-      EVP_MD_CTX_cleanup(&mdc);
+-      luaL_error(L, "data with wrong data");
+-    }
+-    if (!EVP_DigestFinal_ex(&mdc, md_data, &md_len))
++    if (!PKCS7_find_digest(&mdc, bio,
++                           OBJ_obj2nid(p7->d.digest->md->algorithm)))
+       goto err;
++    if (!EVP_DigestFinal_ex(mdc, md_data, &md_len))
++      goto err;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     M_ASN1_OCTET_STRING_set(p7->d.digest->digest, md_data, md_len);
++#else
++    ASN1_OCTET_STRING_set(p7->d.digest->digest, md_data, md_len);
++#endif
+   }
+ 
+   if (!PKCS7_is_detached(p7))
+@@ -485,16 +491,67 @@ static LUA_FUNCTION(openssl_pkcs7_sign_d
+       goto err;
+     if (!(os->flags & ASN1_STRING_FLAG_NDEF))
+     {
+-      char *cont = memdup(data, l);
+-      long contlen = l;
+-      ASN1_STRING_set0(os, (unsigned char *) cont, contlen);
++      char *cont;
++      long contlen;
++      btmp = BIO_find_type(bio, BIO_TYPE_MEM);
++      if (btmp == NULL)
++      {
++        PKCS7err(PKCS7_F_PKCS7_DATAFINAL, PKCS7_R_UNABLE_TO_FIND_MEM_BIO);
++        goto err;
++      }
++      contlen = BIO_get_mem_data(btmp, &cont);
++      /*
++      * Mark the BIO read only then we can use its copy of the data
++      * instead of making an extra copy.
++      */
++      BIO_set_flags(btmp, BIO_FLAGS_MEM_RDONLY);
++      BIO_set_mem_eof_return(btmp, 0);
++      ASN1_STRING_set0(os, (unsigned char *)cont, contlen);
+     }
+   }
+-
+   ret = 1;
+ err:
+-  EVP_MD_CTX_cleanup(&mdc);
+-  return openssl_pushresult(L, ret);
++  EVP_MD_CTX_free(ctx_tmp);
++  return (ret);
++}
++
++
++static int openssl_pkcs7_final(lua_State *L)
++{
++  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
++  BIO *data = load_bio_object(L, 2);
++  int flags = luaL_optint(L, 3, 0);
++
++  BIO *p7bio = PKCS7_dataInit(p7, NULL);
++  int ret = 0;
++
++  if (p7bio == NULL)
++  {
++    lua_pushnil(L);
++    lua_pushstring(L, "PKCS7_dataInit fail");
++    ret = 2;
++  }
++  else
++  {
++    SMIME_crlf_copy(data, p7bio, flags);
++
++    (void)BIO_flush(p7bio);
++
++    if (!openssl_pkcs7_dataFinal(p7, p7bio))
++    {
++      lua_pushnil(L);
++      lua_pushstring(L, "PKCS7_dataFinal fail");
++      ret = 2;
++    }
++    else
++    {
++      ret = 1;
++      lua_pushboolean(L, 1);
++    }
++    BIO_free_all(p7bio);
++  }
++
++  return ret;
+ }
+ 
+ int PKCS7_signatureVerify_digest(PKCS7 *p7, PKCS7_SIGNER_INFO *si, X509 *x509,
+@@ -502,14 +559,16 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+ {
+   ASN1_OCTET_STRING *os;
+   const EVP_MD* md;
+-  EVP_MD_CTX mdc, mdc_tmp;
++  EVP_MD_CTX *mdc, *mdc_tmp;
+   int ret = 0, i;
+   int md_type;
+   STACK_OF(X509_ATTRIBUTE) *sk;
+   EVP_PKEY *pkey = NULL;
+ 
+-  EVP_MD_CTX_init(&mdc);
+-  EVP_MD_CTX_init(&mdc_tmp);
++  mdc = EVP_MD_CTX_new();
++  mdc_tmp = EVP_MD_CTX_new();
++  EVP_MD_CTX_init(mdc);
++  EVP_MD_CTX_init(mdc_tmp);
+   if (!PKCS7_type_is_signed(p7) && !PKCS7_type_is_signedAndEnveloped(p7))
+   {
+     PKCS7err(PKCS7_F_PKCS7_SIGNATUREVERIFY, PKCS7_R_WRONG_PKCS7_TYPE);
+@@ -518,15 +577,27 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+ 
+   md_type = OBJ_obj2nid(si->digest_alg->algorithm);
+   md = EVP_get_digestbynid(md_type);
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   if (!md || !data || (hash && len != (size_t) md->ctx_size) )
+     goto err;
+ 
+-  if (!EVP_DigestInit_ex(&mdc, md, NULL))
++  if (!EVP_DigestInit_ex(mdc, md, NULL))
++    goto err;
++  if (hash)
++    memcpy(mdc->md_data, data, len);
++  else
++    EVP_DigestUpdate(mdc, data, len);
++#else
++  if (!md || !data || (hash && len != (size_t)EVP_MD_meth_get_app_datasize(md)) )
++    goto err;
++
++  if (!EVP_DigestInit_ex(mdc, md, NULL))
+     goto err;
+   if (hash)
+-    memcpy(mdc.md_data, data, len);
++    memcpy(EVP_MD_CTX_md_data(mdc), data, len);
+   else
+-    EVP_DigestUpdate(&mdc, data, len);
++    EVP_DigestUpdate(mdc, data, len);
++#endif
+ 
+   pkey = X509_get_pubkey(x509);
+   if (!pkey)
+@@ -538,7 +609,7 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+   * mdc is the digest ctx that we want, unless there are attributes, in
+   * which case the digest is the signed attributes
+   */
+-  if (!EVP_MD_CTX_copy_ex(&mdc_tmp, &mdc))
++  if (!EVP_MD_CTX_copy_ex(mdc_tmp, mdc))
+     goto err;
+   sk = si->auth_attr;
+   if ((sk != NULL) && (sk_X509_ATTRIBUTE_num(sk) != 0))
+@@ -548,7 +619,7 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+     int alen;
+     ASN1_OCTET_STRING *message_digest;
+ 
+-    if (!EVP_DigestFinal_ex(&mdc_tmp, md_dat, &md_len))
++    if (!EVP_DigestFinal_ex(mdc_tmp, md_dat, &md_len))
+       goto err;
+     message_digest = PKCS7_digest_from_attributes(sk);
+     if (!message_digest)
+@@ -564,7 +635,7 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+       ret = -1;
+       goto err;
+     }
+-    if (!EVP_DigestVerifyInit(&mdc_tmp, NULL, EVP_get_digestbynid(md_type), NULL, pkey))
++    if (!EVP_DigestVerifyInit(mdc_tmp, NULL, EVP_get_digestbynid(md_type), NULL, pkey))
+       goto err;
+ 
+     alen = ASN1_item_i2d((ASN1_VALUE *) sk, &abuf,
+@@ -575,14 +646,14 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+       ret = -1;
+       goto err;
+     }
+-    if (!EVP_VerifyUpdate(&mdc_tmp, abuf, alen))
++    if (!EVP_VerifyUpdate(mdc_tmp, abuf, alen))
+       goto err;
+ 
+     OPENSSL_free(abuf);
+   }
+ 
+   os = si->enc_digest;
+-  i = EVP_VerifyFinal(&mdc_tmp, os->data, os->length, pkey);
++  i = EVP_VerifyFinal(mdc_tmp, os->data, os->length, pkey);
+   if (i <= 0)
+   {
+     PKCS7err(PKCS7_F_PKCS7_SIGNATUREVERIFY, PKCS7_R_SIGNATURE_FAILURE);
+@@ -593,118 +664,25 @@ int PKCS7_signatureVerify_digest(PKCS7 *
+     ret = 1;
+ err:
+   EVP_PKEY_free(pkey);
+-  EVP_MD_CTX_cleanup(&mdc);
+-  EVP_MD_CTX_cleanup(&mdc_tmp);
++  EVP_MD_CTX_free(mdc);
++  EVP_MD_CTX_free(mdc_tmp);
+ 
+   return (ret);
+ }
+ 
+-static LUA_FUNCTION(openssl_pkcs7_verify_digest)
+-{
+-  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+-  STACK_OF(X509) *certs = lua_isnoneornil(L, 2) ? NULL : openssl_sk_x509_fromtable(L, 2);
+-  X509_STORE *store = lua_isnoneornil(L, 3) ? NULL : CHECK_OBJECT(3, X509_STORE, "openssl.x509_store");
+-  size_t len;
+-  const char* data = luaL_checklstring(L, 4, &len);
+-  long flags = luaL_optint(L, 5, 0);
+-  int hash = lua_isnoneornil(L, 6) ? 0 : lua_toboolean(L, 6);
+-
+-  STACK_OF(X509) *signers;
+-  X509 *signer;
+-  STACK_OF(PKCS7_SIGNER_INFO) *sinfos;
+-  PKCS7_SIGNER_INFO *si;
+-  X509_STORE_CTX cert_ctx;
+-
+-  int i, j = 0, k, ret = 0;
+-
+-  if (!PKCS7_type_is_signed(p7))
+-  {
+-    luaL_error(L, "pkcs7 must be signedData");
+-  }
+-
+-  /* Check for no data and no content: no data to verify signature */
+-  if (!PKCS7_get_detached(p7))
+-  {
+-    luaL_error(L, "pkcs7 must be detached signedData");
+-  }
+-
+-
+-  sinfos = PKCS7_get_signer_info(p7);
+-  if (!sinfos || !sk_PKCS7_SIGNER_INFO_num(sinfos))
+-  {
+-    luaL_error(L, "pkcs7 signedData without signature");
+-  }
+-
+-  signers = PKCS7_get0_signers(p7, certs, flags);
+-  if (!signers)
+-  {
+-    luaL_error(L, "pkcs7 signedData without signers");
+-  }
+-
+-  if (!store)
+-    flags |= PKCS7_NOVERIFY;
+-
+-  /* Now verify the certificates */
+-  if (!(flags & PKCS7_NOVERIFY))
+-    for (k = 0; k < sk_X509_num(signers); k++)
+-    {
+-      signer = sk_X509_value(signers, k);
+-      if (!(flags & PKCS7_NOCHAIN))
+-      {
+-        if (!X509_STORE_CTX_init(&cert_ctx, store, signer,
+-                                 p7->d.sign->cert))
+-        {
+-          PKCS7err(PKCS7_F_PKCS7_VERIFY, ERR_R_X509_LIB);
+-          goto err;
+-        }
+-        X509_STORE_CTX_set_default(&cert_ctx, "smime_sign");
+-      }
+-      else if (!X509_STORE_CTX_init(&cert_ctx, store, signer, NULL))
+-      {
+-        PKCS7err(PKCS7_F_PKCS7_VERIFY, ERR_R_X509_LIB);
+-        goto err;
+-      }
+-      if (!(flags & PKCS7_NOCRL))
+-        X509_STORE_CTX_set0_crls(&cert_ctx, p7->d.sign->crl);
+-      i = X509_verify_cert(&cert_ctx);
+-      if (i <= 0)
+-        j = X509_STORE_CTX_get_error(&cert_ctx);
+-      X509_STORE_CTX_cleanup(&cert_ctx);
+-      if (i <= 0)
+-      {
+-        PKCS7err(PKCS7_F_PKCS7_VERIFY,
+-                 PKCS7_R_CERTIFICATE_VERIFY_ERROR);
+-        ERR_add_error_data(2, "Verify error:",
+-                           X509_verify_cert_error_string(j));
+-        goto err;
+-      }
+-      /* Check for revocation status here */
+-    }
+-
+-  /* Now Verify All Signatures */
+-  if (!(flags & PKCS7_NOSIGS))
+-    for (i = 0; i < sk_PKCS7_SIGNER_INFO_num(sinfos); i++)
+-    {
+-      si = sk_PKCS7_SIGNER_INFO_value(sinfos, i);
+-      signer = sk_X509_value(signers, i);
+-      j = PKCS7_signatureVerify_digest(p7, si, signer,
+-                                       (const unsigned char*) data, len, hash);
+-      if (j <= 0)
+-      {
+-        PKCS7err(PKCS7_F_PKCS7_VERIFY, PKCS7_R_SIGNATURE_FAILURE);
+-        goto err;
+-      }
+-    }
+-  ret = 1;
+-
+-err:
+-  if (certs)
+-    sk_X509_pop_free(certs, X509_free);
+-  sk_X509_free(signers);
+-  return openssl_pushresult(L, ret);
+-}
+ #endif
+ 
++/***
++sign message with signcert and signpkey to create pkcs7 object
++
++ at function sign
++ at tparam string|bio msg
++ at tparam x509 signcert
++ at tparam evp_pkey signkey
++ at tparam[opt] stack_of_x509 cacerts
++ at tparam[opt=0] number flags
++ at treturn pkcs7 object
++*/
+ static LUA_FUNCTION(openssl_pkcs7_sign)
+ {
+   BIO *in  = load_bio_object(L, 1);
+@@ -713,7 +691,6 @@ static LUA_FUNCTION(openssl_pkcs7_sign)
+   STACK_OF(X509) *others = lua_isnoneornil(L, 4) ? 0 : openssl_sk_x509_fromtable(L, 4);
+   long flags =  luaL_optint(L, 5, 0);
+   PKCS7 *p7 = NULL;
+-  luaL_argcheck(L, openssl_pkey_is_private(privkey), 3, "must be private key");
+ 
+   if (!X509_check_private_key(cert, privkey))
+     luaL_error(L, "sigcert and private key not match");
+@@ -734,6 +711,18 @@ static LUA_FUNCTION(openssl_pkcs7_sign)
+   return 0;
+ }
+ 
++/***
++verify pkcs7 object, and return msg content, follow by singers
++
++ at function verify
++ at tparam pkcs7 in
++ at tparam[opt] stack_of_x509 signercerts
++ at tparam[opt] x509_store cacerts
++ at tparam[opt] string|bio msg
++ at tparam[opt=0] number flags
++ at treturn[1] string content
++ at treturn[1] boolean result
++*/
+ static LUA_FUNCTION(openssl_pkcs7_verify)
+ {
+   int ret = 0;
+@@ -741,10 +730,14 @@ static LUA_FUNCTION(openssl_pkcs7_verify
+   STACK_OF(X509) *signers = lua_isnoneornil(L, 2) ? NULL : openssl_sk_x509_fromtable(L, 2);
+   X509_STORE *store = lua_isnoneornil(L, 3) ? NULL : CHECK_OBJECT(3, X509_STORE, "openssl.x509_store");
+   BIO* in = lua_isnoneornil(L, 4) ? NULL : load_bio_object(L, 4);
+-  long flags = luaL_optint(L, 5, 0);
+-  BIO* out = BIO_new(BIO_s_mem());
++  long flags = luaL_optint(L, 5, PKCS7_DETACHED);
++  BIO* out = NULL;
++
+   if (!store)
+     flags |= PKCS7_NOVERIFY;
++  if ((flags&PKCS7_DETACHED) != 0)
++    out = BIO_new(BIO_s_mem());
++
+   if (PKCS7_verify(p7, signers, store, in, out, flags) == 1)
+   {
+     if (out && (flags & PKCS7_DETACHED) == 0)
+@@ -773,6 +766,15 @@ static LUA_FUNCTION(openssl_pkcs7_verify
+   return ret;
+ }
+ 
++/***
++encrypt message with recipcerts certificates return encrypted pkcs7 object
++
++ at function encrypt
++ at tparam string|bio msg
++ at tparam stack_of_x509 recipcerts
++ at tparam[opt='rc4'] string|evp_cipher cipher
++ at tparam[opt] number flags
++*/
+ static LUA_FUNCTION(openssl_pkcs7_encrypt)
+ {
+   PKCS7 * p7 = NULL;
+@@ -801,6 +803,15 @@ static LUA_FUNCTION(openssl_pkcs7_encryp
+   return 1;
+ }
+ 
++/***
++decrypt encrypted pkcs7 message
++
++ at function decrypt
++ at tparam pkcs7 input
++ at tparam x509 recipcert
++ at tparam evp_pkey recipkey
++ at treturn string decrypt message
++*/
+ static LUA_FUNCTION(openssl_pkcs7_decrypt)
+ {
+   PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+@@ -821,7 +832,11 @@ static LUA_FUNCTION(openssl_pkcs7_decryp
+   return 1;
+ }
+ 
+-/*** pkcs7 object method ***/
++/***
++openssl.pkcs7 object
++
++ at type pkcs7
++*/
+ static LUA_FUNCTION(openssl_pkcs7_gc)
+ {
+   PKCS7* p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+@@ -829,17 +844,26 @@ static LUA_FUNCTION(openssl_pkcs7_gc)
+   return 0;
+ }
+ 
++/***
++export pkcs7 as string
++
++ at function export
++ at tparam[opt='pem'] string support export as 'pem' or 'der' format, default is 'pem'
++@treturn string
++*/
+ static LUA_FUNCTION(openssl_pkcs7_export)
+ {
+-  int pem;
+   PKCS7 * p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+-  int top = lua_gettop(L);
+   BIO* bio_out = NULL;
+-
+-  pem = top > 1 ? lua_toboolean(L, 2) : 1;
++  int fmt = lua_type(L, 2);
++  luaL_argcheck(L, fmt == LUA_TSTRING || fmt == LUA_TNONE, 2,
++                "only accept 'pem','der' or none");
++  fmt = luaL_checkoption(L, 2, "pem", format);
++  luaL_argcheck(L, fmt == FORMAT_PEM || fmt == FORMAT_DER, 2,
++                "only accept pem or der, default is pem");
+ 
+   bio_out  = BIO_new(BIO_s_mem());
+-  if (pem)
++  if (fmt == FORMAT_PEM)
+   {
+ 
+     if (PEM_write_bio_PKCS7(bio_out, p7))
+@@ -901,19 +925,28 @@ static int openssl_push_pkcs7_signer_inf
+ 
+   if (info->pkey)
+   {
+-    CRYPTO_add(&info->pkey->references, 1, CRYPTO_LOCK_EVP_PKEY);
++    EVP_PKEY_up_ref(info->pkey);
+     AUXILIAR_SETOBJECT(L, info->pkey, "openssl.evp_pkey", -1, "pkey");
+   }
+   return 1;
+ }
+ 
+-static LUA_FUNCTION(openssl_pkcs7_signer_info_gc)
++static LUA_FUNCTION(openssl_pkcs7_type)
+ {
+-  PKCS7_SIGNER_INFO *info = CHECK_OBJECT(1, PKCS7_SIGNER_INFO, "openssl.pkcs7_signer_info");
+-  PKCS7_SIGNER_INFO_free(info);
+-  return 0;
++  PKCS7 * p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
++  int i = OBJ_obj2nid(p7->type);
++
++  lua_pushstring(L, OBJ_nid2sn(i));
++  lua_pushstring(L, OBJ_nid2ln(i));
++  return 2;
+ }
+ 
++/***
++export pkcs7 as a string
++
++ at function parse
++ at treturn table  a table has pkcs7 infomation, include type,and other things relate to types
++*/
+ static LUA_FUNCTION(openssl_pkcs7_parse)
+ {
+   PKCS7 * p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
+@@ -993,16 +1026,13 @@ static LUA_FUNCTION(openssl_pkcs7_parse)
+   case NID_pkcs7_digest:
+   {
+     PKCS7_DIGEST* d = p7->d.digest;
+-
+-    ASN1_OCTET_STRING *as = ASN1_STRING_dup(d->digest);
+-    PUSH_OBJECT(as, "openssl.asn1_string");
++    PUSH_ASN1_OCTET_STRING(L, d->digest);
+     lua_setfield(L, -2, "digest");
+   }
+   break;
+   case NID_pkcs7_data:
+   {
+-    ASN1_OCTET_STRING *as = ASN1_STRING_dup(p7->d.data);
+-    PUSH_OBJECT(as, "openssl.asn1_string");
++    PUSH_ASN1_OCTET_STRING(L, p7->d.data);
+     lua_setfield(L, -2, "data");
+   }
+   break;
+@@ -1026,13 +1056,417 @@ static LUA_FUNCTION(openssl_pkcs7_parse)
+   return 1;
+ }
+ 
++/***
++pkcs7 sign add signer
++
++ at function add_signer
++ at tparam x509 cert used to sign data
++ at tparam evp_pkey pkey used to sign data
++ at tparam evp_md|int digest method when sign data
++ at tparam[opt=0] int flags switch process when add signer
++ at treturn boolean result true for success
++*/
++static LUA_FUNCTION(openssl_pkcs7_sign_add_signer)
++{
++  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
++  X509 *signcert = CHECK_OBJECT(2, X509, "openssl.x509");
++  EVP_PKEY *pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
++  const EVP_MD* md = get_digest(L, 4, NULL);
++  long flags = luaL_optint(L, 5, 0);
++  PKCS7_SIGNER_INFO *signer = 0;
++
++  luaL_argcheck(L, X509_check_private_key(signcert, pkey), 3,
++                "sigcert and private key not match");
++
++  signer = PKCS7_sign_add_signer(p7, signcert, pkey, md, flags);
++  (void) signer;
++  return openssl_pushresult(L, signcert != NULL ? 1 : 0);
++}
++
++#if OPENSSL_VERSION_NUMBER > 0x10000000L
++/***
++pkcs7 sign hash data
++ at function sign_digest
++ at tparam string data to sign data, maybe already hashed
++ at tparam[opt=0] int flags when sign data
++ at tparam[opt=false] boolean hashed when true will skip hash process
++ at treturn boolean result true for success
++*/
++static LUA_FUNCTION(openssl_pkcs7_sign_digest)
++{
++  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
++  size_t l;
++  const char* data = luaL_checklstring(L, 2, &l);
++  long flags = luaL_optint(L, 3, 0);
++  int hash = lua_isnoneornil(L, 4) ? 0 : lua_toboolean(L, 4);
++
++  int ret = 0;
++  int i, j;
++
++  const EVP_MD* md;
++  PKCS7_SIGNER_INFO *si;
++  EVP_MD_CTX *mdc;
++  STACK_OF(X509_ATTRIBUTE) *sk;
++  STACK_OF(PKCS7_SIGNER_INFO) *si_sk = NULL;
++  ASN1_OCTET_STRING *os = NULL;
++
++  if (p7->d.ptr == NULL)
++  {
++    luaL_error(L, "pkcs7 without content");
++    return 0;
++  }
++
++  if (flags & PKCS7_DETACHED)
++  {
++    PKCS7_set_detached(p7, 1);
++  }
++
++  mdc = EVP_MD_CTX_new();
++  EVP_MD_CTX_init(mdc);
++  i = OBJ_obj2nid(p7->type);
++  p7->state = PKCS7_S_HEADER;
++
++  switch (i)
++  {
++  case NID_pkcs7_data:
++    os = p7->d.data;
++    break;
++  case NID_pkcs7_signedAndEnveloped:
++    /* XXXXXXXXXXXXXXXX */
++    si_sk = p7->d.signed_and_enveloped->signer_info;
++    os = p7->d.signed_and_enveloped->enc_data->enc_data;
++    if (!os)
++    {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++      os = M_ASN1_OCTET_STRING_new();
++#else
++      os = ASN1_OCTET_STRING_new();
++#endif
++      if (!os)
++      {
++        PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_MALLOC_FAILURE);
++        goto err;
++      }
++      p7->d.signed_and_enveloped->enc_data->enc_data = os;
++    }
++    break;
++  case NID_pkcs7_enveloped:
++    /* XXXXXXXXXXXXXXXX */
++    os = p7->d.enveloped->enc_data->enc_data;
++    if (!os)
++    {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++      os = M_ASN1_OCTET_STRING_new();
++#else
++      os = ASN1_OCTET_STRING_new();
++#endif
++      if (!os)
++      {
++        PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_MALLOC_FAILURE);
++        goto err;
++      }
++      p7->d.enveloped->enc_data->enc_data = os;
++    }
++    break;
++  case NID_pkcs7_signed:
++    si_sk = p7->d.sign->signer_info;
++    os = PKCS7_get_octet_string(p7->d.sign->contents);
++    /* If detached data then the content is excluded */
++    if (PKCS7_type_is_data(p7->d.sign->contents) && p7->detached)
++    {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++      M_ASN1_OCTET_STRING_free(os);
++#else
++      ASN1_OCTET_STRING_free(os);
++#endif
++      os = NULL;
++      p7->d.sign->contents->d.data = NULL;
++    }
++    break;
++
++  case NID_pkcs7_digest:
++    os = PKCS7_get_octet_string(p7->d.digest->contents);
++    /* If detached data then the content is excluded */
++    if (PKCS7_type_is_data(p7->d.digest->contents) && p7->detached)
++    {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++      M_ASN1_OCTET_STRING_free(os);
++#else
++      ASN1_OCTET_STRING_free(os);
++#endif
++      os = NULL;
++      p7->d.digest->contents->d.data = NULL;
++    }
++    break;
++
++  default:
++    PKCS7err(PKCS7_F_PKCS7_DATAFINAL, PKCS7_R_UNSUPPORTED_CONTENT_TYPE);
++    goto err;
++  }
++
++  if (si_sk != NULL)
++  {
++    for (i = 0; i < sk_PKCS7_SIGNER_INFO_num(si_sk); i++)
++    {
++      si = sk_PKCS7_SIGNER_INFO_value(si_sk, i);
++      if (si->pkey == NULL)
++        continue;
++      j = OBJ_obj2nid(si->digest_alg->algorithm);
++      md = EVP_get_digestbynid(j);
++      EVP_DigestInit_ex(mdc, md, NULL);
++
++      if (hash)
++      {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++        if (l == (size_t) mdc->digest->ctx_size)
++        {
++          memcpy(mdc->md_data, data, l);
++        }
++#else
++        if (l == (size_t)EVP_MD_meth_get_app_datasize(EVP_MD_CTX_md(mdc)))
++        {
++          memcpy(EVP_MD_CTX_md_data(mdc), data, l);
++        }
++#endif
++        else
++        {
++          EVP_MD_CTX_free(mdc);
++          luaL_argerror(L, 2, "data with wrong length");
++        }
++      }
++      else
++        EVP_DigestUpdate(mdc, data, l);
++
++      sk = si->auth_attr;
++
++      /*
++      * If there are attributes, we add the digest attribute and only
++      * sign the attributes
++      */
++      if (sk_X509_ATTRIBUTE_num(sk) > 0)
++      {
++        if (!do_pkcs7_signed_attrib(si, mdc))
++          goto err;
++      }
++      else
++      {
++        unsigned char *abuf = NULL;
++        unsigned int abuflen;
++        abuflen = EVP_PKEY_size(si->pkey);
++        abuf = OPENSSL_malloc(abuflen);
++        if (!abuf)
++          goto err;
++
++        if (!EVP_SignFinal(mdc, abuf, &abuflen, si->pkey))
++        {
++          PKCS7err(PKCS7_F_PKCS7_DATAFINAL, ERR_R_EVP_LIB);
++          goto err;
++        }
++        ASN1_STRING_set0(si->enc_digest, abuf, abuflen);
++      }
++    }
++  }
++  else if (i == NID_pkcs7_digest)
++  {
++    unsigned char md_data[EVP_MAX_MD_SIZE];
++    unsigned int md_len;
++    md = EVP_get_digestbynid(OBJ_obj2nid(p7->d.digest->md->algorithm));
++    EVP_DigestInit_ex(mdc, md, NULL);
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++    if (l == (size_t) mdc->digest->ctx_size)
++    {
++      memcpy(mdc->md_data, data, l);
++    }
++#else
++    if (l == (size_t)EVP_MD_meth_get_app_datasize(EVP_MD_CTX_md(mdc)))
++    {
++      memcpy(EVP_MD_CTX_md_data(mdc), data, l);
++    }
++#endif
++    else
++    {
++      EVP_MD_CTX_free(mdc);
++      luaL_error(L, "data with wrong data");
++    }
++    if (!EVP_DigestFinal_ex(mdc, md_data, &md_len))
++      goto err;
++    ASN1_OCTET_STRING_set(p7->d.digest->digest, md_data, md_len);
++  }
++
++  if (!PKCS7_is_detached(p7))
++  {
++    /*
++    * NOTE(emilia): I think we only reach os == NULL here because detached
++    * digested data support is broken.
++    */
++    if (os == NULL)
++      goto err;
++    if (!(os->flags & ASN1_STRING_FLAG_NDEF))
++    {
++      char *cont = memdup(data, l);
++      long contlen = l;
++      ASN1_STRING_set0(os, (unsigned char *) cont, contlen);
++    }
++  }
++
++  ret = 1;
++err:
++  EVP_MD_CTX_free(mdc);
++  return openssl_pushresult(L, ret);
++}
++
++/***
++pkcs7 verify signature or digest
++
++ at function verify_digest
++ at tparam[opt] table certs contains certificate used to sign data
++ at tparam[opt] x509_store store to verify certs
++ at tparam string data to be signed
++ at tparam[opt=false] boolean hashed true for data already hashed
++ at treturn boolean result true for success
++*/
++static LUA_FUNCTION(openssl_pkcs7_verify_digest)
++{
++  PKCS7 *p7 = CHECK_OBJECT(1, PKCS7, "openssl.pkcs7");
++  STACK_OF(X509) *certs = lua_isnoneornil(L, 2) ? NULL : openssl_sk_x509_fromtable(L, 2);
++  X509_STORE *store = lua_isnoneornil(L, 3) ? NULL : CHECK_OBJECT(3, X509_STORE, "openssl.x509_store");
++  size_t len = 0;
++  const char* data = luaL_optlstring(L, 4, NULL, &len);
++  long flags = luaL_optint(L, 5, 0);
++  int hash = lua_isnoneornil(L, 6) ? 0 : lua_toboolean(L, 6);
++
++  STACK_OF(X509) *signers;
++  X509 *signer;
++  STACK_OF(PKCS7_SIGNER_INFO) *sinfos;
++  PKCS7_SIGNER_INFO *si;
++  X509_STORE_CTX *cert_ctx;
++
++  int i, j = 0, k, ret = 0;
++
++  /* Check for no data and no content: no data to verify signature */
++  if (flags & PKCS7_DETACHED)
++  {
++    if (!PKCS7_get_detached(p7))
++    {
++      luaL_error(L, "pkcs7 must be detached signedData");
++    }
++    luaL_argcheck(L, data != NULL, 4, "need data to be verified");
++  }
++  else
++  {
++    ASN1_OCTET_STRING *os = NULL;
++
++    luaL_argcheck(L, data == NULL, 4, "must be nil or none");
++    os = PKCS7_get_octet_string(p7->d.sign->contents);
++    data = (const char*)os->data;
++    len = os->length;
++  }
++
++  sinfos = PKCS7_get_signer_info(p7);
++  if (!sinfos || !sk_PKCS7_SIGNER_INFO_num(sinfos))
++  {
++    luaL_error(L, "pkcs7 signedData without signature");
++  }
++
++  signers = PKCS7_get0_signers(p7, certs, flags);
++  if (!signers)
++  {
++    luaL_error(L, "pkcs7 signedData without signers");
++  }
++
++  if (!store)
++    flags |= PKCS7_NOVERIFY;
++
++  /* Now verify the certificates */
++  if (!(flags & PKCS7_NOVERIFY))
++    for (k = 0; k < sk_X509_num(signers); k++)
++    {
++      signer = sk_X509_value(signers, k);
++      cert_ctx = X509_STORE_CTX_new();
++      if (!(flags & PKCS7_NOCHAIN))
++      {
++        if (!X509_STORE_CTX_init(cert_ctx, store, signer,
++                                 p7->d.sign->cert))
++        {
++          PKCS7err(PKCS7_F_PKCS7_VERIFY, ERR_R_X509_LIB);
++          goto err;
++        }
++        X509_STORE_CTX_set_default(cert_ctx, "smime_sign");
++      }
++      else if (!X509_STORE_CTX_init(cert_ctx, store, signer, NULL))
++      {
++        PKCS7err(PKCS7_F_PKCS7_VERIFY, ERR_R_X509_LIB);
++        goto err;
++      }
++      if (!(flags & PKCS7_NOCRL))
++        X509_STORE_CTX_set0_crls(cert_ctx, p7->d.sign->crl);
++      i = X509_verify_cert(cert_ctx);
++      if (i <= 0)
++        j = X509_STORE_CTX_get_error(cert_ctx);
++      X509_STORE_CTX_free(cert_ctx);
++      if (i <= 0)
++      {
++        PKCS7err(PKCS7_F_PKCS7_VERIFY,
++                 PKCS7_R_CERTIFICATE_VERIFY_ERROR);
++        ERR_add_error_data(2, "Verify error:",
++                           X509_verify_cert_error_string(j));
++        goto err;
++      }
++      /* Check for revocation status here */
++    }
++
++  /* Now Verify All Signatures */
++  if (!(flags & PKCS7_NOSIGS))
++    for (i = 0; i < sk_PKCS7_SIGNER_INFO_num(sinfos); i++)
++    {
++      si = sk_PKCS7_SIGNER_INFO_value(sinfos, i);
++      signer = sk_X509_value(signers, i);
++      j = PKCS7_signatureVerify_digest(p7, si, signer,
++                                       (const unsigned char*) data, len, hash);
++      if (j <= 0)
++      {
++        PKCS7err(PKCS7_F_PKCS7_VERIFY, PKCS7_R_SIGNATURE_FAILURE);
++        goto err;
++      }
++    }
++  ret = 1;
++
++err:
++  if (certs)
++    sk_X509_pop_free(certs, X509_free);
++  sk_X509_free(signers);
++  return openssl_pushresult(L, ret);
++}
++#endif
++/***
++verify pkcs7 object, and return msg content, follow by singers
++
++ at function verify
++ at tparam[opt] stack_of_x509 signercerts
++ at tparam[opt] x509_store cacerts
++ at tparam[opt] string|bio msg
++ at tparam[opt=0] number flags
++ at treturn string content
++ at treturn stack_of_x509 signers
++*/
++
++/***
++decrypt encrypted pkcs7 message
++
++ at function decrypt
++ at tparam x509 recipcert
++ at tparam evp_pkey recipkey
++@treturn string decrypt message
++*/
++
+ static luaL_Reg pkcs7_funcs[] =
+ {
++  {"type",          openssl_pkcs7_type},
+   {"parse",         openssl_pkcs7_parse},
+   {"export",        openssl_pkcs7_export},
+   {"decrypt",       openssl_pkcs7_decrypt},
+   {"verify",        openssl_pkcs7_verify},
+-
++  {"final",         openssl_pkcs7_final},
+ #if OPENSSL_VERSION_NUMBER > 0x10000000L
+   {"add_signer",    openssl_pkcs7_sign_add_signer},
+   {"add",           openssl_pkcs7_add},
+@@ -1060,7 +1494,7 @@ static const luaL_Reg R[] =
+   {NULL,  NULL}
+ };
+ 
+-static LuaL_Enum pkcs7_const[] =
++static LuaL_Enumeration pkcs7_const[] =
+ {
+   {"TEXT",         PKCS7_TEXT},
+   {"NOCERTS",      PKCS7_NOCERTS},
+@@ -1084,7 +1518,6 @@ static LuaL_Enum pkcs7_const[] =
+ 
+ int luaopen_pkcs7(lua_State *L)
+ {
+-  int i;
+   auxiliar_newclass(L, "openssl.pkcs7", pkcs7_funcs);
+ 
+   lua_newtable(L);
+@@ -1094,11 +1527,6 @@ int luaopen_pkcs7(lua_State *L)
+   lua_pushliteral(L, MYVERSION);
+   lua_settable(L, -3);
+ 
+-  for (i = 0; i < sizeof(pkcs7_const) / sizeof(LuaL_Enum) - 1; i++)
+-  {
+-    LuaL_Enum e = pkcs7_const[i];
+-    lua_pushinteger(L, e.val);
+-    lua_setfield(L, -2, e.name);
+-  }
++  auxiliar_enumerate(L, -1, pkcs7_const);
+   return 1;
+ }
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkey.c luvi-src-v2.7.6/deps/lua-openssl/src/pkey.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/pkey.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/pkey.c	2019-02-13 11:53:24.298459641 +0100
+@@ -1,10 +1,9 @@
+-/*=========================================================================*\
+-* pkey.c
+-* pkey module for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++pkey module for lua-openssl binding
++ at module pkey
++ at usage
++  pkey = require'openssl'.pkey
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/rsa.h>
+@@ -16,70 +15,71 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-static int openssl_pkey_bits(lua_State *L)
+-{
+-  EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+-  lua_Integer ret = EVP_PKEY_bits(pkey);
+-  lua_pushinteger(L, ret);
+-  return  1;
+-};
+-
+ int openssl_pkey_is_private(EVP_PKEY* pkey)
+ {
++  int ret = 1;
++  int typ;
+   assert(pkey != NULL);
+-
+-  switch (pkey->type)
++  typ = EVP_PKEY_type(EVP_PKEY_id(pkey));
++  switch (typ)
+   {
+ #ifndef OPENSSL_NO_RSA
+   case EVP_PKEY_RSA:
+-  case EVP_PKEY_RSA2:
+-    assert(pkey->pkey.rsa != NULL);
+-    if (pkey->pkey.rsa != NULL && (NULL == pkey->pkey.rsa->p || NULL == pkey->pkey.rsa->q))
+-    {
+-      return 0;
+-    }
++  {
++    RSA *rsa = EVP_PKEY_get0_RSA(pkey);
++    const BIGNUM *d = NULL;
++
++    RSA_get0_key(rsa, NULL, NULL, &d);
++    ret = d != NULL;
+     break;
++  }
+ #endif
+ #ifndef OPENSSL_NO_DSA
+   case EVP_PKEY_DSA:
+-  case EVP_PKEY_DSA1:
+-  case EVP_PKEY_DSA2:
+-  case EVP_PKEY_DSA3:
+-  case EVP_PKEY_DSA4:
+-    assert(pkey->pkey.dsa != NULL);
+-
+-    if (NULL == pkey->pkey.dsa->p || NULL == pkey->pkey.dsa->q || NULL == pkey->pkey.dsa->priv_key)
+-    {
+-      return 0;
+-    }
++  {
++    DSA *dsa = EVP_PKEY_get0_DSA(pkey);
++    const BIGNUM *p = NULL;
++    DSA_get0_key(dsa, NULL, &p);
++    ret = p != NULL;
+     break;
++  }
+ #endif
+ #ifndef OPENSSL_NO_DH
+   case EVP_PKEY_DH:
+-    assert(pkey->pkey.dh != NULL);
+-
+-    if (NULL == pkey->pkey.dh->p || NULL == pkey->pkey.dh->priv_key)
+-    {
+-      return 0;
+-    }
++  {
++    DH *dh = EVP_PKEY_get0_DH(pkey);
++    const BIGNUM *p = NULL;
++    DH_get0_key(dh, NULL, &p);
++    ret = p != NULL;
+     break;
++  }
+ #endif
+ #ifndef OPENSSL_NO_EC
+   case EVP_PKEY_EC:
+-    assert(pkey->pkey.ec != NULL);
+-    if (NULL == EC_KEY_get0_private_key(pkey->pkey.ec))
+-    {
+-      return 0;
+-    }
++  {
++    EC_KEY *ec = EVP_PKEY_get0_EC_KEY(pkey);
++    const BIGNUM *p = EC_KEY_get0_private_key(ec);
++    ret = p != NULL;
+     break;
++  }
+ #endif
+   default:
+-    return -1;
++    ret = 0;
+     break;
+   }
+-  return 1;
++  return ret;
+ }
+ 
++/***
++read public/private key from data
++ at function read
++ at tparam string|openssl.bio input string data or bio object
++ at tparam[opt=false] boolean priv prikey set true when input is private key
++ at tparam[opt='auto'] string format or encoding of input, support 'auto','pem','der'
++ at tparam[opt] string passhprase when input is private key, or key types 'ec','rsa','dsa','dh'
++ at treturn evp_pkey public key
++ at see evp_pkey
++*/
+ static int openssl_pkey_read(lua_State*L)
+ {
+   EVP_PKEY * key = NULL;
+@@ -96,6 +96,8 @@ static int openssl_pkey_read(lua_State*L
+       type = EVP_PKEY_DSA;
+     else if (strcmp(passphrase, "ec") == 0 || strcmp(passphrase, "EC") == 0)
+       type = EVP_PKEY_EC;
++    else if (strcmp(passphrase, "dh") == 0 || strcmp(passphrase, "DH") == 0)
++      type = EVP_PKEY_DH;
+   }
+ 
+   if (fmt == FORMAT_AUTO)
+@@ -107,9 +109,9 @@ static int openssl_pkey_read(lua_State*L
+   {
+     if (fmt == FORMAT_PEM)
+     {
+-      key = PEM_read_bio_PUBKEY(in, NULL, NULL, (void*)passphrase);
+-      BIO_reset(in);
+-      if (key == NULL && type == EVP_PKEY_RSA)
++      switch (type)
++      {
++      case EVP_PKEY_RSA:
+       {
+         RSA* rsa = PEM_read_bio_RSAPublicKey(in, NULL, NULL, NULL);
+         if (rsa)
+@@ -117,21 +119,109 @@ static int openssl_pkey_read(lua_State*L
+           key = EVP_PKEY_new();
+           EVP_PKEY_assign_RSA(key, rsa);
+         }
++        break;
+       }
++      case EVP_PKEY_DSA:
++      {
++        DSA* dsa = PEM_read_bio_DSA_PUBKEY(in, NULL, NULL, NULL);
++        if (dsa)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DSA(key, dsa);
++        }
++        break;
++      }
++      case EVP_PKEY_DH:
++      {
++        DH *dh = PEM_read_bio_DHparams(in, NULL, NULL, NULL);
++        if (dh)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DH(key, dh);
++        }
++        break;
++      }
++      case EVP_PKEY_EC:
++      {
++        EC_KEY *ec = PEM_read_bio_EC_PUBKEY(in, NULL, NULL, NULL);
++        if (ec)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_EC_KEY(key, ec);
++        }
++        break;
++      }
++      default:
++      {
++        key = PEM_read_bio_PUBKEY(in, NULL, NULL, NULL);
++        break;
++      }
++      }
++      (void)BIO_reset(in);
+     }
+     else if (fmt == FORMAT_DER)
+     {
+-      key = d2i_PUBKEY_bio(in, NULL);
+-      BIO_reset(in);
+-      if (!key && type != -1)
++      switch (type)
++      {
++      case EVP_PKEY_RSA:
++      {
++        RSA *rsa = d2i_RSAPublicKey_bio(in, NULL);
++        if (rsa)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_RSA(key, rsa);
++        }
++        break;
++      }
++      case EVP_PKEY_DSA:
++      case EVP_PKEY_DH:
++      case EVP_PKEY_EC:
+       {
+         char * bio_mem_ptr;
+         long bio_mem_len;
+-
++        const unsigned char **pp;
+         bio_mem_len = BIO_get_mem_data(in, &bio_mem_ptr);
+-        key = d2i_PublicKey(type, NULL, (const unsigned char **)&bio_mem_ptr, bio_mem_len);
+-        BIO_reset(in);
++        pp = (const unsigned char **)&bio_mem_ptr;
++
++        key = d2i_PublicKey(type, NULL, pp, bio_mem_len);
++      }
++      /*
++      case EVP_PKEY_DSA:
++      {
++        DSA *dsa = d2i_DSA_PUBKEY_bio(in, NULL);
++        if (dsa)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DSA(key, dsa);
++        }
++        break;
++      }
++      case EVP_PKEY_DH:
++      {
++        DH *dh = d2i_DHparams_bio(in, NULL);
++        if (dh)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DH(key, dh);
++        }
++        break;
++      }
++      case EVP_PKEY_EC:
++      {
++        EC_KEY *ec = d2i_EC_PUBKEY_bio(in, NULL);
++        if (ec)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_EC_KEY(key, ec);
++        }
++        break;
+       }
++      */
++      default:
++        key = d2i_PUBKEY_bio(in, NULL);
++        break;
++      }
++      (void)BIO_reset(in);
+     }
+   }
+   else
+@@ -139,25 +229,61 @@ static int openssl_pkey_read(lua_State*L
+     if (fmt == FORMAT_PEM)
+     {
+       key = PEM_read_bio_PrivateKey(in, NULL, NULL, (void*)passphrase);
+-      BIO_reset(in);
++      (void)BIO_reset(in);
+     }
+     else if (fmt == FORMAT_DER)
+     {
+-      if (passphrase)
+-        key = d2i_PKCS8PrivateKey_bio(in, NULL, NULL, (void*)passphrase);
+-      else
+-        key = d2i_PrivateKey_bio(in, NULL);
+-      BIO_reset(in);
+-
+-      if (!key && type != -1)
++      switch (type)
+       {
+-        char * bio_mem_ptr;
+-        long bio_mem_len;
+-
+-        bio_mem_len = BIO_get_mem_data(in, &bio_mem_ptr);
+-        key = d2i_PrivateKey(type, NULL, (const unsigned char **)&bio_mem_ptr, bio_mem_len);
+-        BIO_reset(in);
++      case EVP_PKEY_RSA:
++      {
++        RSA *rsa = d2i_RSAPrivateKey_bio(in, NULL);
++        if (rsa)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_RSA(key, rsa);
++        }
++        break;
+       }
++      case EVP_PKEY_DSA:
++      {
++        DSA *dsa = d2i_DSAPrivateKey_bio(in, NULL);
++        if (dsa)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DSA(key, dsa);
++        }
++        break;
++      }
++      case EVP_PKEY_DH:
++      {
++        DH *dh = d2i_DHparams_bio(in, NULL);
++        if (dh)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_DH(key, dh);
++        }
++      }
++      case EVP_PKEY_EC:
++      {
++        EC_KEY *ec = d2i_ECPrivateKey_bio(in, NULL);
++        if (ec)
++        {
++          key = EVP_PKEY_new();
++          EVP_PKEY_assign_EC_KEY(key, ec);
++        }
++        break;
++      }
++      default:
++      {
++        if (passphrase)
++          key = d2i_PKCS8PrivateKey_bio(in, NULL, NULL, (void*)passphrase);
++        else
++          key = d2i_PrivateKey_bio(in, NULL);
++        break;
++      }
++      }
++      (void)BIO_reset(in);
+     }
+   }
+   BIO_free(in);
+@@ -232,7 +358,7 @@ err:
+     size_t l = 0; const char* bn = luaL_checklstring(L, -1, &l);                      \
+     if (_name == NULL)  _name = BN_new();                                             \
+     BN_bin2bn((const unsigned char *)bn, l, _name);                                   \
+-  } else if (auxiliar_isclass(L, "openssl.bn", -1)) {                                 \
++  } else if (auxiliar_getclassudata(L, "openssl.bn", -1)) {                                 \
+     const BIGNUM* bn = CHECK_OBJECT(-1, BIGNUM, "openssl.bn");                        \
+     if (_name == NULL)  _name = BN_new();                                             \
+     BN_copy(_name, bn);                                                               \
+@@ -241,6 +367,40 @@ err:
+   lua_pop(L, 1);                                                                      \
+ }
+ 
++/***
++generate a new ec keypair
++ at function new
++ at tparam string alg, alg must be 'ec'
++ at tparam string|number curvename this can be integer as curvename NID
++ at tparam[opt] integer flags when alg is ec need this.
++ at treturn evp_pkey object with mapping to EVP_PKEY in openssl
++*/
++/***
++generate a new keypair
++ at function new
++ at tparam[opt='rsa'] string alg, accept `rsa`,`dsa`,`dh`
++ at tparam[opt=2048|512] integer bits, `rsa` with 2048, `dh` or `dsa` with 1024
++ at tparam[opt] integer e, when alg is `rsa` give e value default is 0x10001,
++ when alg is `dh` give generator value default is 2,
++ when alg is `dsa` give string type seed value default is none.
++ at tparam[opt] engine eng
++ at treturn evp_pkey object with mapping to EVP_PKEY in openssl
++*/
++/***
++create a new keypair by factors of keypair or get public key only
++ at function new
++ at tparam table factors to create private/public key, key alg only accept accept 'rsa','dsa','dh','ec' and must exist</br>
++ when arg is rsa, table may with key n,e,d,p,q,dmp1,dmq1,iqmp, both are binary string or openssl.bn<br>
++ when arg is dsa, table may with key p,q,g,priv_key,pub_key, both are binary string or openssl.bn<br>
++ when arg is dh, table may with key p,g,priv_key,pub_key, both are binary string or openssl.bn<br>
++ when arg is ec, table may with D,X,Y,Z,both are binary string or openssl.bn<br>
++ at treturn evp_pkey object with mapping to EVP_PKEY in openssl
++ at usage
++ --create rsa public key
++   pubkey = new({alg='rsa',n=...,e=...}
++ --create new rsa
++   rsa = new({alg='rsa',n=...,q=...,e=...,...}
++*/
+ static LUA_FUNCTION(openssl_pkey_new)
+ {
+   EVP_PKEY *pkey = NULL;
+@@ -252,10 +412,11 @@ static LUA_FUNCTION(openssl_pkey_new)
+ 
+     if (strcasecmp(alg, "rsa") == 0)
+     {
+-      int bits = luaL_optint(L, 2, 1024);
++      int bits = luaL_optint(L, 2, 2048);
+       int e = luaL_optint(L, 3, 65537);
+-      RSA* rsa = RSA_new();
++      ENGINE *eng = lua_isnoneornil(L, 4) ? NULL : CHECK_OBJECT(4, ENGINE, "openssl.engine");
+ 
++      RSA *rsa = eng ? RSA_new_method(eng) : RSA_new();
+       BIGNUM *E = BN_new();
+       BN_set_word(E, e);
+       if (RSA_generate_key_ex(rsa, bits, E, NULL))
+@@ -272,8 +433,9 @@ static LUA_FUNCTION(openssl_pkey_new)
+       int bits = luaL_optint(L, 2, 1024);
+       size_t seed_len = 0;
+       const char* seed = luaL_optlstring(L, 3, NULL, &seed_len);
++      ENGINE *eng = lua_isnoneornil(L, 4) ? NULL : CHECK_OBJECT(4, ENGINE, "openssl.engine");
+ 
+-      DSA *dsa = DSA_new();
++      DSA *dsa = eng ? DSA_new_method(eng) : DSA_new();
+       if (DSA_generate_parameters_ex(dsa, bits, (byte*)seed, seed_len, NULL, NULL, NULL)
+           && DSA_generate_key(dsa))
+       {
+@@ -285,10 +447,11 @@ static LUA_FUNCTION(openssl_pkey_new)
+     }
+     else if (strcasecmp(alg, "dh") == 0)
+     {
+-      int bits = luaL_optint(L, 2, 512);
++      int bits = luaL_optint(L, 2, 1024);
+       int generator = luaL_optint(L, 3, 2);
++      ENGINE *eng = lua_isnoneornil(L, 4) ? NULL : CHECK_OBJECT(4, ENGINE, "openssl.engine");
+ 
+-      DH* dh = DH_new();
++      DH* dh = eng ? DH_new_method(eng) : DH_new();
+       if (DH_generate_parameters_ex(dh, bits, generator, NULL))
+       {
+         if (DH_generate_key(dh))
+@@ -324,7 +487,6 @@ static LUA_FUNCTION(openssl_pkey_new)
+       }
+       else
+         EC_GROUP_free(group);
+-
+     }
+ #endif
+     else
+@@ -345,22 +507,59 @@ static LUA_FUNCTION(openssl_pkey_new)
+         RSA *rsa = RSA_new();
+         if (rsa)
+         {
+-          OPENSSL_PKEY_SET_BN(1, rsa, n);
+-          OPENSSL_PKEY_SET_BN(1, rsa, e);
+-          OPENSSL_PKEY_SET_BN(1, rsa, d);
+-          OPENSSL_PKEY_SET_BN(1, rsa, p);
+-          OPENSSL_PKEY_SET_BN(1, rsa, q);
+-          OPENSSL_PKEY_SET_BN(1, rsa, dmp1);
+-          OPENSSL_PKEY_SET_BN(1, rsa, dmq1);
+-          OPENSSL_PKEY_SET_BN(1, rsa, iqmp);
+-          if (rsa->n)
++          BIGNUM *n = NULL, *e = NULL, *d = NULL;
++          BIGNUM *p = NULL, *q = NULL;
++          BIGNUM *dmp1 = NULL, *dmq1 = NULL, *iqmp = NULL;
++
++          lua_getfield(L, 1, "n");
++          n = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "e");
++          e = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "d");
++          d = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "p");
++          p = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "q");
++          q = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "dmp1");
++          dmp1 = BN_get(L, -1);
++          lua_pop(L, 1);
++          lua_getfield(L, 1, "dmq1");
++          dmq1 = BN_get(L, -1);
++          lua_pop(L, 1);
++          lua_getfield(L, 1, "iqmp");
++          iqmp = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          if (RSA_set0_key(rsa, n, e, d) == 1
++              && (p == NULL || RSA_set0_factors(rsa, p, q) == 1)
++              && (dmp1 == NULL || RSA_set0_crt_params(rsa, dmp1, dmq1, iqmp) == 1) )
+           {
+             if (!EVP_PKEY_assign_RSA(pkey, rsa))
+             {
++              RSA_free(rsa);
++              rsa = NULL;
+               EVP_PKEY_free(pkey);
+               pkey = NULL;
+             }
+           }
++          else
++          {
++            RSA_free(rsa);
++            rsa = NULL;
++            EVP_PKEY_free(pkey);
++            pkey = NULL;
++          }
+         }
+       }
+     }
+@@ -372,23 +571,46 @@ static LUA_FUNCTION(openssl_pkey_new)
+         DSA *dsa = DSA_new();
+         if (dsa)
+         {
+-          OPENSSL_PKEY_SET_BN(-1, dsa, p);
+-          OPENSSL_PKEY_SET_BN(-1, dsa, q);
+-          OPENSSL_PKEY_SET_BN(-1, dsa, g);
+-          OPENSSL_PKEY_SET_BN(-1, dsa, priv_key);
+-          OPENSSL_PKEY_SET_BN(-1, dsa, pub_key);
+-          if (dsa->p && dsa->q && dsa->g)
++          BIGNUM *p = NULL, *q = NULL, *g = NULL;
++          BIGNUM *priv_key = NULL, *pub_key = NULL;
++
++          lua_getfield(L, 1, "p");
++          p = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "q");
++          q = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "g");
++          g = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "priv_key");
++          priv_key = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "pub_key");
++          pub_key = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          if (DSA_set0_key(dsa, pub_key, priv_key) == 1
++              && DSA_set0_pqg(dsa, p, q, g))
+           {
+-            if (!dsa->priv_key && !dsa->pub_key)
+-            {
+-              DSA_generate_key(dsa);
+-            }
+             if (!EVP_PKEY_assign_DSA(pkey, dsa))
+             {
++              DSA_free(dsa);
+               EVP_PKEY_free(pkey);
+               pkey = NULL;
+             }
+           }
++          else
++          {
++            DSA_free(dsa);
++            dsa = NULL;
++            EVP_PKEY_free(pkey);
++            pkey = NULL;
++          }
+         }
+       }
+     }
+@@ -401,22 +623,47 @@ static LUA_FUNCTION(openssl_pkey_new)
+         DH *dh = DH_new();
+         if (dh)
+         {
+-          OPENSSL_PKEY_SET_BN(-1, dh, p);
+-          OPENSSL_PKEY_SET_BN(-1, dh, g);
+-          OPENSSL_PKEY_SET_BN(-1, dh, priv_key);
+-          OPENSSL_PKEY_SET_BN(-1, dh, pub_key);
+-          if (dh->p && dh->g)
++          BIGNUM *p = NULL, *q = NULL, *g = NULL;
++          BIGNUM *priv_key = NULL, *pub_key = NULL;
++
++          lua_getfield(L, 1, "p");
++          p = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "q");
++          q = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "g");
++          g = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "priv_key");
++          priv_key = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          lua_getfield(L, 1, "pub_key");
++          pub_key = BN_get(L, -1);
++          lua_pop(L, 1);
++
++          if (DH_set0_key(dh, pub_key, priv_key) == 1
++              && DH_set0_pqg(dh, p, q, g))
+           {
+-            if (!dh->pub_key)
+-            {
+-              DH_generate_key(dh);
+-            }
+             if (!EVP_PKEY_assign_DH(pkey, dh))
+             {
++              DH_free(dh);
++              dh = NULL;
+               EVP_PKEY_free(pkey);
+               pkey = NULL;
+             }
+           }
++          else
++          {
++            DH_free(dh);
++            dh = NULL;
++            EVP_PKEY_free(pkey);
++            pkey = NULL;
++          }
+         }
+       }
+     }
+@@ -482,8 +729,14 @@ static LUA_FUNCTION(openssl_pkey_new)
+       EC_GROUP_free(group);
+     }
+   }
++  else if (auxiliar_getclassudata(L, "openssl.rsa", 1))
++  {
++    RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++    pkey = EVP_PKEY_new();
++    EVP_PKEY_assign_RSA(pkey, rsa);
++  }
+ 
+-  if (pkey && pkey->pkey.ptr)
++  if (pkey && EVP_PKEY_id(pkey) != NID_undef)
+   {
+     PUSH_OBJECT(pkey, "openssl.evp_pkey");
+     return 1;
+@@ -491,15 +744,27 @@ static LUA_FUNCTION(openssl_pkey_new)
+   else
+     EVP_PKEY_free(pkey);
+   return 0;
+-
+ }
+ 
++/***
++openssl.evp_pkey object
++ at type evp_pkey
++*/
++/***
++export evp_pkey as pem/der string
++ at function export
++ at tparam[opt='pem'] string support export as 'pem' or 'der' format, default is 'pem'
++ at tparam[opt=false] boolean raw true for export low layer key just rsa,dsa,ec
++ at tparam[opt] string passphrase if given, export key will encrypt with des-cbc-ede,
++only need when export private key
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_pkey_export)
+ {
+   EVP_PKEY * key;
+   int ispriv = 0;
+   int exraw = 0;
+-  int expem = 1;
++  int fmt = FORMAT_AUTO;
+   size_t passphrase_len = 0;
+   BIO * bio_out = NULL;
+   int ret = 0;
+@@ -509,19 +774,16 @@ static LUA_FUNCTION(openssl_pkey_export)
+   key = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   ispriv = openssl_pkey_is_private(key);
+ 
+-  if (!lua_isnoneornil(L, 2))
+-    expem = lua_toboolean(L, 2);
+-
+-  if (expem)
+-  {
+-    if (!lua_isnoneornil(L, 3))
+-      exraw = lua_toboolean(L, 3);
+-    passphrase = luaL_optlstring(L, 4, NULL, &passphrase_len);
+-  }
+-  else
+-  {
+-    passphrase = luaL_optlstring(L, 3, NULL, &passphrase_len);
+-  }
++  fmt = lua_type(L, 2);
++  luaL_argcheck(L, fmt == LUA_TSTRING || fmt == LUA_TNONE, 2,
++                "only accept 'pem','der' or none");
++  fmt = luaL_checkoption(L, 2, "pem", format);
++  luaL_argcheck(L, fmt == FORMAT_PEM || fmt == FORMAT_DER, 2,
++                "only accept pem or der, default is pem");
++
++  if (!lua_isnoneornil(L, 3))
++    exraw = lua_toboolean(L, 3);
++  passphrase = luaL_optlstring(L, 4, NULL, &passphrase_len);
+ 
+   if (passphrase)
+   {
+@@ -533,7 +795,7 @@ static LUA_FUNCTION(openssl_pkey_export)
+   }
+ 
+   bio_out = BIO_new(BIO_s_mem());
+-  if (expem)
++  if (fmt == FORMAT_PEM)
+   {
+     if (exraw == 0)
+     {
+@@ -544,29 +806,25 @@ static LUA_FUNCTION(openssl_pkey_export)
+     else
+     {
+       /* export raw key format */
+-      switch (EVP_PKEY_type(key->type))
++      switch (EVP_PKEY_type(EVP_PKEY_id(key)))
+       {
+       case EVP_PKEY_RSA:
+-      case EVP_PKEY_RSA2:
+-        ret = ispriv ? PEM_write_bio_RSAPrivateKey(bio_out, key->pkey.rsa, cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
+-              : PEM_write_bio_RSAPublicKey(bio_out, key->pkey.rsa);
++        ret = ispriv ? PEM_write_bio_RSAPrivateKey(bio_out, EVP_PKEY_get0_RSA(key), cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
++              : PEM_write_bio_RSAPublicKey(bio_out, EVP_PKEY_get0_RSA(key));
+         break;
+       case EVP_PKEY_DSA:
+-      case EVP_PKEY_DSA2:
+-      case EVP_PKEY_DSA3:
+-      case EVP_PKEY_DSA4:
+       {
+-        ret = ispriv ? PEM_write_bio_DSAPrivateKey(bio_out, key->pkey.dsa, cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
+-              : PEM_write_bio_DSA_PUBKEY(bio_out, key->pkey.dsa);
++        ret = ispriv ? PEM_write_bio_DSAPrivateKey(bio_out, EVP_PKEY_get0_DSA(key), cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
++              : PEM_write_bio_DSA_PUBKEY(bio_out, EVP_PKEY_get0_DSA(key));
+       }
+       break;
+       case EVP_PKEY_DH:
+-        ret = PEM_write_bio_DHparams(bio_out, key->pkey.dh);
++        ret = PEM_write_bio_DHparams(bio_out, EVP_PKEY_get0_DH(key));
+         break;
+ #ifndef OPENSSL_NO_EC
+       case EVP_PKEY_EC:
+-        ret = ispriv ? PEM_write_bio_ECPrivateKey(bio_out, key->pkey.ec, cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
+-              : PEM_write_bio_EC_PUBKEY(bio_out, key->pkey.ec);
++        ret = ispriv ? PEM_write_bio_ECPrivateKey(bio_out, EVP_PKEY_get0_EC_KEY(key), cipher, (unsigned char *)passphrase, passphrase_len, NULL, NULL)
++              : PEM_write_bio_EC_PUBKEY(bio_out, EVP_PKEY_get0_EC_KEY(key));
+         break;
+ #endif
+       default:
+@@ -577,41 +835,45 @@ static LUA_FUNCTION(openssl_pkey_export)
+   }
+   else
+   {
+-    if (ispriv)
++    /* out put der */
++    if (exraw == 0)
+     {
+-      if (passphrase == NULL)
+-      {
+-        ret = i2d_PrivateKey_bio(bio_out, key);
+-      }
+-      else
+-      {
+-        ret = i2d_PKCS8PrivateKey_bio(bio_out, key, cipher, (char *)passphrase, passphrase_len, NULL, NULL);
+-      }
++      ret = ispriv ?
++            (passphrase == NULL ? i2d_PrivateKey_bio(bio_out, key) :
++             i2d_PKCS8PrivateKey_bio(bio_out, key, cipher, (char *)passphrase, passphrase_len, NULL, NULL))
++            : i2d_PUBKEY_bio(bio_out, key);
+     }
+     else
+     {
+-      int l;
+-      l = i2d_PublicKey(key, NULL);
+-      if (l > 0)
+-      {
+-        unsigned char* p = malloc(l);
+-        unsigned char* pp = p;
+-        l = i2d_PublicKey(key, &pp);
+-        if (l > 0)
+-        {
+-          BIO_write(bio_out, p, l);
+-          ret = 1;
+-        }
+-        else
+-          ret = 0;
+-        free(p);
++      /* output raw key, rsa, ec, dh, dsa */
++      switch (EVP_PKEY_type(EVP_PKEY_id(key)))
++      {
++      case EVP_PKEY_RSA:
++        ret = ispriv ? i2d_RSAPrivateKey_bio(bio_out, EVP_PKEY_get0_RSA(key))
++              : i2d_RSAPublicKey_bio(bio_out, EVP_PKEY_get0_RSA(key));
++        break;
++      case EVP_PKEY_DSA:
++      {
++        ret = ispriv ? i2d_DSAPrivateKey_bio(bio_out, EVP_PKEY_get0_DSA(key))
++              : i2d_DSA_PUBKEY_bio(bio_out, EVP_PKEY_get0_DSA(key));
+       }
+-      else
++      break;
++      case EVP_PKEY_DH:
++        ret = i2d_DHparams_bio(bio_out, EVP_PKEY_get0_DH(key));
++        break;
++#ifndef OPENSSL_NO_EC
++      case EVP_PKEY_EC:
++        ret = ispriv ? i2d_ECPrivateKey_bio(bio_out, EVP_PKEY_get0_EC_KEY(key))
++              : i2d_EC_PUBKEY_bio(bio_out, EVP_PKEY_get0_EC_KEY(key));
++        break;
++#endif
++      default:
+         ret = 0;
++        break;
++      }
+     }
+   }
+ 
+-
+   if (ret)
+   {
+     char * bio_mem_ptr;
+@@ -637,20 +899,24 @@ static LUA_FUNCTION(openssl_pkey_free)
+   return 0;
+ }
+ 
++/***
++get key details as table
++ at function parse
++ at treturn table infos with key bits,pkey,type, pkey may be rsa,dh,dsa, show as table with factor hex encoded bignum
++*/
+ static LUA_FUNCTION(openssl_pkey_parse)
+ {
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+-  if (pkey->pkey.ptr)
++  if (EVP_PKEY_id(pkey) != NID_undef)
+   {
+     lua_newtable(L);
+ 
+     AUXILIAR_SET(L, -1, "bits", EVP_PKEY_bits(pkey), integer);
+     AUXILIAR_SET(L, -1, "size", EVP_PKEY_size(pkey), integer);
+ 
+-    switch (EVP_PKEY_type(pkey->type))
++    switch (EVP_PKEY_type(EVP_PKEY_id(pkey)))
+     {
+     case EVP_PKEY_RSA:
+-    case EVP_PKEY_RSA2:
+     {
+       RSA* rsa = EVP_PKEY_get1_RSA(pkey);
+       PUSH_OBJECT(rsa, "openssl.rsa");
+@@ -661,9 +927,6 @@ static LUA_FUNCTION(openssl_pkey_parse)
+ 
+     break;
+     case EVP_PKEY_DSA:
+-    case EVP_PKEY_DSA2:
+-    case EVP_PKEY_DSA3:
+-    case EVP_PKEY_DSA4:
+     {
+       DSA* dsa = EVP_PKEY_get1_DSA(pkey);
+       PUSH_OBJECT(dsa, "openssl.dsa");
+@@ -703,104 +966,115 @@ static LUA_FUNCTION(openssl_pkey_parse)
+     luaL_argerror(L, 1, "not assign any keypair");
+   return 0;
+ };
+-/* }}} */
+ 
++/***
++encrypt message with public key
++encrypt length of message must not longer than key size, if shorter will do padding,currently supports 6 padding modes.
++They are: pkcs1, sslv23, no, oaep, x931, pss.
++ at function encrypt
++ at tparam string data data to be encrypted
++ at tparam string[opt='pkcs1'] string padding padding mode
++ at treturn string encrypted message
++*/
+ static LUA_FUNCTION(openssl_pkey_encrypt)
+ {
+   size_t dlen = 0;
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   const char *data = luaL_checklstring(L, 2, &dlen);
+   int padding = openssl_get_padding(L, 3, "pkcs1");
++  ENGINE *engine = lua_isnoneornil(L, 4) ? NULL : CHECK_OBJECT(4, ENGINE, "openssl.engine");
+   size_t clen = EVP_PKEY_size(pkey);
+   EVP_PKEY_CTX *ctx = NULL;
+   int ret = 0;
++  int typ = EVP_PKEY_type(EVP_PKEY_id(pkey));
+ 
+-  if (pkey->type != EVP_PKEY_RSA && pkey->type != EVP_PKEY_RSA2)
++  if (typ != EVP_PKEY_RSA && typ != EVP_PKEY_RSA2)
+   {
+     luaL_argerror(L, 2, "EVP_PKEY must be of type RSA or RSA2");
+     return ret;
+   }
+ 
+-  if (openssl_pkey_is_private(pkey) == 0)
++  ctx = EVP_PKEY_CTX_new(pkey, engine);
++  if (EVP_PKEY_encrypt_init(ctx) == 1)
+   {
+-    ctx = EVP_PKEY_CTX_new(pkey, pkey->engine);
+-    if (EVP_PKEY_encrypt_init(ctx) == 1)
++    if (EVP_PKEY_CTX_set_rsa_padding(ctx, padding) == 1)
+     {
+-      if (EVP_PKEY_CTX_set_rsa_padding(ctx, padding) == 1)
++      byte* buf = malloc(clen);
++      if (EVP_PKEY_encrypt(ctx, buf, &clen, (const unsigned char*)data, dlen) == 1)
+       {
+-        byte* buf = malloc(clen);
+-        if (EVP_PKEY_encrypt(ctx, buf, &clen, (const unsigned char*)data, dlen) == 1)
+-        {
+-          lua_pushlstring(L, (const char*)buf, clen);
+-          ret = 1;
+-        }
+-        else
+-          ret = openssl_pushresult(L, 0);
+-        free(buf);
++        lua_pushlstring(L, (const char*)buf, clen);
++        ret = 1;
+       }
+       else
+         ret = openssl_pushresult(L, 0);
++      free(buf);
+     }
+     else
+       ret = openssl_pushresult(L, 0);
+-    EVP_PKEY_CTX_free(ctx);
+   }
+   else
+-  {
+-    luaL_argerror(L, 2, "EVP_PKEY must be public key");
+-  }
++    ret = openssl_pushresult(L, 0);
++  EVP_PKEY_CTX_free(ctx);
+ 
+   return ret;
+ }
+ 
++/***
++decrypt message with private key
++pair with encrypt
++ at function decrypt
++ at tparam string data data to be decrypted
++ at tparam string[opt='pkcs1'] string padding padding mode
++ at treturn[1] string result
++ at treturn[2] nil
++*/
+ static LUA_FUNCTION(openssl_pkey_decrypt)
+ {
+   size_t dlen = 0;
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   const char *data = luaL_checklstring(L, 2, &dlen);
+   int padding = openssl_get_padding(L, 3, "pkcs1");
++  ENGINE *engine = lua_isnoneornil(L, 4) ? NULL : CHECK_OBJECT(4, ENGINE, "openssl.engine");
+   size_t clen = EVP_PKEY_size(pkey);
+   EVP_PKEY_CTX *ctx = NULL;
+   int ret = 0;
++  int type = EVP_PKEY_type(EVP_PKEY_id(pkey));
+ 
+-  if (pkey->type != EVP_PKEY_RSA && pkey->type != EVP_PKEY_RSA2)
++  if (type != EVP_PKEY_RSA && type != EVP_PKEY_RSA2)
+   {
+     luaL_argerror(L, 2, "EVP_PKEY must be of type RSA or RSA2");
+     return ret;
+   }
+-
+-  if (openssl_pkey_is_private(pkey))
++  ctx = EVP_PKEY_CTX_new(pkey, engine);
++  if (EVP_PKEY_decrypt_init(ctx) == 1)
+   {
+-    ctx = EVP_PKEY_CTX_new(pkey, pkey->engine);
+-    if (EVP_PKEY_decrypt_init(ctx) == 1)
++    if (EVP_PKEY_CTX_set_rsa_padding(ctx, padding) == 1)
+     {
+-      if (EVP_PKEY_CTX_set_rsa_padding(ctx, padding) == 1)
+-      {
+-        byte* buf = malloc(clen);
++      byte* buf = malloc(clen);
+ 
+-        if (EVP_PKEY_decrypt(ctx, buf, &clen, (const unsigned char*)data, dlen) == 1)
+-        {
+-          lua_pushlstring(L, (const char*)buf, clen);
+-          ret = 1;
+-        }
+-        else
+-          ret = openssl_pushresult(L, 0);
+-        free(buf);
++      if (EVP_PKEY_decrypt(ctx, buf, &clen, (const unsigned char*)data, dlen) == 1)
++      {
++        lua_pushlstring(L, (const char*)buf, clen);
++        ret = 1;
+       }
+       else
+         ret = openssl_pushresult(L, 0);
++      free(buf);
+     }
+     else
+       ret = openssl_pushresult(L, 0);
+-    EVP_PKEY_CTX_free(ctx);
+   }
+   else
+-  {
+-    luaL_argerror(L, 2, "EVP_PKEY must be private key");
+-  }
++    ret = openssl_pushresult(L, 0);
++  EVP_PKEY_CTX_free(ctx);
+   return ret;
+ }
+ 
++/***
++return key is private or public
++ at function is_private
++ at treturn boolean ture is private or public key
++*/
+ LUA_FUNCTION(openssl_pkey_is_private1)
+ {
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+@@ -813,35 +1087,37 @@ LUA_FUNCTION(openssl_pkey_is_private1)
+     luaL_error(L, "openssl.evp_pkey is not support");
+   return 1;
+ }
+-
++/* private usage, and for sm2 */
++/***
++return public key
++ at function get_public
++ at treturn evp_pkey pub
++*/
+ static LUA_FUNCTION(openssl_pkey_get_public)
+ {
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+-  int private = openssl_pkey_is_private(pkey);
+   int ret = 0;
+-  if (private == 0)
+-    luaL_argerror(L, 1, "alreay public key");
+-  else
++  BIO* bio = BIO_new(BIO_s_mem());
++  if (i2d_PUBKEY_bio(bio, pkey))
+   {
+-    BIO* bio = BIO_new(BIO_s_mem());
+-    if (i2d_PUBKEY_bio(bio, pkey))
+-    {
+-      EVP_PKEY *pub = d2i_PUBKEY_bio(bio, NULL);
+-      PUSH_OBJECT(pub, "openssl.evp_pkey");
+-      ret = 1;
+-    }
+-    BIO_free(bio);
++    EVP_PKEY *pub = d2i_PUBKEY_bio(bio, NULL);
++    PUSH_OBJECT(pub, "openssl.evp_pkey");
++    ret = 1;
+   }
++  BIO_free(bio);
+   return ret;
+ }
+ 
++/* private useage, and for sm2 */
+ static LUA_FUNCTION(openssl_ec_userId)
+ {
+   EVP_PKEY* pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   ENGINE* engine = CHECK_OBJECT(2, ENGINE, "openssl.engine");
++  EC_KEY *ec = NULL;
+ 
+   int ret = 0;
+-  if (!pkey || EVP_PKEY_type(pkey->type) != EVP_PKEY_EC || !pkey->pkey.ec)
++  if (!pkey || EVP_PKEY_type(EVP_PKEY_id(pkey)) != EVP_PKEY_EC
++      || (ec = EVP_PKEY_get0_EC_KEY(pkey)) == NULL )
+   {
+     luaL_argerror(L, 1, "only support EC key");
+   }
+@@ -851,7 +1127,7 @@ static LUA_FUNCTION(openssl_ec_userId)
+   if (lua_gettop(L) == 2)
+   {
+     ASN1_OCTET_STRING *s = ASN1_OCTET_STRING_new();
+-    ret = ENGINE_ctrl(engine, 0x474554, 0x4944, pkey->pkey.ec, (void(*)(void))s);
++    ret = ENGINE_ctrl(engine, 0x474554, 0x4944, ec, (void(*)(void))s);
+     if (ret == 1)
+       lua_pushlstring(L, (const char*) ASN1_STRING_data(s), ASN1_STRING_length(s));
+     else
+@@ -864,11 +1140,19 @@ static LUA_FUNCTION(openssl_ec_userId)
+     size_t l;
+     const char* data = luaL_checklstring(L, 3, &l);
+     ASN1_OCTET_STRING_set(s, (const unsigned char*) data, l);
+-    ret = ENGINE_ctrl(engine, 0x534554, 0x4944, pkey->pkey.ec, (void(*)(void))s);
++    ret = ENGINE_ctrl(engine, 0x534554, 0x4944, ec, (void(*)(void))s);
+     return openssl_pushresult(L, ret);
+   }
+ }
+ 
++/***
++compute dh key, check whether then supplied key is a private key
++by checking then prime factors whether set
++ at function compute_key
++ at tparam string remote_public_key
++ at treturn string
++ at todo: more check
++*/
+ static LUA_FUNCTION(openssl_dh_compute_key)
+ {
+   BIGNUM *pub;
+@@ -879,16 +1163,18 @@ static LUA_FUNCTION(openssl_dh_compute_k
+   EVP_PKEY* pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   size_t pub_len;
+   const char* pub_str = luaL_checklstring(L, 2, &pub_len);
++  DH *dh = NULL;
+ 
+-  if (!pkey || EVP_PKEY_type(pkey->type) != EVP_PKEY_DH || !pkey->pkey.dh)
++  if (!pkey || EVP_PKEY_type(EVP_PKEY_id(pkey)) != EVP_PKEY_DH
++      || (dh = EVP_PKEY_get0_DH(pkey)) == NULL)
+   {
+     luaL_argerror(L, 1, "only support DH private key");
+   }
+ 
+   pub = BN_bin2bn((unsigned char*)pub_str, pub_len, NULL);
+ 
+-  data = malloc(DH_size(pkey->pkey.dh) + 1);
+-  len = DH_compute_key((unsigned char*)data, pub, pkey->pkey.dh);
++  data = malloc(DH_size(dh) + 1);
++  len = DH_compute_key((unsigned char*)data, pub, dh);
+ 
+   if (len >= 0)
+   {
+@@ -906,78 +1192,109 @@ static LUA_FUNCTION(openssl_dh_compute_k
+   return ret;
+ }
+ 
++/***
++sign message with private key
++ at function sign
++ at tparam string data data be signed
++ at tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
++ at treturn string signed message
++*/
+ static LUA_FUNCTION(openssl_sign)
+ {
+   size_t data_len;
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   const char * data = luaL_checklstring(L, 2, &data_len);
+-  int top = lua_gettop(L);
++  int ret = 0;
++  EVP_MD_CTX *ctx = NULL;
+ 
+-  const EVP_MD *mdtype = NULL;
+-  if (top > 2)
+-  {
+-    mdtype = get_digest(L, 3);
+-  }
+-  else
+-    mdtype = EVP_get_digestbyname("sha1");
+-  if (mdtype)
++  const EVP_MD *md = get_digest(L, 3, "sha256");
++  ctx = EVP_MD_CTX_create();
++  ret = EVP_DigestSignInit(ctx, NULL, md, NULL, pkey);
++  if (ret == 1)
+   {
+-    int ret = 0;
+-    EVP_MD_CTX md_ctx;
+-    unsigned int siglen = EVP_PKEY_size(pkey);
+-    unsigned char *sigbuf = malloc(siglen + 1);
+-
+-    EVP_SignInit(&md_ctx, mdtype);
+-    EVP_SignUpdate(&md_ctx, data, data_len);
+-    if (EVP_SignFinal (&md_ctx, sigbuf, &siglen, pkey))
++    ret = EVP_DigestSignUpdate(ctx, data, data_len);
++    if (ret == 1)
+     {
+-      lua_pushlstring(L, (char *)sigbuf, siglen);
+-      ret = 1;
++      size_t siglen = 0;
++      unsigned char *sigbuf = NULL;
++      ret = EVP_DigestSignFinal(ctx, NULL, &siglen);
++      if (ret == 1)
++      {
++        siglen += 2;
++        sigbuf = OPENSSL_malloc(siglen);
++        ret = EVP_DigestSignFinal(ctx, sigbuf, &siglen);
++        if (ret == 1)
++        {
++          lua_pushlstring(L, (char *)sigbuf, siglen);
++        }
++        else
++          ret = openssl_pushresult(L, ret);
++        OPENSSL_free(sigbuf);
++      }
++      else
++        ret = openssl_pushresult(L, ret);
+     }
+-    free(sigbuf);
+-    EVP_MD_CTX_cleanup(&md_ctx);
+-    return ret;
++    else
++      ret = openssl_pushresult(L, ret);
+   }
+   else
+-    luaL_argerror(L, 3, "Not support digest alg");
++    ret = openssl_pushresult(L, ret);
+ 
+-  return 0;
++  EVP_MD_CTX_destroy(ctx);
++  return ret;
+ }
+ 
++/***
++verify signed message with public key
++ at function verify
++ at tparam string data data be signed
++ at tparam string signature signed result
++ at tparam[opt='SHA1'] string|env_digest md_alg default use sha-1
++ at treturn boolean true for pass verify
++*/
+ static LUA_FUNCTION(openssl_verify)
+ {
+   size_t data_len, signature_len;
+   EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+   const char* data = luaL_checklstring(L, 2, &data_len);
+   const char* signature = luaL_checklstring(L, 3, &signature_len);
++  const EVP_MD *md = get_digest(L, 4, "sha256");
++  EVP_MD_CTX *ctx = EVP_MD_CTX_create();
+ 
+-  const EVP_MD *mdtype = NULL;
+-  int top = lua_gettop(L);
+-  if (top > 3)
+-  {
+-    mdtype = get_digest(L, 4);
+-  }
+-  else
+-    mdtype = EVP_get_digestbyname("sha1");
+-  if (mdtype)
++  int ret = EVP_DigestVerifyInit(ctx, NULL, md, NULL, pkey);
++  if (ret == 1)
+   {
+-    int result;
+-    EVP_MD_CTX     md_ctx;
+-
+-    EVP_VerifyInit   (&md_ctx, mdtype);
+-    EVP_VerifyUpdate (&md_ctx, data, data_len);
+-    result = EVP_VerifyFinal (&md_ctx, (unsigned char *)signature, signature_len, pkey);
+-    EVP_MD_CTX_cleanup(&md_ctx);
+-    lua_pushboolean(L, result == 1);
+-
+-    return 1;
++    ret = EVP_DigestVerifyUpdate(ctx, data, data_len);
++    if (ret == 1)
++    {
++      ret = EVP_DigestVerifyFinal(ctx, (unsigned char *)signature, signature_len);
++      if (ret == 1)
++      {
++        lua_pushboolean(L, ret == 1);
++      }
++      else
++        ret = openssl_pushresult(L, ret);
++    }
++    else
++      ret = openssl_pushresult(L, ret);
+   }
+   else
+-    luaL_argerror(L, 4, "Not support digest alg");
++    ret = openssl_pushresult(L, ret);
+ 
+-  return 0;
++  EVP_MD_CTX_destroy(ctx);
++  return ret;
+ }
+ 
++/***
++seal and encrypt message with one public key
++data be encrypt with secret key, secret key be encrypt with public key
++ at function seal
++ at tparam string data data to be encrypted
++ at tparam[opt='RC4'] cipher|string alg
++ at treturn string data encrypted
++ at treturn string skey secret key encrypted by public key
++ at treturn string iv
++*/
+ static LUA_FUNCTION(openssl_seal)
+ {
+   size_t data_len;
+@@ -993,7 +1310,7 @@ static LUA_FUNCTION(openssl_seal)
+       luaL_argerror(L, 1, "empty array");
+     }
+   }
+-  else if (auxiliar_isclass(L, "openssl.evp_pkey", 1))
++  else if (auxiliar_getclassudata(L, "openssl.evp_pkey", 1))
+   {
+     nkeys = 1;
+   }
+@@ -1006,7 +1323,7 @@ static LUA_FUNCTION(openssl_seal)
+ 
+   if (cipher)
+   {
+-    EVP_CIPHER_CTX ctx;
++    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
+     int ret = 0;
+     EVP_PKEY **pkeys;
+     unsigned char **eks;
+@@ -1046,20 +1363,20 @@ static LUA_FUNCTION(openssl_seal)
+       eksl[0] = EVP_PKEY_size(pkeys[0]);
+       eks[0] = malloc(eksl[0]);
+     }
+-    EVP_CIPHER_CTX_init(&ctx);
++    EVP_CIPHER_CTX_init(ctx);
+ 
+     /* allocate one byte extra to make room for \0 */
+     len1 = data_len + EVP_CIPHER_block_size(cipher) + 1;
+     buf = malloc(len1);
+ 
+ 
+-    if (!EVP_SealInit(&ctx, cipher, eks, eksl, (unsigned char*) iv, pkeys, nkeys)
+-        || !EVP_SealUpdate(&ctx, buf, &len1, (unsigned char *)data, data_len))
++    if (!EVP_SealInit(ctx, cipher, eks, eksl, (unsigned char*) iv, pkeys, nkeys)
++        || !EVP_SealUpdate(ctx, buf, &len1, (unsigned char *)data, data_len))
+     {
+       luaL_error(L, "EVP_SealInit failed");
+     }
+ 
+-    EVP_SealFinal(&ctx, buf + len1, &len2);
++    EVP_SealFinal(ctx, buf + len1, &len2);
+ 
+     if (len1 + len2 > 0)
+     {
+@@ -1079,7 +1396,7 @@ static LUA_FUNCTION(openssl_seal)
+         lua_pushlstring(L, (const char*)eks[0], eksl[0]);
+         free(eks[0]);
+       }
+-      lua_pushlstring(L, iv, EVP_CIPHER_CTX_iv_length(&ctx));
++      lua_pushlstring(L, iv, EVP_CIPHER_CTX_iv_length(ctx));
+ 
+       ret = 3;
+     }
+@@ -1088,7 +1405,7 @@ static LUA_FUNCTION(openssl_seal)
+     free(eks);
+     free(eksl);
+     free(pkeys);
+-    EVP_CIPHER_CTX_cleanup(&ctx);
++    EVP_CIPHER_CTX_free(ctx);
+     return ret;
+   }
+   else
+@@ -1096,6 +1413,62 @@ static LUA_FUNCTION(openssl_seal)
+   return 0;
+ }
+ 
++/***
++open and ecrypted seal data with private key
++ at function open
++ at tparam string ekey encrypted secret key
++ at tparam string string iv
++ at tparam[opt='RC4'] evp_cipher|string md_alg
++ at treturn string data decrypted message or nil on failure
++*/
++static LUA_FUNCTION(openssl_open)
++{
++  EVP_PKEY *pkey =  CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
++  size_t data_len, ekey_len, iv_len;
++  const char *data = luaL_checklstring(L, 2, &data_len);
++  const char *ekey = luaL_checklstring(L, 3, &ekey_len);
++  const char *iv = luaL_checklstring(L, 4, &iv_len);
++
++  int ret = 0;
++  int len1, len2 = 0;
++  unsigned char *buf;
++
++  const EVP_CIPHER *cipher = NULL;
++
++  cipher = get_cipher(L, 5, "rc4");
++
++  if (cipher)
++  {
++    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
++    len1 = data_len + 1;
++    buf = malloc(len1);
++
++    EVP_CIPHER_CTX_init(ctx);
++    if (EVP_OpenInit(ctx, cipher, (unsigned char *)ekey, ekey_len, (const unsigned char *)iv, pkey)
++        && EVP_OpenUpdate(ctx, buf, &len1, (unsigned char *)data, data_len))
++    {
++      len2 = data_len - len1;
++      if (!EVP_OpenFinal(ctx, buf + len1, &len2) || (len1 + len2 == 0))
++      {
++        luaL_error(L, "EVP_OpenFinal() failed.");
++        ret = 0;
++      }
++    }
++    else
++    {
++      luaL_error(L, "EVP_OpenInit() failed.");
++      ret = 0;
++    }
++    EVP_CIPHER_CTX_free(ctx);
++    lua_pushlstring(L, (const char*)buf, len1 + len2);
++    free(buf);
++    ret = 1;
++  }
++  else
++    luaL_argerror(L, 5, "Not support cipher alg");
++
++  return ret;
++}
+ 
+ static LUA_FUNCTION(openssl_seal_init)
+ {
+@@ -1110,7 +1483,7 @@ static LUA_FUNCTION(openssl_seal_init)
+       luaL_argerror(L, 1, "empty array");
+     }
+   }
+-  else if (auxiliar_isclass(L, "openssl.evp_pkey", 1))
++  else if (auxiliar_getclassudata(L, "openssl.evp_pkey", 1))
+   {
+     nkeys = 1;
+   }
+@@ -1133,7 +1506,6 @@ static LUA_FUNCTION(openssl_seal_init)
+     eksl = malloc(nkeys * sizeof(*eksl));
+     eks = malloc(nkeys * sizeof(*eks));
+ 
+-
+     memset(eks, 0, sizeof(*eks) * nkeys);
+ 
+     /* get the public keys we are using to seal this data */
+@@ -1235,55 +1607,6 @@ static LUA_FUNCTION(openssl_seal_final)
+   return 1;
+ }
+ 
+-static LUA_FUNCTION(openssl_open)
+-{
+-  EVP_PKEY *pkey =  CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+-  size_t data_len, ekey_len, iv_len;
+-  const char *data = luaL_checklstring(L, 2, &data_len);
+-  const char *ekey = luaL_checklstring(L, 3, &ekey_len);
+-  const char *iv = luaL_checklstring(L, 4, &iv_len);
+-
+-  int ret = 0;
+-  int len1, len2 = 0;
+-  unsigned char *buf;
+-
+-  EVP_CIPHER_CTX ctx;
+-  const EVP_CIPHER *cipher = NULL;
+-
+-  cipher = get_cipher(L, 5, "rc4");
+-
+-  if (cipher)
+-  {
+-    len1 = data_len + 1;
+-    buf = malloc(len1);
+-
+-    EVP_CIPHER_CTX_init(&ctx);
+-    if (EVP_OpenInit(&ctx, cipher, (unsigned char *)ekey, ekey_len, (const unsigned char *)iv, pkey) && EVP_OpenUpdate(&ctx, buf, &len1, (unsigned char *)data, data_len))
+-    {
+-      len2 = data_len - len1;
+-      if (!EVP_OpenFinal(&ctx, buf + len1, &len2) || (len1 + len2 == 0))
+-      {
+-        luaL_error(L, "EVP_OpenFinal() failed.");
+-        ret = 0;
+-      }
+-    }
+-    else
+-    {
+-      luaL_error(L, "EVP_OpenInit() failed.");
+-      ret = 0;
+-    }
+-    EVP_CIPHER_CTX_cleanup(&ctx);
+-    lua_pushlstring(L, (const char*)buf, len1 + len2);
+-    free(buf);
+-    ret = 1;
+-  }
+-  else
+-    luaL_argerror(L, 5, "Not support cipher alg");
+-
+-  return ret;
+-}
+-
+-
+ static LUA_FUNCTION(openssl_open_init)
+ {
+   EVP_PKEY *pkey =  CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
+@@ -1349,6 +1672,14 @@ static LUA_FUNCTION(openssl_open_final)
+   return ret == 1 ? ret : openssl_pushresult(L, ret);
+ }
+ 
++static int openssl_pkey_bits(lua_State *L)
++{
++  EVP_PKEY *pkey = CHECK_OBJECT(1, EVP_PKEY, "openssl.evp_pkey");
++  lua_Integer ret = EVP_PKEY_bits(pkey);
++  lua_pushinteger(L, ret);
++  return  1;
++};
++
+ static luaL_Reg pkey_funcs[] =
+ {
+   {"is_private",    openssl_pkey_is_private1},
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/private.h luvi-src-v2.7.6/deps/lua-openssl/src/private.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/private.h	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/private.h	2019-02-13 11:53:24.298459641 +0100
+@@ -1,6 +1,16 @@
+-#include "openssl.h"
++#ifndef OPENSSL_PRIVATE_H
++#define OPENSSL_PRIVATE_H
++
++#if defined(__cplusplus)
++extern "C" {
++#endif
++#include <lua.h>
++#include <lauxlib.h>
++#include <lualib.h>
+ 
+-#include "lua-compat/c-api/compat-5.3.h"
++#if LUA_VERSION_NUM < 503
++#include "c-api/compat-5.3.h"
++#endif
+ 
+ #define luaL_checktable(L, n) luaL_checktype(L, n, LUA_TTABLE)
+ 
+@@ -29,6 +39,110 @@
+ #endif
+ #endif
+ 
++#include "openssl.h"
++
++#if OPENSSL_VERSION_NUMBER > 0x10100000L
++#define CONSTIFY_X509_get0 const
++#else
++#define CONSTIFY_X509_get0
++#endif
++
++#define PUSH_BN(x)                                      \
++  *(void **)(lua_newuserdata(L, sizeof(void *))) = (x); \
++  luaL_getmetatable(L,"openssl.bn");                    \
++  lua_setmetatable(L,-2)
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++int BIO_up_ref(BIO *b);
++int X509_up_ref(X509 *x);
++int X509_STORE_up_ref(X509_STORE *s);
++int EVP_PKEY_up_ref(EVP_PKEY *pkey);
++
++DH *EVP_PKEY_get0_DH(EVP_PKEY *pkey);
++int DH_bits(const DH *dh);
++void DH_get0_key(const DH *dh,
++                 const BIGNUM **pub_key, const BIGNUM **priv_key);
++int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key);
++void DH_get0_pqg(const DH *dh,
++                 const BIGNUM **p, const BIGNUM **q, const BIGNUM **g);
++int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
++void DSA_get0_pqg(const DSA *dsa,
++                  const BIGNUM **p, const BIGNUM **q, const BIGNUM **g);
++
++EC_KEY *EVP_PKEY_get0_EC_KEY(EVP_PKEY *pkey);
++void ECDSA_SIG_get0(const ECDSA_SIG *sig,
++                    const BIGNUM **pr, const BIGNUM **ps);
++int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s);
++int RSA_bits(const RSA *r);
++void RSA_get0_key(const RSA *r,
++                  const BIGNUM **n, const BIGNUM **e, const BIGNUM **d);
++int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
++int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);
++int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqmp);
++void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q);
++void RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIGNUM **dmq1, const BIGNUM **iqmp);
++RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey);
++
++DSA *EVP_PKEY_get0_DSA(EVP_PKEY *pkey);
++int DSA_bits(const DSA *dsa);
++void DSA_get0_key(const DSA *d,
++                  const BIGNUM **pub_key, const BIGNUM **priv_key);
++int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key);
++void DSA_get0_pqg(const DSA *d,
++                  const BIGNUM **p, const BIGNUM **q, const BIGNUM **g);
++int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
++
++HMAC_CTX *HMAC_CTX_new(void);
++void HMAC_CTX_free(HMAC_CTX *ctx);
++
++EVP_MD_CTX *EVP_MD_CTX_new(void);
++int EVP_MD_CTX_reset(EVP_MD_CTX *ctx);
++void EVP_MD_CTX_free(EVP_MD_CTX *ctx);
++void X509_REQ_get0_signature(const X509_REQ *req, const ASN1_BIT_STRING **psig,
++                             const X509_ALGOR **palg);
++X509_PUBKEY *X509_REQ_get_X509_PUBKEY(X509_REQ *req);
++int X509_PUBKEY_get0_param(ASN1_OBJECT **ppkalg,
++                           const unsigned char **pk, int *ppklen,
++                           X509_ALGOR **pa, X509_PUBKEY *pub);
++const ASN1_INTEGER *X509_get0_serialNumber(const X509 *a);
++const STACK_OF(X509_EXTENSION) *X509_get0_extensions(const X509 *x);
++int i2d_re_X509_REQ_tbs(X509_REQ *req, unsigned char **pp);
++const ASN1_INTEGER *X509_REVOKED_get0_serialNumber(const X509_REVOKED *x);
++int X509_REVOKED_set_revocationDate(X509_REVOKED *x, ASN1_TIME *tm);
++const ASN1_TIME *X509_REVOKED_get0_revocationDate(const X509_REVOKED *x);
++const STACK_OF(X509_EXTENSION) *X509_REVOKED_get0_extensions(const X509_REVOKED *r);
++const STACK_OF(X509_EXTENSION) *X509_CRL_get0_extensions(const X509_CRL *crl);
++
++void X509_CRL_get0_signature(const X509_CRL *crl, const ASN1_BIT_STRING **psig,
++                             const X509_ALGOR **palg);
++
++const ASN1_INTEGER *TS_STATUS_INFO_get0_status(const TS_STATUS_INFO *a);
++const STACK_OF(ASN1_UTF8STRING) *TS_STATUS_INFO_get0_text(const TS_STATUS_INFO *a);
++const ASN1_BIT_STRING *TS_STATUS_INFO_get0_failure_info(const TS_STATUS_INFO *a);
++
++
++int TS_VERIFY_CTX_add_flags(TS_VERIFY_CTX *ctx, int f);
++int TS_VERIFY_CTX_set_flags(TS_VERIFY_CTX *ctx, int f);
++BIO *TS_VERIFY_CTX_set_data(TS_VERIFY_CTX *ctx, BIO *b);
++X509_STORE *TS_VERIFY_CTX_set_store(TS_VERIFY_CTX *ctx, X509_STORE *s);
++STACK_OF(X509) *TS_VERIFY_CTS_set_certs(TS_VERIFY_CTX *ctx,
++                                        STACK_OF(X509) *certs);
++unsigned char *TS_VERIFY_CTX_set_imprint(TS_VERIFY_CTX *ctx,
++    unsigned char *hexstr,
++    long len);
++
++#if OPENSSL_VERSION_NUMBER < 0x10002000L || defined(LIBRESSL_VERSION_NUMBER)
++int i2d_re_X509_tbs(X509 *x, unsigned char **pp);
++#endif
++#if OPENSSL_VERSION_NUMBER < 0x10002000L
++void X509_get0_signature(CONSTIFY_X509_get0 ASN1_BIT_STRING **psig,
++                         CONSTIFY_X509_get0 X509_ALGOR **palg,
++                         const X509 *x);
++int X509_get_signature_nid(const X509 *x);
++#endif
++
++#endif
++
+ #define AUXILIAR_SETOBJECT(L, cval, ltype, idx, lvar) \
+   do {                                                \
+   int n = (idx < 0)?idx-1:idx;                        \
+@@ -51,7 +165,7 @@
+   const char* bn = luaL_checklstring(L,-1,&l);              \
+   if(_type->_name==NULL)  _type->_name = BN_new();          \
+   BN_bin2bn((const unsigned char *)bn,l,_type->_name);      \
+-  }else if(auxiliar_isclass(L,"openssl.bn",-1)) {           \
++  }else if(auxiliar_getclassudata(L,"openssl.bn",-1)) {           \
+   const BIGNUM* bn = CHECK_OBJECT(-1,BIGNUM,"openssl.bn");  \
+   if(_type->_name==NULL)  _type->_name = BN_new();          \
+   BN_copy(_type->_name, bn);                                \
+@@ -77,7 +191,7 @@ extern const char* format[];
+ 
+ BIO* load_bio_object(lua_State* L, int idx);
+ int  bio_is_der(BIO* bio);
+-const EVP_MD* get_digest(lua_State* L, int idx);
++const EVP_MD* get_digest(lua_State* L, int idx, const char* def_alg);
+ const EVP_CIPHER* get_cipher(lua_State* L, int idx, const char* def_alg);
+ BIGNUM *BN_get(lua_State *L, int i);
+ int openssl_engine(lua_State *L);
+@@ -87,14 +201,13 @@ void to_hex(const char* in, int length,
+ 
+ int openssl_push_asn1type(lua_State* L, const ASN1_TYPE* type);
+ int openssl_push_asn1object(lua_State* L, const ASN1_OBJECT* obj);
+-int openssl_push_asn1(lua_State* L, ASN1_STRING* string, int type);
+-int openssl_push_x509_algor(lua_State*L, const X509_ALGOR* alg);
++int openssl_push_asn1(lua_State* L, const ASN1_STRING* string, int type);
+ int openssl_push_general_name(lua_State*L, const GENERAL_NAME* name);
+ 
+-#define PUSH_ASN1_TIME(L, tm)             openssl_push_asn1(L, (ASN1_STRING*)tm, V_ASN1_UTCTIME)
+-#define PUSH_ASN1_INTEGER(L, i)           openssl_push_asn1(L, (ASN1_STRING*)i,  V_ASN1_INTEGER)
+-#define PUSH_ASN1_OCTET_STRING(L, s)      openssl_push_asn1(L, (ASN1_STRING*)s,  V_ASN1_OCTET_STRING)
+-#define PUSH_ASN1_STRING(L, s)            openssl_push_asn1(L, (ASN1_STRING*)s, V_ASN1_UNDEF)
++#define PUSH_ASN1_TIME(L, tm)             openssl_push_asn1(L, (ASN1_STRING*)(tm), V_ASN1_UTCTIME)
++#define PUSH_ASN1_INTEGER(L, i)           openssl_push_asn1(L, (ASN1_STRING*)(i),  V_ASN1_INTEGER)
++#define PUSH_ASN1_OCTET_STRING(L, s)      openssl_push_asn1(L, (ASN1_STRING*)(s),  V_ASN1_OCTET_STRING)
++#define PUSH_ASN1_STRING(L, s)            openssl_push_asn1(L, (ASN1_STRING*)(s),  V_ASN1_UNDEF)
+ 
+ int openssl_push_xname_asobject(lua_State*L, X509_NAME* xname);
+ int openssl_push_bit_string_bitname(lua_State* L, const BIT_STRING_BITNAME* name);
+@@ -112,27 +225,42 @@ int openssl_register_xalgor(lua_State*L)
+ 
+ int openssl_pushresult(lua_State*L, int result);
+ 
+-int openssl_newvalue(lua_State*L, void*p);
+-int openssl_freevalue(lua_State*L, void*p);
+-int openssl_setvalue(lua_State*L, void*p, const char*field);
+-int openssl_getvalue(lua_State*L, void*p, const char*field);
+-int openssl_refrence(lua_State*L, void*p, int op);
++int openssl_newvalue(lua_State*L, const void*p);
++int openssl_freevalue(lua_State*L, const void*p);
++int openssl_valueset(lua_State*L, const void*p, const char*field);
++int openssl_valueget(lua_State*L, const void*p, const char*field);
++int openssl_valueseti(lua_State*L, const void*p, int i);
++int openssl_valuegeti(lua_State*L, const void*p, int i);
++size_t openssl_valuelen(lua_State*L, const void*p);
++int openssl_refrence(lua_State*L, const void*p, int op);
+ 
+ int openssl_verify_cb(int preverify_ok, X509_STORE_CTX *xctx);
+ int openssl_cert_verify_cb(X509_STORE_CTX *xctx, void* u);
+ void openssl_xstore_free(X509_STORE* ctx);
+ 
+ STACK_OF(X509)* openssl_sk_x509_fromtable(lua_State *L, int idx);
+-int openssl_sk_x509_totable(lua_State *L, STACK_OF(X509)* sk);
++int openssl_sk_x509_totable(lua_State *L, const STACK_OF(X509)* sk);
+ STACK_OF(X509_CRL)* openssl_sk_x509_crl_fromtable(lua_State *L, int idx);
+-int openssl_sk_x509_crl_totable(lua_State *L, STACK_OF(X509_CRL)* sk);
++int openssl_sk_x509_crl_totable(lua_State *L, const STACK_OF(X509_CRL)* sk);
+ STACK_OF(X509_EXTENSION)* openssl_sk_x509_extension_fromtable(lua_State *L, int idx);
+-int openssl_sk_x509_extension_totable(lua_State *L, STACK_OF(X509_EXTENSION)* sk);
+-int openssl_sk_x509_algor_totable(lua_State *L, STACK_OF(X509_ALGOR)* sk);
+-int openssl_sk_x509_name_totable(lua_State *L, STACK_OF(X509_NAME)* sk);
++int openssl_sk_x509_extension_totable(lua_State *L, const STACK_OF(X509_EXTENSION)* sk);
++int openssl_sk_x509_algor_totable(lua_State *L, const STACK_OF(X509_ALGOR)* sk);
++int openssl_sk_x509_name_totable(lua_State *L, const STACK_OF(X509_NAME)* sk);
+ 
+ X509_ATTRIBUTE* openssl_new_xattribute(lua_State*L, X509_ATTRIBUTE** a, int idx, const char* eprefix);
+ 
++#if !defined(OPENSSL_NO_SRP)
++#if defined(LIBRESSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER <= 0x10002000
++#define OPENSSL_NO_SRP
++#endif
++#endif
++
+ #ifdef HAVE_USER_CUSTOME
+ #include HAVE_USER_CUSTOME
+ #endif
++
++#if defined(__cplusplus)
++}
++#endif
++
++#endif /* OPENSSL_PRIVATE_H */
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/rsa.c luvi-src-v2.7.6/deps/lua-openssl/src/rsa.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/rsa.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/rsa.c	2019-02-13 11:53:24.321792707 +0100
+@@ -7,19 +7,12 @@
+ #include "openssl.h"
+ #include "private.h"
+ #include <openssl/rsa.h>
++#include <openssl/engine.h>
+ 
+ #define MYNAME    "rsa"
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-#define lua_boxpointer(L,u) \
+-  (*(void **)(lua_newuserdata(L, sizeof(void *))) = (u))
+-
+-#define PUSH_BN(x)                  \
+-lua_boxpointer(L,x);                \
+-luaL_getmetatable(L,"openssl.bn");  \
+-lua_setmetatable(L,-2)
+-
+ static LUA_FUNCTION(openssl_rsa_free)
+ {
+   RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
+@@ -29,11 +22,9 @@ static LUA_FUNCTION(openssl_rsa_free)
+ 
+ static int is_private(const RSA* rsa)
+ {
+-  if (NULL == rsa->p || NULL == rsa->q)
+-  {
+-    return 0;
+-  }
+-  return 1;
++  const BIGNUM* d = NULL;
++  RSA_get0_key(rsa, NULL, NULL, &d);
++  return d != NULL && !BN_is_zero(d);
+ };
+ 
+ static LUA_FUNCTION(openssl_rsa_isprivate)
+@@ -43,21 +34,29 @@ static LUA_FUNCTION(openssl_rsa_isprivat
+   return 1;
+ };
+ 
++static LUA_FUNCTION(openssl_rsa_size)
++{
++  RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++  lua_pushinteger(L, RSA_size(rsa));
++  return 1;
++};
++
+ static LUA_FUNCTION(openssl_rsa_encrypt)
+ {
+   RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
+   size_t l;
+   const unsigned char* from = (const unsigned char *)luaL_checklstring(L, 2, &l);
+   int padding = openssl_get_padding(L, 3, "pkcs1");
++  int ispriv = lua_isnone(L, 4) ? is_private(rsa) : lua_toboolean(L, 4);
+   unsigned char* to = OPENSSL_malloc(RSA_size(rsa));
+   int flen = l;
+ 
+-  flen = is_private(rsa)
++  flen = ispriv
+          ? RSA_private_encrypt(flen, from, to, rsa, padding)
+          : RSA_public_encrypt(flen, from, to, rsa, padding);
+   if (flen > 0)
+   {
+-    lua_pushlstring(L, to, flen);
++    lua_pushlstring(L, (const char*)to, flen);
+     OPENSSL_free(to);
+     return 1;
+   }
+@@ -71,15 +70,16 @@ static LUA_FUNCTION(openssl_rsa_decrypt)
+   size_t l;
+   const unsigned char* from = (const unsigned char *) luaL_checklstring(L, 2, &l);
+   int padding = openssl_get_padding(L, 3, "pkcs1");
++  int ispriv = lua_isnone(L, 4) ? is_private(rsa) : lua_toboolean(L, 4);
+   unsigned char* to = OPENSSL_malloc(RSA_size(rsa));
+   int flen = l;
+ 
+-  flen = is_private(rsa)
++  flen = ispriv
+          ? RSA_private_decrypt(flen, from, to, rsa, padding)
+          : RSA_public_decrypt(flen, from, to, rsa, padding);
+   if (flen > 0)
+   {
+-    lua_pushlstring(L, to, flen);
++    lua_pushlstring(L, (const char*)to, flen);
+     OPENSSL_free(to);
+     return 1;
+   }
+@@ -87,27 +87,111 @@ static LUA_FUNCTION(openssl_rsa_decrypt)
+   return openssl_pushresult(L, flen);
+ };
+ 
++static LUA_FUNCTION(openssl_rsa_sign)
++{
++  RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++  size_t l;
++  const unsigned char* msg = (const unsigned char *)luaL_checklstring(L, 2, &l);
++  int type = luaL_optint(L, 3, NID_md5_sha1);
++  unsigned char* sig = OPENSSL_malloc(RSA_size(rsa));
++  int flen = l;
++  unsigned int slen = RSA_size(rsa);
++
++  int ret = RSA_sign(type, msg, flen, sig, &slen, rsa);
++  if (ret == 1)
++  {
++    lua_pushlstring(L, (const char*)sig, slen);
++    OPENSSL_free(sig);
++    return 1;
++  }
++  OPENSSL_free(sig);
++  return openssl_pushresult(L, ret);
++};
++
++static LUA_FUNCTION(openssl_rsa_verify)
++{
++  RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++  size_t l;
++  const unsigned char* from = (const unsigned char *)luaL_checklstring(L, 2, &l);
++  size_t s;
++  const unsigned char* sig = (const unsigned char *)luaL_checklstring(L, 3, &s);
++  int type = luaL_optint(L, 4, NID_md5_sha1);
++  int flen = l;
++  int slen = s;
++
++  int ret = RSA_verify(type, from, flen, sig, slen, rsa);
++  return openssl_pushresult(L, ret);
++};
++
+ static LUA_FUNCTION(openssl_rsa_parse)
+ {
++  const BIGNUM *n = NULL, *e = NULL, *d = NULL;
++  const BIGNUM *p = NULL, *q = NULL;
++  const BIGNUM *dmp1 = NULL, *dmq1 = NULL, *iqmp = NULL;
++
+   RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++  RSA_get0_key(rsa, &n, &e, &d);
++  RSA_get0_factors(rsa, &p, &q);
++  RSA_get0_crt_params(rsa, &dmp1, &dmq1, &iqmp);
++
++
+   lua_newtable(L);
+-  OPENSSL_PKEY_GET_BN(rsa->n, n);
+-  OPENSSL_PKEY_GET_BN(rsa->e, e);
+-  OPENSSL_PKEY_GET_BN(rsa->d, d);
+-  OPENSSL_PKEY_GET_BN(rsa->p, p);
+-  OPENSSL_PKEY_GET_BN(rsa->q, q);
+-  OPENSSL_PKEY_GET_BN(rsa->dmp1, dmp1);
+-  OPENSSL_PKEY_GET_BN(rsa->dmq1, dmq1);
+-  OPENSSL_PKEY_GET_BN(rsa->iqmp, iqmp);
++  lua_pushinteger(L, RSA_size(rsa));
++  lua_setfield(L, -2, "size");
++  lua_pushinteger(L, RSA_bits(rsa));
++  lua_setfield(L, -2, "bits");
++  OPENSSL_PKEY_GET_BN(n, n);
++  OPENSSL_PKEY_GET_BN(e, e);
++  OPENSSL_PKEY_GET_BN(d, d);
++  OPENSSL_PKEY_GET_BN(p, p);
++  OPENSSL_PKEY_GET_BN(q, q);
++  OPENSSL_PKEY_GET_BN(dmp1, dmp1);
++  OPENSSL_PKEY_GET_BN(dmq1, dmq1);
++  OPENSSL_PKEY_GET_BN(iqmp, iqmp);
++  return 1;
++}
++
++static LUA_FUNCTION(openssl_rsa_read)
++{
++  size_t l;
++  const char* data = luaL_checklstring(L, 1, &l);
++  const unsigned char* in = (const unsigned char*)data;
++  RSA *rsa = d2i_RSAPrivateKey(NULL, &in, l);
++  if (rsa == NULL)
++  {
++    in = (const unsigned char*)data;
++    rsa = d2i_RSA_PUBKEY(NULL, &in, l);
++  }
++  if (rsa)
++    PUSH_OBJECT(rsa, "openssl.rsa");
++  else
++    lua_pushnil(L);
+   return 1;
+ }
+ 
++static int openssl_rsa_set_method(lua_State *L) 
++{
++  RSA* rsa = CHECK_OBJECT(1, RSA, "openssl.rsa");
++  ENGINE *e = CHECK_OBJECT(2, ENGINE, "openssl.engine");
++  const RSA_METHOD *m = ENGINE_get_RSA(e);
++  if (m) 
++  {
++    int r = RSA_set_method(rsa, m);
++    return openssl_pushresult(L, r);
++  }
++  return 0;
++}
++
+ static luaL_Reg rsa_funs[] =
+ {
+   {"parse",       openssl_rsa_parse},
+   {"isprivate",   openssl_rsa_isprivate},
+   {"encrypt",     openssl_rsa_encrypt},
+   {"decrypt",     openssl_rsa_decrypt},
++  {"sign",        openssl_rsa_sign},
++  {"verify",      openssl_rsa_verify},
++  {"size",        openssl_rsa_size},
++  {"set_method",  openssl_rsa_set_method},
+ 
+   {"__gc",        openssl_rsa_free},
+   {"__tostring",  auxiliar_tostring},
+@@ -121,6 +205,10 @@ static luaL_Reg R[] =
+   {"isprivate",   openssl_rsa_isprivate},
+   {"encrypt",     openssl_rsa_encrypt},
+   {"decrypt",     openssl_rsa_decrypt},
++  {"sign",        openssl_rsa_sign},
++  {"verify",      openssl_rsa_verify},
++  {"size",        openssl_rsa_size},
++  {"read",        openssl_rsa_read},
+ 
+   {NULL, NULL}
+ };
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/sk.h luvi-src-v2.7.6/deps/lua-openssl/src/sk.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/sk.h	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/sk.h	2019-02-13 11:53:24.321792707 +0100
+@@ -1,18 +1,28 @@
+-/*=========================================================================*\
+-* sk.h
+-* stack routines(MACRO) for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++Provide STACK_OF(object) maintance in lua.
++STACK\_OF(CTYPE) object just like STACK\_OF(X509) are high frequency used,
++in x509, pkcs7, pkcs12 and others module, and it has complex APIs in openssl.
++In lua-openssl, all of STACK\_OF(CTYPE) C side objects are mapping to array
++actually table in Lua side, and follow the rules of the Lua array, start
++index from 1, not 0 in C world.
++E.g C side STACK\_OF(X509) and Lua side array {cert1,cert2,...,certn} can
++be automatic convert in lua\-openssl if need.
+ 
++ at module sk
++*/
+ #include "openssl.h"
+ 
+ #ifdef CRYPTO_LOCK_REF
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ #define REF_OR_DUP(TYPE, x)  CRYPTO_add(&x->references,1,CRYPTO_LOCK_##TYPE)
+ #else
++#define REF_OR_DUP(TYPE, x)  TYPE##_up_ref(x)
++#endif
++#else
+ #define REF_OR_DUP(TYPE, x) x = TYPE##_dup(x)
+ #endif
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ #define TAB2SK(TYPE, type)                                        \
+ STACK_OF(TYPE)* openssl_sk_##type##_fromtable(lua_State*L, int idx) {     \
+   STACK_OF(TYPE) * sk;                                            \
+@@ -35,7 +45,7 @@ STACK_OF(TYPE)* openssl_sk_##type##_from
+ }
+ 
+ 
+-#define SK2TAB(TYPE,type)  int openssl_sk_##type##_totable(lua_State* L, STACK_OF(TYPE) *sk)  {  \
++#define SK2TAB(TYPE,type)  int openssl_sk_##type##_totable(lua_State* L,const STACK_OF(TYPE) *sk)  {  \
+   int i=0, n=0;                                                                           \
+   lua_newtable(L);                                                                        \
+   n = SKM_sk_num(TYPE, sk);                                                               \
+@@ -47,6 +57,42 @@ STACK_OF(TYPE)* openssl_sk_##type##_from
+   }                                                                                       \
+   return 1;                                                                               \
+ }
++#else
++#define TAB2SK(TYPE, type)                                        \
++STACK_OF(TYPE)* openssl_sk_##type##_fromtable(lua_State*L, int idx) {     \
++  STACK_OF(TYPE) * sk;                                            \
++  luaL_argcheck(L, lua_istable(L, idx),  idx,                     \
++         "must be a table as array or nil");                      \
++  sk = sk_##TYPE##_new_null();                                    \
++  if (lua_istable(L,idx)) {                                       \
++    int n = lua_rawlen(L, idx);                                   \
++    int i;                                                        \
++    for ( i=0; i<n; i++ ) {                                       \
++      TYPE *x;                                                    \
++      lua_rawgeti(L, idx, i+1);                                   \
++      x = CHECK_OBJECT(-1,TYPE,"openssl." #type);                 \
++      REF_OR_DUP(TYPE, x);                                        \
++      sk_##TYPE##_push(sk, x);                                    \
++      lua_pop(L,1);                                               \
++    }                                                             \
++  }                                                               \
++  return sk;                                                      \
++}
++
++
++#define SK2TAB(TYPE,type)  int openssl_sk_##type##_totable(lua_State* L, const STACK_OF(TYPE) *sk)  {  \
++  int i=0, n=0;                                                                           \
++  lua_newtable(L);                                                                        \
++  n = sk_##TYPE##_num(sk);                                                                \
++  for(i=0;i<n;i++) {                                                                      \
++    TYPE *x =  sk_##TYPE##_value(sk, i);                                                  \
++    REF_OR_DUP(TYPE, x);                                                                  \
++    PUSH_OBJECT(x,"openssl."#type);                                                       \
++    lua_rawseti(L,-2, i+1);                                                               \
++  }                                                                                       \
++  return 1;                                                                               \
++}
++#endif
+ 
+ #define IMP_LUA_SK(TYPE,type)   \
+ TAB2SK(TYPE,type);              \
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/srp.c luvi-src-v2.7.6/deps/lua-openssl/src/srp.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/srp.c	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/srp.c	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,202 @@
++#include "openssl.h"
++#include "private.h"
++
++#ifndef OPENSSL_NO_SRP
++#include <openssl/srp.h>
++#include <openssl/bn.h>
++
++#define MYNAME    "srp"
++#define MYVERSION MYNAME " library for " LUA_VERSION " / May 2018 / "\
++  "based on OpenSSL " SHLIB_VERSION_NUMBER
++
++/* server side */
++static int openssl_srp_create_verifier(lua_State *L)
++{
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  const char *username = luaL_checkstring(L, 2);
++  const char *servpass = luaL_checkstring(L, 3);
++  BIGNUM *salt = NULL, *verifier = NULL;
++  int ret = SRP_create_verifier_BN(username, servpass, &salt, &verifier, GN->N, GN->g);
++  if (ret==1)
++  {
++    PUSH_OBJECT(salt, "openssl.bn");
++    PUSH_OBJECT(verifier, "openssl.bn");
++    return 2;
++  }
++  return openssl_pushresult(L, ret);
++}
++
++#ifndef BN_RAND_TOP_ANY
++#define BN_RAND_TOP_ANY -1
++#endif
++#ifndef BN_RAND_BOTTOM_ANY
++#define BN_RAND_BOTTOM_ANY 0
++#endif
++
++static int openssl_srp_calc_b(lua_State *L)
++{
++  int ret = 0;
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  BIGNUM *v = CHECK_OBJECT(2, BIGNUM, "openssl.bn");
++  int bits = luaL_optint(L, 3, 32*8);
++
++  BIGNUM *Brnd = NULL, *Bpub = NULL;
++  Brnd = BN_new();
++
++  ret = BN_rand(Brnd, bits, BN_RAND_TOP_ANY, BN_RAND_BOTTOM_ANY);
++  if (ret==1)
++  {
++    /* Server's first message */
++    Bpub = SRP_Calc_B(Brnd, GN->N, GN->g, v);
++    ret = SRP_Verify_B_mod_N(Bpub, GN->N);
++    if(ret==1)
++    {
++      PUSH_OBJECT(Bpub, "openssl.bn");
++      PUSH_OBJECT(Brnd, "openssl.bn");
++      ret = 2;
++    }
++  }
++  if(ret!=2)
++  {
++    ret = openssl_pushresult(L, ret);
++    if(Brnd) BN_free(Brnd);
++    if(Bpub) BN_free(Bpub);
++  }
++  return ret;
++}
++
++static int openssl_srp_calc_server_key(lua_State *L)
++{
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  BIGNUM *Apub = CHECK_OBJECT(2, BIGNUM, "openssl.bn");
++  BIGNUM *v = CHECK_OBJECT(3, BIGNUM, "openssl.bn");
++  BIGNUM *u = CHECK_OBJECT(4, BIGNUM, "openssl.bn");
++  BIGNUM *Brnd = CHECK_OBJECT(5, BIGNUM, "openssl.bn");
++
++  /* Server's key */
++  BIGNUM *Kserver = SRP_Calc_server_key(Apub, v, u, Brnd, GN->N);
++  PUSH_OBJECT(Kserver, "openssl.bn");
++  return 1;
++}
++
++/* client side */
++static int openssl_srp_calc_a(lua_State *L)
++{
++  int ret = 0;
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  int bits = luaL_optint(L, 3, 32*8);
++
++  BIGNUM *Arnd = NULL, *Apub = NULL;
++  Arnd = BN_new();
++
++  ret = BN_rand(Arnd, bits, BN_RAND_TOP_ANY, BN_RAND_BOTTOM_ANY);
++  if (ret==1)
++  {
++    /* Client's response */
++    Apub = SRP_Calc_A(Arnd, GN->N, GN->g);
++    ret = SRP_Verify_A_mod_N(Apub, GN->N);
++    if(ret==1)
++    {
++      PUSH_OBJECT(Apub, "openssl.bn");
++      PUSH_OBJECT(Arnd, "openssl.bn");
++      ret = 2;
++    }
++  }
++  if(ret!=2)
++  {
++    ret = openssl_pushresult(L, ret);
++    if(Arnd) BN_free(Arnd);
++    if(Apub) BN_free(Apub);
++  }
++  return ret;
++}
++
++static int openssl_srp_calc_x(lua_State *L)
++{
++  BIGNUM *s = CHECK_OBJECT(1, BIGNUM, "openssl.bn");
++  const char *username = luaL_checkstring(L, 2);
++  const char *password = luaL_checkstring(L, 3);
++
++  BIGNUM *x = SRP_Calc_x(s, username, password);
++  PUSH_OBJECT(x, "openssl.bn");
++  return 1;
++}
++
++static int openssl_srp_calc_client_key(lua_State *L)
++{
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  BIGNUM *Bpub = CHECK_OBJECT(2, BIGNUM, "openssl.bn");
++  BIGNUM *x = CHECK_OBJECT(3, BIGNUM, "openssl.bn");
++  BIGNUM *Arnd = CHECK_OBJECT(4, BIGNUM, "openssl.bn");
++  BIGNUM *u = CHECK_OBJECT(5, BIGNUM, "openssl.bn");
++
++  /* Client's key */
++  BIGNUM *Kclient = SRP_Calc_client_key(GN->N, Bpub, GN->g, x, Arnd, u);
++  PUSH_OBJECT(Kclient, "openssl.bn");
++  return 1;
++}
++
++/* both side */
++static int openssl_srp_get_default_gN(lua_State *L)
++{
++  const char *id = luaL_checkstring(L, 1);
++  SRP_gN *GN = SRP_get_default_gN(id);
++  if(GN)
++    PUSH_OBJECT(GN, "openssl.srp_gn");
++  else
++    lua_pushnil(L);
++  return 1;
++}
++
++static int openssl_srp_calc_u(lua_State *L)
++{
++  const SRP_gN *GN = CHECK_OBJECT(1, SRP_gN, "openssl.srp_gn");
++  BIGNUM *Apub = CHECK_OBJECT(2, BIGNUM, "openssl.bn");
++  BIGNUM *Bpub = CHECK_OBJECT(3, BIGNUM, "openssl.bn");
++
++  /* Both sides calculate u */
++  BIGNUM *u = SRP_Calc_u(Apub, Bpub, GN->N);
++  PUSH_OBJECT(u, "openssl.bn");
++  return 1;
++}
++
++static luaL_Reg srp_funs[] =
++{
++  /* both side */
++  {"calc_u",          openssl_srp_calc_u},
++
++  /* client side */
++  {"calc_a",          openssl_srp_calc_a},
++  {"calc_x",          openssl_srp_calc_x},
++  {"calc_client_key", openssl_srp_calc_client_key},
++
++  /* server side */
++  {"calc_b",          openssl_srp_calc_b},
++  {"create_verifier", openssl_srp_create_verifier},
++  {"calc_server_key", openssl_srp_calc_server_key},
++
++  /* prototype */
++  {"__tostring",      auxiliar_tostring},
++
++  {NULL,  NULL }
++};
++
++static luaL_Reg R[] =
++{
++  {"get_default_gN",  openssl_srp_get_default_gN},
++
++  {NULL,  NULL}
++};
++
++int luaopen_srp(lua_State *L)
++{
++  auxiliar_newclass(L, "openssl.srp_gn",       srp_funs);
++
++  lua_newtable(L);
++  luaL_setfuncs(L, R, 0);
++  lua_pushliteral(L, "version");
++  lua_pushliteral(L, MYVERSION);
++  lua_settable(L, -3);
++  return 1;
++}
++#endif
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/ssl.c luvi-src-v2.7.6/deps/lua-openssl/src/ssl.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/ssl.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/ssl.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,9 +1,10 @@
+-/*=========================================================================*\
+-* ssl.c
+-* SSL modules for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++ssl modules for lua-openssl binding, provide ssl function in lua.
++
++ at module ssl
++ at usage
++  ssl = require('openssl').ssl
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include <stdint.h>
+@@ -15,6 +16,13 @@
+ 
+ #include <openssl/ssl.h>
+ 
++/***
++create ssl_ctx object, which mapping to SSL_CTX in openssl.
++ at function ctx_new
++ at tparam string protocol support 'SSLv3', 'SSLv23', 'SSLv2', 'TSLv1', 'TSLv1_1','TSLv1_2','DTLSv1', and can be follow by '_server' or '_client'
++ at tparam[opt] string support_ciphers, if not given, default of openssl will be used
++ at treturn ssl_ctx
++*/
+ static int openssl_ssl_ctx_new(lua_State*L)
+ {
+   const char* meth = luaL_optstring(L, 1, "TLSv1");
+@@ -24,12 +32,17 @@ static int openssl_ssl_ctx_new(lua_State
+   SSL_METHOD* method = NULL;
+   const char* ciphers;
+   SSL_CTX* ctx;
+-  if (strcmp(meth, "SSLv3") == 0)
++  if (0);
++
++#ifndef OPENSSL_NO_SSL3
++  else if (strcmp(meth, "SSLv3") == 0)
+     method = SSLv3_method();    /* SSLv3 */
+   else if (strcmp(meth, "SSLv3_server") == 0)
+     method = SSLv3_server_method(); /* SSLv3 */
+   else if (strcmp(meth, "SSLv3_client") == 0)
+     method = SSLv3_client_method(); /* SSLv3 */
++#endif
++
+   else if (strcmp(meth, "SSLv23") == 0)
+     method = SSLv23_method();   /* SSLv3 but can rollback to v2 */
+   else if (strcmp(meth, "SSLv23_server") == 0)
+@@ -73,22 +86,21 @@ static int openssl_ssl_ctx_new(lua_State
+   else if (strcmp(meth, "SSLv2_client") == 0)
+     method = SSLv2_client_method();
+ #endif
++#endif
+ #ifdef LOAD_SSL_CUSTOM
+   LOAD_SSL_CUSTOM
+ #endif
+-
+-#endif
+   else
+     luaL_error(L, "#1:%s not supported\n"
+-               "Maybe SSLv3 SSLv23 TLSv1 TLSv1_1 TLSv1_2 DTLSv1 [SSLv2], option followed by _client or _server\n",
+-               "default is SSLv3",
++               "Maybe [SSLv3] SSLv23 TLSv1 TLSv1_1 TLSv1_2 DTLSv1 [SSLv2], option followed by _client or _server\n"
++               "default is TLSv1",
+                meth);
+   ciphers = luaL_optstring(L, 2, SSL_DEFAULT_CIPHER_LIST);
+   ctx = SSL_CTX_new(method);
+   if (!ctx)
+     luaL_error(L, "#1:%s not supported\n"
+-               "Maybe SSLv3 SSLv23 TLSv1 TLSv1_1 TLSv1_2 DTLSv1 [SSLv2], option followed by _client or _server\n",
+-               "default is SSLv3",
++               "Maybe [SSLv3] SSLv23 TLSv1 TLSv1_1 TLSv1_2 DTLSv1 [SSLv2], option followed by _client or _server\n"
++               "default is TLSv1",
+                meth);
+   openssl_newvalue(L, ctx);
+   SSL_CTX_set_cipher_list(ctx, ciphers);
+@@ -98,6 +110,14 @@ static int openssl_ssl_ctx_new(lua_State
+   return 1;
+ }
+ 
++/***
++get alert_string for ssl state
++ at function alert_string
++ at tparam number alert
++ at tparam[opt=false] boolean long
++ at treturn string alert type
++ at treturn string desc string, if long set true will return long info
++*/
+ static int openssl_ssl_alert_string(lua_State*L)
+ {
+   int v = luaL_checkint(L, 1);
+@@ -119,16 +139,66 @@ static int openssl_ssl_alert_string(lua_
+   return 2;
+ }
+ 
++static int openssl_ssl_session_new(lua_State*L)
++{
++  SSL_SESSION *ss = SSL_SESSION_new();
++  PUSH_OBJECT(ss, "openssl.ssl_session");
++  return 1;
++}
++
++static int openssl_ssl_session_read(lua_State*L)
++{
++  BIO *in = load_bio_object(L, 1);
++  SSL_SESSION* ss = PEM_read_bio_SSL_SESSION(in, NULL, NULL, NULL);
++  if (!ss)
++  {
++    (void)BIO_reset(in);
++    ss = d2i_SSL_SESSION_bio(in, NULL);
++  }
++  BIO_free(in);
++  if (ss)
++  {
++    PUSH_OBJECT(ss, "openssl.ssl_session");
++    return 1;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++static luaL_Reg R[] =
++{
++  {"ctx_new",       openssl_ssl_ctx_new },
++  {"alert_string",  openssl_ssl_alert_string },
++
++  {"session_new",   openssl_ssl_session_new},
++  {"session_read",  openssl_ssl_session_read},
++  {NULL,    NULL}
++};
++
+ /****************************SSL CTX********************************/
++/***
++openssl.ssl_ctx object
++ at type ssl_ctx
++*/
++
++/***
++tell ssl_ctx use private key and certificate, and check private key
++ at function use
++ at tparam evp_pkey pkey
++ at tparam x509 cert
++ at treturn boolean result return true for ok, or nil followed by errmsg and errval
++*/
+ static int openssl_ssl_ctx_use(lua_State*L)
+ {
+   int ret;
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+   EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-  X509* cert = CHECK_OBJECT(3, X509, "openssl.x509");
+ 
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
+-  ret = SSL_CTX_use_certificate(ctx, cert);
++  if(lua_isstring(L, 3)) {
++    ret = SSL_CTX_use_certificate_chain_file(ctx, luaL_checkstring(L, 3));
++  } else {
++    X509* cert = CHECK_OBJECT(3, X509, "openssl.x509");
++    ret = SSL_CTX_use_certificate(ctx, cert);
++  }
+   if (ret == 1)
+   {
+     ret = SSL_CTX_use_PrivateKey(ctx, pkey);
+@@ -140,6 +210,13 @@ static int openssl_ssl_ctx_use(lua_State
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++add client ca cert and option extra chain cert
++ at function add
++ at tparam x509 clientca
++ at tparam[opt] table extra_chain_cert_array
++ at treturn boolean result
++*/
+ static int openssl_ssl_ctx_add(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -155,7 +232,7 @@ static int openssl_ssl_ctx_add(lua_State
+       lua_rawgeti(L, 3, i);
+       x = CHECK_OBJECT(2, X509, "openssl.x509");
+       lua_pop(L, 1);
+-      CRYPTO_add(&x->references, 1, CRYPTO_LOCK_X509);
++      X509_up_ref(x);
+       ret = SSL_CTX_add_extra_chain_cert(ctx, x);
+     }
+   }
+@@ -181,6 +258,17 @@ static int openssl_ssl_ctx_gc(lua_State*
+   return 0;
+ }
+ 
++/***
++get timeout
++ at function timeout
++ at return number
++*/
++/***
++set timeout
++ at function timeout
++ at tparam number timeout
++ at treturn number previous timeout
++*/
+ static int openssl_ssl_ctx_timeout(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -220,6 +308,23 @@ static const char* sMode_options[] =
+   NULL
+ };
+ 
++/***
++clean given mode
++mode support 'enable_partial_write','accept_moving_write_buffer','auto_retry','no_auto_chain','release_buffers'
++ at function mode
++ at tparam boolean clear must be true
++ at tparam string mode
++ at param[opt] ...
++ at treturn string
++ at treturn ...
++ at usage
++ modes = { ssl_ctx:mode('enable_partial_write','accept_moving_write_buffer','auto_retry') },
++
++  for  i, v in ipairs(modes)
++    print(v)
++ end
++ --output 'enable_partial_write','accept_moving_write_buffer','auto_retry'
++*/
+ static int openssl_ssl_ctx_mode(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -253,7 +358,30 @@ static int openssl_ssl_ctx_mode(lua_Stat
+   return ret;
+ };
+ 
++/***
++get options
++ at function options
++ at treturn table string list of current options
++*/
+ 
++/***
++set options
++ at function options
++ at tparam string option, support "microsoft_sess_id_bug", "netscape_challenge_bug", "netscape_reuse_cipher_change_bug",
++"sslref2_reuse_cert_type_bug", "microsoft_big_sslv3_buffer", "msie_sslv3_rsa_padding","ssleay_080_client_dh_bug",
++"tls_d5_bug","tls_block_padding_bug","dont_insert_empty_fragments","all", please to see ssl_options.h
++ at treturn table string list of current options after set new option
++*/
++
++/***
++clear options
++ at function options
++ at tparam boolean clear set true to clear options
++ at tparam string option, support "microsoft_sess_id_bug", "netscape_challenge_bug", "netscape_reuse_cipher_change_bug",
++"sslref2_reuse_cert_type_bug", "microsoft_big_sslv3_buffer", "msie_sslv3_rsa_padding","ssleay_080_client_dh_bug",
++"tls_d5_bug","tls_block_padding_bug","dont_insert_empty_fragments","all",  please to see ssl_options.h
++ at treturn table string list of current options after clear some option
++*/
+ static int openssl_ssl_ctx_options(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -275,8 +403,8 @@ static int openssl_ssl_ctx_options(lua_S
+         int j;
+         for (j = 0; ssl_options[j].name; j++)
+         {
+-          LuaL_Enum e = ssl_options[j];
+-          if (strcasecmp(s, e.name))
++          LuaL_Enumeration e = ssl_options[j];
++          if (strcasecmp(s, e.name) == 0)
+           {
+             options |= e.val;
+             break;
+@@ -285,7 +413,6 @@ static int openssl_ssl_ctx_options(lua_S
+       }
+     }
+ 
+-
+     if (clear != 0)
+       options = SSL_CTX_clear_options(ctx, options);
+     else
+@@ -298,8 +425,8 @@ static int openssl_ssl_ctx_options(lua_S
+   ret = 0;
+   for (i = 0; ssl_options[i].name; i++)
+   {
+-    LuaL_Enum e = ssl_options[i];
+-    if (options && e.val)
++    LuaL_Enumeration e = ssl_options[i];
++    if (options & e.val)
+     {
+       lua_pushstring(L, e.name);
+       ret++;
+@@ -309,6 +436,25 @@ static int openssl_ssl_ctx_options(lua_S
+   return 1;
+ }
+ 
++/***
++get quit_shutdown is set or not
++Normally when a SSL connection is finished, the parties must send out
++"close notify" alert messages using ***SSL:shutdown"*** for a clean shutdown.
++ at function quiet_shutdown
++ at treturn boolean result
++*/
++/***
++set quiet_shutdown
++ at function quiet_shutdown
++ at tparam boolean quiet
++When setting the "quiet shutdown" flag to 1, ***SSL:shutdown*** will set the internal flags
++to SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN. ***SSL:shutdown*** then behaves like
++***SSL:set_shutdown*** called with SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN.
++The session is thus considered to be shutdown, but no "close notify" alert
++is sent to the peer. This behaviour violates the TLS standard.
++The default is normal shutdown behaviour as described by the TLS standard.
++ at treturn boolean result
++*/
+ static int openssl_ssl_ctx_quiet_shutdown(lua_State*L)
+ {
+   SSL_CTX* s = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -326,6 +472,16 @@ static int openssl_ssl_ctx_quiet_shutdow
+   }
+ };
+ 
++/***
++set verify locations with cafile and capath
++ssl_ctx:verify_locations specifies the locations for *ctx*, at
++which CA certificates for verification purposes are located. The certificates
++available via *CAfile* and *CApath* are trusted.
++ at function verify_locations
++ at tparam string cafile
++ at tparam string capath
++ at treturn boolean result
++*/
+ static int openssl_ssl_ctx_load_verify_locations(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -335,22 +491,33 @@ static int openssl_ssl_ctx_load_verify_l
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get certificate verification store of ssl_ctx
++ at function cert_store
++ at treturn x509_store store
++*/
++/***
++set or replaces then certificate verification store of ssl_ctx
++ at function cert_store
++ at tparam x509_store store
++ at treturn x509_store store
++*/
+ static int openssl_ssl_ctx_cert_store(lua_State*L)
+ {
++#if OPENSSL_VERSION_NUMBER >  0x10002000L
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+   X509_STORE *store = NULL;
+-#if OPENSSL_VERSION_NUMBER >  0x10002000L
+   if (lua_isnoneornil(L, 2))
+   {
+     store = SSL_CTX_get_cert_store(ctx);
+-    CRYPTO_add(&store->references, 1, CRYPTO_LOCK_X509_STORE);
++    X509_STORE_up_ref(store);
+     PUSH_OBJECT(store, "openssl.x509_store");
+     return 1;
+   }
+   else
+   {
+     store = CHECK_OBJECT(2, X509_STORE, "openssl.x509_store");
+-    CRYPTO_add(&store->references, 1, CRYPTO_LOCK_X509_STORE);
++    X509_STORE_up_ref(store);
+     SSL_CTX_set_cert_store(ctx, store);
+     X509_STORE_set_trust(store, 1);
+     return 0;
+@@ -361,6 +528,32 @@ static int openssl_ssl_ctx_cert_store(lu
+ #endif
+ }
+ 
++#ifndef OPENSSL_NO_ENGINE
++static int openssl_ssl_ctx_set_engine(lua_State*L)
++{
++  SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
++  ENGINE* eng = CHECK_OBJECT(2, ENGINE,  "openssl.engine");
++  int ret = SSL_CTX_set_client_cert_engine(ctx, eng);
++  return openssl_pushresult(L, ret);
++}
++#endif
++
++/****************************************************************************/
++/***
++create ssl object
++ at function ssl
++ at tparam bio bio
++ at tparam[opt=false] boolean server, true will make ssl server
++ at treturn ssl
++*/
++/***
++create ssl object
++ at function ssl
++ at tparam bio input
++ at tparam bio ouput
++ at tparam[opt=false] boolean server, true will make ssl server
++ at treturn ssl
++*/
+ static int openssl_ssl_ctx_new_ssl(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -369,15 +562,15 @@ static int openssl_ssl_ctx_new_ssl(lua_S
+   SSL *ssl = SSL_new(ctx);
+   int ret = 1;
+ 
+-  if (auxiliar_isclass(L, "openssl.bio", 2))
++  if (auxiliar_getclassudata(L, "openssl.bio", 2))
+   {
+     BIO *bi = CHECK_OBJECT(2, BIO, "openssl.bio");
+     BIO *bo = bi;
+-    CRYPTO_add(&bi->references, 1, CRYPTO_LOCK_BIO);
+-    if (auxiliar_isclass(L, "openssl.bio", 3))
++    BIO_up_ref(bi);
++    if (auxiliar_getclassudata(L, "openssl.bio", 3))
+     {
+       bo = CHECK_OBJECT(3, BIO, "openssl.bio");
+-      CRYPTO_add(&bo->references, 1, CRYPTO_LOCK_BIO);
++      BIO_up_ref(bo);
+       mode_idx = 4;
+     }
+     else
+@@ -415,6 +608,14 @@ static int openssl_ssl_ctx_new_ssl(lua_S
+   return 1;
+ }
+ 
++/***
++create bio object
++ at function bio
++ at tparam string host_addr format like 'host:port'
++ at tparam[opt=false] boolean server, true listen at host_addr,false connect to host_addr
++ at tparam[opt=true] boolean autoretry ssl operation autoretry mode
++ at treturn bio bio object
++*/
+ static int openssl_ssl_ctx_new_bio(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -445,7 +646,7 @@ static int openssl_ssl_ctx_new_bio(lua_S
+       openssl_newvalue(L, bio);
+ 
+       lua_pushboolean(L, 1);
+-      openssl_setvalue(L, bio, "free_all");
++      openssl_valueset(L, bio, "free_all");
+ 
+       return 1;
+     }
+@@ -460,17 +661,17 @@ static int openssl_ssl_ctx_new_bio(lua_S
+   }
+ }
+ 
+-static int openssl_ssl_getpeerverification(lua_State *L)
+-{
+-  long err;
+-  SSL* ssl = CHECK_OBJECT(1, SSL, "openssl.ssl");
+-
+-  err = SSL_get_verify_result(ssl);
+-  lua_pushboolean(L, err == X509_V_OK);
+-  openssl_getvalue(L, ssl, "verify_cert");
+-  return 2;
+-}
+-
++/***
++get verify depth when cert chain veirition
++ at function verify_depth
++ at treturn number depth
++*/
++/***
++set verify depth when cert chain veirition
++ at function verify_depth
++ at tparam number depth
++ at treturn number depth
++*/
+ static int openssl_ssl_ctx_verify_depth(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -503,6 +704,31 @@ static const char* sVerifyMode_Options[]
+   NULL
+ };
+ 
++/***
++get verify_mode, return number mode and all string modes list
++ at function verify_mode
++ at treturn number mode_code
++ at return ...
++  none: not verify client cert
++  peer: verify client cert
++  fail: if client not have cert, will failure
++  once: verify client only once.
++ at usage
++  mode = {ctx:verify_mode()}
++  print('integer mode',mode[1])
++  for i=2, #mode then
++    print('string mode:'..mode[i])
++  end
++*/
++/***
++set ssl verify mode and callback
++ at function verify_mode
++ at tparam number mode, mode set to ctx, must be ssl.none or ssl.peer, and ssl.peer support combine with ssl.fail or ssl.once
++ at tparam[opt=nil] function ssl verify callback in lua function, not give will use default openssl callback, when mode is 'none', will be ignore this
++verify_cb must be boolean function(verifyarg) prototype, return true to continue or false to end ssl handshake
++verifyarg has field 'error', 'error_string','error_depth','current_cert', and 'preverify_ok'
++ at treturn boolean result
++*/
+ static int openssl_ssl_ctx_verify_mode(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -522,13 +748,13 @@ static int openssl_ssl_ctx_verify_mode(l
+     if (lua_isfunction(L, 3))
+     {
+       lua_pushvalue(L, 3);
+-      openssl_setvalue(L, ctx, "verify_cb");
++      openssl_valueset(L, ctx, "verify_cb");
+       SSL_CTX_set_verify(ctx, mode, openssl_verify_cb);
+     }
+     else
+     {
+       lua_pushnil(L);
+-      openssl_setvalue(L, ctx, "verify_cb");
++      openssl_valueset(L, ctx, "verify_cb");
+       SSL_CTX_set_verify(ctx, mode, openssl_verify_cb);
+     }
+     return 0;
+@@ -568,6 +794,17 @@ static int openssl_ssl_ctx_verify_mode(l
+   }
+ }
+ 
++/***
++set certificate verify callback function
++ at function set_cert_verify
++ at tparam[opt] function cert_verify_cb with boolean function(verifyargs) prototype, if nil or none will use openssl default callback
++verifyargs has field 'error', 'error_string','error_depth','current_cert'
++*/
++/***
++set certificate verify options
++ at function set_cert_verify
++ at tparam table verify_cb_flag support field always_continue with boolean value and verify_depth with number value.
++*/
+ static int openssl_ssl_ctx_set_cert_verify(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -578,13 +815,13 @@ static int openssl_ssl_ctx_set_cert_veri
+   if (lua_istable(L, 2))
+   {
+     lua_pushvalue(L, 2);
+-    openssl_setvalue(L, ctx, "verify_cb_flags");
++    openssl_valueset(L, ctx, "verify_cb_flags");
+     SSL_CTX_set_cert_verify_callback(ctx, openssl_cert_verify_cb, L);
+   }
+   else if (lua_isfunction(L, 2))
+   {
+     lua_pushvalue(L, 2);
+-    openssl_setvalue(L, ctx, "cert_verify_cb");
++    openssl_valueset(L, ctx, "cert_verify_cb");
+     SSL_CTX_set_cert_verify_callback(ctx, openssl_cert_verify_cb, L);
+   }
+   else
+@@ -600,7 +837,7 @@ static DH *tmp_dh_callback(SSL *ssl, int
+   lua_State *L = SSL_CTX_get_app_data(ctx);
+   int ret = 0;
+   /* get callback function */
+-  openssl_getvalue(L, ctx, "tmp_dh_callback");
++  openssl_valueget(L, ctx, "tmp_dh_callback");
+ 
+   /* Invoke the callback */
+   lua_pushboolean(L, is_export);
+@@ -627,7 +864,6 @@ static DH *tmp_dh_callback(SSL *ssl, int
+     lua_error(L);
+   }
+ 
+-
+   lua_pop(L, 2);    /* Remove values from stack */
+   return dh_tmp;
+ }
+@@ -640,7 +876,7 @@ static RSA *tmp_rsa_callback(SSL *ssl, i
+   lua_State *L = SSL_CTX_get_app_data(ctx);
+   int ret = 0;
+   /* get callback function */
+-  openssl_getvalue(L, ctx, "tmp_rsa_callback");
++  openssl_valueget(L, ctx, "tmp_rsa_callback");
+ 
+   /* Invoke the callback */
+   lua_pushboolean(L, is_export);
+@@ -654,11 +890,9 @@ static RSA *tmp_rsa_callback(SSL *ssl, i
+       lua_pop(L, 2);  /* Remove values from stack */
+       return NULL;
+     }
+-    bio = BIO_new_mem_buf((void*)lua_tostring(L, -1),
+-                          lua_rawlen(L, -1));
++    bio = BIO_new_mem_buf((void*)lua_tostring(L, -1), lua_rawlen(L, -1));
+     if (bio)
+     {
+-
+       rsa_tmp = PEM_read_bio_RSAPrivateKey(bio, NULL, NULL, NULL);
+       BIO_free(bio);
+     }
+@@ -668,7 +902,6 @@ static RSA *tmp_rsa_callback(SSL *ssl, i
+     lua_error(L);
+   }
+ 
+-
+   lua_pop(L, 2);    /* Remove values from stack */
+   return rsa_tmp;
+ }
+@@ -682,7 +915,7 @@ static EC_KEY *tmp_ecdh_callback(SSL *ss
+   lua_State *L = SSL_CTX_get_app_data(ctx);
+   int ret = 0;
+   /* get callback function */
+-  openssl_getvalue(L, ctx, "tmp_ecdh_callback");
++  openssl_valueget(L, ctx, "tmp_ecdh_callback");
+ 
+   /* Invoke the callback */
+   lua_pushboolean(L, is_export);
+@@ -700,7 +933,6 @@ static EC_KEY *tmp_ecdh_callback(SSL *ss
+                           lua_rawlen(L, -1));
+     if (bio)
+     {
+-
+       ec_tmp = PEM_read_bio_ECPrivateKey(bio, NULL, NULL, NULL);
+       BIO_free(bio);
+     }
+@@ -710,11 +942,30 @@ static EC_KEY *tmp_ecdh_callback(SSL *ss
+     lua_error(L);
+   }
+ 
+-
+   lua_pop(L, 2);    /* Remove values from stack */
+   return ec_tmp;
+ }
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++/***
++set temp callback
++ at function set_tmp
++ at tparam string keytype, 'dh','ecdh',or 'rsa'
++ at tparam function tmp_cb
++ at param[opt] vararg
++*/
++/***
++set tmp key content pem format
++ at function set_tmp
++ at tparam string keytype, 'dh','ecdh',or 'rsa'
++ at tparam string key_pem
++*/
++/***
++set ecdh with given curvename as tmp key
++ at function set_tmp
++ at tparam string keytype, must be 'ecdh'
++ at tparam string curvename
++*/
+ static int openssl_ssl_ctx_set_tmp(lua_State *L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -736,20 +987,20 @@ static int openssl_ssl_ctx_set_tmp(lua_S
+     switch (nwhich)
+     {
+     case 0:
+-      openssl_setvalue(L, ctx, "tmp_dh_callback");
++      openssl_valueset(L, ctx, "tmp_dh_callback");
+       SSL_CTX_set_tmp_dh_callback(ctx, tmp_dh_callback);
+       break;
+     case 1:
+-      openssl_setvalue(L, ctx, "tmp_rsa_callback");
++      openssl_valueset(L, ctx, "tmp_rsa_callback");
+       SSL_CTX_set_tmp_rsa_callback(ctx, tmp_rsa_callback);
+       break;
+     case 2:
+     {
+       luaL_argcheck(L, lua_isstring(L, 4), 4, "must supply curve name");
+-      openssl_setvalue(L, ctx, "tmp_ecdh_callback");
++      openssl_valueset(L, ctx, "tmp_ecdh_callback");
+       SSL_CTX_set_tmp_ecdh_callback(ctx, tmp_ecdh_callback);
+       lua_pushvalue(L, 4);
+-      openssl_setvalue(L, ctx, "curve");
++      openssl_valueset(L, ctx, "curve");
+     }
+     break;
+     }
+@@ -806,6 +1057,7 @@ static int openssl_ssl_ctx_set_tmp(lua_S
+ 
+   return openssl_pushresult(L, ret);
+ }
++#endif
+ 
+ static int tlsext_servername_callback(SSL *ssl, int *ad, void *arg)
+ {
+@@ -820,11 +1072,11 @@ static int tlsext_servername_callback(SS
+     return SSL_TLSEXT_ERR_NOACK;
+ 
+   /* Search for the name in the map */
+-  openssl_getvalue(L, ctx, "tlsext_servername");
++  openssl_valueget(L, ctx, "tlsext_servername");
+   if (lua_istable(L, -1))
+   {
+     lua_getfield(L, -1, name);
+-    if (auxiliar_isclass(L, "openssl.ssl_ctx", -1))
++    if (auxiliar_getclassudata(L, "openssl.ssl_ctx", -1))
+     {
+       newctx = CHECK_OBJECT(-1, SSL_CTX, "openssl.ssl_ctx");
+       SSL_set_SSL_CTX(ssl, newctx);
+@@ -843,17 +1095,26 @@ static int tlsext_servername_callback(SS
+   return SSL_TLSEXT_ERR_ALERT_FATAL;
+ }
+ 
++/***
++set servername callback
++ at function set_servefrname_callback
++ at todo
++*/
+ static int openssl_ssl_ctx_set_servername_callback(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+   luaL_argcheck(L, lua_istable(L, 2) || lua_isfunction(L, 2), 2, "must be table or function");
+ 
+   lua_pushvalue(L, 2);
+-  openssl_setvalue(L, ctx, "tlsext_servername");
++  openssl_valueset(L, ctx, "tlsext_servername");
+   SSL_CTX_set_tlsext_servername_callback(ctx, tlsext_servername_callback);
+   return 0;
+ }
+ 
++/***
++flush sessions
++ at function flush
++*/
+ static int openssl_ssl_ctx_flush_sessions(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -862,6 +1123,10 @@ static int openssl_ssl_ctx_flush_session
+   return 0;
+ }
+ 
++/***
++set ssl session
++ at function sessions
++*/
+ static int openssl_ssl_ctx_sessions(lua_State*L)
+ {
+   SSL_CTX* ctx = CHECK_OBJECT(1, SSL_CTX, "openssl.ssl_ctx");
+@@ -890,6 +1155,18 @@ static int openssl_ssl_ctx_sessions(lua_
+   }
+ }
+ 
++/***
++get current session cache mode
++ at function session_cache_mode
++ at treturn table modes as array, mode is 'no_auto_clear','server','client','both','off'
++*/
++
++/***
++set session cache mode,and return old mode
++ at function session_cache_mode
++ at tparam string mode support 'no_auto_clear','server','client','both','off',
++'no_auto_clear' can be combine with others, so accept one or two param.
++*/
+ static int openssl_session_cache_mode(lua_State *L)
+ {
+   static const char* smode[] =
+@@ -966,12 +1243,19 @@ static int openssl_session_cache_mode(lu
+   return 1;
+ }
+ 
++#ifdef SSL_CTX_EXT_DEFINE
++SSL_CTX_EXT_DEFINE
++#endif
++
+ static luaL_Reg ssl_ctx_funcs[] =
+ {
+   {"ssl",             openssl_ssl_ctx_new_ssl},
+   {"bio",             openssl_ssl_ctx_new_bio},
+-
++#ifndef SSL_CTX_USE_EXT
+   {"use",             openssl_ssl_ctx_use},
++#else
++  SSL_CTX_USE_EXT
++#endif
+   {"add",             openssl_ssl_ctx_add},
+   {"mode",            openssl_ssl_ctx_mode},
+   {"timeout",         openssl_ssl_ctx_timeout},
+@@ -979,16 +1263,20 @@ static luaL_Reg ssl_ctx_funcs[] =
+   {"quiet_shutdown",  openssl_ssl_ctx_quiet_shutdown},
+   {"verify_locations", openssl_ssl_ctx_load_verify_locations},
+   {"cert_store",      openssl_ssl_ctx_cert_store},
+-
++#ifndef OPENSSL_NO_ENGINE
++  {"set_engine",      openssl_ssl_ctx_set_engine},
++#endif
+   {"verify_mode",     openssl_ssl_ctx_verify_mode },
+-  {"set_cert_verify",    openssl_ssl_ctx_set_cert_verify},
+-  {"set_servername_callback",    openssl_ssl_ctx_set_servername_callback},
++  {"set_cert_verify", openssl_ssl_ctx_set_cert_verify},
+ 
+   {"verify_depth",    openssl_ssl_ctx_verify_depth},
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   {"set_tmp",         openssl_ssl_ctx_set_tmp},
++#endif
+   {"flush_sessions",  openssl_ssl_ctx_flush_sessions},
+   {"session",         openssl_ssl_ctx_sessions},
+   {"session_cache_mode",        openssl_session_cache_mode },
++  {"set_servername_callback",   openssl_ssl_ctx_set_servername_callback },
+ 
+   {"__gc",            openssl_ssl_ctx_gc},
+   {"__tostring",      auxiliar_tostring},
+@@ -1015,30 +1303,26 @@ SL_SESSION *(*SSL_CTX_sess_get_get_cb(SS
+   SSL_SESSION *session;
+ */
+ 
+-
+-static int openssl_ssl_session_new(lua_State*L)
++/***
++get peer certificate verify result
++ at function getpeerverification
++ at treturn boolean true for success
++ at treturn table all certificate in chains verify result
++ preverify_ok as boolean verify result
++ error as number error code
++ error_string as string error message
++ error_depth as number verify depth
++ current_cert as x509 certificate to verified
++*/
++static int openssl_ssl_getpeerverification(lua_State *L)
+ {
+-  SSL_SESSION *ss = SSL_SESSION_new();
+-  PUSH_OBJECT(ss, "openssl.ssl_session");
+-  return 1;
+-}
++  long err;
++  SSL* ssl = CHECK_OBJECT(1, SSL, "openssl.ssl");
+ 
+-static int openssl_ssl_session_read(lua_State*L)
+-{
+-  BIO *in = load_bio_object(L, 1);
+-  SSL_SESSION* ss = PEM_read_bio_SSL_SESSION(in, NULL, NULL, NULL);
+-  if (!ss)
+-  {
+-    BIO_reset(in);
+-    ss = d2i_SSL_SESSION_bio(in, NULL);
+-  }
+-  BIO_free(in);
+-  if (ss)
+-  {
+-    PUSH_OBJECT(ss, "openssl.ssl_session");
+-    return 1;
+-  }
+-  return openssl_pushresult(L, 0);
++  err = SSL_get_verify_result(ssl);
++  lua_pushboolean(L, err == X509_V_OK);
++  openssl_valueget(L, ssl, "verify_cert");
++  return 2;
+ }
+ 
+ static int openssl_ssl_session_time(lua_State*L)
+@@ -1165,8 +1449,23 @@ static luaL_Reg ssl_session_funcs[] =
+ 
+ 
+ /***************************SSL**********************************/
++/***
++openssl.ssl object
++All SSL object IO operation methods(connect, accept, handshake, read,
++peek or write) return nil or false when fail or error.
++When nil returned, it followed by 'ssl' or 'syscall', means SSL layer or
++system layer error. When false returned, it followed by number 0,
++'want_read','want_write','want_x509_lookup','want_connect','want_accept'.
++Numnber 0 means SSL connection closed, others means you should do some
++SSL operation.
++ at type ssl
++*/
+ 
+-/* need more think */
++/***
++reset ssl object to allow another connection
++ at function clear
++ at treturn boolean result true for success
++*/
+ static int openssl_ssl_clear(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1174,6 +1473,13 @@ static int openssl_ssl_clear(lua_State*L
+   return 1;
+ }
+ 
++/***
++tell ssl use private key and certificate, and check private key
++ at function use
++ at tparam evp_pkey pkey
++ at tparam[opt] x509 cert
++ at treturn boolean result return true for ok, or nil followed by errmsg and errval
++*/
+ static int openssl_ssl_use(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1181,7 +1487,6 @@ static int openssl_ssl_use(lua_State*L)
+   EVP_PKEY* pkey = CHECK_OBJECT(3, EVP_PKEY, "openssl.evp_pkey");
+   int ret;
+ 
+-  luaL_argcheck(L, openssl_pkey_is_private(pkey), 3, "must be private key");
+   ret = SSL_use_PrivateKey(s, pkey);
+   if (ret == 1)
+   {
+@@ -1194,6 +1499,12 @@ static int openssl_ssl_use(lua_State*L)
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++get peer certificate and certificate chains
++ at function peer
++ at treturn[1] x509 certificate
++ at treturn[1] sk_of_x509 chains of peer
++*/
+ static int openssl_ssl_peer(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1217,6 +1528,12 @@ static int openssl_ssl_gc(lua_State*L)
+   return 0;
+ }
+ 
++/***
++get want to do
++ at function want
++ at treturn[1] string 'nothing', 'reading', 'writing', 'x509_lookup'
++ at treturn[1] number state want
++*/
+ static int openssl_ssl_want(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1235,7 +1552,12 @@ static int openssl_ssl_want(lua_State*L)
+   lua_pushinteger(L, st);
+   return 2;
+ }
+-#ifndef LIBRESSL_VERSION_NUMBER
++#if !defined(OPENSSL_NO_COMP) && !defined(LIBRESSL_VERSION_NUMBER)
++/***
++get current compression name
++ at function current_compression
++ at treturn string
++*/
+ static int openssl_ssl_current_compression(lua_State *L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1248,6 +1570,11 @@ static int openssl_ssl_current_compressi
+ }
+ #endif
+ 
++/***
++get current cipher info
++ at function current_cipher
++ at treturn table include name,version,id,bits,algbits and description
++*/
+ static int openssl_ssl_current_cipher(lua_State *L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1276,6 +1603,11 @@ static int openssl_ssl_current_cipher(lu
+   return 0;
+ }
+ 
++/***
++get number of bytes available inside SSL fro immediate read
++ at function pending
++ at treturn number
++*/
+ static int openssl_ssl_pending(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1330,6 +1662,11 @@ static int openssl_ssl_pushresult(lua_St
+   }
+ }
+ 
++/***
++get socket fd of ssl
++ at function getfd
++ at treturn number fd
++*/
+ static int openssl_ssl_getfd(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1337,6 +1674,33 @@ static int openssl_ssl_getfd(lua_State*L
+   return 1;
+ }
+ 
++/***
++get value according to arg
++ at function get
++@tparam string arg
++ <br/>certificate:  return SSL certificates
++ <br/>fd: return file or network connect fd
++ <br/>rfd:
++ <br/>wfd:
++ <br/>client_CA_list
++ <br/>read_ahead: -> boolean
++ <br/>shared_ciphers: string
++ <br/>cipher_list -> string
++ <br/>verify_mode: number
++ <br/>verify_depth
++ <br/>state_string
++ <br/>state_string_long
++ <br/>rstate_string
++ <br/>rstate_string_long
++ <br/>iversion
++ <br/>version
++ <br/>default_timeout,
++ <br/>certificates
++ <br/>verify_result
++ <br/>state
++ <br/>state_string
++ at return according to arg
++*/
+ static int openssl_ssl_get(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1429,7 +1793,7 @@ static int openssl_ssl_get(lua_State*L)
+     }
+     else if (strcmp(what, "state") == 0)
+     {
+-      lua_pushinteger(L, SSL_state(s));
++      lua_pushinteger(L, SSL_get_state(s));
+     }
+     else if (strcmp(what, "hostname") == 0)
+     {
+@@ -1441,6 +1805,25 @@ static int openssl_ssl_get(lua_State*L)
+   return top - 1;
+ }
+ 
++/***
++set value according to arg
++ at function set
++ at tparam string arg
++ <br/>certificate:  return SSL certificates
++ <br/>fd: return file or network connect fd
++ <br/>rfd:
++ <br/>wfd:
++ <br/>client_CA:
++ <br/>read_ahead:
++ <br/>cipher_list:
++ <br/>verify_depth:
++ <br/>purpose:
++ <br/>trust:
++ <br/>verify_result:
++ <br/>hostname:
++ at param value val type accroding to arg
++ at return value
++*/
+ static int openssl_ssl_set(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1482,7 +1865,6 @@ static int openssl_ssl_set(lua_State*L)
+       int depth = luaL_checkint(L, i + 1);
+       SSL_set_verify_depth(s, depth);
+     }
+-
+     else if (strcmp(what, "purpose") == 0)
+     {
+       //FIX
+@@ -1505,14 +1887,6 @@ static int openssl_ssl_set(lua_State*L)
+       const char* hostname = luaL_checkstring(L, i + 1);
+       SSL_set_tlsext_host_name(s, hostname);
+     }
+-
+-#if OPENSSL_VERSION_NUMBER > 0x10000000L
+-    else if (strcmp(what, "state") == 0)
+-    {
+-      int l = luaL_checkint(L, 2);
+-      SSL_set_state(s, l);
+-    }
+-#endif
+     else
+       luaL_argerror(L, i, "don't understand");
+ 
+@@ -1522,6 +1896,12 @@ static int openssl_ssl_set(lua_State*L)
+   return 0;
+ }
+ 
++/***
++do ssl server accept
++ at function accept
++ at treturn boolean true for success
++ at treturn string fail reason
++*/
+ static int openssl_ssl_accept(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1529,6 +1909,12 @@ static int openssl_ssl_accept(lua_State*
+   return openssl_ssl_pushresult(L, s, ret);
+ }
+ 
++/***
++do ssl client connect
++ at function connect
++ at treturn boolean true for success
++ at treturn string fail reasion
++*/
+ static int openssl_ssl_connect(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1536,6 +1922,13 @@ static int openssl_ssl_connect(lua_State
+   return openssl_ssl_pushresult(L, s, ret);
+ }
+ 
++/***
++do ssl read
++ at function read
++ at tparam[opt=4096] number length to read
++ at treturn string data, nil or false for fail
++ at treturn string fail reason
++*/
+ static int openssl_ssl_read(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1558,6 +1951,13 @@ static int openssl_ssl_read(lua_State*L)
+   return ret;
+ }
+ 
++/***
++do ssl peak, data can be read again
++ at function peek
++ at tparam[opt=4096] number length to read
++ at treturn string data, nil or false for fail
++ at treturn string fail reason
++*/
+ static int openssl_ssl_peek(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1581,6 +1981,13 @@ static int openssl_ssl_peek(lua_State*L)
+   return ret;
+ }
+ 
++/***
++do ssl write
++ at function write
++ at tparam string data
++ at treturn number count of bytes write successfully
++ at treturn string fail reason
++*/
+ static int openssl_ssl_write(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1598,6 +2005,12 @@ static int openssl_ssl_write(lua_State*L
+   }
+ }
+ 
++/***
++do ssl handshake, support both server and client side
++ at function handshake
++ at treturn boolean true for success
++ at treturn string fail reasion
++*/
+ static int openssl_ssl_do_handshake(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1605,6 +2018,12 @@ static int openssl_ssl_do_handshake(lua_
+   return openssl_ssl_pushresult(L, s, ret);
+ }
+ 
++/***
++do ssl renegotiate
++ at function renegotiate
++ at treturn boolean true for success
++ at treturn string fail reasion
++*/
+ static int openssl_ssl_renegotiate(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1620,6 +2039,19 @@ static int openssl_ssl_renegotiate_abbre
+   return openssl_ssl_pushresult(L, s, ret);
+ }
+ #endif
++
++/***
++get ssl renegotiate_pending
++ at function renegotiate_pending
++ at treturn boolean true for success
++ at treturn string fail reasion
++*/
++/***
++do ssl renegotiate_pending
++ at function renegotiate_pending
++ at treturn boolean true for success
++ at treturn string fail reasion
++*/
+ static int openssl_ssl_renegotiate_pending(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1627,6 +2059,23 @@ static int openssl_ssl_renegotiate_pendi
+   return openssl_ssl_pushresult(L, s, ret);
+ }
+ 
++/***
++shutdown ssl connection with quite or noquite mode
++ at function shutdown
++ at tparam boolean mode
++ at treturn boolean if mode is true, return true or false for quite
++ at treturn string if mode is false, return 'read' or 'write' for shutdown direction
++*/
++/***
++shutdown SSL connection
++ at function shutdown
++*/
++/***
++shutdown ssl connect with special mode, disable read or write,
++enable or disable quite shutdown
++ at function shutdown
++ at tparam string mode support 'read','write', 'quite', 'noquite'
++*/
+ static int openssl_ssl_shutdown(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1674,6 +2123,10 @@ static int openssl_ssl_shutdown(lua_Stat
+   return 0;
+ };
+ 
++/***
++make ssl to client mode
++ at function set_connect_state
++*/
+ static int openssl_ssl_set_connect_state(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1681,6 +2134,10 @@ static int openssl_ssl_set_connect_state
+   return 0;
+ }
+ 
++/***
++make ssl to server mode
++ at function set_accept_state
++*/
+ static int openssl_ssl_set_accept_state(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1688,6 +2145,11 @@ static int openssl_ssl_set_accept_state(
+   return 0;
+ }
+ 
++/***
++duplicate ssl object
++ at treturn ssl
++ at function dup
++*/
+ static int openssl_ssl_dup(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1696,6 +2158,10 @@ static int openssl_ssl_dup(lua_State*L)
+   return 1;
+ }
+ 
++/***
++get ssl session resused
++ at function session_reused
++*/
+ static int openssl_ssl_session_reused(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1722,6 +2188,17 @@ static int openssl_ssl_set_debug(lua_Sta
+ #endif
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x0090819fL
++/***
++get ssl_ctx associate with current ssl
++ at function ctx
++ at treturn ssl_ctx
++*/
++/***
++set ssl_ctx associate to current ssl
++ at function ctx
++ at tparam ssl_ctx ctx
++ at treturn ssl_ctx orgine ssl_ctx object
++*/
+ static int openssl_ssl_ctx(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1741,7 +2218,18 @@ static int openssl_ssl_ctx(lua_State*L)
+ }
+ #endif
+ 
+-
++/***
++get ssl session
++ at treturn ssl_session session object
++ at function session
++*/
++/***
++set ssl session
++ at function session
++ at tparam string|ssl_session sesion
++ reuse session would speed up ssl handshake
++ at treturn boolean result
++*/
+ static int openssl_ssl_session(lua_State*L)
+ {
+   SSL* s = CHECK_OBJECT(1, SSL, "openssl.ssl");
+@@ -1794,7 +2282,7 @@ static luaL_Reg ssl_funcs[] =
+   {"getfd",     openssl_ssl_getfd},
+ 
+   {"current_cipher",        openssl_ssl_current_cipher},
+-#ifndef LIBRESSL_VERSION_NUMBER
++#if !defined(OPENSSL_NO_COMP) && !defined(LIBRESSL_VERSION_NUMBER)
+   {"current_compression",   openssl_ssl_current_compression},
+ #endif
+   {"getpeerverification",   openssl_ssl_getpeerverification},
+@@ -1834,16 +2322,6 @@ static luaL_Reg ssl_funcs[] =
+   {NULL,      NULL},
+ };
+ 
+-static luaL_Reg R[] =
+-{
+-  {"ctx_new",       openssl_ssl_ctx_new },
+-  {"alert_string",  openssl_ssl_alert_string },
+-
+-  {"session_new",   openssl_ssl_session_new},
+-  {"session_read",  openssl_ssl_session_read},
+-  {NULL,    NULL}
+-};
+-
+ int luaopen_ssl(lua_State *L)
+ {
+   int i;
+@@ -1855,7 +2333,6 @@ int luaopen_ssl(lua_State *L)
+   auxiliar_newclass(L, "openssl.ssl_session",   ssl_session_funcs);
+   auxiliar_newclass(L, "openssl.ssl",           ssl_funcs);
+ 
+-
+   lua_newtable(L);
+   luaL_setfuncs(L, R, 0);
+ 
+@@ -1863,12 +2340,7 @@ int luaopen_ssl(lua_State *L)
+   lua_pushliteral(L, MYVERSION);
+   lua_settable(L, -3);
+ 
+-  for (i = 0; i < sizeof(ssl_options) / sizeof(LuaL_Enum) - 1; i++)
+-  {
+-    LuaL_Enum e = ssl_options[i];
+-    lua_pushinteger(L, e.val);
+-    lua_setfield(L, -2, e.name);
+-  }
++  auxiliar_enumerate(L, -1, ssl_options);
+   for (i = 0; sVerifyMode_Options[i]; i++)
+   {
+     lua_pushinteger(L, iVerifyMode_Options[i]);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/ssl_options.h luvi-src-v2.7.6/deps/lua-openssl/src/ssl_options.h
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/ssl_options.h	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/ssl_options.h	2019-02-13 11:53:24.321792707 +0100
+@@ -4,7 +4,7 @@
+ #include <openssl/ssl.h>
+ #include "auxiliar.h"
+ 
+-static LuaL_Enum ssl_options[] =
++static LuaL_Enumeration ssl_options[] =
+ {
+ #if defined(SSL_OP_ALL)
+   {"all", SSL_OP_ALL},
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/th-lock.c luvi-src-v2.7.6/deps/lua-openssl/src/th-lock.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/th-lock.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/th-lock.c	2019-02-13 11:53:24.321792707 +0100
+@@ -60,6 +60,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
++#include <openssl/crypto.h>
+ #ifdef OPENSSL_SYS_WIN32
+ #include <windows.h>
+ #endif
+@@ -76,25 +77,10 @@
+ #include <pthread.h>
+ #endif
+ #endif
+-#include <openssl/lhash.h>
+-#include <openssl/crypto.h>
+-#include <openssl/buffer.h>
+-#include <openssl/x509.h>
+-#include <openssl/ssl.h>
+-#include <openssl/err.h>
+ 
+ void CRYPTO_thread_setup(void);
+ void CRYPTO_thread_cleanup(void);
+ 
+-static void irix_locking_callback(int mode, int type, const char *file, int line);
+-static void solaris_locking_callback(int mode, int type, const char *file, int line);
+-static void win32_locking_callback(int mode, int type, const char *file, int line);
+-static void pthreads_locking_callback(int mode, int type, const char *file, int line);
+-
+-static unsigned long irix_thread_id(void );
+-static unsigned long solaris_thread_id(void );
+-static unsigned long pthreads_thread_id(void );
+-
+ /* usage:
+  * CRYPTO_thread_setup();
+  * application code
+@@ -105,6 +91,8 @@ static unsigned long pthreads_thread_id(
+ 
+ #ifdef OPENSSL_SYS_WIN32
+ 
++static void win32_locking_callback(int mode, int type, const char *file, int line);
++
+ static HANDLE *lock_cs;
+ 
+ void CRYPTO_thread_setup(void)
+@@ -149,6 +137,9 @@ static void win32_locking_callback(int m
+ 
+ #ifdef SOLARIS
+ 
++static void solaris_locking_callback(int mode, int type, const char *file, int line);
++static unsigned long solaris_thread_id(void );
++
+ #define USE_MUTEX
+ 
+ #ifdef USE_MUTEX
+@@ -246,6 +237,10 @@ unsigned long solaris_thread_id(void)
+ #endif /* SOLARIS */
+ 
+ #ifdef IRIX
++
++static void irix_locking_callback(int mode, int type, const char *file, int line);
++static unsigned long irix_thread_id(void );
++
+ /* I don't think this works..... */
+ 
+ static usptr_t *arena;
+@@ -316,6 +311,10 @@ unsigned long irix_thread_id(void)
+ /* Linux and a few others */
+ #ifdef PTHREADS
+ #ifndef OPENSSL_SYS_WIN32
++
++static void pthreads_locking_callback(int mode, int type, const char *file, int line);
++static unsigned long pthreads_thread_id(void );
++
+ static pthread_mutex_t *lock_cs;
+ static long *lock_count;
+ 
+@@ -335,7 +334,7 @@ void CRYPTO_thread_setup(void)
+   CRYPTO_set_locking_callback((void (*)())pthreads_locking_callback);
+ }
+ 
+-void thread_cleanup(void)
++void CRYPTO_thread_cleanup(void)
+ {
+   int i;
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/util.c luvi-src-v2.7.6/deps/lua-openssl/src/util.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/util.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/util.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,6 +1,6 @@
+ #include "private.h"
+ 
+-int openssl_newvalue(lua_State*L, void*p)
++int openssl_newvalue(lua_State*L,const void*p)
+ {
+   lua_rawgetp(L, LUA_REGISTRYINDEX, p);
+   if (lua_isnil(L, -1))
+@@ -14,14 +14,14 @@ int openssl_newvalue(lua_State*L, void*p
+   return 0;
+ }
+ 
+-int openssl_freevalue(lua_State*L, void*p)
++int openssl_freevalue(lua_State*L, const void*p)
+ {
+   lua_pushnil(L);
+   lua_rawsetp(L, LUA_REGISTRYINDEX, p);
+   return 0;
+ }
+ 
+-int openssl_setvalue(lua_State*L, void*p, const char*field)
++int openssl_valueset(lua_State*L, const void*p, const char*field)
+ {
+   lua_rawgetp(L, LUA_REGISTRYINDEX, p);
+   lua_pushvalue(L, -2);
+@@ -31,7 +31,7 @@ int openssl_setvalue(lua_State*L, void*p
+   return 0;
+ }
+ 
+-int openssl_getvalue(lua_State*L, void*p, const char*field)
++int openssl_valueget(lua_State*L, const void*p, const char*field)
+ {
+   lua_rawgetp(L, LUA_REGISTRYINDEX, p);
+   if (!lua_isnil(L, -1))
+@@ -39,10 +39,43 @@ int openssl_getvalue(lua_State*L, void*p
+     lua_getfield(L, -1, field);
+     lua_remove(L, -2);
+   }
++  return lua_type(L, -1);
++}
++
++int openssl_valueseti(lua_State*L, const void*p, int i)
++{
++  lua_rawgetp(L, LUA_REGISTRYINDEX, p);
++  lua_pushvalue(L, -2);
++  lua_remove(L, -3);
++  lua_rawseti(L, -2, i);
++  lua_pop(L, 1);
+   return 0;
+ }
+ 
+-int openssl_refrence(lua_State*L, void*p, int op)
++int openssl_valuegeti(lua_State*L, const void*p, int i)
++{
++  lua_rawgetp(L, LUA_REGISTRYINDEX, p);
++  if (!lua_isnil(L, -1))
++  {
++    lua_rawgeti(L, -1, i);
++    lua_remove(L, -2);
++  }
++  return lua_type(L, -1);
++}
++
++size_t openssl_valuelen(lua_State*L, const void*p)
++{
++  size_t s = 0;
++  lua_rawgetp(L, LUA_REGISTRYINDEX, p);
++  if (!lua_isnil(L, -1))
++  {
++    s = lua_rawlen(L, -1);
++  }
++  lua_pop(L, 1);
++  return s;
++}
++
++int openssl_refrence(lua_State*L, const void*p, int op)
+ {
+   int ref;
+   lua_rawgetp(L, LUA_REGISTRYINDEX, p);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/x509.c luvi-src-v2.7.6/deps/lua-openssl/src/x509.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/x509.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/x509.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,9 +1,12 @@
+-/*=========================================================================*\
+-* x509.c
+-* x509 modules for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
++/***
++x509 modules for lua-openssl binding
++create and manage x509 certificate
++ at module x509
++ at usage
++ x509 = require'openssl'.x509
++*/
++
++
+ #include "openssl.h"
+ #include "private.h"
+ #define CRYPTO_LOCK_REF
+@@ -13,21 +16,326 @@
+ #define MYVERSION MYNAME " library for " LUA_VERSION " / Nov 2014 / "\
+   "based on OpenSSL " SHLIB_VERSION_NUMBER
+ 
+-int openssl_push_x509_algor(lua_State*L, const X509_ALGOR* alg)
++static int openssl_push_purpose(lua_State*L, X509_PURPOSE* purpose)
+ {
+   lua_newtable(L);
+-  openssl_push_asn1object(L, alg->algorithm);
+-  lua_setfield(L, -2, "algorithm");
+-  if (alg->parameter)
++
++  AUXILIAR_SET(L, -1, "purpose", purpose->purpose, integer);
++  AUXILIAR_SET(L, -1, "trust", purpose->trust, integer);
++  AUXILIAR_SET(L, -1, "flags", purpose->flags, integer);
++
++  AUXILIAR_SET(L, -1, "name", purpose->name, string);
++  AUXILIAR_SET(L, -1, "sname", purpose->sname, string);
++
++  return 1;
++};
++
++/***
++return all supported purpose as table
++ at function purpose
++ at treturn table
++*/
++/*
++get special purpose info as table
++ at function purpose
++ at tparam number|string purpose id or short name
++ at treturn table
++*/
++static int openssl_x509_purpose(lua_State*L)
++{
++  if (lua_isnoneornil(L, 1))
++  {
++    int count = X509_PURPOSE_get_count();
++    int i;
++    lua_newtable(L);
++    for (i = 0; i < count; i++)
++    {
++      X509_PURPOSE* purpose = X509_PURPOSE_get0(i);
++      openssl_push_purpose(L, purpose);
++      lua_rawseti(L, -2, i + 1);
++    }
++    return 1;
++  }
++  else if (lua_isnumber(L, 1))
++  {
++    int idx = X509_PURPOSE_get_by_id(lua_tointeger(L, 1));
++    if (idx >= 0)
++    {
++      X509_PURPOSE* purpose = X509_PURPOSE_get0(idx);
++      openssl_push_purpose(L, purpose);
++    }
++    else
++      lua_pushnil(L);
++    return 1;
++  }
++  else if (lua_isstring(L, 1))
++  {
++    char* name = (char*)lua_tostring(L, 1);
++    int idx = X509_PURPOSE_get_by_sname(name);
++    if (idx >= 0)
++    {
++      X509_PURPOSE* purpose = X509_PURPOSE_get0(idx);
++      openssl_push_purpose(L, purpose);
++    }
++    else
++      lua_pushnil(L);
++    return 1;
++  }
++  return 0;
++};
++
++static const char* usage_mode[] =
++{
++  "standard",
++  "netscape",
++  "extend",
++  NULL
++};
++
++/***
++get support certtypes
++ at function certtypes
++ at tparam[opt='standard'] string type support 'standard','netscape','extend'
++ at treturn table if type is 'standard' or 'netscape', contains node with {lname=...,sname=...,bitname=...},
++               if type is 'extend', contains node with {lname=...,sname=...,nid=...}
++*/
++static int openssl_x509_certtypes(lua_State*L)
++{
++  int mode = luaL_checkoption(L, 1, "standard", usage_mode);
++  int i;
++  const BIT_STRING_BITNAME* bitname;
++
++  switch (mode)
++  {
++  case 0:
++  {
++    const static BIT_STRING_BITNAME key_usage_type_table[] =
++    {
++      {0, "Digital Signature", "digitalSignature"},
++      {1, "Non Repudiation", "nonRepudiation"},
++      {2, "Key Encipherment", "keyEncipherment"},
++      {3, "Data Encipherment", "dataEncipherment"},
++      {4, "Key Agreement", "keyAgreement"},
++      {5, "Certificate Sign", "keyCertSign"},
++      {6, "CRL Sign", "cRLSign"},
++      {7, "Encipher Only", "encipherOnly"},
++      {8, "Decipher Only", "decipherOnly"},
++      { -1, NULL, NULL}
++    };
++    lua_newtable(L);
++    for (i = 0, bitname = &key_usage_type_table[i]; bitname->bitnum != -1; i++, bitname = &key_usage_type_table[i])
++    {
++      openssl_push_bit_string_bitname(L, bitname);
++      lua_rawseti(L, -2, i + 1);
++    }
++    return 1;
++
++  }
++  case 1:
+   {
+-    openssl_push_asn1type(L, alg->parameter);
+-    lua_setfield(L, -2, "parameter");
++    const static BIT_STRING_BITNAME ns_cert_type_table[] =
++    {
++      {0, "SSL Client", "client"},
++      {1, "SSL Server", "server"},
++      {2, "S/MIME", "email"},
++      {3, "Object Signing", "objsign"},
++      {4, "Unused", "reserved"},
++      {5, "SSL CA", "sslCA"},
++      {6, "S/MIME CA", "emailCA"},
++      {7, "Object Signing CA", "objCA"},
++      { -1, NULL, NULL}
++    };
++    lua_newtable(L);
++    for (i = 0, bitname = &ns_cert_type_table[i]; bitname->bitnum != -1; i++, bitname = &ns_cert_type_table[i])
++    {
++      openssl_push_bit_string_bitname(L, bitname);
++      lua_rawseti(L, -2, i + 1);
++    }
++    return 1;
+   }
++  case 2:
++  {
++    static const int ext_nids[] =
++    {
++      NID_server_auth,
++      NID_client_auth,
++      NID_email_protect,
++      NID_code_sign,
++      NID_ms_sgc,
++      NID_ns_sgc,
++      NID_OCSP_sign,
++      NID_time_stamp,
++      NID_dvcs,
++      NID_anyExtendedKeyUsage
++    };
++    int count = sizeof(ext_nids) / sizeof(int);
++    int nid;
++    lua_newtable(L);
++    for (i = 0; i < count; i++)
++    {
++      nid = ext_nids[i];
++      lua_newtable(L);
++      lua_pushstring(L, OBJ_nid2ln(nid));
++      lua_setfield(L, -2, "lname");
++      lua_pushstring(L, OBJ_nid2sn(nid));
++      lua_setfield(L, -2, "sname");
++      lua_pushinteger(L, nid);
++      lua_setfield(L, -2, "nid");
++      lua_rawseti(L, -2, i + 1);
++    };
++    return 1;
++  }
++  }
++  return 0;
++}
++
++/***
++get certificate verify result string message
++ at function verify_cert_error_string
++ at tparam number verify_result
++ at treturn string result message
++*/
++static int openssl_verify_cert_error_string(lua_State*L)
++{
++  int v = luaL_checkint(L, 1);
++  const char*s = X509_verify_cert_error_string(v);
++  lua_pushstring(L, s);
+   return 1;
++}
++
++/***
++read x509 from string or bio input
++ at function read
++ at tparam bio|string input input data
++ at tparam[opt='auto'] string format support 'auto','pem','der'
++ at treturn x509 certificate object
++*/
++static LUA_FUNCTION(openssl_x509_read)
++{
++  X509 *cert = NULL;
++  BIO *in = load_bio_object(L, 1);
++  int fmt = luaL_checkoption(L, 2, "auto", format);
++  if (fmt == FORMAT_AUTO)
++  {
++    fmt = bio_is_der(in) ? FORMAT_DER : FORMAT_PEM;
++  }
++
++  if (fmt == FORMAT_DER)
++  {
++    cert = d2i_X509_bio(in, NULL);
++  }
++  else if (fmt == FORMAT_PEM)
++  {
++    cert = PEM_read_bio_X509(in, NULL, NULL, NULL);
++  }
++
++  BIO_free(in);
++
++  if (cert)
++  {
++    PUSH_OBJECT(cert, "openssl.x509");
++    return 1;
++  }
++  return openssl_pushresult(L, 0);
++}
++
++/***
++create or generate a new x509 object.
++ at function new
++ at tparam[opt] openssl.bn serial serial number
++ at tparam[opt] x509_req csr,copy x509_name, pubkey and extension to new object
++ at tparam[opt] x509_name subject subject name set to x509_req
++ at tparam[opt] stack_of_x509_extension extensions add to x509
++ at tparam[opt] stack_of_x509_attribute attributes add to x509
++@treturn x509 certificate object
++*/
++static int openssl_x509_new(lua_State* L)
++{
++  int i = 1;
++  int ret = 1;
++  int n = lua_gettop(L);
++  X509 *x = X509_new();
++
++  ret = X509_set_version(x, 2);
++  if (ret == 1 && (
++        auxiliar_getclassudata(L, "openssl.bn", i) ||
++        lua_isstring(L, i) || lua_isnumber(L, i)
++      ))
++  {
++    BIGNUM *bn = BN_get(L, i);
++    ASN1_INTEGER* ai = BN_to_ASN1_INTEGER(bn, NULL);
++    BN_free(bn);
++    ret = X509_set_serialNumber(x, ai);
++    ASN1_INTEGER_free(ai);
++    i++;
++  }
++
++  for (; i <= n; i++)
++  {
++    if (ret == 1 && auxiliar_getclassudata(L, "openssl.x509_req", i))
++    {
++      X509_REQ* csr = CHECK_OBJECT(i, X509_REQ, "openssl.x509_req");
++      X509_NAME* xn = X509_REQ_get_subject_name(csr);
++      ret = X509_set_subject_name(x, xn);
++
++      if (ret == 1)
++      {
++        STACK_OF(X509_EXTENSION) *exts = X509_REQ_get_extensions(csr);
++        int j, n1;
++        n1 = sk_X509_EXTENSION_num(exts);
++        for (j = 0; ret == 1 && j < n1; j++)
++        {
++          ret = X509_add_ext(x, sk_X509_EXTENSION_value(exts, j), j);
++        }
++        sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
++      }
++      if (ret == 1)
++      {
++        EVP_PKEY* pkey = X509_REQ_get_pubkey(csr);
++        ret = X509_set_pubkey(x, pkey);
++        EVP_PKEY_free(pkey);
++      }
++      i++;
++    };
++
++    if (ret == 1 && auxiliar_getclassudata(L, "openssl.x509_name", i))
++    {
++      X509_NAME *xn = CHECK_OBJECT(i, X509_NAME, "openssl.x509_name");
++      ret = X509_set_subject_name(x, xn);
++      i++;
++    }
++  }
++
++  if (ret == 1)
++  {
++    PUSH_OBJECT(x, "openssl.x509");
++    return 1;
++  }
++  else
++  {
++    X509_free(x);
++    return openssl_pushresult(L, ret);
++  }
++};
++
++static luaL_Reg R[] =
++{
++  {"new",           openssl_x509_new },
++  {"read",          openssl_x509_read },
++  {"purpose",       openssl_x509_purpose },
++  {"certtypes",     openssl_x509_certtypes },
++  {"verify_cert_error_string", openssl_verify_cert_error_string },
++
++  {NULL,    NULL}
+ };
+ 
+ int openssl_push_general_name(lua_State*L, const GENERAL_NAME* general_name)
+ {
++  if (general_name == NULL)
++  {
++    lua_pushnil(L);
++    return 1;
++  }
+   lua_newtable(L);
+ 
+   switch (general_name->type)
+@@ -137,37 +445,17 @@ static int check_cert(X509_STORE *ca, X5
+   return X509_V_ERR_OUT_OF_MEM;
+ }
+ 
+-static LUA_FUNCTION(openssl_x509_read)
+-{
+-  X509 *cert = NULL;
+-  BIO *in = load_bio_object(L, 1);
+-  int fmt = luaL_checkoption(L, 2, "auto", format);
+-  if (fmt == FORMAT_AUTO)
+-  {
+-    fmt = bio_is_der(in) ? FORMAT_DER : FORMAT_PEM;
+-  }
+-
+-  if (fmt == FORMAT_DER)
+-  {
+-    cert = d2i_X509_bio(in, NULL);
+-    BIO_reset(in);
+-  }
+-  else if (fmt == FORMAT_PEM)
+-  {
+-    cert = PEM_read_bio_X509(in, NULL, NULL, NULL);
+-    BIO_reset(in);
+-  }
+-
+-  BIO_free(in);
+-
+-  if (cert)
+-  {
+-    PUSH_OBJECT(cert, "openssl.x509");
+-    return 1;
+-  }
+-  return openssl_pushresult(L, 0);
+-}
+-
++/***
++openssl.x509 object
++ at type x509
++*/
++/***
++export x509_req to string
++ at function export
++ at tparam[opt='pem'] string format, 'der' or 'pem' default
++ at tparam[opt='true'] boolean noext not export extension
++ at treturn string
++*/
+ static LUA_FUNCTION(openssl_x509_export)
+ {
+   X509 *cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -213,19 +501,25 @@ static LUA_FUNCTION(openssl_x509_export)
+   return 1;
+ };
+ 
+-
++/***
++parse x509 object as table
++ at function parse
++ at tparam[opt=true] shortname default will use short object name
++ at treturn table result which all x509 information
++*/
+ static LUA_FUNCTION(openssl_x509_parse)
+ {
+   int i;
+   X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
+   X509_ALGOR* alg = 0;
+   lua_newtable(L);
+-
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   if (cert->name)
+   {
+     AUXILIAR_SET(L, -1, "name", cert->name, string);
+   }
+   AUXILIAR_SET(L, -1, "valid", cert->valid, boolean);
++#endif
+   AUXILIAR_SET(L, -1, "version", X509_get_version(cert), integer);
+ 
+   openssl_push_xname_asobject(L, X509_get_subject_name(cert));
+@@ -238,16 +532,31 @@ static LUA_FUNCTION(openssl_x509_parse)
+     AUXILIAR_SET(L, -1, "hash", buf, string);
+   }
+ 
+-  PUSH_ASN1_INTEGER(L, cert->cert_info->serialNumber);
++  PUSH_ASN1_INTEGER(L, X509_get0_serialNumber(cert));
+   lua_setfield(L, -2, "serialNumber");
++
+   PUSH_ASN1_TIME(L, X509_get_notBefore(cert));
+   lua_setfield(L, -2, "notBefore");
+   PUSH_ASN1_TIME(L, X509_get_notAfter(cert));
+   lua_setfield(L, -2, "notAfter");
+ 
+-  alg = X509_ALGOR_dup(cert->sig_alg);
+-  PUSH_OBJECT(alg, "openssl.x509_algor");
+-  lua_setfield(L, -2, "sig_alg");
++  {
++    CONSTIFY_X509_get0 X509_ALGOR *palg = NULL;
++    CONSTIFY_X509_get0 ASN1_BIT_STRING *psig = NULL;
++
++    X509_get0_signature(&psig, &palg, cert);
++    if (palg != NULL)
++    {
++      alg = X509_ALGOR_dup((X509_ALGOR*)palg);
++      PUSH_OBJECT(alg, "openssl.x509_algor");
++      lua_setfield(L, -2, "sig_alg");
++    }
++    if (psig != NULL)
++    {
++      lua_pushlstring(L, (const char *)psig->data, psig->length);
++      lua_setfield(L, -2, "sig");
++    }
++  }
+ 
+   {
+     int l = 0;
+@@ -312,6 +621,17 @@ static LUA_FUNCTION(openssl_x509_free)
+   return 0;
+ }
+ 
++/***
++get public key of x509
++ at function pubkey
++ at treturn evp_pkey public key
++*/
++/***
++set public key of x509
++ at function pubkey
++ at tparam evp_pkey pubkey public key set to x509
++ at treturn boolean result, true for success
++*/
+ static LUA_FUNCTION(openssl_x509_public_key)
+ {
+   X509 *cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -329,6 +649,7 @@ static LUA_FUNCTION(openssl_x509_public_
+   }
+ }
+ 
++#if 0
+ static int verify_cb(int ok, X509_STORE_CTX *ctx)
+ {
+   int err;
+@@ -360,14 +681,31 @@ static int verify_cb(int ok, X509_STORE_
+     return 1;
+   }
+ }
++#endif
+ 
++/***
++check x509 with ca certchian and option purpose
++purpose can be one of: ssl_client, ssl_server, ns_ssl_server, smime_sign, smime_encrypt, crl_sign, any, ocsp_helper, timestamp_sign
++ at function check
++ at tparam x509_store cacerts
++ at tparam x509_store untrusted certs  containing a bunch of certs that are not trusted but may be useful in validating the certificate.
++ at tparam[opt] string purpose to check supported
++ at treturn boolean result true for check pass
++ at treturn integer verify result
++ at see verify_cert_error_string
++*/
++/***
++check x509 with evp_pkey
++ at function check
++ at tparam evp_pkey pkey private key witch match with x509 pubkey
++ at treturn boolean result true for check pass
++*/
+ static LUA_FUNCTION(openssl_x509_check)
+ {
+   X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
+-  if (auxiliar_isclass(L, "openssl.evp_pkey", 2))
++  if (auxiliar_getclassudata(L, "openssl.evp_pkey", 2))
+   {
+     EVP_PKEY * key = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+-    luaL_argcheck(L, openssl_pkey_is_private(key), 2, "must be private key");
+     lua_pushboolean(L, X509_check_private_key(cert, key));
+     return 1;
+   }
+@@ -375,8 +713,20 @@ static LUA_FUNCTION(openssl_x509_check)
+   {
+     X509_STORE* store = CHECK_OBJECT(2, X509_STORE, "openssl.x509_store");
+     STACK_OF(X509)* untrustedchain = lua_isnoneornil(L, 3) ?  NULL : openssl_sk_x509_fromtable(L, 3);
+-    int purpose = lua_isnone(L, 4) ? 0 : X509_PURPOSE_get_by_sname((char*)luaL_optstring(L, 4, "any"));
++    int purpose = 0;
+     int ret = 0;
++    if (!lua_isnone(L, 4))
++    {
++      int purpose_id = X509_PURPOSE_get_by_sname((char*)luaL_optstring(L, 4, "any"));
++      if (purpose_id >= 0)
++      {
++        X509_PURPOSE* ppurpose = X509_PURPOSE_get0(purpose_id);
++        if (ppurpose)
++        {
++          purpose = ppurpose->purpose;
++        }
++      }
++    }
+ #if 0
+     X509_STORE_set_verify_cb_func(store, verify_cb);
+ #endif
+@@ -388,8 +738,73 @@ static LUA_FUNCTION(openssl_x509_check)
+   }
+ }
+ 
++#if OPENSSL_VERSION_NUMBER > 0x10002000L
++/***
++check x509 for host (only for openssl 1.0.2 or greater)
++ at function check_host
++ at tparam string host hostname to check for match match with x509 subject
++ at treturn boolean result true if host is present and matches the certificate
++*/
++static LUA_FUNCTION(openssl_x509_check_host)
++{
++  X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
++  if (lua_isstring(L, 2))
++  {
++    const char *hostname = lua_tostring(L, 2);
++    lua_pushboolean(L, X509_check_host(cert, hostname, strlen(hostname), 0, NULL));
++  }
++  else
++  {
++    lua_pushboolean(L, 0);
++  }
++  return 1;
++}
++/***
++check x509 for email address (only for openssl 1.0.2 or greater)
++ at tparam string email to check for match match with x509 subject
++ at treturn boolean result true if host is present and matches the certificate
++ at function check_email
++*/
++static LUA_FUNCTION(openssl_x509_check_email)
++{
++  X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
++  if (lua_isstring(L, 2))
++  {
++    const char *email = lua_tostring(L, 2);
++    lua_pushboolean(L, X509_check_email(cert, email, strlen(email), 0));
++  }
++  else
++  {
++    lua_pushboolean(L, 0);
++  }
++  return 1;
++}
++
++/***
++check x509 for ip address (ipv4 or ipv6, only for openssl 1.0.2 or greater)
++ at function check_ip_asc
++ at tparam string ip to check for match match with x509 subject
++ at treturn boolean result true if host is present and matches the certificate
++*/
++static LUA_FUNCTION(openssl_x509_check_ip_asc)
++{
++  X509 * cert = CHECK_OBJECT(1, X509, "openssl.x509");
++  if (lua_isstring(L, 2))
++  {
++    const char *ip_asc = lua_tostring(L, 2);
++    lua_pushboolean(L, X509_check_ip_asc(cert, ip_asc, 0));
++  }
++  else
++  {
++    lua_pushboolean(L, 0);
++  }
++  return 1;
++}
++#endif
++
+ IMP_LUA_SK(X509, x509)
+ 
++#if 0
+ static STACK_OF(X509) * load_all_certs_from_file(BIO *in)
+ {
+   STACK_OF(X509) *stack = sk_X509_new_null();
+@@ -417,7 +832,19 @@ static STACK_OF(X509) * load_all_certs_f
+   }
+   return stack;
+ };
++#endif
+ 
++/***
++get subject name of x509
++ at function subject
++ at treturn x509_name subject name
++*/
++/***
++set subject name of x509
++ at function subject
++ at tparam x509_name subject
++ at treturn boolean result true for success
++*/
+ static int openssl_x509_subject(lua_State* L)
+ {
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -434,6 +861,19 @@ static int openssl_x509_subject(lua_Stat
+   }
+ }
+ 
++/***
++get issuer name of x509
++ at function issuer
++ at tparam[opt=false] boolean asobject, true for return as x509_name object, or as table
++ at treturn[1] x509_name issuer
++ at treturn[1] table issuer name as table
++*/
++/***
++set issuer name of x509
++ at function issuer
++ at tparam x509_name name
++ at treturn boolean result true for success
++*/
+ static int openssl_x509_issuer(lua_State* L)
+ {
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -450,13 +890,19 @@ static int openssl_x509_issuer(lua_State
+   }
+ }
+ 
++/***
++get digest of x509 object
++ at function digest
++ at tparam[opt='sha1'] evp_digest|string md_alg, default use 'sha1'
++ at treturn string digest result
++*/
+ static int openssl_x509_digest(lua_State* L)
+ {
+   unsigned int bytes;
+   unsigned char buffer[EVP_MAX_MD_SIZE];
+   char hex_buffer[EVP_MAX_MD_SIZE * 2];
+   X509 *cert = CHECK_OBJECT(1, X509, "openssl.x509");
+-  const EVP_MD *digest = lua_isnoneornil(L, 2) ? EVP_sha1() : get_digest(L, 2);
++  const EVP_MD *digest = get_digest(L, 2, "sha256");
+   int ret;
+   if (!digest)
+   {
+@@ -474,6 +920,16 @@ static int openssl_x509_digest(lua_State
+   return openssl_pushresult(L, ret);
+ };
+ 
++/***
++get notbefore valid time of x509
++ at function notbefore
++ at treturn string notbefore time string
++*/
++/***
++set notbefore valid time of x509
++ at function notbefore
++ at tparam string|number notbefore
++*/
+ static int openssl_x509_notbefore(lua_State *L)
+ {
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -491,7 +947,7 @@ static int openssl_x509_notbefore(lua_St
+       at = ASN1_TIME_new();
+       ASN1_TIME_set(at, time);
+     }
+-    if (lua_isstring(L, 2))
++    else if (lua_isstring(L, 2))
+     {
+       const char* time = lua_tostring(L, 2);
+       at = ASN1_TIME_new();
+@@ -504,6 +960,7 @@ static int openssl_x509_notbefore(lua_St
+     if (at)
+     {
+       ret = X509_set_notBefore(cert, at);
++      ASN1_TIME_free(at);
+     }
+     else
+       ret = 0;
+@@ -511,6 +968,16 @@ static int openssl_x509_notbefore(lua_St
+   };
+ }
+ 
++/***
++get notafter valid time of x509
++ at function notafter
++ at treturn string notafter time string
++*/
++/***
++set notafter valid time of x509
++ at function notafter
++ at tparam string|number notafter
++*/
+ static int openssl_x509_notafter(lua_State *L)
+ {
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -528,7 +995,7 @@ static int openssl_x509_notafter(lua_Sta
+       at = ASN1_TIME_new();
+       ASN1_TIME_set(at, time);
+     }
+-    if (lua_isstring(L, 2))
++    else if (lua_isstring(L, 2))
+     {
+       const char* time = lua_tostring(L, 2);
+       at = ASN1_TIME_new();
+@@ -541,6 +1008,7 @@ static int openssl_x509_notafter(lua_Sta
+     if (at)
+     {
+       ret = X509_set_notAfter(cert, at);
++      ASN1_TIME_free(at);
+     }
+     else
+       ret = 0;
+@@ -548,6 +1016,21 @@ static int openssl_x509_notafter(lua_Sta
+   }
+ }
+ 
++/***
++check x509 valid
++ at function validat
++ at tparam[opt] number time, default will use now time
++ at treturn boolean result true for valid, or for invalid
++ at treturn string notbefore
++ at treturn string notafter
++*/
++/***
++set valid time, notbefore and notafter
++ at function validat
++ at tparam number notbefore
++ at tparam number notafter
++ at treturn boolean result, true for success
++*/
+ static int openssl_x509_valid_at(lua_State* L)
+ {
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+@@ -595,42 +1078,76 @@ static int openssl_x509_valid_at(lua_Sta
+   return 0;
+ }
+ 
++/***
++get serial number of x509
++ at function serial
++ at tparam[opt=true] boolean asobject
++ at treturn[1] bn object
++ at treturn[2] string result
++*/
++/***
++set serial number of x509
++ at function serial
++ at tparam string|number|bn serail
++ at treturn boolean result true for success
++*/
+ static int openssl_x509_serial(lua_State *L)
+ {
+-  BIGNUM *bn;
+-  ASN1_INTEGER *serial;
+   X509* cert = CHECK_OBJECT(1, X509, "openssl.x509");
+-
+-  if (lua_isnone(L, 2) || lua_isboolean(L, 2))
++  ASN1_INTEGER *serial = X509_get_serialNumber(cert);
++  if (lua_isboolean(L, 2))
+   {
+-    int asobj = lua_isnone(L, 2) ? 0 : lua_toboolean(L, 2);
+-    serial = X509_get_serialNumber(cert);
+-    bn = ASN1_INTEGER_to_BN(serial, NULL);
++    int asobj = lua_toboolean(L, 2);
+     if (asobj)
+     {
+-      PUSH_OBJECT(bn, "openssl.bn");
++      PUSH_ASN1_INTEGER(L, serial);
+     }
+     else
+     {
+-      char *tmp = BN_bn2hex(bn);
+-      lua_pushstring(L, tmp);
+-      BN_free(bn);
+-      OPENSSL_free(tmp);
++      BIGNUM *bn = ASN1_INTEGER_to_BN(serial, NULL);
++      PUSH_OBJECT(bn, "openssl.bn");
+     }
+-    return 1;
++  }
++  else if (lua_isnone(L, 2))
++  {
++    BIGNUM *bn = ASN1_INTEGER_to_BN(serial, NULL);
++    char *tmp = BN_bn2hex(bn);
++    lua_pushstring(L, tmp);
++    OPENSSL_free(tmp);
++    BN_free(bn);
+   }
+   else
+   {
+     int ret;
+-    bn = BN_get(L, 2);
+-    serial = BN_to_ASN1_INTEGER(bn, NULL);
+-    BN_free(bn);
++    if (auxiliar_getclassudata(L, "openssl.asn1_string", 2))
++    {
++      serial = CHECK_OBJECT(2, ASN1_STRING, "openssl.asn1_string");
++    }
++    else
++    {
++      BIGNUM *bn = BN_get(L, 2);
++      serial = BN_to_ASN1_INTEGER(bn, NULL);
++      BN_free(bn);
++    }
++    luaL_argcheck(L, serial != NULL, 2, "not accept");
+     ret = X509_set_serialNumber(cert, serial);
+     ASN1_INTEGER_free(serial);
+     return openssl_pushresult(L, ret);
+   }
++  return 1;
+ }
+ 
++/***
++get version number of x509
++ at function version
++ at treturn number version of x509
++*/
++/***
++set version number of x509
++ at function version
++ at tparam number version
++ at treturn boolean result true for result
++*/
+ static int openssl_x509_version(lua_State *L)
+ {
+   int version;
+@@ -650,12 +1167,25 @@ static int openssl_x509_version(lua_Stat
+   }
+ }
+ 
++/***
++get extensions of x509 object
++ at function extensions
++ at tparam[opt=false] boolean asobject, true for return as stack_of_x509_extension or as table
++ at treturn[1] stack_of_x509_extension object when param set true
++ at treturn[2] table contain all x509_extension when param set false or nothing
++*/
++/***
++set extension of x509 object
++ at function extensions
++ at tparam stack_of_x509_extension extensions
++ at treturn boolean result true for success
++*/
+ static int openssl_x509_extensions(lua_State* L)
+ {
+-  X509 *peer = CHECK_OBJECT(1, X509, "openssl.x509");
++  X509 *self = CHECK_OBJECT(1, X509, "openssl.x509");
++  STACK_OF(X509_EXTENSION) *exts = (STACK_OF(X509_EXTENSION) *)X509_get0_extensions(self);
+   if (lua_isnone(L, 2))
+   {
+-    STACK_OF(X509_EXTENSION) *exts = peer->cert_info->extensions;
+     if (exts)
+     {
+       openssl_sk_x509_extension_totable(L, exts);
+@@ -666,89 +1196,45 @@ static int openssl_x509_extensions(lua_S
+   }
+   else
+   {
+-    STACK_OF(X509_EXTENSION) *exts = openssl_sk_x509_extension_fromtable(L, 2);
+-    sk_X509_EXTENSION_pop_free(peer->cert_info->extensions, X509_EXTENSION_free);
+-    peer->cert_info->extensions = exts;
++    STACK_OF(X509_EXTENSION) *others = (STACK_OF(X509_EXTENSION) *)openssl_sk_x509_extension_fromtable(L, 2);
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++    sk_X509_EXTENSION_pop_free(self->cert_info->extensions, X509_EXTENSION_free);
++    self->cert_info->extensions = others;
++#else
++    int i;
++    int n = sk_X509_EXTENSION_num(exts);
++    for (i = 0; i < n; i++)
++      sk_X509_EXTENSION_delete(exts, i);
++    n = sk_X509_EXTENSION_num(others);
++    for (i = 0; i < n; i++)
++    {
++      X509_EXTENSION* ext = sk_X509_EXTENSION_value(others, i);
++      if (exts!=NULL)
++        sk_X509_EXTENSION_push(exts, ext);
++      else
++        X509_add_ext(self, ext, -1);
++    }
++    sk_X509_EXTENSION_free(others);
++#endif
+     return openssl_pushresult(L, 1);
+   }
+ }
+ 
+-static int openssl_x509_new(lua_State* L)
+-{
+-  int i = 1;
+-  int ret = 1;
+-  int n = lua_gettop(L);
+-  X509 *x = X509_new();
+-
+-  ret = X509_set_version(x, 2);
+-  if (ret == 1 && (
+-        auxiliar_isclass(L, "openssl.bn", i) ||
+-        lua_isstring(L, i) || lua_isnumber(L, i)
+-      ))
+-  {
+-    BIGNUM *bn = BN_get(L, i);
+-    ASN1_INTEGER* ai = BN_to_ASN1_INTEGER(bn, NULL);
+-    BN_free(bn);
+-    ret = X509_set_serialNumber(x, ai);
+-    ASN1_INTEGER_free(ai);
+-    i++;
+-  }
+-
+-  for (; i <= n; i++)
+-  {
+-    if (ret == 1 && auxiliar_isclass(L, "openssl.x509_req", i))
+-    {
+-      X509_REQ* csr = CHECK_OBJECT(i, X509_REQ, "openssl.x509_req");
+-      X509_NAME* xn = X509_REQ_get_subject_name(csr);
+-      ret = X509_set_subject_name(x, xn);
+-
+-      if (ret == 1)
+-      {
+-        STACK_OF(X509_EXTENSION) *exts = X509_REQ_get_extensions(csr);
+-        int j, n1;
+-        n1 = sk_X509_EXTENSION_num(exts);
+-        for (j = 0; ret == 1 && j < n1; j++)
+-        {
+-          ret = X509_add_ext(x, sk_X509_EXTENSION_value(exts, j), j);
+-        }
+-        sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
+-      }
+-      if (ret == 1)
+-      {
+-        EVP_PKEY* pkey = X509_REQ_get_pubkey(csr);
+-        ret = X509_set_pubkey(x, pkey);
+-        EVP_PKEY_free(pkey);
+-      }
+-      i++;
+-    };
+-
+-    if (ret == 1 && auxiliar_isclass(L, "openssl.x509_name", i))
+-    {
+-      X509_NAME *xn = CHECK_OBJECT(i, X509_NAME, "openssl.x509_name");
+-      ret = X509_set_subject_name(x, xn);
+-      i++;
+-    }
+-  }
+-
+-  if (ret == 1)
+-  {
+-    PUSH_OBJECT(x, "openssl.x509");
+-    return 1;
+-  }
+-  else
+-  {
+-    X509_free(x);
+-    return openssl_pushresult(L, ret);
+-  }
+-};
+-
++/***
++sign x509
++ at function sign
++ at tparam evp_pkey pkey private key to sign x509
++ at tparam x509|x509_name cacert or cacert x509_name
++ at tparam[opt='sha1WithRSAEncryption'] string|md_digest md_alg
++@treturn boolean result true for check pass
++*/
+ static int openssl_x509_sign(lua_State*L)
+ {
+   X509* x = CHECK_OBJECT(1, X509, "openssl.x509");
+-  if (lua_isnoneornil(L, 2) && x->cert_info != NULL)
++  if (lua_isnoneornil(L, 2))
+   {
+     unsigned char *out = NULL;
+-    int len = i2d_X509_CINF(x->cert_info, &out);
++    int len = i2d_re_X509_tbs(x, &out);
+     if (len > 0)
+     {
+       lua_pushlstring(L, (const char *)out, len);
+@@ -757,14 +1243,13 @@ static int openssl_x509_sign(lua_State*L
+     }
+     return openssl_pushresult(L, len);
+   }
+-  else if (auxiliar_isclass(L, "openssl.evp_pkey", 2))
++  else if (auxiliar_getclassudata(L, "openssl.evp_pkey", 2))
+   {
+     EVP_PKEY* pkey = CHECK_OBJECT(2, EVP_PKEY, "openssl.evp_pkey");
+     const EVP_MD *md;
+     int ret = 1;
+     int i = 3;
+-    luaL_argcheck(L, openssl_pkey_is_private(pkey), 2, "must be private key");
+-    if (auxiliar_isclass(L, "openssl.x509_name", 3))
++    if (auxiliar_getclassudata(L, "openssl.x509_name", 3))
+     {
+       X509_NAME* xn = CHECK_OBJECT(3, X509_NAME, "openssl.x509_name");
+       ret = X509_set_issuer_name(x, xn);
+@@ -784,9 +1269,7 @@ static int openssl_x509_sign(lua_State*L
+ 
+     if (ret == 1)
+     {
+-      md = lua_isnoneornil(L, i) ?
+-           EVP_get_digestbyname("sha1") :
+-           get_digest(L, i);
++      md = get_digest(L, i, "sha256");
+       ret = X509_sign(x, pkey, md);
+       if (ret > 0)
+         ret = 1;
+@@ -798,11 +1281,16 @@ static int openssl_x509_sign(lua_State*L
+     size_t sig_len;
+     const char* sig = luaL_checklstring(L, 2, &sig_len);
+     int nid = openssl_get_nid(L, 3);
+-    int ret = ASN1_BIT_STRING_set(x->signature, (unsigned char*)sig, (int)sig_len);
++    CONSTIFY_X509_get0 ASN1_BIT_STRING *psig = NULL;
++    CONSTIFY_X509_get0 X509_ALGOR *palg = NULL;
++    int ret;
++
++    X509_get0_signature(&psig, &palg, x);
++    ret = ASN1_BIT_STRING_set((ASN1_BIT_STRING*)psig, (unsigned char*)sig, (int)sig_len);
+     if (ret == 1)
+     {
+       ASN1_OBJECT *obj = OBJ_nid2obj(nid);
+-      ret = X509_ALGOR_set0(x->sig_alg, obj, V_ASN1_UNDEF, NULL);
++      ret = X509_ALGOR_set0((X509_ALGOR*)palg, obj, V_ASN1_UNDEF, NULL);
+     }
+     return openssl_pushresult(L, ret);
+   }
+@@ -811,22 +1299,31 @@ static int openssl_x509_sign(lua_State*L
+ static int openssl_x509_verify(lua_State*L)
+ {
+   X509* x = CHECK_OBJECT(1, X509, "openssl.x509");
+-  if (lua_isnoneornil(L, 2) && x->cert_info != NULL)
++  if (lua_isnoneornil(L, 2))
+   {
+     unsigned char *out = NULL;
+-    int len = i2d_X509_CINF(x->cert_info, &out);
++    int len = i2d_re_X509_tbs(x, &out);
+     if (len > 0)
+     {
++      CONSTIFY_X509_get0 ASN1_BIT_STRING *psig = NULL;
++      CONSTIFY_X509_get0 X509_ALGOR *palg = NULL;
++
+       lua_pushlstring(L, (const char *)out, len);
+       OPENSSL_free(out);
+-      if (x->signature != NULL)
++
++      X509_get0_signature(&psig, &palg, x);
++      if (psig != NULL)
+       {
+-        lua_pushlstring(L, (const char *)x->signature->data, x->signature->length);
++        lua_pushlstring(L, (const char *)psig->data, psig->length);
+       }
+       else
+         lua_pushnil(L);
+-      if (x->sig_alg)
+-        openssl_push_x509_algor(L, x->sig_alg);
++
++      if (palg)
++      {
++        X509_ALGOR *alg = X509_ALGOR_dup((X509_ALGOR *)palg);
++        PUSH_OBJECT(alg, "openssl.x509_algor");
++      }
+       else
+         lua_pushnil(L);
+       return 3;
+@@ -846,6 +1343,11 @@ static luaL_Reg x509_funcs[] =
+   {"parse",       openssl_x509_parse},
+   {"export",      openssl_x509_export},
+   {"check",       openssl_x509_check},
++#if OPENSSL_VERSION_NUMBER > 0x10002000L
++  {"check_host",  openssl_x509_check_host},
++  {"check_email", openssl_x509_check_email},
++  {"check_ip_asc", openssl_x509_check_ip_asc},
++#endif
+   {"pubkey",      openssl_x509_public_key},
+   {"version",     openssl_x509_version},
+ 
+@@ -868,181 +1370,6 @@ static luaL_Reg x509_funcs[] =
+   {NULL,      NULL},
+ };
+ 
+-
+-static int openssl_push_purpose(lua_State*L , X509_PURPOSE* purpose)
+-{
+-  lua_newtable(L);
+-
+-  AUXILIAR_SET(L, -1, "purpose", purpose->purpose, integer);
+-  AUXILIAR_SET(L, -1, "trust", purpose->trust, integer);
+-  AUXILIAR_SET(L, -1, "flags", purpose->flags, integer);
+-
+-  AUXILIAR_SET(L, -1, "name", purpose->name, string);
+-  AUXILIAR_SET(L, -1, "sname", purpose->sname, string);
+-
+-  return 1;
+-};
+-
+-static int openssl_x509_purpose(lua_State*L)
+-{
+-  if (lua_isnoneornil(L, 1))
+-  {
+-    int count = X509_PURPOSE_get_count();
+-    int i;
+-    lua_newtable(L);
+-    for (i = 0; i < count; i++)
+-    {
+-      X509_PURPOSE* purpose = X509_PURPOSE_get0(i);
+-      openssl_push_purpose(L, purpose);
+-      lua_rawseti(L, -2, i + 1);
+-    }
+-    return 1;
+-  }
+-  else if (lua_isnumber(L, 1))
+-  {
+-    int idx = X509_PURPOSE_get_by_id(lua_tointeger(L, 1));
+-    if (idx >= 0)
+-    {
+-      X509_PURPOSE* purpose = X509_PURPOSE_get0(idx);
+-      openssl_push_purpose(L, purpose);
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 1;
+-  }
+-  else if (lua_isstring(L, 1))
+-  {
+-    char* name = (char*)lua_tostring(L, 1);
+-    int idx = X509_PURPOSE_get_by_sname(name);
+-    if (idx >= 0)
+-    {
+-      X509_PURPOSE* purpose = X509_PURPOSE_get0(idx);
+-      openssl_push_purpose(L, purpose);
+-    }
+-    else
+-      lua_pushnil(L);
+-    return 1;
+-  }
+-  return 0;
+-};
+-
+-static const char* usage_mode[] =
+-{
+-  "standard",
+-  "netscape",
+-  "extend",
+-  NULL
+-};
+-
+-static int openssl_x509_certtypes(lua_State*L)
+-{
+-  int mode = luaL_checkoption(L, 1, "standard", usage_mode);
+-  int i;
+-  const BIT_STRING_BITNAME* bitname;
+-
+-  switch (mode)
+-  {
+-  case 0:
+-  {
+-    const static BIT_STRING_BITNAME key_usage_type_table[] =
+-    {
+-      {0, "Digital Signature", "digitalSignature"},
+-      {1, "Non Repudiation", "nonRepudiation"},
+-      {2, "Key Encipherment", "keyEncipherment"},
+-      {3, "Data Encipherment", "dataEncipherment"},
+-      {4, "Key Agreement", "keyAgreement"},
+-      {5, "Certificate Sign", "keyCertSign"},
+-      {6, "CRL Sign", "cRLSign"},
+-      {7, "Encipher Only", "encipherOnly"},
+-      {8, "Decipher Only", "decipherOnly"},
+-      { -1, NULL, NULL}
+-    };
+-    lua_newtable(L);
+-    for (i = 0, bitname = &key_usage_type_table[i]; bitname->bitnum != -1; i++, bitname = &key_usage_type_table[i])
+-    {
+-      openssl_push_bit_string_bitname(L, bitname);
+-      lua_rawseti(L, -2, i + 1);
+-    }
+-    return 1;
+-
+-  }
+-  case 1:
+-  {
+-    const static BIT_STRING_BITNAME ns_cert_type_table[] =
+-    {
+-      {0, "SSL Client", "client"},
+-      {1, "SSL Server", "server"},
+-      {2, "S/MIME", "email"},
+-      {3, "Object Signing", "objsign"},
+-      {4, "Unused", "reserved"},
+-      {5, "SSL CA", "sslCA"},
+-      {6, "S/MIME CA", "emailCA"},
+-      {7, "Object Signing CA", "objCA"},
+-      { -1, NULL, NULL}
+-    };
+-    lua_newtable(L);
+-    for (i = 0, bitname = &ns_cert_type_table[i]; bitname->bitnum != -1; i++, bitname = &ns_cert_type_table[i])
+-    {
+-      openssl_push_bit_string_bitname(L, bitname);
+-      lua_rawseti(L, -2, i + 1);
+-    }
+-    return 1;
+-  }
+-  case 2:
+-  {
+-    static const int ext_nids[] =
+-    {
+-      NID_server_auth,
+-      NID_client_auth,
+-      NID_email_protect,
+-      NID_code_sign,
+-      NID_ms_sgc,
+-      NID_ns_sgc,
+-      NID_OCSP_sign,
+-      NID_time_stamp,
+-      NID_dvcs,
+-      NID_anyExtendedKeyUsage
+-    };
+-    int count = sizeof(ext_nids) / sizeof(int);
+-    int nid;
+-    lua_newtable(L);
+-    for (i = 0; i < count; i++)
+-    {
+-      nid = ext_nids[i];
+-      lua_newtable(L);
+-      lua_pushstring(L, OBJ_nid2ln(nid));
+-      lua_setfield(L, -2, "lname");
+-      lua_pushstring(L, OBJ_nid2sn(nid));
+-      lua_setfield(L, -2, "sname");
+-      lua_pushinteger(L, nid);
+-      lua_setfield(L, -2, "nid");
+-      lua_rawseti(L, -2, i + 1);
+-    };
+-    return 1;
+-  }
+-  }
+-  return 0;
+-}
+-
+-static int openssl_verify_cert_error_string(lua_State*L)
+-{
+-  int v = luaL_checkint(L, 1);
+-  const char*s = X509_verify_cert_error_string(v);
+-  lua_pushstring(L, s);
+-  return 1;
+-}
+-
+-static luaL_Reg R[] =
+-{
+-  {"new",           openssl_x509_new },
+-  {"read",          openssl_x509_read },
+-  {"purpose",       openssl_x509_purpose },
+-  {"certtypes",     openssl_x509_certtypes },
+-  {"verify_cert_error_string", openssl_verify_cert_error_string },
+-
+-  {NULL,    NULL}
+-};
+-
+ int luaopen_x509(lua_State *L)
+ {
+   auxiliar_newclass(L, "openssl.x509", x509_funcs);
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/xalgor.c luvi-src-v2.7.6/deps/lua-openssl/src/xalgor.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/xalgor.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/xalgor.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,10 +1,11 @@
+-/*=========================================================================*\
+-* xalgor.c
+-* * x509_algor routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++x509.algor module for lua-openssl binding, Provide X509_ALGOR as lua object.
++Sometime when you make CSR,TS or X509, you maybe need to use this.
++
++ at module x509.algor
++ at usage
++  algor = require('openssl').x509.algor
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include "sk.h"
+@@ -12,19 +13,44 @@ IMP_LUA_SK(X509_ALGOR, x509_algor)
+ 
+ #define MYNAME "x509.algor"
+ 
+-void openssl_xalgor_free(X509_ALGOR* alg)
++/***
++Create x509_algor object
++
++ at function new
++ at treturn x509_algor mapping to X509_ALGOR in openssl
++*/
++
++static int openssl_xalgor_new(lua_State*L)
+ {
+-  X509_ALGOR_free(alg);
+-}
++  X509_ALGOR* alg = X509_ALGOR_new();
++  PUSH_OBJECT(alg, "openssl.x509_algor");
++  return 1;
++};
+ 
++static luaL_Reg R[] =
++{
++  {"new",           openssl_xalgor_new},
+ 
++  {NULL,          NULL},
++};
++
++/***
++openssl.x509_algor object
++ at type x509_algor
++*/
+ static int openssl_xalgor_gc(lua_State* L)
+ {
+   X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+-  openssl_xalgor_free(alg);
++  X509_ALGOR_free(alg);
+   return 0;
+ }
+ 
++/***
++clone the x509_algor
++
++ at function dup
++ at treturn x509_algor clone of x509_algor
++*/
+ static int openssl_xalgor_dup(lua_State* L)
+ {
+   X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+@@ -34,6 +60,11 @@ static int openssl_xalgor_dup(lua_State*
+ }
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10002000L
++/***
++compare with other x509_algor object
++ at function equals
++ at treturn boolean return true if two x509_algor equals
++*/
+ static int openssl_xalgor_cmp(lua_State* L)
+ {
+   X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+@@ -44,28 +75,38 @@ static int openssl_xalgor_cmp(lua_State*
+ #endif
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10001000L
++/***
++set message digest object to x509_algor
++ at function md
++ at tparam number|string|evp_md md
++*/
+ static int openssl_xalgor_md(lua_State* L)
+ {
+   X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+-  const EVP_MD* md = get_digest(L, 2);
++  const EVP_MD* md = get_digest(L, 2, NULL);
+   X509_ALGOR_set_md(alg, md);
+   return 0;
+ }
+ #endif
+ 
++/***
++get x509_algor properties
++ at function get
++ at tparam asn1_object ident algorithm, nil for fail
++ at tparam asn1_string attached paramater value
++*/
+ static int openssl_xalgor_get(lua_State* L)
+ {
+   int type;
+-  void* val;
+-  ASN1_OBJECT *obj, *dup;
++  CONSTIFY_X509_get0 void* val;
++  CONSTIFY_X509_get0 ASN1_OBJECT *obj;
+ 
+-  X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
++  CONSTIFY_X509_get0 X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+ 
+   X509_ALGOR_get0(&obj, &type, &val, alg);
+   if (obj != NULL)
+   {
+-    dup = OBJ_dup(obj);
+-    PUSH_OBJECT(dup, "openssl.asn1_object");
++    openssl_push_asn1object(L, obj);
+   }
+   else
+     lua_pushnil(L);
+@@ -73,33 +114,50 @@ static int openssl_xalgor_get(lua_State*
+     lua_pushnil(L);
+   else
+   {
+-    ASN1_STRING *s = ASN1_STRING_dup(val);
+-    PUSH_OBJECT(s, "openssl.asn1_string");
++    PUSH_ASN1_STRING(L, val);
+   }
+ 
+   return 2;
+ }
+ 
++/***
++set x509_algor properties
++ at function set
++ at tparam asn1_object obj ident algorithm in openssl
++ at tparam[opt] asn1_string val attached paramater value
++ at treturn boolean result true for success, others for fail
++*/
++/***
++set digest algorithm, alias of set()
++only when OPENSSL_VERSION_NUMBER >= 0x10001000
++ at function set
++ at tparam string|evp_digest digest algorithm
++*/
+ static int openssl_xalgor_set(lua_State* L)
+ {
+   int ret = 0;
+   X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+   ASN1_OBJECT* obj = CHECK_OBJECT(2, ASN1_OBJECT, "openssl.asn1_object");
+   ASN1_STRING* val = lua_isnoneornil(L, 3) ?
+-                     NULL : auxiliar_checkgroup(L, "openssl.asn1_group", 3);
++                     NULL : auxiliar_checkgroup(L, "openssl.asn1_string", 3);
+   obj = OBJ_dup(obj);
+   val = ASN1_STRING_dup(val);
+-  ret = X509_ALGOR_set0(alg, obj , val->type, val);
++  ret = X509_ALGOR_set0(alg, obj, val->type, val);
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++convert x509_algor to txt string of asn1_object
++ at function tostring
++ at tparam string txt of asn1_object
++*/
+ static int openssl_xalgor_tostring(lua_State* L)
+ {
+   int type;
+-  void* val;
+-  ASN1_OBJECT *obj;
++  CONSTIFY_X509_get0 void* val;
++  CONSTIFY_X509_get0 ASN1_OBJECT *obj;
+ 
+-  X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
++  CONSTIFY_X509_get0 X509_ALGOR* alg = CHECK_OBJECT(1, X509_ALGOR, "openssl.x509_algor");
+ 
+   X509_ALGOR_get0(&obj, &type, &val, alg);
+   if (obj != NULL)
+@@ -114,6 +172,15 @@ static int openssl_xalgor_tostring(lua_S
+   return 0;
+ }
+ 
++/***
++check with other x509_algor whether equals, alias with == operator
++only when OPENSSL_VERSION_NUMBER >= 0x10002000L
++
++ at function equals
++ at tparam x509_algor other to compare
++*/
++
++
+ static luaL_Reg xalgor_funcs[] =
+ {
+   {"dup",               openssl_xalgor_dup},
+@@ -132,20 +199,6 @@ static luaL_Reg xalgor_funcs[] =
+ 
+   {NULL,          NULL},
+ };
+-
+-static int openssl_xalgor_new(lua_State*L)
+-{
+-  X509_ALGOR* alg = X509_ALGOR_new();
+-  PUSH_OBJECT(alg, "openssl.x509_algor");
+-  return 1;
+-};
+-
+-static luaL_Reg R[] =
+-{
+-  {"new",           openssl_xalgor_new},
+-
+-  {NULL,          NULL},
+-};
+ 
+ int openssl_register_xalgor(lua_State*L)
+ {
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/xattrs.c luvi-src-v2.7.6/deps/lua-openssl/src/xattrs.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/xattrs.c	2019-02-13 11:31:40.327301704 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/xattrs.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,49 +1,145 @@
+-/*=========================================================================*\
+-* xattrs.c
+-* x509 attributes routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++x509 attributes module for lua-openssl binding, Provide x509_attribute as lua object.
++Sometime when you make CSR,TS or X509, you maybe need to use this.
++
++ at module x509.attr
++ at usage
++  attr = require('openssl').x509.attr
++*/
+ #include "openssl.h"
+ #include "private.h"
+ #include "sk.h"
+ 
+ #define MYNAME "x509.attribute"
+ 
++/***
++x509_attribute contrust param table.
++
++ at table x509_attribute_param_table
++ at tfield string|integer|asn1_object object, identify a asn1_object
++ at tfield string|integer type, same with type in asn1.new_string
++ at tfield string|asn1_object value, value of attribute
++
++ at usage
++xattr = x509.attribute.new_attribute {
++  object = asn1_object,
++  type = Nid_or_String,
++  value = string or asn1_string value
++}
++*/
++
++/***
++asn1_type object as table
++
++ at table asn1_type_table
++ at tfield string value, value data
++ at tfield string type, type of value
++ at tfield string format, value is 'der', only exist when type is not in 'bit','bmp','octet'
++*/
++
++/***
++Create x509_attribute object
++
++ at function new_attribute
++ at tparam table attribute with object, type and value
++ at treturn[1] x509_attribute mapping to X509_ATTRIBUTE in openssl
++
++ at see x509_attribute_param_table
++*/
++static int openssl_xattr_new(lua_State*L)
++{
++  X509_ATTRIBUTE *x = NULL;
++  luaL_checktable(L, 1);
++
++  x = openssl_new_xattribute(L, &x, 1, NULL);
++  PUSH_OBJECT(x, "openssl.x509_attribute");
++  return 1;
++}
++
++static luaL_Reg R[] =
++{
++  {"new_attribute",         openssl_xattr_new},
++
++  {NULL,          NULL},
++};
++
++/***
++x509_attribute infomation table
++
++ at table x509_attribute_info_table
++ at tfield asn1_object|object object of asn1_object
++ at tfield boolean single  true for single value
++ at tfield table value  if single, value is asn1_type or array have asn1_type node table
++*/
+ static int openssl_xattr_totable(lua_State*L, X509_ATTRIBUTE *attr)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   lua_newtable(L);
+   openssl_push_asn1object(L, attr->object);
+   lua_setfield(L, -2, "object");
+ 
+-  AUXILIAR_SET(L, -1, "single", attr->single, boolean);
++  lua_newtable(L);
+   if (attr->single)
+   {
+     openssl_push_asn1type(L, attr->value.single);
+-    lua_setfield(L, -2, "value");
++    lua_rawseti(L, -2, 1);
+   }
+   else
+   {
+     int i;
+-    lua_newtable(L);
+     for (i = 0; i < sk_ASN1_TYPE_num(attr->value.set); i++)
+     {
+       ASN1_TYPE* t = sk_ASN1_TYPE_value(attr->value.set, i);
+       openssl_push_asn1type(L, t);
+       lua_rawseti(L, -2, i + 1);
+     }
+-    lua_setfield(L, -2, "value");
+   }
++  lua_setfield(L, -2, "value");
+   return 1;
++#else
++  int i, c;
++
++  lua_newtable(L);
++  openssl_push_asn1object(L, X509_ATTRIBUTE_get0_object(attr));
++  lua_setfield(L, -2, "object");
++
++  c = X509_ATTRIBUTE_count(attr);
++  lua_newtable(L);
++  for (i = 0; i < c; i++)
++  {
++    ASN1_TYPE* t = X509_ATTRIBUTE_get0_type(attr, i);
++    openssl_push_asn1type(L, t);
++    lua_rawseti(L, -2, i + 1);
++  }
++  lua_setfield(L, -2, "value");
++  return 1;
++#endif
+ }
+ 
++/***
++openssl.x509_attribute object
++ at type x509_attribute
++*/
++
++/***
++get infomation table of x509_attribute.
++
++ at function info
++ at treturn[1] table info,  x509_attribute infomation as table
++ at see x509_attribute_info_table
++*/
+ static int openssl_xattr_info(lua_State*L)
+ {
+   X509_ATTRIBUTE* attr = CHECK_OBJECT(1, X509_ATTRIBUTE, "openssl.x509_attribute");
+   return openssl_xattr_totable(L, attr);
+ }
+ 
++/***
++clone then asn1_attribute
++
++ at function dup
++ at treturn x509_attribute attr clone of x509_attribute
++*/
+ static int openssl_xattr_dup(lua_State*L)
+ {
+   X509_ATTRIBUTE* attr = CHECK_OBJECT(1, X509_ATTRIBUTE, "openssl.x509_attribute");
+@@ -59,6 +155,22 @@ static int openssl_xattr_free(lua_State*
+   return 0;
+ }
+ 
++/***
++get type of x509_attribute
++
++ at function data
++ at tparam integer idx location want to get type
++ at tparam string attrtype attribute type
++ at treturn asn1_string
++*/
++/***
++set type of x509_attribute
++
++ at function data
++ at tparam string attrtype attribute type
++ at tparam string data set to asn1_attr
++@treturn boolean result true for success and others for fail
++*/
+ static int openssl_xattr_data(lua_State*L)
+ {
+   X509_ATTRIBUTE* attr = CHECK_OBJECT(1, X509_ATTRIBUTE, "openssl.x509_attribute");
+@@ -68,12 +180,14 @@ static int openssl_xattr_data(lua_State*
+     size_t size;
+     int ret;
+     const char *data = luaL_checklstring(L, 3, &size);
+-    if (attr->single)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++    if (X509_ATTRIBUTE_count(attr) == 1)
+       ASN1_TYPE_free((ASN1_TYPE*)attr->value.ptr);
+     else
+       sk_ASN1_TYPE_pop_free(attr->value.set, ASN1_TYPE_free);
+     attr->value.ptr = NULL;
+-
++#else
++#endif
+     ret = X509_ATTRIBUTE_set1_data(attr, attrtype, data, size);
+     return openssl_pushresult(L, ret);
+   }
+@@ -82,12 +196,20 @@ static int openssl_xattr_data(lua_State*
+     int idx = luaL_checkint(L, 2);
+     int attrtype = luaL_checkint(L, 3);
+     ASN1_STRING *as = (ASN1_STRING *)X509_ATTRIBUTE_get0_data(attr, idx, attrtype, NULL);
+-    as = ASN1_STRING_dup(as);
+-    PUSH_OBJECT(as, "openssl.asn1_string");
++    PUSH_ASN1_STRING(L, as);
+     return 1;
+   }
+ }
+ 
++/***
++get type of x509_attribute.
++
++ at function type
++ at tparam[opt] integer location which location to get type, default is 0
++ at treturn table asn1_type, asn1_type as table info
++ at treturn nil nil, fail return nothing
++ at see asn1_type_table
++*/
+ static int openssl_xattr_type(lua_State*L)
+ {
+   X509_ATTRIBUTE* attr = CHECK_OBJECT(1, X509_ATTRIBUTE, "openssl.x509_attribute");
+@@ -103,14 +225,27 @@ static int openssl_xattr_type(lua_State*
+   return 1;
+ }
+ 
++/***
++get asn1_object of x509_attribute.
++
++ at function object
++ at treturn asn1_object object of x509_attribute
++*/
++/***
++set asn1_object for x509_attribute.
++
++ at function object
++ at tparam asn1_object obj
++ at treturn boolean true for success
++ at return nil when occure error, and followed by error message
++*/
+ static int openssl_xattr_object(lua_State*L)
+ {
+   X509_ATTRIBUTE* attr = CHECK_OBJECT(1, X509_ATTRIBUTE, "openssl.x509_attribute");
+   if (lua_isnone(L, 2))
+   {
+     ASN1_OBJECT* obj = X509_ATTRIBUTE_get0_object(attr);
+-    obj = OBJ_dup(obj);
+-    PUSH_OBJECT(obj, "openssl.asn1_object");
++    openssl_push_asn1object(L, obj);
+     return 1;
+   }
+   else
+@@ -146,6 +281,7 @@ X509_ATTRIBUTE* openssl_new_xattribute(l
+   size_t len = 0;
+   int nid;
+   const char* data = NULL;
++  ASN1_STRING *s = NULL;
+ 
+   lua_getfield(L, idx, "object");
+   nid = openssl_get_nid(L, -1);
+@@ -178,18 +314,17 @@ X509_ATTRIBUTE* openssl_new_xattribute(l
+   {
+     data = lua_tolstring(L, -1, &len);
+   }
+-  else if (auxiliar_isgroup(L, "openssl.asn1group", -1))
++  else if ((s = GET_GROUP(-1, ASN1_STRING, "openssl.asn1group")) != NULL)
+   {
+-    ASN1_STRING* value = CHECK_GROUP(-1, ASN1_STRING, "openssl.asn1group");
+-    if (ASN1_STRING_type(value) != arttype)
++    if (ASN1_STRING_type(s) != arttype)
+     {
+       if (eprefix)
+         luaL_error(L, "%s field value not match type", eprefix);
+       else
+-        luaL_argcheck(L, ASN1_STRING_type(value) == arttype, idx, "field value not match type");
++        luaL_argcheck(L, ASN1_STRING_type(s) == arttype, idx, "field value not match type");
+     }
+-    data = (const char *)ASN1_STRING_data(value);
+-    len  = ASN1_STRING_length(value);
++    data = (const char *)ASN1_STRING_data(s);
++    len  = ASN1_STRING_length(s);
+   }
+   else
+   {
+@@ -207,23 +342,6 @@ X509_ATTRIBUTE* openssl_new_xattribute(l
+ }
+ 
+ 
+-static int openssl_xattr_new(lua_State*L)
+-{
+-  X509_ATTRIBUTE *x = NULL;
+-  luaL_checktable(L, 1);
+-
+-  x = openssl_new_xattribute(L, &x, 1, NULL);
+-  PUSH_OBJECT(x, "openssl.x509_attribute");
+-  return 1;
+-}
+-
+-static luaL_Reg R[] =
+-{
+-  {"new_attribute",         openssl_xattr_new},
+-
+-  {NULL,          NULL},
+-};
+-
+ IMP_LUA_SK(X509_ATTRIBUTE, x509_attribute)
+ 
+ int openssl_register_xattribute(lua_State*L)
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/xexts.c luvi-src-v2.7.6/deps/lua-openssl/src/xexts.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/xexts.c	2019-02-13 11:31:40.323968393 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/xexts.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,10 +1,11 @@
+-/*=========================================================================*\
+-* xexts.c
+-* * x509 extension routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++Provide x509_extension as lua object.
++Sometime when you make CSR,TS or X509, you maybe need to use this.
++
++ at module x509.extension
++ at usage
++  extension = require('openssl').x509.extension
++*/
+ #include <ctype.h>
+ #include "openssl.h"
+ #include "private.h"
+@@ -14,176 +15,21 @@
+ 
+ #define MYNAME "x509.extension"
+ 
+-static int openssl_xext_totable(lua_State* L, X509_EXTENSION *x)
+-{
+-  lua_newtable(L);
+-  openssl_push_asn1object(L, x->object);
+-  lua_setfield(L, -2, "object");
+-
+-  PUSH_ASN1_OCTET_STRING(L, x->value);
+-  lua_setfield(L, -2, "value");
+-
+-  AUXILIAR_SET(L, -1, "critical", x->critical, boolean);
+-
+-  switch (x->object->nid)
+-  {
+-  case NID_subject_alt_name:
+-  {
+-    int i;
+-    int n_general_names;
+-
+-    STACK_OF(GENERAL_NAME) *values = X509V3_EXT_d2i(x);
+-
+-    if (values == NULL)
+-      break;
+-
+-    /* Push ret[oid] */
+-    openssl_push_asn1object(L, x->object);
+-    lua_newtable(L);
+-    n_general_names = sk_GENERAL_NAME_num(values);
+-    for (i = 0; i < n_general_names; i++)
+-    {
+-      GENERAL_NAME *general_name = sk_GENERAL_NAME_value(values, i);
+-      openssl_push_general_name(L, general_name);
+-      lua_rawseti(L, -2, i + 1);
+-    }
+-    lua_settable(L, -3);
+-  }
+-  default:
+-    break;
+-  }
+-  return 1;
+-};
+-
+-static int openssl_xext_info(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  return openssl_xext_totable(L, x);
+-};
+-
+-static int openssl_xext_dup(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  X509_EXTENSION *d = X509_EXTENSION_dup(x);
+-  PUSH_OBJECT(d, "openssl.x509_extension");
+-  return 1;
+-};
+-
+-static int openssl_xext_export(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  unsigned char* p = NULL;
+-  int len = i2d_X509_EXTENSION(x, &p);
+-  if (len > 0)
+-  {
+-    lua_pushlstring(L, (const char *) p, len);
+-    OPENSSL_free(p);
+-  }
+-  else
+-    lua_pushnil(L);
+-  return 1;
+-};
+-
+-static int openssl_xext_free(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  X509_EXTENSION_free(x);
+-  return 0;
+-};
+-
+-static int openssl_xext_object(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  ASN1_OBJECT* obj;
+-  if (lua_isnone(L, 2))
+-  {
+-    obj = X509_EXTENSION_get_object(x);
+-    obj = OBJ_dup(obj);
+-    PUSH_OBJECT(obj, "openssl.asn1_object");
+-    return 1;
+-  }
+-  else
+-  {
+-    int nid = openssl_get_nid(L, 2);
+-    int ret;
+-    obj = OBJ_nid2obj(nid);
+-    ret = X509_EXTENSION_set_object(x, obj);
+-    return openssl_pushresult(L, ret);
+-  }
+-};
+-
+-static int openssl_xext_critical(lua_State* L)
+-{
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  if (lua_isnone(L, 2))
+-  {
+-    lua_pushboolean(L, X509_EXTENSION_get_critical(x));
+-    return 1;
+-  }
+-  else
+-  {
+-    int ret = X509_EXTENSION_set_critical(x, lua_toboolean(L, 2));
+-    return openssl_pushresult(L, ret);
+-  }
+-};
+-
+-static int openssl_xext_data(lua_State* L)
+-{
+-  int ret = 0;
+-  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+-  if (lua_isnone(L, 2))
+-  {
+-    ASN1_STRING *s = X509_EXTENSION_get_data(x);
+-    s = ASN1_STRING_dup(s);
+-    PUSH_OBJECT(s, "openssl.asn1_string");
+-    return 1;
+-  }
+-  else if (lua_isstring(L, 2))
+-  {
+-    size_t size;
+-    const char* data = lua_tolstring(L, 2, &size);
+-    int type = lua_isnone(L, 3) ? V_ASN1_OCTET_STRING : luaL_checkint(L, 3);
+-    ASN1_STRING* s = ASN1_STRING_type_new(type);
+-    if (ASN1_STRING_set(s, data, size) == 1)
+-    {
+-      ret = X509_EXTENSION_set_data(x, s);
+-    }
+-    ASN1_STRING_free(s);
+-    return openssl_pushresult(L, ret);
+-  }
+-  else
+-  {
+-    ASN1_STRING* s = CHECK_GROUP(2, ASN1_STRING, "openssl.asn1group");
+-    if (ASN1_STRING_type(s) == V_ASN1_OCTET_STRING)
+-    {
+-      ret = X509_EXTENSION_set_data(x, s);
+-      return openssl_pushresult(L, ret);
+-    }
+-    else
+-    {
+-      luaL_argerror(L, 2, "asn1_string type must be octet");
+-    }
+-  }
+-  return 0;
+-};
+-
+-static luaL_Reg x509_extension_funs[] =
+-{
+-  {"info",          openssl_xext_info},
+-  {"dup",           openssl_xext_dup},
+-  {"export",        openssl_xext_export},
+-
+-  /* set and get */
+-  {"object",        openssl_xext_object},
+-  {"critical",      openssl_xext_critical},
+-  {"data",          openssl_xext_data},
+-
+-  {"__gc",          openssl_xext_free},
+-  {"__tostring",    auxiliar_tostring},
+-
+-  { NULL, NULL }
+-};
++/***
++x509_extension contrust param table.
+ 
++ at table x509_extension_param_table
++ at tfield boolean critical true set critical
++ at tfield asn1_string value of x509_extension
++ at tfield string|asn1_object object, object of extension
++
++ at usage
++xattr = x509.attrextension.new_extension {
++  object = asn1_object,
++  critical = false,
++  value = string or asn1_string value
++}
++*/
+ static X509_EXTENSION* openssl_new_xextension(lua_State*L, int idx, int v3)
+ {
+   int nid;
+@@ -205,13 +51,11 @@ static X509_EXTENSION* openssl_new_xexte
+     luaL_argerror(L, idx, lua_tostring(L, -1));
+   }
+   lua_getfield(L, idx, "value");
+-
+-  luaL_argcheck(L, lua_isstring(L, -1) || auxiliar_isgroup(L, "openssl.asn1group", -1),
+-                1, "field value must be string or openssl.asn1group object");
+   if (lua_isstring(L, -1))
+   {
+     size_t size;
+     const char* data = lua_tolstring(L, -1, &size);
++    lua_pop(L, 1);
+     if (v3)
+     {
+       const X509V3_EXT_METHOD *method = X509V3_EXT_get_nid(nid);
+@@ -291,13 +135,25 @@ static X509_EXTENSION* openssl_new_xexte
+   }
+   else
+   {
+-    value = CHECK_GROUP(-1, ASN1_STRING, "openssl.asn1group");
+-    y = X509_EXTENSION_create_by_NID(NULL, nid, critical, value);
+-    lua_pop(L, 1);
+-    return y;
++    value = GET_GROUP(-1, ASN1_STRING, "openssl.asn1group");
++    if(value)
++    {
++      y = X509_EXTENSION_create_by_NID(NULL, nid, critical, value);
++      lua_pop(L, 1);
++      return y;
++    }
+   }
++  luaL_argerror(L, 1, "field value must be string or openssl.asn1group object");
++  return NULL;
+ }
+ 
++/***
++Create x509_extension object
++ at function new_extension
++ at tparam table extension with object, value and critical
++ at treturn x509_extension mapping to X509_EXTENSION in openssl
++ at see x509_extension_param_table
++*/
+ static int openssl_xext_new(lua_State* L)
+ {
+   X509_EXTENSION *x = NULL;
+@@ -316,6 +172,12 @@ static int openssl_xext_new(lua_State* L
+   return 1;
+ };
+ 
++/***
++read der encoded x509_extension
++ at function read_extension
++ at tparam string data der encoded
++ at treturn x509_extension mappling to X509_EXTENSION in openssl
++*/
+ static int openssl_xext_read(lua_State* L)
+ {
+   size_t size;
+@@ -330,6 +192,23 @@ static int openssl_xext_read(lua_State*
+   return 1;
+ };
+ 
++/***
++get all x509 certificate supported extensions
++ at function support
++ at treturn table contain all support extension info as table node {lname=..., sname=..., nid=...}
++*/
++/***
++check x509_extension object support or not
++ at function support
++ at tparam x509_extension extension
++ at treturn boolean true for supported, false or not
++*/
++/***
++check nid or name support or not
++ at function support
++ at tparam number|string nid_or_name for extension
++ at treturn boolean true for supported, false or not
++*/
+ static int openssl_xext_support(lua_State*L)
+ {
+   static const int supported_nids[] =
+@@ -369,7 +248,7 @@ static int openssl_xext_support(lua_Stat
+     };
+     return 1;
+   }
+-  else if (auxiliar_isclass(L, "openssl.x509_extension", 1))
++  else if (auxiliar_getclassudata(L, "openssl.x509_extension", 1))
+   {
+     X509_EXTENSION* ext = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
+     int ret = X509_supported_extension(ext);
+@@ -402,6 +281,251 @@ static luaL_Reg R[] =
+   {NULL,          NULL},
+ };
+ 
++/***
++openssl.x509_extension object
++ at type x509_extension
++*/
++
++/***
++x509_extension infomation table
++ at todo double check
++ at table x509_extension_info_table
++ at tfield asn1_object|object object of x509_extension
++ at tfield boolean|critical true for critical value
++ at tfield string|value as octet string
++*/
++static int openssl_xext_totable(lua_State* L, X509_EXTENSION *x)
++{
++  ASN1_OBJECT *obj = X509_EXTENSION_get_object(x);
++  int nid = OBJ_obj2nid(obj);
++  lua_newtable(L);
++  openssl_push_asn1object(L, obj);
++  lua_setfield(L, -2, "object");
++
++  PUSH_ASN1_OCTET_STRING(L, X509_EXTENSION_get_data(x));
++  lua_setfield(L, -2, "value");
++
++  AUXILIAR_SET(L, -1, "critical", X509_EXTENSION_get_critical(x), boolean);
++
++  switch (nid)
++  {
++  case NID_subject_alt_name:
++  {
++    int i;
++    int n_general_names;
++
++    STACK_OF(GENERAL_NAME) *values = X509V3_EXT_d2i(x);
++
++    if (values == NULL)
++      break;
++
++    /* Push ret[oid] */
++    openssl_push_asn1object(L, obj);
++    lua_newtable(L);
++    n_general_names = sk_GENERAL_NAME_num(values);
++    for (i = 0; i < n_general_names; i++)
++    {
++      GENERAL_NAME *general_name = sk_GENERAL_NAME_value(values, i);
++      openssl_push_general_name(L, general_name);
++      lua_rawseti(L, -2, i + 1);
++    }
++    lua_settable(L, -3);
++  }
++  default:
++    break;
++  }
++  return 1;
++};
++
++/***
++get infomation table of x509_extension.
++
++ at function info
++ at tparam[opt] boolean|utf8 true for utf8 default
++ at treturn[1] table info,  x509_extension infomation as table
++ at see x509_extension_info_table
++*/
++static int openssl_xext_info(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  return openssl_xext_totable(L, x);
++};
++
++/***
++clone then x509_extension
++
++ at function dup
++ at treturn x509_extension clone of x509_extension
++*/
++static int openssl_xext_dup(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  X509_EXTENSION *d = X509_EXTENSION_dup(x);
++  PUSH_OBJECT(d, "openssl.x509_extension");
++  return 1;
++};
++
++/***
++export x509_extenion to der encoded string
++ at function export
++@treturn string
++*/
++static int openssl_xext_export(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  unsigned char* p = NULL;
++  int len = i2d_X509_EXTENSION(x, &p);
++  if (len > 0)
++  {
++    lua_pushlstring(L, (const char *) p, len);
++    OPENSSL_free(p);
++  }
++  else
++    lua_pushnil(L);
++  return 1;
++};
++
++static int openssl_xext_free(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  X509_EXTENSION_free(x);
++  return 0;
++};
++
++/***
++get asn1_object of x509_extension.
++ at function object
++ at treturn asn1_object object of x509_extension
++*/
++
++/***
++set asn1_object for x509_extension.
++
++ at function object
++ at tparam asn1_object obj
++ at treturn boolean true for success
++ at return nil when occure error, and followed by error message
++*/
++static int openssl_xext_object(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  ASN1_OBJECT* obj;
++  if (lua_isnone(L, 2))
++  {
++    obj = X509_EXTENSION_get_object(x);
++    openssl_push_asn1object(L, obj);
++    return 1;
++  }
++  else
++  {
++    int nid = openssl_get_nid(L, 2);
++    int ret;
++    obj = OBJ_nid2obj(nid);
++    ret = X509_EXTENSION_set_object(x, obj);
++    return openssl_pushresult(L, ret);
++  }
++};
++
++/***
++get critical of x509_extension.
++
++ at function critical
++ at treturn boolean true if extension set critical or false
++*/
++/***
++set critical of x509_extension.
++
++ at function critical
++ at tparam boolean critical set to self
++ at treturn boolean set critical success return true
++ at return nil fail return nil, and followed by error message
++*/
++static int openssl_xext_critical(lua_State* L)
++{
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  if (lua_isnone(L, 2))
++  {
++    lua_pushboolean(L, X509_EXTENSION_get_critical(x));
++    return 1;
++  }
++  else
++  {
++    int ret = X509_EXTENSION_set_critical(x, lua_toboolean(L, 2));
++    return openssl_pushresult(L, ret);
++  }
++};
++
++/***
++get data of x509_extension
++
++ at function data
++ at treturn asn1_string
++*/
++
++/***
++set type of x509_extension
++
++ at function data
++ at tparam asn1_string data set to self
++ at treturn boolean result true for success
++ at return nil for error, and followed by error message
++*/
++static int openssl_xext_data(lua_State* L)
++{
++  int ret = 0;
++  X509_EXTENSION *x = CHECK_OBJECT(1, X509_EXTENSION, "openssl.x509_extension");
++  if (lua_isnone(L, 2))
++  {
++    ASN1_STRING *s = X509_EXTENSION_get_data(x);
++    PUSH_ASN1_STRING(L, s);
++    return 1;
++  }
++  else if (lua_isstring(L, 2))
++  {
++    size_t size;
++    const char* data = lua_tolstring(L, 2, &size);
++    int type = lua_isnone(L, 3) ? V_ASN1_OCTET_STRING : luaL_checkint(L, 3);
++    ASN1_STRING* s = ASN1_STRING_type_new(type);
++    if (ASN1_STRING_set(s, data, size) == 1)
++    {
++      ret = X509_EXTENSION_set_data(x, s);
++    }
++    ASN1_STRING_free(s);
++    return openssl_pushresult(L, ret);
++  }
++  else
++  {
++    ASN1_STRING* s = CHECK_GROUP(2, ASN1_STRING, "openssl.asn1group");
++    if (ASN1_STRING_type(s) == V_ASN1_OCTET_STRING)
++    {
++      ret = X509_EXTENSION_set_data(x, s);
++      return openssl_pushresult(L, ret);
++    }
++    else
++    {
++      luaL_argerror(L, 2, "asn1_string type must be octet");
++    }
++  }
++  return 0;
++};
++
++static luaL_Reg x509_extension_funs[] =
++{
++  {"info",          openssl_xext_info},
++  {"dup",           openssl_xext_dup},
++  {"export",        openssl_xext_export},
++
++  /* set and get */
++  {"object",        openssl_xext_object},
++  {"critical",      openssl_xext_critical},
++  {"data",          openssl_xext_data},
++
++  {"__gc",          openssl_xext_free},
++  {"__tostring",    auxiliar_tostring},
++
++  { NULL, NULL }
++};
++
+ IMP_LUA_SK(X509_EXTENSION, x509_extension)
+ 
+ int openssl_register_xextension(lua_State*L)
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/xname.c luvi-src-v2.7.6/deps/lua-openssl/src/xname.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/xname.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/xname.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,10 +1,11 @@
+-/*=========================================================================*\
+-* xname.c
+-* * x509 name routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++x509_name module for lua-openssl binding, provide x509_name as lua object
++Sometime when you make CSR,TS or X509, you maybe need to use this.
++
++ at module x509.name
++ at usage
++  name = require('openssl').x509.name
++*/
+ #include "openssl.h"
+ #include "private.h"
+ 
+@@ -12,6 +13,120 @@
+ 
+ #define MYNAME "x509.name"
+ 
++int openssl_push_xname_asobject(lua_State*L, X509_NAME* xname)
++{
++  X509_NAME* dup = X509_NAME_dup(xname);
++  PUSH_OBJECT(dup, "openssl.x509_name");
++  return 1;
++}
++
++static int openssl_new_xname(lua_State*L, X509_NAME* xname, int idx, int utf8)
++{
++  int i, n;
++  luaL_checktable(L, idx);
++  luaL_argcheck(L, lua_istable(L, idx) && lua_rawlen(L, idx) > 0, idx,
++                "must be not empty table as array");
++
++  n = lua_rawlen(L, idx);
++  for (i = 0; i < n; i++)
++  {
++    lua_rawgeti(L, idx, i + 1);
++    lua_pushnil(L);
++
++    while (lua_next(L, -2) != 0)
++    {
++      size_t size;
++      const char *value;
++      int ret;
++      int nid = openssl_get_nid(L, -2);
++      value = luaL_checklstring(L, -1, &size);
++
++      if (nid == NID_undef)
++      {
++        lua_pushfstring(L, "node at %d which key (%s) is not a valid object identity",
++                        i + 1, lua_tostring(L, -2));
++        luaL_argerror(L, idx, lua_tostring(L, -1));
++      }
++      ret = X509_NAME_add_entry_by_NID(xname, nid, utf8 ? MBSTRING_UTF8 : MBSTRING_ASC, (unsigned char*)value, (int)size, -1, 0);
++      if (ret != 1)
++      {
++        lua_pushfstring(L, "node at %d which  %s=%s can't add to X509 name",
++                        i + 1, lua_tostring(L, -2), value);
++        luaL_argerror(L, idx, lua_tostring(L, -1));
++      }
++      lua_pop(L, 1);
++    }
++  }
++  return 0;
++}
++
++/***
++Create x509_name object
++
++ at function new
++ at tparam table array include name node
++ at tparam[opt] boolean utf8 encode will be use default
++ at treturn x509_name mapping to X509_EXTENSION in openssl
++ at usage
++  name = require'openssl'.x509.name
++  subject = name.new{
++    {C='CN'},
++    {O='kkhub.com'},
++    {CN='zhaozg'}
++  }
++*/
++static int openssl_xname_new(lua_State*L)
++{
++  X509_NAME* xn;
++  int utf8;
++  luaL_checktable(L, 1);
++  utf8 = lua_isnoneornil(L, 2) ? 1 : lua_toboolean(L, 2);
++  xn = X509_NAME_new();
++  openssl_new_xname(L, xn, 1, utf8);
++  PUSH_OBJECT(xn, "openssl.x509_name");
++  return 1;
++};
++
++/***
++Create x509_name from der string
++
++ at function d2i
++ at tparam string content DER encoded string
++ at treturn x509_name mapping to X509_NAME in openssl
++*/
++static int openssl_xname_d2i(lua_State*L)
++{
++  size_t len;
++  const unsigned char* dat = (const unsigned char*)luaL_checklstring(L, 1, &len);
++  X509_NAME* xn = d2i_X509_NAME(NULL, &dat, len);
++  if (xn)
++    PUSH_OBJECT(xn, "openssl.x509_name");
++  else
++    openssl_pushresult(L, 0);
++  return 1;
++};
++
++static luaL_Reg R[] =
++{
++  {"new",           openssl_xname_new},
++  {"d2i",           openssl_xname_d2i},
++
++  {NULL,          NULL},
++};
++
++/***
++x509_name infomation table
++other field is number type, and value table is alter name.(I not understand clearly)
++ at table x509_extension_info_table
++ at tfield asn1_object|object object of x509_name
++ at tfield boolean|critical true for critical value
++ at tfield string|value as octet string
++*/
++
++/***
++openssl.x509_name object
++ at type x509_name
++*/
+ static int openssl_xname_gc(lua_State* L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -19,6 +134,12 @@ static int openssl_xname_gc(lua_State* L
+   return 0;
+ }
+ 
++/***
++get oneline of x509_name.
++
++ at function oneline
++ at treturn string line, name as oneline text
++*/
+ static int openssl_xname_oneline(lua_State*L)
+ {
+   X509_NAME* xname = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -29,6 +150,12 @@ static int openssl_xname_oneline(lua_Sta
+   return 1;
+ };
+ 
++/***
++get hash code of x509_name
++
++ at function hash
++ at treturn integer hash hash code of x509_name
++*/
+ static int openssl_xname_hash(lua_State*L)
+ {
+   X509_NAME* xname = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -37,10 +164,17 @@ static int openssl_xname_hash(lua_State*
+   return 1;
+ };
+ 
++/***
++get digest of x509_name
++
++ at function digest
++ at tparam string|nid|openssl.evp_md md method of digest
++ at treturn string digest digest value by given alg of x509_name
++*/
+ static int openssl_xname_digest(lua_State*L)
+ {
+   X509_NAME* xname = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+-  const EVP_MD* md = get_digest(L, 2);
++  const EVP_MD* md = get_digest(L, 2, NULL);
+   unsigned char buf [EVP_MAX_MD_SIZE];
+   unsigned int len = sizeof(buf);
+ 
+@@ -52,6 +186,15 @@ static int openssl_xname_digest(lua_Stat
+   return 1;
+ };
+ 
++/***
++print x509_name to bio object
++
++ at function print
++ at tparam openssl.bio out output bio object
++ at tparam[opt] integer indent for output
++ at tparam[opt] integer flags for output
++ at treturn boolean result, follow by error message
++*/
+ static int openssl_xname_print(lua_State*L)
+ {
+   X509_NAME* xname = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -68,42 +211,73 @@ static int openssl_xname_print(lua_State
+   return 1;
+ };
+ 
+-static int openssl_push_xname_entry(lua_State* L, X509_NAME_ENTRY* ne)
++static int openssl_push_xname_entry(lua_State* L, X509_NAME_ENTRY* ne, int obj)
+ {
+   ASN1_OBJECT* object = X509_NAME_ENTRY_get_object(ne);
+-  ASN1_STRING *s;
++  ASN1_STRING* value = X509_NAME_ENTRY_get_data(ne);
+   lua_newtable(L);
+-  openssl_push_asn1object(L, object);
+-  s = X509_NAME_ENTRY_get_data(ne);
+-  PUSH_ASN1_STRING(L, s);
++  if(obj)
++  {
++    openssl_push_asn1object(L, object);
++    PUSH_ASN1_STRING(L, value);
++  }
++  else
++  {
++    lua_pushstring(L, OBJ_nid2sn(OBJ_obj2nid(object)));
++    lua_pushlstring(L, (const char*)ASN1_STRING_data(value), ASN1_STRING_length(value));
++  }
+   lua_settable(L, -3);
+   return 1;
+ }
+ 
++/***
++return x509_name as table
++
++ at function info
++ at tparam[opt=false] boolean asobject table key will use asn1_object or short name of asn1_object
++ at treturn table names
++ at see new
++*/
+ static int openssl_xname_info(lua_State*L)
+ {
+   X509_NAME* name = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+-  int i;
+-  int n_entries = X509_NAME_entry_count(name);
++  int obj = lua_isnoneornil(L, 2) ? 0 : lua_toboolean(L, 2);
++  int i, n;
+   lua_newtable(L);
+-  for (i = 0; i < n_entries; i++)
++  for (i = 0, n = X509_NAME_entry_count(name); i < n; i++)
+   {
+     X509_NAME_ENTRY* entry = X509_NAME_get_entry(name, i);
+-    openssl_push_xname_entry(L, entry);
++    openssl_push_xname_entry(L, entry, obj);
+     lua_rawseti(L, -2, i + 1);
+   }
+   return 1;
+ };
+ 
++/***
++compare two x509_name
++
++ at function cmp
++ at tparam x509_name another to compare with
++ at treturn boolean result true for equal or false
++ at usage
++  name1 = name.new({...})
++  name2 = name1:dup()
++  assert(name1:cmp(name2)==(name1==name2))
++*/
+ static int openssl_xname_cmp(lua_State*L)
+ {
+   X509_NAME* a = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+-  X509_NAME* b = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
++  X509_NAME* b = CHECK_OBJECT(2, X509_NAME, "openssl.x509_name");
+   int ret = X509_NAME_cmp(a, b);
+   lua_pushboolean(L, ret == 0);
+   return 1;
+ };
+ 
++/***
++make a clone of x509_name
++ at function dup
++ at treturn x509_name clone
++*/
+ static int openssl_xname_dup(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -112,6 +286,12 @@ static int openssl_xname_dup(lua_State*L
+   return 1;
+ };
+ 
++/***
++get DER encoded string of x509_name.
++
++ at function i2d
++@treturn string der
++*/
+ static int openssl_xname_i2d(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -120,13 +300,19 @@ static int openssl_xname_i2d(lua_State*L
+   if (len > 0)
+   {
+     lua_pushlstring(L, (const char *)out, len);
+-    CRYPTO_free(out);
++    OPENSSL_free(out);
+     return 1;
+   }
+   else
+     return openssl_pushresult(L, len);
+ };
+ 
++/***
++get count in x509_name.
++
++ at function entry_count
++ at treturn integer count of x509_name
++*/
+ static int openssl_xname_entry_count(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -135,6 +321,14 @@ static int openssl_xname_entry_count(lua
+   return 1;
+ };
+ 
++/***
++get text by given asn1_object or nid
++
++ at function get_text
++ at tparam string|integer|asn1_object identid for asn1_object
++ at tparam[opt=-1] number lastpos retrieve the next index after lastpos
++ at treturn string text and followed by lastpos
++*/
+ static int openssl_xname_get_text(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -156,18 +350,35 @@ static int openssl_xname_get_text(lua_St
+   return 2;
+ };
+ 
++/***
++get x509 name entry by index
++ at function get_entry
++ at tparam integer index start from 0, and less than xn:entry_count()
++ at tparam[opt=false] boolean asobject table key will use asn1_object or short name of asn1_object
++ at treturn x509 name entry table
++*/
+ static int openssl_xname_get_entry(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+   int lastpos = luaL_checkint(L, 2);
++  int obj = lua_isnoneornil(L, 3) ? 0 : lua_toboolean(L, 3);
+   X509_NAME_ENTRY *e = X509_NAME_get_entry(xn, lastpos);
+   if (e)
+   {
+-    return openssl_push_xname_entry(L, e);
++    return openssl_push_xname_entry(L, e, obj);
+   }
+   return 0;
+ };
+ 
++/***
++add name entry
++
++ at function add_entry
++ at tparam string|integer|asn1_object identid for asn1_object
++ at tparam string data to add
++ at tparam[opt] boolean utf8 true for use utf8 default
++ at treturn boolean result true for success or follow by error message
++*/
+ static int openssl_xname_add_entry(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -189,6 +400,15 @@ static int openssl_xname_add_entry(lua_S
+   return openssl_pushresult(L, ret);
+ };
+ 
++/***
++get index by give asn1_object or nid
++
++ at function delete_entry
++ at tparam integer location which name entry to delete
++ at treturn[1] asn1_object object that delete name entry
++ at treturn[1] asn1_string value that delete name entry
++ at treturn[2] nil delete nothing
++*/
+ static int openssl_xname_delete_entry(lua_State*L)
+ {
+   X509_NAME* xn = CHECK_OBJECT(1, X509_NAME, "openssl.x509_name");
+@@ -197,10 +417,8 @@ static int openssl_xname_delete_entry(lu
+   X509_NAME_ENTRY *xe = X509_NAME_delete_entry(xn, loc);
+   if (xe)
+   {
+-    ASN1_OBJECT *obj = OBJ_dup(xe->object);
+-    ASN1_STRING *as = ASN1_STRING_dup(xe->value);
+-    PUSH_OBJECT(obj, "openssl.asn1_object");
+-    PUSH_OBJECT(as, "openssl.asn1_string");
++    openssl_push_asn1object(L, X509_NAME_ENTRY_get_object(xe));
++    PUSH_ASN1_STRING(L, X509_NAME_ENTRY_get_data(xe));
+     X509_NAME_ENTRY_free(xe);
+     return 2;
+   }
+@@ -234,85 +452,6 @@ static luaL_Reg xname_funcs[] =
+ 
+   {NULL,          NULL},
+ };
+-
+-int openssl_push_xname_asobject(lua_State*L, X509_NAME* xname)
+-{
+-  X509_NAME* dup = X509_NAME_dup(xname);
+-  PUSH_OBJECT(dup, "openssl.x509_name");
+-  return 1;
+-}
+-
+-static int openssl_new_xname(lua_State*L, X509_NAME* xname, int idx, int utf8)
+-{
+-  int i, n;
+-  luaL_checktable(L, idx);
+-  luaL_argcheck(L, lua_istable(L, idx) && lua_rawlen(L, idx) > 0, idx,
+-                "must be not empty table as array");
+-
+-  n = lua_rawlen(L, idx);
+-  for (i = 0; i < n; i++)
+-  {
+-    lua_rawgeti(L, idx, i + 1);
+-    lua_pushnil(L);
+-
+-    while (lua_next(L, -2) != 0)
+-    {
+-      size_t size;
+-      const char *value;
+-      int ret;
+-      int nid = openssl_get_nid(L, -2);
+-      value = luaL_checklstring(L, -1, &size);
+-
+-      if (nid == NID_undef)
+-      {
+-        lua_pushfstring(L, "node at %d which key (%s) is not a valid object identity",
+-                        i + 1, lua_tostring(L, -2));
+-        luaL_argerror(L, idx, lua_tostring(L, -1));
+-      }
+-      ret = X509_NAME_add_entry_by_NID(xname, nid, utf8 ? MBSTRING_UTF8 : MBSTRING_ASC, (unsigned char*)value, (int)size, -1, 0);
+-      if (ret != 1)
+-      {
+-        lua_pushfstring(L, "node@%d which  %s=%s can't add to X509 name",
+-                        i + 1, lua_tostring(L, -2), value);
+-        luaL_argerror(L, idx, lua_tostring(L, -1));
+-      }
+-      lua_pop(L, 1);
+-    }
+-  }
+-  return 0;
+-}
+-
+-static int openssl_xname_new(lua_State*L)
+-{
+-  X509_NAME* xn;
+-  int utf8;
+-  luaL_checktable(L, 1);
+-  utf8 = lua_isnoneornil(L, 2) ? 1 : lua_toboolean(L, 2);
+-  xn = X509_NAME_new();
+-  openssl_new_xname(L, xn, 1, utf8);
+-  PUSH_OBJECT(xn, "openssl.x509_name");
+-  return 1;
+-};
+-
+-static int openssl_xname_d2i(lua_State*L)
+-{
+-  size_t len;
+-  const unsigned char* dat = (const unsigned char*)luaL_checklstring(L, 1, &len);
+-  X509_NAME* xn = d2i_X509_NAME(NULL, &dat, len);
+-  if (xn)
+-    PUSH_OBJECT(xn, "openssl.x509_name");
+-  else
+-    openssl_pushresult(L, 0);
+-  return 1;
+-};
+-
+-static luaL_Reg R[] =
+-{
+-  {"new",           openssl_xname_new},
+-  {"d2i",           openssl_xname_d2i},
+-
+-  {NULL,          NULL},
+-};
+ 
+ IMP_LUA_SK(X509_NAME, x509_name)
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/src/xstore.c luvi-src-v2.7.6/deps/lua-openssl/src/xstore.c
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/src/xstore.c	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/src/xstore.c	2019-02-13 11:53:24.321792707 +0100
+@@ -1,18 +1,71 @@
+-/*=========================================================================*\
+-* xstore.c
+-* * x509_store routines for lua-openssl binding
+-*
+-* Author:  george zhao <zhaozg(at)gmail.com>
+-\*=========================================================================*/
+-
++/***
++Provide x509_store as lua object, create and manage x509 store object
++ at module x509.store
++ at usage
++  store = require'openssl'.x509.store
++*/
+ #include "openssl.h"
+ #include "private.h"
+ 
+ #define MYNAME "x509.store"
+ 
++/***
++create or generate a new x509_store object.
++ at function new
++ at tparam table certs array of x509 objects, all x509 object will add to store, certs can be empty but not nil
++ at tparam[opt] table crls array of x509_crl objects, all crl object will add to store
++ at treturn x509_store object
++ at see x509_store
++*/
++static int openssl_xstore_new(lua_State*L)
++{
++  X509_STORE* ctx = X509_STORE_new();
++  int i, n;
++  luaL_checktable(L, 1);
++  n = lua_rawlen(L, 1);
++  for (i = 0; i < n; i++)
++  {
++    X509* x;
++    lua_rawgeti(L, 1, i + 1);
++    luaL_argcheck(L, auxiliar_getclassudata(L, "openssl.x509", -1), 1, "only contains x509 object");
++    x = CHECK_OBJECT(-1, X509, "openssl.x509");
++    lua_pop(L, 1);
++    X509_STORE_add_cert(ctx, x);
++  }
++  if (!lua_isnoneornil(L, 2))
++  {
++    luaL_checktable(L, 2);
++
++    n = lua_rawlen(L, 2);
++    for (i = 0; i < n; i++)
++    {
++      X509_CRL* c;
++      lua_rawgeti(L, 2, i + 1);
++      c = CHECK_OBJECT(-1, X509_CRL, "openssl.x509_crl");
++      lua_pop(L, 1);
++      X509_STORE_add_crl(ctx, c);
++    }
++  };
++
++  PUSH_OBJECT(ctx, "openssl.x509_store");
++  return 1;
++};
++
++static luaL_Reg R[] =
++{
++  {"new",           openssl_xstore_new},
++
++  {NULL,          NULL},
++};
++
++/***
++openssl.x509_store object
++@type x509_store
++*/
+ void openssl_xstore_free(X509_STORE* ctx)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10002000L
++  /* hack openssl bugs */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+   if (ctx->references > 1)
+     CRYPTO_add(&ctx->references, -1, CRYPTO_LOCK_X509_STORE);
+   else
+@@ -29,6 +82,14 @@ static int openssl_xstore_gc(lua_State*
+   return 0;
+ }
+ 
++/***
++add lookup path for store
++ at function add_lookup
++ at tparam string path file or dir path to add
++ at tparam[opt='file'] mode only 'file' or 'dir'
++ at tparam[opt='default'] format only 'pem', 'der' or 'default'
++ at treturn boolean result
++*/
+ static int openssl_xstore_add_lookup(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -60,7 +121,12 @@ static int openssl_xstore_add_lookup(lua
+   return openssl_pushresult(L, ret);
+ }
+ 
+-
++/***
++set verify depth of certificate chains
++ at function depth
++ at tparam number depth
++ at treturn boolean result
++*/
+ static int openssl_xstore_depth(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -69,6 +135,12 @@ static int openssl_xstore_depth(lua_Stat
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set verify flags of certificate chains
++ at function flags
++ at tparam number flags
++ at treturn boolean result
++*/
+ static int openssl_xstore_flags(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -77,6 +149,12 @@ static int openssl_xstore_flags(lua_Stat
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set prupose of x509 store
++ at function purpose
++ at tparam integer purpose
++ at treturn boolean result
++*/
+ static int openssl_xstore_purpose(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -85,6 +163,12 @@ static int openssl_xstore_purpose(lua_St
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++set as trust x509 store
++ at function trust
++ at tparam boolean trust
++ at treturn boolean result
++*/
+ static int openssl_xstore_trust(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -93,6 +177,13 @@ static int openssl_xstore_trust(lua_Stat
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++load certificate from file or dir,not given any paramater will load from defaults path
++ at function load
++ at tparam[opt] string filepath
++ at tparam[opt] string dirpath
++ at treturn boolean result
++*/
+ static int openssl_xstore_load(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -109,6 +200,12 @@ static int openssl_xstore_load(lua_State
+   return openssl_pushresult(L, ret);
+ }
+ 
++/***
++add x509 certificate or crl to store
++ at param ... support x509 object,x509_crl object or array contains x509,x509_crl object
++ at function add
++ at treturn boolean result
++*/
+ static int openssl_xstore_add(lua_State* L)
+ {
+   X509_STORE* ctx = CHECK_OBJECT(1, X509_STORE, "openssl.x509_store");
+@@ -124,12 +221,12 @@ static int openssl_xstore_add(lua_State*
+       for (j = 1; j <= k; j++)
+       {
+         lua_rawgeti(L, i, j);
+-        if (auxiliar_isclass(L, "openssl.x509", i))
++        if (auxiliar_getclassudata(L, "openssl.x509", i))
+         {
+           X509* x = CHECK_OBJECT(i, X509, "openssl.x509");
+           ret = X509_STORE_add_cert(ctx, x);
+         }
+-        else if (auxiliar_isclass(L, "openssl.x509_crl", i))
++        else if (auxiliar_getclassudata(L, "openssl.x509_crl", i))
+         {
+           X509_CRL* c = CHECK_OBJECT(i, X509_CRL, "openssl.x509_crl");
+           ret = X509_STORE_add_crl(ctx, c);
+@@ -140,12 +237,12 @@ static int openssl_xstore_add(lua_State*
+         }
+       }
+     }
+-    else if (auxiliar_isclass(L, "openssl.x509", i))
++    else if (auxiliar_getclassudata(L, "openssl.x509", i))
+     {
+       X509* x = CHECK_OBJECT(i, X509, "openssl.x509");
+       ret = X509_STORE_add_cert(ctx, x);
+     }
+-    else if (auxiliar_isclass(L, "openssl.x509_crl", i))
++    else if (auxiliar_getclassudata(L, "openssl.x509_crl", i))
+     {
+       X509_CRL* c = CHECK_OBJECT(i, X509_CRL, "openssl.x509_crl");
+       ret = X509_STORE_add_crl(ctx, c);
+@@ -186,47 +283,6 @@ static luaL_Reg xname_funcs[] =
+ 
+   {NULL,          NULL},
+ };
+-
+-static int openssl_xstore_new(lua_State*L)
+-{
+-  X509_STORE* ctx = X509_STORE_new();
+-  int i, n;
+-  luaL_checktable(L, 1);
+-  n = lua_rawlen(L, 1);
+-  for (i = 0; i < n; i++)
+-  {
+-    X509* x;
+-    lua_rawgeti(L, 1, i + 1);
+-    luaL_argcheck(L, auxiliar_isclass(L, "openssl.x509", -1), 1, "only contains x509 object");
+-    x = CHECK_OBJECT(-1, X509, "openssl.x509");
+-    lua_pop(L, 1);
+-    X509_STORE_add_cert(ctx, x);
+-  }
+-  if (!lua_isnoneornil(L, 2))
+-  {
+-    luaL_checktable(L, 2);
+-
+-    n = lua_rawlen(L, 2);
+-    for (i = 0; i < n; i++)
+-    {
+-      X509_CRL* c;
+-      lua_rawgeti(L, 2, i + 1);
+-      c = CHECK_OBJECT(-1, X509_CRL, "openssl.x509_crl");
+-      lua_pop(L, 1);
+-      X509_STORE_add_crl(ctx, c);
+-    }
+-  };
+-
+-  PUSH_OBJECT(ctx, "openssl.x509_store");
+-  return 1;
+-};
+-
+-static luaL_Reg R[] =
+-{
+-  {"new",           openssl_xstore_new},
+-
+-  {NULL,          NULL},
+-};
+ 
+ int openssl_register_xstore(lua_State*L)
+ {
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/0.engine.lua luvi-src-v2.7.6/deps/lua-openssl/test/0.engine.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/0.engine.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/0.engine.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -5,7 +5,13 @@ TestEngine = {}
+         local eng = assert(openssl.engine('openssl'))
+         assert(eng:id(),'openssl')
+         assert(eng:set_default('RSA'))
+-        assert(eng:set_default('ECDSA'))
++        local _,sslv
++        _, _, sslv = openssl.version(true)
++        if sslv>=0x10100000 then
++          assert(eng:set_default('EC'))
++        else
++          assert(eng:set_default('ECDSA'))
++      end
+     end
+ 
+     function TestEngine:testLoop()
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.asn1.lua luvi-src-v2.7.6/deps/lua-openssl/test/1.asn1.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.asn1.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/1.asn1.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,6 +1,5 @@
+ local openssl = require'openssl'
+ local asn1 = openssl.asn1
+-
+ local first = true
+ 
+ TestObject = {}
+@@ -27,15 +26,19 @@ TestObject = {}
+         o3 = asn1.new_object(self.nid)
+         o4 = asn1.new_object(self.oid)
+         o5 = asn1.new_object(self.oid,true)
+-
+-        o6 = asn1.new_object(self.ln,true)
+-        assertEquals(openssl.error(),218513530)
+-
++        assert(o1)
+         assert(o1==o2)
+         assert(o1==o3)
+         assert(o1==o4)
+         assert(o1==o5)
++
++        assertEquals(openssl.error(),nil)
++
++        o6 = asn1.new_object(self.ln,true)
+         assertNil(o6)
++        assertNotNil(openssl.error())
++        assertNil(openssl.error())
++
+         o6 = o1:dup()
+         assert(o1==o6)
+ 
+@@ -64,9 +67,10 @@ TestObject = {}
+             ln  ='CCSTC GMSM2 EC1'
+         }
+ 
++        assertNil(openssl.error())
+         o7 = asn1.new_object(options.sn)
+         if not o7 then
+-            assertEquals(openssl.error(),218513530)
++            assertNotNil(openssl.error())
+             o7 =  asn1.new_object(options)
+             assertStrContains(tostring(o7), 'openssl.asn1_object')
+             assertEquals(o7:txt(), options.ln)
+@@ -81,13 +85,16 @@ TestObject = {}
+             first = false
+ 
+             assertIsNil(asn1.new_object(self.ne_sn))
++            assertNotNil(openssl.error())
+             assertIsNil(asn1.new_object(self.ne_ln))
++            assertNotNil(openssl.error())
+             assert(asn1.new_object(self.ne_oid))
+ 
+             o1 = assert(asn1.new_object({oid=self.ne_oid,sn=self.ne_sn,ln=self.ne_ln}))
+             o2 = assert(asn1.new_object(self.ne_oid))
+             assertEquals(o1,o2)
+ 
++            assertNil(openssl.error())
+         else
+             assert(asn1.txt2nid(self.ne_oid))
+ 
+@@ -151,4 +158,4 @@ TestTime = {}
+         assert(at:set(self.time))
+         local t1 = at:get(self.time)
+         assertEquals(self.time,t1)
+-    end
+\ No newline at end of file
++    end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.x509_attr.lua luvi-src-v2.7.6/deps/lua-openssl/test/1.x509_attr.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.x509_attr.lua	2019-02-13 11:31:40.287301977 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/1.x509_attr.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -36,10 +36,9 @@ TestX509attr = {}
+         local n1 = attr.new_attribute(self.ca)
+         assertStrContains(tostring(n1),'openssl.x509_attribute')
+         local info = n1:info()
+-
+         assertIsTable(info)
+         assertEquals(info.object:ln(), "X509v3 Basic Constraints")
+-        assertEquals(info.single,false)
++        assertEquals(#info.value, 1)
+         assertEquals(info.value[1].type, asn1.OCTET_STRING)
+         assertEquals(info.value[1].value, "CA:FALSE")
+         local n2 = n1:dup()
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.x509_extension.lua luvi-src-v2.7.6/deps/lua-openssl/test/1.x509_extension.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/1.x509_extension.lua	2019-02-13 11:31:40.290635288 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/1.x509_extension.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -35,8 +35,9 @@ TestX509ext = {}
+         local info = n1:info()
+         assertIsTable(info)
+         assertEquals(info.object:ln(), "X509v3 Basic Constraints")
+-        assertEquals(info.critical,true)
++        assertEquals(info.critical,false)
+         assertEquals(info.value:tostring(), "CA:FALSE")
++
+         local n2 = n1:dup()
+         assertEquals(n2:info(),info)
+         assertEquals(n1:critical(),false)
+@@ -54,6 +55,7 @@ TestX509ext = {}
+         assertEquals(n1:data(), self.cafalse)
+ 
+         local time = ext.new_extension(self.time)
++        assertEquals(time:critical(),true)
+         local der = time:export()
+         local t1 = ext.read_extension(der)
+         assert(der==t1:export())
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/3.cipher.lua luvi-src-v2.7.6/deps/lua-openssl/test/3.cipher.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/3.cipher.lua	2019-02-13 11:31:40.283968667 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/3.cipher.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -91,7 +91,7 @@ TestCipherMY = {}
+         b = assert(obj1:update(a))
+         b = b..assert(obj1:final())
+         assertEquals(b,self.msg)
+-        assert(#a>#self.msg)
++        assert(#a >= #self.msg)
+ 
+         obj = C:encrypt_new(self.key)
+         aa = assert(obj:update(self.msg))
+@@ -101,7 +101,7 @@ TestCipherMY = {}
+         bb = assert(obj1:update(aa))
+         bb = bb..assert(obj1:final())
+         assertEquals(self.msg,bb)
+-        assert(#self.msg < #aa)
++        assert(#self.msg <= #aa)
+ 
+         local r = openssl.random(16)
+         local k,i = C:BytesToKey(r)
+@@ -113,3 +113,33 @@ TestCipherMY = {}
+         assertEquals(#k,t.key_length)
+         assertEquals(#i,t.iv_length)
+     end
++
++    function TestCipherMY:testAesCTR()
++
++        local C = cipher.get('aes-128-ctr')
++        local key = '0123456789abcefg'
++        local iv = string.rep('\0',16)
++
++        local a,b,c,aa,bb,cc
++        local obj,obj1
++
++        obj = C:new(true,self.key)
++        a = assert(obj:update(self.msg))
++        a = a..obj:final()
++
++        obj1 = C:new(false,self.key)
++        b = assert(obj1:update(a))
++        b = b..assert(obj1:final())
++        assertEquals(b,self.msg)
++        assert(#a>=#self.msg)
++
++        obj = C:encrypt_new(self.key)
++        aa = assert(obj:update(self.msg))
++        aa = aa..assert(obj:final())
++
++        obj1 = C:decrypt_new(self.key)
++        bb = assert(obj1:update(aa))
++        bb = bb..assert(obj1:final())
++        assertEquals(self.msg,bb)
++        assert(#self.msg <= #aa)
++    end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/4.pkey.lua luvi-src-v2.7.6/deps/lua-openssl/test/4.pkey.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/4.pkey.lua	2019-02-13 11:31:40.297301909 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/4.pkey.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -20,7 +20,7 @@ TestPKEYMY = {}
+                 {'ec','prime256v1'}
+         }
+     end
+-
++--[[
+     function TestPKEYMY:testModule()
+         for i,v in ipairs(self.genalg ) do
+                 --print(v)
+@@ -30,7 +30,6 @@ TestPKEYMY = {}
+ 
+                 local t= k:parse()
+                 local len = t.bits/8
+-                --print_r(t)
+ 
+                 local msg = openssl.random(len-11)
+                 if t.type=='rsa' then
+@@ -54,17 +53,16 @@ TestPKEYMY = {}
+ 
+                 assert(k1:export():find('^-----BEGIN PUBLIC KEY-----'))
+ 
+-                assert(string.len(k:export(true,true))>0)
+-
+-                assert(string.len(k:export(true,true))>0)
+-                assert(string.len(k:export(true,false))>0)
+-                assert(string.len(k:export(false))>0)
++                assert(string.len(k:export('pem',true))>0)
+ 
+-                assert(string.len(k:export(true,true,'secret'))>0)
++                assert(string.len(k:export('pem',true))>0)
++                assert(string.len(k:export('pem',false))>0)
++                assert(string.len(k:export('der'))>0)
+ 
+-                assert(string.len(k:export(true,false,'secret'))>0)
+-                assert(string.len(k:export(false,'secret'))>0)
++                assert(string.len(k:export('pem',true,'secret'))>0)
+ 
++                assert(string.len(k:export('pem',false,'secret'))>0)
++                assert(string.len(k:export('der',false,'secret'))>0)
+         end
+     end
+ 
+@@ -84,17 +82,16 @@ TestPKEYMY = {}
+         assert(t.e)
+         t.alg = 'rsa'
+         local r2 = pkey.new(t)
+-        assert(r2:is_private()==false)
++        assert(not r2:is_private())
+         local msg = openssl.random(128-11)
+ 
+         local out = pkey.encrypt(r2,msg)
+         local raw = pkey.decrypt(rsa,out)
+         assert(msg==raw)
+     end
+-
+-    function testRsaFmt()
++--]]
++    function testKeyFmt()
+     local keys = {
+-
+ RSA= {[[
+ -----BEGIN PRIVATE KEY-----
+ MIICdQIBADALBgkqhkiG9w0BAQEEggJhMIICXQIBAAKBgQC7JHoJfg6yNzLMOWet
+@@ -114,6 +111,7 @@ mu/UpE/BRZmR
+ -----END PRIVATE KEY-----
+ ]],
+ "3082025D02010002818100BB247A097E0EB23732CC3967ADF19E3D6B8283D1D0ACA4C018BE8D9800C07BFF0744C9CA1CBA36E12769FFB1E38D8BEE57A93AAA16433954197CAE692414F664FFBC74C6676C4CF1024969C72BE1E1A1A34314F4778FC8D0855A3595AC62A9C1210077A08B9730B45A2CB8902F48A005284BF20F8DEC8B4D034275D6AD81C011020301000102818000FCB94A260789512B537291E0183EA65E31EF9C0C162442D02833F9FAD03C540406C015F51B9AB32431AB3C6B4743B0D2A9DC05E18159B604E96661AAD70B008F3DE5BFA2F85E256C1E220FB4FD41E203315FDA20C5C0F3550EE1C9ECD73E2A0C01CA7B22CBACF42B27F0785FB5C2F9E8145A6E7E86BD6A9B200CBACC972011024100C9599F298A5B9FE32AD87EC2409FA845E53E118D3CED6EABCED06546D8C70763B52334F49F7E1CC7C7F965D1F4044238BE3A0C9D0825FCA371D9AE0C3961F489024100EDEFABA9D5399CEE591BFFCF48441BB632E74624F3047FDE95086D759E6717BA5CA4D4E2E24D77CEEB6629C596E062BBE5ACDC44625486ED640CCED060039D49024054D9187227E4BE76BB1A6A282F955812C42CA8B6CCE2FD0D1764C818D7C6DF3D4C1A9EF92AB0B92E12FDECC351C1EDA9FDB7769341D8C822941A77F69CC3C3890241008EF9A708ADB52A04DB8D04A1B5062034D2CFC089B17231B8398BCFE28EA5DA4F451E534266C4304B298EC16917298C8AE60F8268A141B3B6709975A92718E4E902410089EA6E6D70DF255F183F48DA63108BFEA80C940FDE9756538994E21E2C743C9181340BA640F8CB2A608CE002B78993CF189F4954FD7D3F9AEFD4A44FC1459991",
++"30819F300D06092A864886F70D010101050003818D0030818902818100BB247A097E0EB23732CC3967ADF19E3D6B8283D1D0ACA4C018BE8D9800C07BFF0744C9CA1CBA36E12769FFB1E38D8BEE57A93AAA16433954197CAE692414F664FFBC74C6676C4CF1024969C72BE1E1A1A34314F4778FC8D0855A3595AC62A9C1210077A08B9730B45A2CB8902F48A005284BF20F8DEC8B4D034275D6AD81C0110203010001",
+ "30818902818100BB247A097E0EB23732CC3967ADF19E3D6B8283D1D0ACA4C018BE8D9800C07BFF0744C9CA1CBA36E12769FFB1E38D8BEE57A93AAA16433954197CAE692414F664FFBC74C6676C4CF1024969C72BE1E1A1A34314F4778FC8D0855A3595AC62A9C1210077A08B9730B45A2CB8902F48A005284BF20F8DEC8B4D034275D6AD81C0110203010001"
+ },
+ 
+@@ -126,7 +124,8 @@ zo0MUVPQgwJ3aJtNM1QMOQUayCrRwfklg+D/rFSU
+ -----END PRIVATE KEY-----
+ ]],
+ '30770201010420622AD3652C7EE4EF18EAD9467246BA5BA6ED262A1C76B76895F72E912A13124FA00A06082A8648CE3D030107A1440342000424BCF36EECF6B519CB16538BFBA6D35FA82255ABC0B1CE8D0C5153D0830277689B4D33540C39051AC82AD1C1F92583E0FFAC5494C0452AB5987B7C90E216ACF7',
+-'0424BCF36EECF6B519CB16538BFBA6D35FA82255ABC0B1CE8D0C5153D0830277689B4D33540C39051AC82AD1C1F92583E0FFAC5494C0452AB5987B7C90E216ACF7'
++"3059301306072A8648CE3D020106082A8648CE3D0301070342000424BCF36EECF6B519CB16538BFBA6D35FA82255ABC0B1CE8D0C5153D0830277689B4D33540C39051AC82AD1C1F92583E0FFAC5494C0452AB5987B7C90E216ACF7",
++'3059301306072A8648CE3D020106082A8648CE3D0301070342000424BCF36EECF6B519CB16538BFBA6D35FA82255ABC0B1CE8D0C5153D0830277689B4D33540C39051AC82AD1C1F92583E0FFAC5494C0452AB5987B7C90E216ACF7'
+ },
+ --]=]
+ DSA={
+@@ -142,103 +141,154 @@ vgPnEUG6Mk9bkxMZKRgsiKn6QGKDYGbOvnS1xmkM
+ -----END PRIVATE KEY-----
+ ]],
+ '308201BC02010002818100AA0930CC145825221CAFFA28AC2894196A27833DE5EC212707916894207774A2E7B238B0D36F1B2499A2C2585083EB01432924418D867FAA212DD1071D4DCEB2782794AD393CC08A4D4ADA7F68D6E839A5FCD34B4E402D82CB8A8CB40FEC31911BF9BD360B034CAACB4C5E947992573C9E90099C1B0F05940CABE5D2DE49A167021500ADC0E869B36F0AC013A681FDF4D4899D69820451028181008C6B4589AFA53A4D1048BFC346D1F386CA75521CCF72DDAA251286880EE13201FF48890BBFC33D79BACAEC71E7A778507BD5F1A66422E39415BE03E71141BA324F5B93131929182C88A9FA4062836066CEBE74B5C6690C7D101106C240AB7EBD54E4E3301FD086CE6ADAC922FB2713A2B0887CBA13B9BC68CE5CFFF241CD32460281802B260EA97DC6A12AE932C640E7DF3D8FF04A8A05A0324F8D5F1B23F15FA170FF3F42061124EFF2586CB11B49A82DCDC1B90FC6A84FB10109CB67DB5D2DA971AEAF17BE5E37284563E4C64D9E5FC8480258B319F0DE29D54D835070D9E287914D77DF81491F4423B62DA984EB3F45EB2A29FCEA5DAE525AC6AB6BCCE04BFDF5B6021500A535A8E1D0D91BEAFC8BEE1D9B2A3A8DE3311203',
+-'0281802B260EA97DC6A12AE932C640E7DF3D8FF04A8A05A0324F8D5F1B23F15FA170FF3F42061124EFF2586CB11B49A82DCDC1B90FC6A84FB10109CB67DB5D2DA971AEAF17BE5E37284563E4C64D9E5FC8480258B319F0DE29D54D835070D9E287914D77DF81491F4423B62DA984EB3F45EB2A29FCEA5DAE525AC6AB6BCCE04BFDF5B6'
++"308201B73082012C06072A8648CE3804013082011F02818100AA0930CC145825221CAFFA28AC2894196A27833DE5EC212707916894207774A2E7B238B0D36F1B2499A2C2585083EB01432924418D867FAA212DD1071D4DCEB2782794AD393CC08A4D4ADA7F68D6E839A5FCD34B4E402D82CB8A8CB40FEC31911BF9BD360B034CAACB4C5E947992573C9E90099C1B0F05940CABE5D2DE49A167021500ADC0E869B36F0AC013A681FDF4D4899D69820451028181008C6B4589AFA53A4D1048BFC346D1F386CA75521CCF72DDAA251286880EE13201FF48890BBFC33D79BACAEC71E7A778507BD5F1A66422E39415BE03E71141BA324F5B93131929182C88A9FA4062836066CEBE74B5C6690C7D101106C240AB7EBD54E4E3301FD086CE6ADAC922FB2713A2B0887CBA13B9BC68CE5CFFF241CD3246038184000281802B260EA97DC6A12AE932C640E7DF3D8FF04A8A05A0324F8D5F1B23F15FA170FF3F42061124EFF2586CB11B49A82DCDC1B90FC6A84FB10109CB67DB5D2DA971AEAF17BE5E37284563E4C64D9E5FC8480258B319F0DE29D54D835070D9E287914D77DF81491F4423B62DA984EB3F45EB2A29FCEA5DAE525AC6AB6BCCE04BFDF5B6",
++"308201B73082012C06072A8648CE3804013082011F02818100AA0930CC145825221CAFFA28AC2894196A27833DE5EC212707916894207774A2E7B238B0D36F1B2499A2C2585083EB01432924418D867FAA212DD1071D4DCEB2782794AD393CC08A4D4ADA7F68D6E839A5FCD34B4E402D82CB8A8CB40FEC31911BF9BD360B034CAACB4C5E947992573C9E90099C1B0F05940CABE5D2DE49A167021500ADC0E869B36F0AC013A681FDF4D4899D69820451028181008C6B4589AFA53A4D1048BFC346D1F386CA75521CCF72DDAA251286880EE13201FF48890BBFC33D79BACAEC71E7A778507BD5F1A66422E39415BE03E71141BA324F5B93131929182C88A9FA4062836066CEBE74B5C6690C7D101106C240AB7EBD54E4E3301FD086CE6ADAC922FB2713A2B0887CBA13B9BC68CE5CFFF241CD3246038184000281802B260EA97DC6A12AE932C640E7DF3D8FF04A8A05A0324F8D5F1B23F15FA170FF3F42061124EFF2586CB11B49A82DCDC1B90FC6A84FB10109CB67DB5D2DA971AEAF17BE5E37284563E4C64D9E5FC8480258B319F0DE29D54D835070D9E287914D77DF81491F4423B62DA984EB3F45EB2A29FCEA5DAE525AC6AB6BCCE04BFDF5B6",
+ }
+ }
+ 
+         for k,v in pairs(keys) do
+-                print(string.format('Test %s export format',k))
+-
+                 local pri = pkey.read(v[1], true, 'pem')
+                 local pub = assert(pri:get_public())
+-                -- evp_pkey:export ([pem=true[, raw_key=false[, passphrase]]])
+ 
+-                --begin test pem format
+-                -- pem=true, raw_key=false, passphrase=nil
++                -- evp_pkey:export ([format='pem'[, raw=false[, passphrase]]])
++
++                -- private
++                --1 format='pem', raw=false, passphrase=nil
+                 local pem1  = pri:export()
+                 assertStrContains(pem1,'-----BEGIN PRIVATE KEY-----')
+                 assertStrContains(pem1,'-----END PRIVATE KEY-----')
+ 
+-                local pem1  = pri:export(true)
++                local pem1  = pri:export('pem')
+                 assertStrContains(pem1,'-----BEGIN PRIVATE KEY-----')
+                 assertStrContains(pem1,'-----END PRIVATE KEY-----')
+ 
+-                local pem1  = pri:export(true, false)
++                local pem1  = pri:export('pem', false)
+                 assertStrContains(pem1,'-----BEGIN PRIVATE KEY-----')
+                 assertStrContains(pem1,'-----END PRIVATE KEY-----')
+ 
+-                local k1 = pkey.read(pem1,true)
++                local k1 = pkey.read(pem1, true)
+                 assertEquals(pri:export(),k1:export())
+ 
+-                -- pem=true, raw_key=false, export_private=false, passphrase=nil
+-                local pem1  = pub:export(true)
+-                assertStrContains(pem1,'-----BEGIN PUBLIC KEY-----')
+-                assertStrContains(pem1,'-----END PUBLIC KEY-----')
+-
+-                local k2 = pkey.read(pem1,false)
+-                assertEquals(pub:export(),k2:export())
+-
+-                -- pem=true, raw_key=false, export_private=true, passphrase='secret'
+-                local pem3  = pri:export(true, false,'secret')
++                -- format='pem', raw=false, passphrase='secret'
++                local pem3  = pri:export('pem', false,'secret')
+                 assertStrContains(pem3,'-----BEGIN ENCRYPTED PRIVATE KEY-----')
+                 assertStrContains(pem3,'-----END ENCRYPTED PRIVATE KEY-----')
+ 
+-                --ispriv = true,
+                 local k2 = pkey.read(pem3, true, 'pem','secret')
+                 assertEquals(pri:export(),k2:export())
+ 
+-                -- pem=true, raw_key=true, passphrase=nil
+-                local pem2  = pri:export(true, true)
++                --2 format='pem', raw=true, passphrase=nil
++                local pem2  = pri:export('pem', true)
+                 assertStrContains(pem2,'-----BEGIN '..k..' PRIVATE KEY-----')
+                 assertStrContains(pem2,'-----END '..k..' PRIVATE KEY-----')
+                 assertNotStrContains(pem2,'Proc-Type: 4,ENCRYPTED')
+                 assertNotStrContains(pem2,'DEK-Info: DES-EDE3-CBC,')
+ 
+-                local k2 = pkey.read(pem2,true,'pem')
++                local k2 = pkey.read(pem2, true, 'pem')
+                 assertEquals(pri:export(),k2:export())
+ 
+-                -- pem=true, raw_key=true, passphrase=nil
+-                if k~='EC' and k~='DSA' then
+-                        local pem2  = pub:export(true, true)
+-                        assertStrContains(pem2,'-----BEGIN '..k..' PUBLIC KEY-----')
+-                        assertStrContains(pem2,'-----END '..k..' PUBLIC KEY-----')
+-                        local k2 = pkey.read(pem2, false,'pem',k)
+-                        --pem=true,raw_key=true
+-                        assertEquals(pem2,k2:export(true,true))
+-                end
+-                -- pem=true, raw_key=true, export_private=true, passphrase='secret'
+-                local pem4  = pri:export(true, true, 'secret')
++                -- format='pem' raw=true,  passphrase='secret'
++                local pem4  = pri:export('pem', true, 'secret')
+                 assertStrContains(pem4,'-----BEGIN '..k..' PRIVATE KEY-----')
+                 assertStrContains(pem4,'Proc-Type: 4,ENCRYPTED')
+                 assertStrContains(pem4,'DEK-Info: DES-EDE3-CBC,')
+                 assertStrContains(pem4,'-----END '..k..' PRIVATE KEY-----')
++
+                 local k2 = pkey.read(pem4,true,'pem','secret')
+                 assertEquals(pri:export(),k2:export())
+-                --end of pem test
+ 
+-                --test der
+-                -- pem=false, export_private=true, passphrase=nil
+-                local export = pri:export(false)
++                --3 format='der', raw=false, passphrase=nil
++                local export = pri:export('der')
++                local hex = openssl.hex(export)
++                assertEquals(hex:upper(),v[2])
++
++                local k2 = pkey.read(export,true,'der')
++                assertEquals(pri:export(),k2:export())
++
++                local export = pri:export('der',false)
+                 local hex = openssl.hex(export)
+                 assertEquals(hex:upper(),v[2])
+ 
+                 local k2 = pkey.read(export,true,'der')
+                 assertEquals(pri:export(),k2:export())
+ 
+-                -- pem=false, export_private=false, passphrase=nil
+-                local export = pub:export(false)
++                local export = pri:export('der', nil)
++                local hex = openssl.hex(export)
++                assertEquals(hex:upper(),v[2])
++
++                local k2 = pkey.read(export,true,'der')
++                assertEquals(pri:export(),k2:export())
++
++                -- pem=false, raw=false, passphrase='secret'
++                local export = pri:export('der',false,'secret')
++                local k2 = pkey.read(export,true,'der','secret')
++                assertEquals(pri:export(),k2:export())
++
++                local export = pri:export('der', nil, 'secret')
++                local k2 = pkey.read(export,true,'der','secret')
++                assertEquals(pri:export(),k2:export())
++
++                --4 pem=false, raw=true, passphrase=nil
++                local export = pri:export('der', true)
++                local hex = openssl.hex(export)
++                assertEquals(hex:upper(),v[2])
++
++                local k2 = pkey.read(export,true,'der', k)
++                assertEquals(pri:export(),k2:export())
++
++                -------------------------------
++                -- public
++                --1 format='pem', raw=false, passphrase=nil
++                local pem1  = pub:export()
++                assertEquals(pem1,  pub:export('pem'))
++                assertStrContains(pem1,'-----BEGIN PUBLIC KEY-----')
++                assertStrContains(pem1,'-----END PUBLIC KEY-----')
++
++                local k2 = pkey.read(pem1,false)
++                assertEquals(pub:export(),k2:export())
++
++                --2 format='pem', raw=true, passphrase=nil
++                local pem2  = pub:export('pem', true)
++                if k~="EC" and k~='DSA' then
++                        assertStrContains(pem2,'-----BEGIN '..k..' PUBLIC KEY-----')
++                        assertStrContains(pem2,'-----END '..k..' PUBLIC KEY-----')
++                end
++                local k2 = pkey.read(pem2, false, 'pem', k)
++                assertEquals(pub:export(),k2:export())
++
++                --3 format='der', raw=false, passphrase=nil
++                local export = pub:export('der')
+                 local hex = openssl.hex(export)
+                 assertEquals(hex:upper(),v[3])
+ 
+-                if k~='EC' and k~='DSA' then
+-                        local k1 = assert(pkey.read(export, false,'der',k))
+-                        local p1 = k1:export()
+-                        assertEquals(p1,pub:export())
++                local export = pub:export('der', false)
++                local k2 = pkey.read(export,false,'der')
++                assertEquals(hex:upper(),v[3])
++                assertEquals(pub:export(),k2:export())
++
++                local k2 = pkey.read(export, nil,'der')
++                assertEquals(pub:export(),k2:export())
++
++                --4 format='der', raw=true, passphrase=nil
++                
++                local export = pub:export('der', true)
++                local hex = openssl.hex(export)
++                if (hex:upper()~=v[4]) then
++                  print('XXXXXXXXX', k)
++                  print('PUB:', hex)
++                  print('---:', v[4])
++                end
++                assertEquals(hex:upper(),v[4])
++
++                if (k~='EC' and k~='DSA') then
++                        local k1 = assert(pkey.read(export, false,'der', k))
++                        local p1 = k1:export('der', true)
++                        assertEquals(p1, export)
++                        assertEquals(k1:export(), pub:export())
+                 end
+-                -- pkcs8 der
+-                -- pem=false, export_private=true, passphrase='secret'
+-                local export = pri:export(false,'secret')
+-                local k1 = pkey.read(export,true,'der','secret')
+-                assertEquals(pri:export(),k1:export())
+         end
+     end
++
++--""    #EXPORT_ASSERT_TO_GLOBALS = true
++--""    #require'luaunit'
++--""    #    LuaUnit.run()
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.ts.lua luvi-src-v2.7.6/deps/lua-openssl/test/5.ts.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.ts.lua	2019-02-13 11:31:40.290635288 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/5.ts.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -2,58 +2,499 @@ local openssl = require'openssl'
+ 
+ local asn1,ts,asn1,csr = openssl.asn1,openssl.ts,openssl.asn1, openssl.x509.req
+ 
+-local timeStamping = openssl.asn1.new_string('timeStamping',asn1.OCTET_STRING)
+-local timeStamping=asn1.new_type('timeStamping')
+-timeStamping = timeStamping:i2d()
+-local cafalse = openssl.asn1.new_string('CA:FALSE',asn1.OCTET_STRING)
++
++testTSRequest = {}
++
++    function testTSRequest:setUp()
++        self.msg = 'abcd'
++        self.alg = 'sha1'
++        self.hash = assert(openssl.digest.digest(self.alg, self.msg, true))
++    end
++
++    function testTSRequest:testReq1()
++        local req = assert(openssl.ts.req_new())
++        assert(req:msg_imprint(self.hash, self.alg))
++        assert(req:cert_req(true))
++        local der = assert(req:export())
++        local req1 = assert(ts.req_read(der))
++        local t = req1:info()
++        assertIsTable(t)
++        assertEquals(t.cert_req,true)
++        assertEquals(t.version,1)
++        assertEquals(t.msg_imprint.hashed_msg,self.hash)
++        assertEquals(t.msg_imprint.hash_algo:tostring(), self.alg)
++        return req
++    end
++
++    function testTSRequest:testReq2()
++        local req = assert(openssl.ts.req_new())
++        assert(req:msg_imprint(self.hash, self.alg))
++        local nonce = openssl.bn.text(openssl.random(16))
++        assert(req:nonce(nonce))
++
++        local der = assert(req:export())
++        local req1 = assert(ts.req_read(der))
++        local t = req1:info()
++        assertIsTable(t)
++        assertEquals(t.cert_req,false)
++        assertEquals(t.version,1)
++
++        assertEquals(t.nonce:data(), nonce:totext())
++        assertEquals(t.msg_imprint.hashed_msg,self.hash)
++        assertEquals(t.msg_imprint.hash_algo:tostring(), self.alg)
++        self.nonce = nonce
++        return req
++    end
++
++    function testTSRequest:testReq3()
++        local req = assert(openssl.ts.req_new())
++        assert(req:msg_imprint(self.hash, self.alg))
++        local nonce = openssl.bn.text(openssl.random(16))
++        assert(req:nonce(nonce))
++
++        local oid = '1.2.3.4.100'
++
++        local obj = assert(asn1.new_object(oid))
++        assert(req:policy_id(obj))
++
++        local der = assert(req:export())
++        local req1 = assert(ts.req_read(der))
++        local t = req1:info()
++        assertIsTable(t)
++        assertEquals(t.cert_req,false)
++        assertEquals(t.version,1)
++
++        assertEquals(t.nonce:data(), nonce:totext())
++        assertEquals(t.policy_id:data(), oid)
++        assertEquals(t.msg_imprint.hashed_msg,self.hash)
++        assertEquals(t.msg_imprint.hash_algo:tostring(), self.alg)
++        return req
++    end
+ 
+ local first = true
+-TestTS = {}
+-    function TestTS:setUp()
+-        self.alg='sha1'
++testTSSign = {}
+ 
+-        self.cadn = {{commonName='CA'},{C='CN'}}
+-        self.tsadn = {{commonName='tsa'},{C='CN'}}
++    function testTSSign:setUp()
++        local timeStamping = openssl.asn1.new_string('timeStamping',asn1.OCTET_STRING)
++        local timeStamping=asn1.new_type('timeStamping')
++        self.timeStamping = timeStamping:i2d()
++        self.cafalse = openssl.asn1.new_string('CA:FALSE',asn1.OCTET_STRING)
+ 
++        self.dat=[[
++[test]
++basicConstraints=CA:FALSE
++keyUsage = nonRepudiation, digitalSignature, keyEncipherment
++extendedKeyUsage = critical,timeStamping
++]]
++        self.alg='sha1'
+         self.digest = 'sha1WithRSAEncryption'
+         self.md = openssl.digest.get('sha1WithRSAEncryption')
++        self.hash = assert(self.md:digest(self.dat))
++        if first then
++            assert(asn1.new_object({oid='1.2.3.4.5.6',sn='1.2.3.4.5.6_sn',ln='1.2.3.4.5.6_ln'}))
++            assert(asn1.new_object({oid='1.2.3.4.5.7',sn='1.2.3.4.5.7_sn',ln='1.2.3.4.5.7_ln'}))
++            first = false
++        end
++
++        --setUp private key and certificate
++        local ca = {}
++        self.ca = ca
++        ca.dn = {{commonName='CA'},{C='CN'}}
++        ca.pkey = assert(openssl.pkey.new())
++        local subject = assert(openssl.x509.name.new(ca.dn))
++        ca.req = assert(csr.new(subject,ca.pkey))
++        ca.cert = assert(ca.req:to_x509(ca.pkey))
++
++        local attributes =
++        {
++            {
++                object='basicConstraints',
++                type=asn1.OCTET_STRING,
++                value=cafalse
++            }
++        }
++        local extensions =
++        {
++            openssl.x509.extension.new_extension(
++            {
++            object='extendedKeyUsage',
++            value = 'timeStamping',
++            critical = true
++        })}
++
++        local tsa = {}
++        self.tsa = tsa
++        tsa.dn  = {{commonName='tsa'},{C='CN'}}
++        tsa.pkey = assert(openssl.pkey.new())
++        subject = openssl.x509.name.new(tsa.dn)
++
++        tsa.req = csr.new(subject,tsa.pkey)
++        assertEquals(type(tsa.req:parse()),'table')
++
++        tsa.cert = openssl.x509.new(1, tsa.req)
++        assert(tsa.cert:validat(os.time(), os.time() + 3600*24*365))
++        assert(tsa.cert:extensions(extensions))
++        assert(tsa.cert:sign(ca.pkey,ca.cert))
++
++        assertEquals(type(tsa.cert:parse()),'table')
++
++        ca.store = openssl.x509.store.new({ca.cert})
++        assert(tsa.cert:check(ca.store,nil,'timestamp_sign'))
++
++        local args = {}
++        args.attribs = {}
++        args.extentions = {}
++        args.digest = 'sha1WithRSAEncryption'
++        args.num_days = 3650
++        args.serialNumber = 1
++    end
++
++
++    function testTSSign:testSign1()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq1()
++
++        local tsa = self.tsa
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++        assert(t.status_info.status:tostring()=='02')
++        assertEquals(#t.status_info.text,1)
++        assertEquals(t.status_info.text[1],'Error during response generation.')
++    end
++
++    function testTSSign:testSign2()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq2()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.5.7'
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, oid))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local res = assert(openssl.ts.resp_read(res:export()))
++        local vry = assert(req:to_verify_ctx())
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign3()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local res = assert(openssl.ts.resp_read(res:export()))
++        local vry = assert(req:to_verify_ctx())
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign4()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local res = assert(openssl.ts.resp_read(res:export()))
++        local vry = ts.verify_ctx_new(req)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign5()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local vry = assert(ts.verify_ctx_new())
++        vry:imprint(self.hash)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign6()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local vry = assert(ts.verify_ctx_new())
++        vry:data(self.dat)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign7()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local vry = assert(ts.verify_ctx_new())
++        vry:imprint(self.hash)
++        vry:data(self.dat)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++    function testTSSign:testSign8()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        assert(req_ctx:policies({assert(asn1.new_object('1.1.3')),assert(asn1.new_object('1.1.4'))}))
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),'01')
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++        local now = os.time()
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++
++        local vry = assert(ts.verify_ctx_new())
++        vry:imprint(self.hash)
++        vry:data(self.dat)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++    end
++
++testTSComplex = {}
++
++    function testTSComplex:setUp()
++        local timeStamping = openssl.asn1.new_string('timeStamping',asn1.OCTET_STRING)
++        local timeStamping=asn1.new_type('timeStamping')
++        self.timeStamping = timeStamping:i2d()
++        self.cafalse = openssl.asn1.new_string('CA:FALSE',asn1.OCTET_STRING)
++
+         self.dat=[[
+ [test]
+ basicConstraints=CA:FALSE
+ keyUsage = nonRepudiation, digitalSignature, keyEncipherment
+ extendedKeyUsage = critical,timeStamping
+ ]]
++        self.alg='sha1'
++        self.digest = 'sha1WithRSAEncryption'
++        self.md = openssl.digest.get('sha1WithRSAEncryption')
+         self.hash = assert(self.md:digest(self.dat))
+         if first then
+             assert(asn1.new_object({oid='1.2.3.4.5.6',sn='1.2.3.4.5.6_sn',ln='1.2.3.4.5.6_ln'}))
+             assert(asn1.new_object({oid='1.2.3.4.5.7',sn='1.2.3.4.5.7_sn',ln='1.2.3.4.5.7_ln'}))
+             first = false
+         end
+-    end
+ 
+-function TestTS:testAll()
+-    local args = {}
+-    args.attribs = {}
+-    args.extentions = {}
+-    args.digest = 'sha1WithRSAEncryption'
+-    args.num_days = 3650
+-    args.serialNumber = 1
+-
+-    local cakey = assert(openssl.pkey.new())
+-    local careq = assert(csr.new(openssl.x509.name.new(self.cadn),cakey))
+-    local cacert = assert(careq:to_x509(cakey))
+-
+-    local pkey = assert(openssl.pkey.new())
+-    local subject = openssl.x509.name.new(self.tsadn)
+-    local attributes =
++        --setUp private key and certificate
++        local ca = {}
++        self.ca = ca
++        ca.dn = {{commonName='CA'},{C='CN'}}
++        ca.pkey = assert(openssl.pkey.new())
++        local subject = assert(openssl.x509.name.new(ca.dn))
++        ca.req = assert(csr.new(subject,ca.pkey))
++        ca.cert = assert(ca.req:to_x509(ca.pkey))
++
++        local attributes =
++        {
+             {
+-                {
+-                    object='basicConstraints',
+-                    type=asn1.OCTET_STRING,
+-                    value=cafalse
+-                }
++                object='basicConstraints',
++                type=asn1.OCTET_STRING,
++                value=cafalse
+             }
+-    local extensions =
++        }
++        local extensions =
+         {
+             openssl.x509.extension.new_extension(
+             {
+@@ -61,75 +502,86 @@ function TestTS:testAll()
+             value = 'timeStamping',
+             critical = true
+         })}
+-    x = csr.new(
+-        subject,
+-        pkey
+-        )
+-    t = assert(x:parse())
+-    assertEquals(type(t),'table')
+-    --print_r(t)
+-
+-    local x509 = openssl.x509.new(
+-        1,
+-        x
+-    )
+-    assert(x509:validat(os.time(), os.time() + 3600*24*365))
+-    assert(x509:extensions(extensions))
+-    assert(x509:sign(cakey,cacert))
+-    t = assert(x509:parse())
+-    assertEquals(type(t),'table')
+-    --print_r(t)
+-
+-    ---------------------------------------------------
+-    local req = assert(openssl.ts.req_new())
+-    assert(req:msg_imprint(self.hash,'sha1'))
+-    assert(req:cert_req(true))
+-    local der = assert(req:export())
+-    local req1 = assert(ts.req_read(der))
+-    local t = req1:info()
+-    assertIsTable(t)
+-    --print_r(t)
+-
+-    local req_ctx = assert(ts.resp_ctx_new(x509, pkey, '1.2.3.4.5.7'))
+-    assert(req_ctx:md({'md5','sha1'}))
+-    --assert(req_ctx:policies({'1.1.3','1.1.4'}))
+-    local res = req_ctx:sign(req)
+-
+-    t = assert(res:info())
+-    assertIsTable(t)
+-    --print_r(t)
+-    t = res:tst_info()
+-    assertIsTable(t)
+-    --print_r(t)
+-
+-    local skx = openssl.x509.store.new({cacert})
+-
+-    assert(x509:check(skx,nil,'timestamp_sign'))
+-
+-    local res = assert(openssl.ts.resp_read(res:export()))
+-    local vry = assert(req:to_verify_ctx())
+-    assert(vry:store(skx))
+-    assert(vry:verify(res))
+-
+-    local vry = ts.verify_ctx_new(req)
+-    assert(vry:store(skx))
+-    assert(vry:verify(res))
+-
+-    local vry = assert(ts.verify_ctx_new())
+-    assert(vry:imprint(self.hash))
+-    assert(vry:store(skx))
+-    assert(vry:verify(res))
+-
+-    local vry = assert(ts.verify_ctx_new())
+-    assert(vry:data(self.dat))
+-    assert(vry:store(skx))
+-    assert(vry:verify(res))
+-
+-    local vry = assert(ts.verify_ctx_new())
+-    assert(vry:imprint(self.hash))
+-    assert(vry:data(self.dat))
+-    assert(vry:store(skx))
+-    assert(vry:verify(res))
+-    res = ts.resp_read(res:export())
+-    vry:verify(res)
+-end
++
++        local tsa = {}
++        self.tsa = tsa
++        tsa.dn  = {{commonName='tsa'},{C='CN'}}
++        tsa.pkey = assert(openssl.pkey.new())
++        subject = openssl.x509.name.new(tsa.dn)
++
++        tsa.req = csr.new(subject,tsa.pkey)
++        assertEquals(type(tsa.req:parse()),'table')
++
++        tsa.cert = openssl.x509.new(1, tsa.req)
++        assert(tsa.cert:validat(os.time(), os.time() + 3600*24*365))
++        assert(tsa.cert:extensions(extensions))
++        assert(tsa.cert:sign(ca.pkey,ca.cert))
++
++        assertEquals(type(tsa.cert:parse()),'table')
++
++        ca.store = openssl.x509.store.new({ca.cert})
++        assert(tsa.cert:check(ca.store,nil,'timestamp_sign'))
++
++        local args = {}
++        args.attribs = {}
++        args.extentions = {}
++        args.digest = 'sha1WithRSAEncryption'
++        args.num_days = 3650
++        args.serialNumber = 1
++    end
++
++    function testTSComplex:testCallback()
++        testTSRequest:setUp()
++        local req = testTSRequest:testReq3()
++
++        local tsa = self.tsa
++        local oid = '1.2.3.4.100'
++        local obj = assert(asn1.new_object(oid))
++        local req_ctx = assert(ts.resp_ctx_new(tsa.cert, tsa.pkey, obj))
++        assert(req_ctx:md({'md5','sha1'}))
++        assert(req_ctx:policies({assert(asn1.new_object('1.1.3')),assert(asn1.new_object('1.1.4'))}))
++
++        local sn = 0
++        req_ctx:set_serial_cb(function(self)
++            sn = sn + 1
++            return sn
++        end)
++
++        local now = os.time()
++        req_ctx:set_time_cb(function(self)
++            return now
++        end)
++
++        assert(pcall(function()
++        local res = req_ctx:sign(req)
++        t = assert(res:info())
++        assertIsTable(t)
++
++        assert(t.status_info.status:tostring()=='0')
++        assert(not t.status_info.text)
++        assert(not t.status_info.failure_info)
++        assertIsTable(t.tst_info)
++        assertIsUserdata(t.token)
++
++        local tst = t.tst_info
++        assertEquals(tst.serial:tostring(),string.format('%02x',sn))
++        assertEquals(tst.version,1)
++        assertEquals(tst.ordering,false)
++        assertEquals(tst.policy_id:txt(true),oid)
++
++        local function get_timezone()
++          local now = os.time()
++          return os.difftime(now, os.time(os.date("!*t", now)))
++        end
++        timezone = get_timezone()
++
++        assertEquals(tst.time:tostring(),os.date('%Y%m%d%H%M%SZ',now-timezone))
++        assertIsString(tst.nonce:tostring())
++        local vry = assert(ts.verify_ctx_new())
++        vry:imprint(self.hash)
++        vry:data(self.dat)
++        vry:store(self.ca.store)
++        assert(vry:verify(res))
++
++        end))
++    end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.x509.lua luvi-src-v2.7.6/deps/lua-openssl/test/5.x509.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.x509.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/5.x509.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -2,6 +2,8 @@ local openssl = require'openssl'
+ 
+ local csr,x509 = openssl.x509.req, openssl.x509
+ 
++local helper = require('helper')
++
+ TestX509 = {}
+     function TestX509:setUp()
+         self.alg='sha1'
+@@ -13,33 +15,24 @@ TestX509 = {}
+     end
+ 
+ function TestX509:testNew()
+-        --cacert, self sign
+-        local pkey = assert(openssl.pkey.new())
+-        local req = assert(csr.new(self.cadn,pkey))
+-        local t = req:parse()
+-        assertEquals(type(t),'table')
+-
+-        local cacert = openssl.x509.new(
+-                1,      --serialNumber
+-                req     --copy name and extensions
+-        )
+-
+-        cacert:validat(os.time(), os.time() + 3600*24*365)
+-        assert(cacert:sign(pkey, cacert))  --self sign
++        local pkey, cacert = helper.new_ca(self.cadn)
+         assertEquals(cacert:subject(), cacert:issuer())
++        assert(cacert:parse().ca, 'invalid ca certificate')
+ 
+         local c = cacert:pubkey():encrypt('abcd')
+         d = pkey:decrypt(c)
+         assert(d=='abcd')
+         assert(cacert:check(pkey),'self sign check failed')
+-        assert(cacert:check(openssl.x509.store.new({cacert}) ))
++        local castore = openssl.x509.store.new({cacert})
++        assert(cacert:check(castore))
+ 
+         --sign cert by cacert
+ 
+         local dkey = openssl.pkey.new()
+         req = assert(csr.new(self.dn,dkey))
+         local cert = openssl.x509.new(2,req)
+-        cert:validat(os.time(), os.time() + 3600*24*365)
++        cert:notbefore(os.time())
++        cert:validat(os.time(), os.time() + 3600*24*360)
+         assert(cert:sign(pkey,cacert))
+ 
+         local c = cert:pubkey():encrypt('abcd')
+@@ -47,7 +40,7 @@ function TestX509:testNew()
+         assert(d=='abcd')
+         assert(cert:check(dkey),'self private match failed')
+ 
+-        assert(cert:check(openssl.x509.store.new({cacert})))
++        assert(cert:check(castore))
+ end
+ 
+ function TestX509:testIO()
+@@ -75,8 +68,6 @@ sggwDQYJKoZIhvcNAQEEBQADQQCU5SSgapJSdRXJ
+         assert(x:notbefore())
+         assert(x:notafter())
+ 
+-        print(os.date('%c', x:notafter():get()))
+-
+         assertIsNil(x:extensions())
+ 
+         assert(x:subject())
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.x509_req.lua luvi-src-v2.7.6/deps/lua-openssl/test/5.x509_req.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/5.x509_req.lua	2019-02-13 11:31:40.290635288 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/5.x509_req.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -160,7 +160,7 @@ TestCSR = {}
+                 assertEquals(req1:subject():tostring(),self.subject:tostring())
+ 
+                 local s = req1:digest()
+-                local r = req1:digest('sha1')
++                local r = req1:digest('sha256')
+                 assertEquals(r,s)
+                 assert(req2:check(pkey))
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/6.cms.lua luvi-src-v2.7.6/deps/lua-openssl/test/6.cms.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/6.cms.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/6.cms.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,86 @@
++local openssl = require'openssl'
++local bio, x509,cms,csr = openssl.bio,openssl.x509,openssl.cms,openssl.x509.req
++local helper = require'helper'
++if not cms then
++  print('Skip cms test')
++  return
++end
++
++TestCMS = {}
++
++--need OpenSSL build with zlib support
++--[[
++  function TestCMS:testCompress()
++    local msg = openssl.random(1000)
++    local cs = assert(cms.compress(msg, 'rle'))
++    local out = bio.mem()
++    local ret = assert(cms.uncompress (cs, msg, out))
++    assertEquals(msg, out:get_mem())
++  end
++--]]
++    function TestCMS:setUp()
++        self.alg='sha1'
++        self.cadn = openssl.x509.name.new({{commonName='CA'},{C='CN'}})
++        self.alicedn = openssl.x509.name.new({{commonName='Alice'},{C='CN'}})
++        self.bobdn = openssl.x509.name.new({{commonName='Bob'},{C='CN'}})
++
++        local cakey, cacert = helper.new_ca(self.cadn)
++        self.cakey, self.cacert = cakey, cacert
++        self.castore = openssl.x509.store.new({cacert})
++
++        local pkey = openssl.pkey.new()
++        req = assert(csr.new(self.alicedn, pkey))
++        local cert = openssl.x509.new(2,req)
++        cert:validat(os.time(), os.time() + 3600*24*365)
++        assert(cert:sign(cakey,cacert))
++        self.alice = {
++          key = pkey,
++          cert = cert
++        }
++
++        pkey = openssl.pkey.new()
++        req = assert(csr.new(self.bobdn, pkey))
++        cert = openssl.x509.new(2,req)
++        cert:validat(os.time(), os.time() + 3600*24*365)
++        assert(cert:sign(cakey,cacert))
++        self.bob = {
++          key = pkey,
++          cert = cert
++        }
++
++        self.msg = openssl.hex(openssl.random(128))
++        self.digest = 'sha1WithRSAEncryption'
++    end
++
++    function TestCMS:testEncrypt()
++        local recipts = {self.alice.cert}
++        local msg = assert(cms.encrypt(recipts, self.msg))
++        local smime = assert(cms.write(msg))
++        local ss = assert(cms.read(smime,'smime'))
++        local raw = assert(cms.decrypt(ss,self.alice.key, self.alice.cert))
++        assertEquals(raw,self.msg)
++    end
++
++    function TestCMS:testSign()
++        local c1 = assert(cms.sign(self.bob.cert, self.bob.key, self.msg, {}))
++        local smime = assert(cms.write(c1))
++        local msg = assert(cms.verify(c1, {self.bob.cert}, self.castore))
++        assertEquals(msg, self.msg)
++        msg = assert(cms.verify(c1, {}, self.castore))
++        assertEquals(msg, self.msg)
++    end
++
++    function TestCMS:testEncryptedData()
++        local key = openssl.random(24)
++        local c1 = assert(cms.EncryptedData_encrypt(self.msg, key))
++        local smime = assert(cms.write(c1))
++        local msg = assert(cms.EncryptedData_decrypt(c1, key))
++        assertEquals(msg, self.msg)
++    end
++    function TestCMS:testDigest()
++        local key = openssl.random(24)
++        local c1 = assert(cms.digest_create(self.msg))
++        local smime = assert(cms.write(c1))
++        local msg = assert(cms.digest_verify(c1))
++        assertEquals(msg, self.msg)
++    end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/6.pkcs7.lua luvi-src-v2.7.6/deps/lua-openssl/test/6.pkcs7.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/6.pkcs7.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/6.pkcs7.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,5 +1,6 @@
+ local openssl = require'openssl'
+ local x509,pkcs7,csr = openssl.x509,openssl.pkcs7,openssl.x509.req
++local helper = require'helper'
+ 
+ TestCompat = {}
+     function TestCompat:setUp()
+@@ -11,18 +12,7 @@ TestCompat = {}
+     end
+ 
+     function TestCompat:testNew()
+-        local cakey = assert(openssl.pkey.new())
+-        local req = assert(csr.new(self.cadn,cakey))
+-        local t = req:parse()
+-        assertEquals(type(t),'table')
+-
+-        local cacert = openssl.x509.new(
+-                1,      --serialNumber
+-                req     --copy name and extensions
+-        )
+-        cacert:validat(os.time(), os.time() + 3600*24*361)
+-        assert(cacert:sign(cakey, cacert))  --self sign
+-
++        local cakey, cacert = helper.new_ca(self.cadn)
+         local dkey = openssl.pkey.new()
+         req = assert(csr.new(self.dn,dkey))
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/7.pkcs12.lua luvi-src-v2.7.6/deps/lua-openssl/test/7.pkcs12.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/7.pkcs12.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/7.pkcs12.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,5 +1,6 @@
+ local openssl = require'openssl'
+ local csr, x509, pkcs12 = openssl.x509.req,openssl.x509, openssl.pkcs12
++local helper = require'helper'
+ 
+ TestCompat = {}
+     function TestCompat:setUp()
+@@ -12,17 +13,9 @@ TestCompat = {}
+ 
+ 
+ function TestCompat:testNew()
+-        local pkey = assert(openssl.pkey.new())
+-        local req = assert(csr.new(self.cadn,pkey))
+-        local t = req:parse()
+-        assertEquals(type(t),'table')
+-
+-        local cacert = openssl.x509.new(
+-                1,      --serialNumber
+-                req     --copy name and extensions
+-        )
++        local pkey, cacert = helper.new_ca(self.cadn)
+         local dkey = openssl.pkey.new()
+-        req = assert(csr.new(self.dn,dkey))
++        local req = assert(csr.new(self.dn,dkey))
+ 
+         local extensions =
+         {{
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/8.ssl_options.lua luvi-src-v2.7.6/deps/lua-openssl/test/8.ssl_options.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/8.ssl_options.lua	2019-02-13 11:31:40.290635288 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/8.ssl_options.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,13 +1,15 @@
+ -- Testcase
+-local ssl = require "openssl".ssl
++local openssl = require'openssl'
++local ssl = openssl.ssl
++local helper = require'helper'
+ 
+ local proto = 'TLSv1'
+-
+ local SET = function(t)
+   local s = {}
+   for _, k in ipairs(t) do s[k] = true end
+   return s
+ end
++local libressl = helper.libressl
+ 
+ TestSSLOptions = {}
+       function TestSSLOptions:setUp()
+@@ -18,16 +20,18 @@ TestSSLOptions = {}
+             local t, e = self.ctx:options()
+             assert(type(t) == "table", e or type(t))
+             t = SET(t)
+-            
++            assertIsTable(t)
++            assertEquals(0, #t)
++
+             t = self.ctx:options(ssl.no_sslv3, "no_ticket")
+             t = SET(t)
+             assertIsTable(t)
+-            assert(t.no_sslv3)
++            assert(libressl or t.no_sslv3)
+             assert(t.no_ticket)
+ 
+             assert(not pcall(self.ctx.options, ctx, true, nil))
+             assertIsTable(t)
+-            assert(t.no_sslv3)
++            assert(libressl or t.no_sslv3)
+             assert(t.no_ticket)
+       end
+ 
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/9.issue.lua luvi-src-v2.7.6/deps/lua-openssl/test/9.issue.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/9.issue.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/9.issue.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,76 @@
++local openssl = require'openssl'
++local hmac = require'openssl'.hmac
++
++TestIssuer = {}
++    function dump(t,i)
++        for k,v in pairs(t) do
++            if type(v) == 'table' then
++                print( string.rep('\t',i),k..'={')
++                dump(v,i+1)
++                print( string.rep('\t',i),'}')
++            elseif type(v) == 'userdata' then
++                local s = tostring(v)
++                if s:match('^openssl.asn1_') then
++                    if type(k)=='userdata' and tostring(k):match('^openssl.asn1_object') then
++                        print( string.rep('\t',i),k:sn()..'='..v:data() )
++                    elseif s:match('^openssl.asn1_integer') then
++                        print( string.rep('\t',i),tostring(k)..'='..tostring(v),v:bn())
++                    else
++                        print( string.rep('\t',i),tostring(k)..'='..tostring(v),v:data())
++                    end
++                elseif s:match('^openssl.x509_name') then
++                    print( string.rep('\t',i),k..'='..v:oneline())
++                    print( string.rep('\t',i),k..'={')
++                    dump(v:info(true), i+1)
++                    print( string.rep('\t',i),k..'=}')
++                elseif s:match('^openssl.x509_extension') then
++                    print( string.rep('\t',i),k..'={')
++                    dump(v:info(true), i+1)
++                    print(string.rep('\t',i),'}')
++                elseif s:match('^openssl.x509_algor') then
++                    print(string.rep('\t',i), k..'='..v:tostring())
++                else
++                    print( string.rep('\t',i),k..'='..v)
++                end
++            else
++                print( string.rep('\t',i),k..'='..tostring(v))
++            end
++        end
++    end
++
++    function TestIssuer:test75()
++        local certasstring = [[
++-----BEGIN CERTIFICATE-----
++MIIDATCCArCgAwIBAgITEgAFDVkfna1KLEIuKgAAAAUNWTAIBgYqhQMCAgMwfzEj
++MCEGCSqGSIb3DQEJARYUc3VwcG9ydEBjcnlwdG9wcm8ucnUxCzAJBgNVBAYTAlJV
++MQ8wDQYDVQQHEwZNb3Njb3cxFzAVBgNVBAoTDkNSWVBUTy1QUk8gTExDMSEwHwYD
++VQQDExhDUllQVE8tUFJPIFRlc3QgQ2VudGVyIDIwHhcNMTUwNjEzMTczNjQ4WhcN
++MTUwOTEzMTc0NjQ4WjATMREwDwYDVQQDEwhuZ2F0ZS5ydTBjMBwGBiqFAwICEzAS
++BgcqhQMCAiQABgcqhQMCAh4BA0MABEBn4s6r6zCgimGfiHg4o0FpNaGv1jGzmqSD
++chsnAiqcV8fQ4Y6p/o0x8CZEXAC+hzdf5w2f1VxzbJaGCTQslmNYo4IBbTCCAWkw
++EwYDVR0lBAwwCgYIKwYBBQUHAwEwCwYDVR0PBAQDAgQwMB0GA1UdDgQWBBT4x4Lz
++iE6QcS3Qnmz03HNroSojbzAfBgNVHSMEGDAWgBQVMXywjRreZtcVnElSlxckuQF6
++gzBZBgNVHR8EUjBQME6gTKBKhkhodHRwOi8vdGVzdGNhLmNyeXB0b3Byby5ydS9D
++ZXJ0RW5yb2xsL0NSWVBUTy1QUk8lMjBUZXN0JTIwQ2VudGVyJTIwMi5jcmwwgakG
++CCsGAQUFBwEBBIGcMIGZMGEGCCsGAQUFBzAChlVodHRwOi8vdGVzdGNhLmNyeXB0
++b3Byby5ydS9DZXJ0RW5yb2xsL3Rlc3QtY2EtMjAxNF9DUllQVE8tUFJPJTIwVGVz
++dCUyMENlbnRlciUyMDIuY3J0MDQGCCsGAQUFBzABhihodHRwOi8vdGVzdGNhLmNy
++eXB0b3Byby5ydS9vY3NwL29jc3Auc3JmMAgGBiqFAwICAwNBAA+nkIdgmqgVr/2J
++FlwzT6GFy4Cv0skv+KuUyfrd7kX4jcY/oGwxpxBv5WfNYDnHrVK90bNsXTqlon2M
++veFd3yM=
++-----END CERTIFICATE-----
++]]
++        local x = openssl.x509.read(certasstring)
++        local t = x:parse()
++        assert(type(t)=='table')
++        --dump(t,0)
++    end
++
++    function TestIssuer:test141()
++        local c = openssl.cipher.decrypt_new('bf-cbc', "secret_key", "iv")
++        local out = c:update("msg")
++        local final = c:final()
++        c:close()
++        c = nil
++        collectgarbage("collect")
++    end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/9.srp.lua luvi-src-v2.7.6/deps/lua-openssl/test/9.srp.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/9.srp.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/9.srp.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,63 @@
++
++local openssl = require'openssl'
++local srp = openssl.srp
++if srp==nil then
++  print('Skip test srp')
++  return
++end
++
++local GN = assert(srp.get_default_gN('1024'));
++
++local self = {}
++
++TestSRP = {}
++    function TestSRP:setUp()
++        self.user = 'zhaozg'
++        self.pass = 'password'
++    end
++
++    function TestSRP:tearDown()
++    end
++
++    function TestSRP:test_1_SRV_CreateVerifier()
++        self.salt, self.verifier = GN:create_verifier(self.user, self.pass)
++        assert(self.salt)
++        assert(self.verifier)
++    end
++
++    function TestSRP:test_2_SRV_Calc_b()
++        self.Bpub, self.Brnd = GN:calc_b(self.verifier)
++        assert(self.Bpub)
++        assert(self.Brnd)
++    end
++
++    function TestSRP:test_3_CLI_Calc_a()
++        self.Apub, self.Arnd = GN:calc_a()
++        assert(self.Apub)
++        assert(self.Arnd)
++    end
++
++    function TestSRP:test_4_Calc_u()
++        self.u = assert(GN:calc_u(self.Apub, self.Bpub))
++    end
++
++    function TestSRP:test_5_cli_key()
++        local x = assert(GN.calc_x(self.salt, self.user, self.pass))
++        self.Kclient = assert(GN:calc_client_key(self.Bpub, x, self.Arnd, self.u))
++    end
++
++    function TestSRP:test_6_srv_key()
++        local Kserver = assert(GN:calc_server_key(self.Apub, self.verifier, self.u, self.Brnd))
++        assert(Kserver==self.Kclient)
++    end
++
++    function TestSRP:test_7_cli_key()
++        local x = assert(GN.calc_x(self.salt, self.user, self.pass..'1'))
++        self.Kclient = assert(GN:calc_client_key(self.Bpub, x, self.Arnd, self.u))
++    end
++
++    function TestSRP:test_8_srv_key()
++        local Kserver = assert(GN:calc_server_key(self.Apub, self.verifier, self.u, self.Brnd))
++        assert( Kserver~=self.Kclient)
++    end
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/ec.lua luvi-src-v2.7.6/deps/lua-openssl/test/ec.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/ec.lua	2019-02-13 11:31:40.290635288 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/ec.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -14,7 +14,7 @@ testEC = {}
+         }
+         local ec = assert(pkey.new(factor))
+ 
+-        local pem = assert(ec:export(true))
++        local pem = assert(ec:export('pem'))
+         assertEquals(pem,[[
+ -----BEGIN PRIVATE KEY-----
+ MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgH+M5UMX0YRJK6ZLC
+@@ -27,7 +27,7 @@ jcWtqOmp3Xyzxw30SJhuUb3l0VdvmZAfnCxqgGpH
+     function testEC:testEC()
+         local nec =  {'ec','prime256v1'}
+         local ec = pkey.new(unpack(nec))
+-        local t = ec:parse().ec:parse(true) --make basic table
++        local t = ec:parse().ec:parse('pem') --make basic table
+         assertEquals(type(t.curve_name), 'number')
+         assertStrContains(t.x.version, 'bn library')
+         assertStrContains(t.y.version, 'bn library')
+@@ -63,5 +63,24 @@ jcWtqOmp3Xyzxw30SJhuUb3l0VdvmZAfnCxqgGpH
+         ec2p.d = ec:parse().ec:parse().priv_key
+         local ec2priv = pkey.new(ec2p)
+         assert(ec2priv:is_private())
++    end
++
++    function testEC:testEC()
++        local nec =  {'ec','prime256v1'}
++        local key1 = pkey.new(unpack(nec))
++        local key2 = pkey.new(unpack(nec))
++        local ec1 = key1:parse().ec
++        local ec2 = key2:parse().ec
++        local secret1 = ec1:compute_key(ec2)
++        local secret2 = ec2:compute_key(ec1)
++        assert(secret1==secret2)
++
++        local pub1 = pkey.get_public(key1)
++        local pub2 = pkey.get_public(key2)
++        pub1 = pub1:parse().ec
++        pub2 = pub2:parse().ec
+ 
++        secret1 = ec1:compute_key(pub2)
++        secret2 = ec2:compute_key(pub1)
++        assert(secret1==secret2)
+     end
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/helper.lua luvi-src-v2.7.6/deps/lua-openssl/test/helper.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/helper.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/helper.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,46 @@
++local openssl = require'openssl'
++local ext = openssl.x509.extension
++
++local M = {}
++
++local default_caexts = {
++  {
++     object='basicConstraints',
++     value='CA:true',
++     critical = true
++  },
++  {
++    object='keyUsage',
++    value='keyCertSign'
++  }
++}
++
++function M.to_extensions(exts)
++  exts = exts or default_caexts
++  local ret = {}
++  for i=1, #exts do
++    ret[i] = ext.new_extension(exts[i])
++  end
++  return ret
++end
++
++function M.new_ca(subject)
++  --cacert, self sign
++  local pkey = assert(openssl.pkey.new())
++  local req = assert(openssl.x509.req.new(subject, pkey))
++  local cacert = openssl.x509.new(
++    1,      --serialNumber
++    req     --copy name and extensions
++  )
++  cacert:extensions(M.to_extensions())
++  cacert:notbefore(os.time())
++  cacert:notafter(os.time() + 3600*24*365)
++  assert(cacert:sign(pkey, cacert))  --self sign
++  return pkey, cacert
++end
++
++M.luaopensslv, M.luav, M.opensslv = openssl.version()
++M.libressl = M.opensslv:find('^LibreSSL')
++
++return M
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/luacrypto/ca/README luvi-src-v2.7.6/deps/lua-openssl/test/luacrypto/ca/README
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/luacrypto/ca/README	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/luacrypto/ca/README	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,17 @@
++Testing x509 certs for luacrypto
++
++# Make the CA cert
++openssl genrsa -des3 -out ca.key 4096
++openssl req -new -x509 -days 365 -key ca.key -out ca.crt
++
++# Make server cert and signing request
++openssl genrsa -des3 -out server.key 4096
++openssl req -new -key server.key -out server.csr
++
++# Sign the server csr and generate a crt
++openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
++
++# Output unencrypted server key
++openssl rsa -in server.key -out server.key.insecure
++
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/luv_ssl/ssl_c.lua luvi-src-v2.7.6/deps/lua-openssl/test/luv_ssl/ssl_c.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/luv_ssl/ssl_c.lua	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/luv_ssl/ssl_c.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,84 +1,84 @@
+-local uv = require('luv')
+-local ssl = require('luv.ssl')
++local uv = require 'luv'
++local ssl = require 'luv.ssl'
+ -----------------------------------------------
+ local count = 0
+ local ncount = arg[3] and tonumber(arg[3]) or 40000
+ ncount = ncount or 40000
+-local step = 1000/2
++local step = 1000 / 2
+ local tmp = true
+ 
+-local function setInterval(fn, ms)
++local function setInterval (fn, ms)
+   local handle = uv.new_timer()
+   uv.timer_start(handle, ms, ms, fn)
+   return handle
+ end
+ 
+-setInterval(function()
+-	print(os.date(),count)
+-	print(ssl.error())
+-	collectgarbage()
+-end,
+-1000)
++setInterval(function ()
++    print(os.date(), count)
++    print(ssl.error())
++    collectgarbage()
++  end, 1000)
+ --------------------------------------------------------------
+-host = arg[1] or "127.0.0.1"; --only ip
+-port = arg[2] or "8383";
++host = arg[1] or "127.0.0.1" --only ip
++port = arg[2] or "8383"
+ 
+ local address = {
+-	port = tonumber(port),
+-	address = host
++  port = tonumber(port),
++  address = host,
++
+ }
+ 
+-local ctx = ssl.new_ctx({
+-   protocol = "TLSv1_2_client",
+-   verify = {"none"},
+---   options = {"all", "no_sslv2"}
+-})
++local ctx = ssl.new_ctx {
++  protocol = "TLSv1_2_client",
++  verify = ssl.none,
++  --   options = {"all", "no_sslv2"}
++
++}
+ 
+ 
+ local new_connection
+ 
+-function new_connection(i)
++function new_connection (i)
+ 
+-	local scli = ssl.connect(address.address,address.port,ctx, function(self)
+-		count = count + 1
+-		self:write('GET / HTTP/1.0\r\n\r\n')
+-		if tmp then
+-			self:close()
+-		end
+-
+-		if count <= ncount then
+-			new_connection(i)
+-		end
+-
+-	end)
+-
+-	function scli:ondata(chunk)
+-		--print(chunk)
+-	end
+-	
+-	function scli:onerror(err)
+-		print('onerror',err)
+-	end
+-	
+-	function scli:onend()
+-		--print('onend********8')
+-		--count = count -1
+-		self:close()
+-	end
+-	function scli:onclose()
+-		count = count -1
+-		--print('closed')
+-	end
+-	return scli
++  local scli = ssl.connect(address.address, address.port, ctx, function (self)
++      count = count + 1
++      self:write 'GET / HTTP/1.0\r\n\r\n'
++      if tmp then
++        self:close()
++      end
++
++      if count <= ncount then
++        new_connection(i)
++      end
++    end)
++
++  function scli:ondata (chunk)
++ --print(chunk)
++       end
++
++  function scli:onerror (err)
++    print('onerror', err)
++  end
++
++  function scli:onend ()
++    --print('onend********8')
++    --count = count -1
++    self:close()
++  end
++  function scli:onclose ()
++    count = count - 1
++ --print('closed')
++       end
++  return scli
+ end
+ 
+ tmp = true
+ local conns = {}
+ 
+-for i=1, step do 
+-	new_connection(i)
++for i = 1, step do
++  new_connection(i)
+ end
+ 
+-uv.run('default')
++uv.run 'default'
+ 
+-print("done")
++print "done"
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/luv_ssl/ssl_s.lua luvi-src-v2.7.6/deps/lua-openssl/test/luv_ssl/ssl_s.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/luv_ssl/ssl_s.lua	2019-02-13 11:31:40.320635083 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/luv_ssl/ssl_s.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -1,83 +1,82 @@
+-local uv = require('luv')
+-local ssl = require('luv.ssl')
++local uv = require 'luv'
++local ssl = require 'luv.ssl'
+ 
+ -----------------------------------------------
+ ---[[
+ local count = 0
+ 
+-local function setInterval(fn, ms)
++local function setInterval (fn, ms)
+   local handle = uv.new_timer()
+   uv.timer_start(handle, ms, ms, fn)
+   return handle
+ end
+ 
+-setInterval(function()
+-	print(os.date(),count)
+-	print(ssl.error())
+-	collectgarbage()
+-end,
+-1000)
++setInterval(function ()
++    print(os.date(), count)
++    print(ssl.error())
++    collectgarbage()
++  end, 1000)
+ --]]
+ --------------------------------------------------------------
+-host = arg[1] or "127.0.0.1"; --only ip
+-port = arg[2] or "8383";
++host = arg[1] or "127.0.0.1" --only ip
++port = arg[2] or "8383"
+ 
+ local address = {
+-	port = tonumber(port),
+-	address = host
++  port = tonumber(port),
++  address = host,
++
+ }
+ 
+-local ctx = ssl.new_ctx({
+-   protocol = "TLSv1_2_server",
+-   verify = {"none"},
+-   key = "../luasec/certs/serverAkey.pem",
+-   certificate = "../luasec/certs/serverA.pem",
+-   cafile = "../luasec/certs/rootA.pem",
+-   verify = {"none"},   
+---   options = {"all", "no_sslv2"}
+-})
++local ctx = ssl.new_ctx {
++  protocol = "TLSv1_2_server",
++  key = "../luasec/certs/serverAkey.pem",
++  certificate = "../luasec/certs/serverA.pem",
++  cafile = "../luasec/certs/rootA.pem",
++  verify = ssl.none,
++  --   options = {"all", "no_sslv2"}
++
++}
+ 
+-function create_server(host, port, on_connection)
++function create_server (host, port, on_connection)
+   local server = uv.new_tcp()
+   uv.tcp_bind(server, host, port)
+-  uv.listen(server,64, function(self) 
+-    local client = uv.new_tcp()
+-    uv.accept(server, client)
+-    on_connection(client)
+-  end)
++  uv.listen(server, 64, function (self)
++      local client = uv.new_tcp()
++      uv.accept(server, client)
++      on_connection(client)
++    end)
+   return server
+ end
+ 
+ local p = print
+ local server = create_server(address.address, address.port, function (client)
+ 
+-	local scli = ssl.new_ssl(ctx,client,true)
+-	scli:handshake(function(scli)
+-		print('CONNECTED')
+-		count = count + 1
+-	end)
+-
+-	function scli:ondata(chunk)
+-		print("ondata", chunk)
+-		self:close()
+-	end
+-	function scli:onerror(err)
+-		print('onerr',err,ssl.error())
+-	end
+-
+-	function scli:onend()
+-		print("onend")
+-		uv.shutdown(client, function ()
+-		  print("onshutdown")
+-		  uv.close(client)
+-		end)
+-	end
+-
+-end)
++    local scli = ssl.new_ssl(ctx, client, true)
++    scli:handshake(function (scli)
++        print 'CONNECTED'
++        count = count + 1
++      end)
++
++    function scli:ondata (chunk)
++      print("ondata", chunk)
++      self:close()
++    end
++    function scli:onerror (err)
++      print('onerr', err, ssl.error())
++    end
++
++    function scli:onend ()
++      print "onend"
++      uv.shutdown(client, function ()
++          print "onshutdown"
++          uv.close(client)
++        end)
++    end
++  end)
+ 
+ local address = uv.tcp_getsockname(server)
+ p("server", server, address)
+ 
+-uv.run('default')
++uv.run 'default'
+ 
+-print("done")
++print "done"
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/sm2.lua luvi-src-v2.7.6/deps/lua-openssl/test/sm2.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/sm2.lua	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/sm2.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -0,0 +1,74 @@
++local openssl = require'openssl'
++local pkey = openssl.pkey
++local sm2  = openssl.sm2
++local unpack = unpack or table.unpack
++local helper = require'helper'
++
++_,_,opensslv = openssl.version(true)
++print(opensslv)
++if opensslv >= 0x10101007 and (not helper.libressl) then
++  print('Support SM2')
++  testSM2 = {}
++
++    function testSM2:testSM2()
++        local nec =  {'ec','SM2'}
++        local ec = pkey.new(unpack(nec))
++        local t = ec:parse().ec:parse('pem') --make basic table
++        assertEquals(type(t.curve_name), 'number')
++        assertStrContains(t.x.version, 'bn library')
++        assertStrContains(t.y.version, 'bn library')
++        assertStrContains(t.d.version, 'bn library')
++
++        local k1 = pkey.get_public(ec)
++        assert(not k1:is_private())
++        local t = k1:parse()
++        assert(t.bits==256)
++        assert(t.type=='ec')
++        assert(t.size==72)
++        local r = t.ec
++        t = r:parse(true) --make basic table
++        assertEquals(type(t.curve_name), 'number')
++        assertStrContains(t.x.version, 'bn library')
++        assertStrContains(t.y.version, 'bn library')
++        assertEquals(t.d, nil)
++        t = r:parse()
++        assertStrContains(tostring(t.pub_key), 'openssl.ec_point')
++        assertStrContains(tostring(t.group), 'openssl.ec_group')
++        local x, y = t.group:affine_coordinates(t.pub_key)
++        assertStrContains(x.version, 'bn library')
++        assertStrContains(y.version, 'bn library')
++        local ec2p = {
++            alg = 'ec',
++            ec_name = t.group:parse().curve_name,
++            x = x,
++            y = y,
++        }
++        local ec2 = pkey.new(ec2p)
++        assert(not ec2:is_private())
++
++        ec2p.d = ec:parse().ec:parse().priv_key
++        local ec2priv = pkey.new(ec2p)
++        assert(ec2priv:is_private())
++
++        local nec =  {'ec','SM2'}
++        local key1 = pkey.new(unpack(nec))
++        local key2 = pkey.new(unpack(nec))
++        local ec1 = key1:parse().ec
++        local ec2 = key2:parse().ec
++        local secret1 = ec1:compute_key(ec2)
++        local secret2 = ec2:compute_key(ec1)
++        assert(secret1==secret2)
++
++        local pub1 = pkey.get_public(key1)
++        local pub2 = pkey.get_public(key2)
++        pub1 = pub1:parse().ec
++        pub2 = pub2:parse().ec
++
++        secret1 = ec1:compute_key(pub2)
++        secret2 = ec2:compute_key(pub1)
++        assert(secret1==secret2)
++      end
++else
++  print('Skip SM2')
++end
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/test/test.lua luvi-src-v2.7.6/deps/lua-openssl/test/test.lua
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/test/test.lua	2019-02-13 11:31:40.293968598 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/test/test.lua	2019-02-13 11:53:24.321792707 +0100
+@@ -3,8 +3,7 @@ EXPORT_ASSERT_TO_GLOBALS = true
+ require'luaunit'
+ 
+ openssl.rand_load()
+-v = {openssl.version(true)}
+-print(openssl.version())
++print('VERSION:', openssl.version())
+ 
+ dofile('0.engine.lua')
+ dofile('0.misc.lua')
+@@ -23,11 +22,15 @@ dofile('5.x509_crl.lua')
+ dofile('5.x509.lua')
+ dofile('5.ts.lua')
+ dofile('6.pkcs7.lua')
++dofile('6.cms.lua')
+ dofile('7.pkcs12.lua')
+ dofile('8.ssl_options.lua')
+ dofile('8.ssl.lua')
++dofile('9.srp.lua')
++dofile('9.issue.lua')
+ dofile('rsa.lua')
+ dofile('ec.lua')
++dofile('sm2.lua')
+ 
+ --LuaUnit.verbosity = 0
+ LuaUnit.run()
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setenv_lua.sh luvi-src-v2.7.6/deps/lua-openssl/.travis/setenv_lua.sh
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setenv_lua.sh	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/.travis/setenv_lua.sh	2019-02-13 11:53:24.105128513 +0100
+@@ -1,3 +1,3 @@
+-export PATH=${PATH}:$HOME/.lua:$HOME/.local/bin:${TRAVIS_BUILD_DIR}/install/luarocks/bin
++export PATH=$HOME/.usr/bin:${PATH}
+ bash .travis/setup_lua.sh
+-eval `$HOME/.lua/luarocks path`
++eval `$HOME/.usr/luarocks path`
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setup_lua.sh luvi-src-v2.7.6/deps/lua-openssl/.travis/setup_lua.sh
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setup_lua.sh	2019-02-13 11:31:40.330635015 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/.travis/setup_lua.sh	2019-02-13 11:53:24.105128513 +0100
+@@ -8,16 +8,13 @@
+ 
+ set -eufo pipefail
+ 
+-LUAJIT_VERSION="2.0.4"
++LUAJIT_VERSION="2.0.5"
+ LUAJIT_BASE="LuaJIT-$LUAJIT_VERSION"
+ 
+ source .travis/platform.sh
+ 
+-LUA_HOME_DIR=$TRAVIS_BUILD_DIR/install/lua
+-
+-LR_HOME_DIR=$TRAVIS_BUILD_DIR/install/luarocks
+-
+-mkdir $HOME/.lua
++LUA_HOME_DIR=$HOME/.usr
++LR_HOME_DIR=$HOME/.usr
+ 
+ LUAJIT="no"
+ 
+@@ -54,10 +51,7 @@ if [ "$LUAJIT" == "yes" ]; then
+   fi
+ 
+   make && make install PREFIX="$LUA_HOME_DIR"
+-
+-  ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/luajit
+-  ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/lua;
+-
++  ln -s $HOME/.usr/bin/luajit $HOME/.usr/bin/lua
+ else
+ 
+   if [ "$LUA" == "lua5.1" ]; then
+@@ -67,18 +61,14 @@ else
+     curl http://www.lua.org/ftp/lua-5.2.4.tar.gz | tar xz
+     cd lua-5.2.4;
+   elif [ "$LUA" == "lua5.3" ]; then
+-    curl http://www.lua.org/ftp/lua-5.3.2.tar.gz | tar xz
+-    cd lua-5.3.2;
++    curl http://www.lua.org/ftp/lua-5.3.4.tar.gz | tar xz
++    cd lua-5.3.4;
+   fi
+ 
+   # Build Lua without backwards compatibility for testing
+   perl -i -pe 's/-DLUA_COMPAT_(ALL|5_2)//' src/Makefile
+   make $PLATFORM
+   make INSTALL_TOP="$LUA_HOME_DIR" install;
+-
+-  ln -s $LUA_HOME_DIR/bin/lua $HOME/.lua/lua
+-  ln -s $LUA_HOME_DIR/bin/luac $HOME/.lua/luac;
+-
+ fi
+ 
+ cd $TRAVIS_BUILD_DIR
+@@ -103,8 +93,6 @@ fi
+ 
+ make build && make install
+ 
+-ln -s $LR_HOME_DIR/bin/luarocks $HOME/.lua/luarocks
+-
+ cd $TRAVIS_BUILD_DIR
+ 
+ luarocks --version
+@@ -118,5 +106,5 @@ elif [ "$LUA" == "lua5.1" ]; then
+ elif [ "$LUA" == "lua5.2" ]; then
+   rm -rf lua-5.2.4;
+ elif [ "$LUA" == "lua5.3" ]; then
+-  rm -rf lua-5.3.2;
++  rm -rf lua-5.3.4;
+ fi
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setup_ssl.sh luvi-src-v2.7.6/deps/lua-openssl/.travis/setup_ssl.sh
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/.travis/setup_ssl.sh	1970-01-01 01:00:00.000000000 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/.travis/setup_ssl.sh	2019-02-13 11:53:24.105128513 +0100
+@@ -0,0 +1,52 @@
++#!/bin/sh
++if [ -z "$SSL" ]; then
++	echo '$SSL not set, use default openssl' >&2
++	exit 0
++fi
++
++source .travis/platform.sh
++
++case "$SSL" in
++openssl-0.9.*)
++	SSLURL=https://www.openssl.org/source/old/0.9.x/$SSL.tar.gz
++	;;
++openssl-1.0.0*)
++	SSLURL=https://www.openssl.org/source/old/1.0.0/$SSL.tar.gz
++	;;
++openssl-1.0.1*)
++	SSLURL=https://www.openssl.org/source/old/1.0.1/$SSL.tar.gz
++	;;
++openssl-*)
++	SSLURL=https://www.openssl.org/source/$SSL.tar.gz
++	;;
++libressl-*)
++	SSLURL=https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/$SSL.tar.gz
++	LIBRESSL=$SSL
++	;;
++*)
++  echo $SSL where to download?
++	exit 1
++	;;
++esac
++
++if [ ! -d "$HOME/opt/$SSL" ]; then
++	wget "$SSLURL" || exit 1
++	tar -xzf "$SSL.tar.gz" || exit 1
++	cd "$SSL" || exit 1
++	export OPENSSL_DIR=$HOME/.usr
++	if [ "$PLATFORM" == "linux" ]; then
++		./config shared --prefix="$OPENSSL_DIR" || exit 1
++	fi
++	if [ "$PLATFORM" == "macosx" ]; then
++		if [ -z "$LIBRESSL" ]; then
++			./Configure darwin64-x86_64-cc shared --prefix="$OPENSSL_DIR" || exit 1
++		else
++			./config --prefix="$OPENSSL_DIR" || exit 1
++		fi
++	fi
++	make && make install_sw || { rm -rf "$OPENSSL_DIR"; exit 1; }
++	cd ..
++fi
++
++# vim: ts=8 sw=8 noet tw=79 fen fdm=marker
++
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl/.travis.yml luvi-src-v2.7.6/deps/lua-openssl/.travis.yml
+--- luvi-src-v2.7.6.orig/deps/lua-openssl/.travis.yml	2019-02-13 11:31:40.277302045 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl/.travis.yml	2019-02-13 11:53:24.105128513 +0100
+@@ -3,17 +3,21 @@ language: c
+ sudo: required
+ env:
+   global:
+-    - LUAROCKS=2.2.2
++    - LUAROCKS=3.0.3
+   matrix:
+     - LUA=lua5.1
+-    - LUA=lua5.2
+-    - LUA=lua5.3
+-    - LUA=luajit
+-    
++    - LUA=lua5.1 SSL=openssl-1.0.2p
++    - LUA=lua5.2 SSL=libressl-2.8.0
++    - LUA=lua5.3 SSL=openssl-1.1.1
++    - LUA=luajit SSL=openssl-1.1.0i
++    - LUA=luajit2.1
+ os:
+   - linux
+   - osx
+ 
++matrix:
++  allow_failures:
++    - env: LUA=lua5.2 SSL=libressl-2.8.0
+ 
+ branches:
+   only:
+@@ -22,16 +26,20 @@ branches:
+ before_install:
+   - source .travis/setenv_lua.sh
+   - bash .travis/setup_uv.sh
++  - bash .travis/setup_ssl.sh
+   - git submodule update --init --recursive
+   - git submodule update --recursive
+ 
+-install: 
+-  - sudo $HOME/.lua/luarocks make rockspecs/openssl-scm-1.rockspec
++install:
++  - 'if [[ "$TRAVIS_OS_NAME" == "osx" && -z "$SSL" ]]; then sudo $HOME/.usr/bin/luarocks make openssl-scm-5.rockspec OPENSSL_DIR=/usr/local/opt/openssl; fi'
++  - 'if [[ "$TRAVIS_OS_NAME" == "osx" && -n "$SSL" ]]; then sudo $HOME/.usr/bin/luarocks make openssl-scm-5.rockspec OPENSSL_DIR=$HOME/.usr; fi'
++  - 'if [[ "$TRAVIS_OS_NAME" == "linux" && -z "$SSL" ]]; then sudo -H $HOME/.usr/bin/luarocks make openssl-scm-5.rockspec OPENSSL_DIR=/usr; fi'
++  - 'if [[ "$TRAVIS_OS_NAME" == "linux" && -n "$SSL" ]]; then sudo -H $HOME/.usr/bin/luarocks make openssl-scm-5.rockspec OPENSSL_DIR=$HOME/.usr; fi'
+ 
+-script: 
++script:
+   - cd test
+   - curl https://raw.githubusercontent.com/bluebird75/luaunit/master/luaunit.lua > luaunit.lua
+-  - lua test.lua
++  - lua -e "package.cpath='../?.so'" test.lua
+ 
+ notifications:
+   email:
+diff -purN luvi-src-v2.7.6.orig/deps/lua-openssl.cmake luvi-src-v2.7.6/deps/lua-openssl.cmake
+--- luvi-src-v2.7.6.orig/deps/lua-openssl.cmake	2019-02-13 11:31:40.273968734 +0100
++++ luvi-src-v2.7.6/deps/lua-openssl.cmake	2019-02-13 11:49:06.031947286 +0100
+@@ -1,19 +1,32 @@
+ set(LUA_OPENSSL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps/lua-openssl)
++if(DEFINED ENV{LUA_OPENSSL_DIR})
++  set(LUA_OPENSSL_DIR $ENV{LUA_OPENSSL_DIR})
++endif()
+ 
+ include_directories(
+-  ${LUA_OPENSSL_DIR}/deps
++  ${LUA_OPENSSL_DIR}/deps/auxiliar
++  ${LUA_OPENSSL_DIR}/deps/lua-compat
+   ${LUA_OPENSSL_DIR}/src
+ )
+ 
++add_definitions(
++  -DCOMPAT52_IS_LUAJIT
++)
++
+ if(WIN32)
++  add_definitions(
++    -DWIN32_LEAN_AND_MEAN
++    -D_CRT_SECURE_NO_WARNINGS
++  )
+ else()
+   find_package(Threads)
+   add_definitions(-DPTHREADS)
+ endif()
+ 
+ add_library(lua_openssl
++  ${LUA_OPENSSL_DIR}/deps/auxiliar/auxiliar.c
++  ${LUA_OPENSSL_DIR}/deps/auxiliar/subsidiar.c
+   ${LUA_OPENSSL_DIR}/src/asn1.c
+-  ${LUA_OPENSSL_DIR}/src/auxiliar.c
+   ${LUA_OPENSSL_DIR}/src/bio.c
+   ${LUA_OPENSSL_DIR}/src/callback.c
+   ${LUA_OPENSSL_DIR}/src/cipher.c
+@@ -40,6 +53,7 @@ add_library(lua_openssl
+   ${LUA_OPENSSL_DIR}/src/private.h
+   ${LUA_OPENSSL_DIR}/src/rsa.c
+   ${LUA_OPENSSL_DIR}/src/sk.h
++  ${LUA_OPENSSL_DIR}/src/srp.c
+   ${LUA_OPENSSL_DIR}/src/ssl.c
+   ${LUA_OPENSSL_DIR}/src/th-lock.c
+   ${LUA_OPENSSL_DIR}/src/util.c
+@@ -52,7 +66,7 @@ add_library(lua_openssl
+ )
+ 
+ set_target_properties(lua_openssl PROPERTIES
+-    COMPILE_FLAGS "-DLUA_LIB -DCOMPAT52_IS_LUAJIT")
++    COMPILE_FLAGS "-DLUA_LIB")
+ 
+ if (WithSharedOpenSSL)
+   target_link_libraries(lua_openssl ssl crypto)
-- 
2.20.1
