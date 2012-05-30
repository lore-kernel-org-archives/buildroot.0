From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 30 May 2012 09:20:28 +0200
Subject: [Buildroot] [PATCH] lua: bump version to 5.1.5
Message-ID: <CAB0FRsu0QDjFTzNNpZY-XeJou5COQaavaZnoZf7DvYiP4wivcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua-bug3-boolean_expression.patch |   48 -------------------------
 package/lua/lua-bug4-table.patch              |   22 ------------
 package/lua/lua-bug5-debug_getfenv.patch      |   10 ------
 package/lua/lua-bug6-gc_performance.patch     |   14 --------
 package/lua/lua-bug7-string_format.patch      |   20 -----------
 package/lua/lua-bug8-io_read.patch            |   14 --------
 package/lua/lua-root-path.patch               |    7 ++--
 package/lua/lua-shared-libs.patch             |   46 ++++++++++++------------
 package/lua/lua.mk                            |    2 +-
 9 files changed, 27 insertions(+), 156 deletions(-)
 delete mode 100644 package/lua/lua-bug3-boolean_expression.patch
 delete mode 100644 package/lua/lua-bug4-table.patch
 delete mode 100644 package/lua/lua-bug5-debug_getfenv.patch
 delete mode 100644 package/lua/lua-bug6-gc_performance.patch
 delete mode 100644 package/lua/lua-bug7-string_format.patch
 delete mode 100644 package/lua/lua-bug8-io_read.patch

diff --git a/package/lua/lua-bug3-boolean_expression.patch
b/package/lua/lua-bug3-boolean_expression.patch
deleted file mode 100644
index f04eb85..0000000
--- a/package/lua/lua-bug3-boolean_expression.patch
+++ /dev/null
@@ -1,48 +0,0 @@
---- lua-5.1.4.orig/src/lcode.c	2007/12/28 15:32:23	2.25.1.3
-+++ lua-5.1.4/src/lcode.c	2009/06/15 14:07:34
-@@ -544,15 +544,18 @@
-       pc = NO_JUMP;  /* always true; do nothing */
-       break;
-     }
--    case VFALSE: {
--      pc = luaK_jump(fs);  /* always jump */
--      break;
--    }
-     case VJMP: {
-       invertjump(fs, e);
-       pc = e->u.s.info;
-       break;
-     }
-+    case VFALSE: {
-+      if (!hasjumps(e)) {
-+        pc = luaK_jump(fs);  /* always jump */
-+        break;
-+      }
-+      /* else go through */
-+    }
-     default: {
-       pc = jumponcond(fs, e, 0);
-       break;
-@@ -572,14 +575,17 @@
-       pc = NO_JUMP;  /* always false; do nothing */
-       break;
-     }
--    case VTRUE: {
--      pc = luaK_jump(fs);  /* always jump */
--      break;
--    }
-     case VJMP: {
-       pc = e->u.s.info;
-       break;
-     }
-+    case VTRUE: {
-+      if (!hasjumps(e)) {
-+        pc = luaK_jump(fs);  /* always jump */
-+        break;
-+      }
-+      /* else go through */
-+    }
-     default: {
-       pc = jumponcond(fs, e, 1);
-       break;
-
diff --git a/package/lua/lua-bug4-table.patch b/package/lua/lua-bug4-table.patch
deleted file mode 100644
index 9ffc1bb..0000000
--- a/package/lua/lua-bug4-table.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- lua-5.1.4.orig/src/lvm.c	2007/12/28 15:32:23	2.63.1.3
-+++ lua-5.1.4/src/lvm.c	2009/07/01 20:36:59
-@@ -133,6 +133,7 @@
-
- void luaV_settable (lua_State *L, const TValue *t, TValue *key, StkId val) {
-   int loop;
-+  TValue temp;
-   for (loop = 0; loop < MAXTAGLOOP; loop++) {
-     const TValue *tm;
-     if (ttistable(t)) {  /* `t' is a table? */
-@@ -152,7 +153,9 @@
-       callTM(L, tm, t, key, val);
-       return;
-     }
--    t = tm;  /* else repeat with `tm' */
-+    /* else repeat with `tm' */
-+    setobj(L, &temp, tm);  /* avoid pointing inside table (may rehash) */
-+    t = &temp;
-   }
-   luaG_runerror(L, "loop in settable");
- }
-
diff --git a/package/lua/lua-bug5-debug_getfenv.patch
b/package/lua/lua-bug5-debug_getfenv.patch
deleted file mode 100644
index fce4d47..0000000
--- a/package/lua/lua-bug5-debug_getfenv.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- lua-5.1.4.orig/src/ldblib.c	2007/12/28 15:32:23	2.63.1.3
-+++ lua-5.1.4/src/ldblib.c	2010/02/23 12:36:59
-@@ -45,6 +45,7 @@
-
-
- static int db_getfenv (lua_State *L) {
-+  luaL_checkany(L, 1);
-   lua_getfenv(L, 1);
-   return 1;
- }
diff --git a/package/lua/lua-bug6-gc_performance.patch
b/package/lua/lua-bug6-gc_performance.patch
deleted file mode 100644
index 3c78525..0000000
--- a/package/lua/lua-bug6-gc_performance.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- lua-5.1.4.orig/src/llex.c	2007/12/28 15:32:23	2.63.1.3
-+++ lua-5.1.4/src/llex.c	2010/02/23 12:36:59
-@@ -118,8 +118,10 @@
-   lua_State *L = ls->L;
-   TString *ts = luaS_newlstr(L, str, l);
-   TValue *o = luaH_setstr(L, ls->fs->h, ts);  /* entry for `str' */
--  if (ttisnil(o))
-+  if (ttisnil(o)) {
-     setbvalue(o, 1);  /* make sure `str' will not be collected */
-+    luaC_checkGC(L);
-+  }
-   return ts;
- }
-
diff --git a/package/lua/lua-bug7-string_format.patch
b/package/lua/lua-bug7-string_format.patch
deleted file mode 100644
index 68f3197..0000000
--- a/package/lua/lua-bug7-string_format.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- lua-5.1.4.orig/src/lstrlib.c	2008/07/11 17:27:21	1.132.1.4
-+++ lua-5.1.4/src/lstrlib.c	2010/05/14 15:12:53
-@@ -754,6 +754,7 @@
-
-
- static int str_format (lua_State *L) {
-+  int top = lua_gettop(L);
-   int arg = 1;
-   size_t sfl;
-   const char *strfrmt = luaL_checklstring(L, arg, &sfl);
-@@ -768,7 +769,8 @@
-     else { /* format item */
-       char form[MAX_FORMAT];  /* to store the format (`%...') */
-       char buff[MAX_ITEM];  /* to store the formatted item */
--      arg++;
-+      if (++arg > top)
-+        luaL_argerror(L, arg, "no value");
-       strfrmt = scanformat(L, strfrmt, form);
-       switch (*strfrmt++) {
-         case 'c': {
diff --git a/package/lua/lua-bug8-io_read.patch
b/package/lua/lua-bug8-io_read.patch
deleted file mode 100644
index fb56bcf..0000000
--- a/package/lua/lua-bug8-io_read.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- lua-5.1.4.orig/src/liolib.c	2008/01/18 17:47:43	2.73.1.3
-+++ lua-5.1.4.orig/src/liolib.c	2010/05/14 15:29:29
-@@ -276,7 +276,10 @@
-     lua_pushnumber(L, d);
-     return 1;
-   }
--  else return 0;  /* read fails */
-+  else {
-+    lua_pushnil(L);  /* "result" to be removed */
-+    return 0;  /* read fails */
-+  }
- }
-
-
diff --git a/package/lua/lua-root-path.patch b/package/lua/lua-root-path.patch
index a00b99e..3addce1 100644
--- a/package/lua/lua-root-path.patch
+++ b/package/lua/lua-root-path.patch
@@ -1,6 +1,6 @@
-diff -Naur lua-5.1.4.org/src/luaconf.h lua-5.1.4/src/luaconf.h
---- lua-5.1.4.org/src/luaconf.h	2008-02-11 17:25:08.000000000 +0100
-+++ lua-5.1.4/src/luaconf.h	2009-11-24 23:19:15.052817379 +0100
+diff -Naur lua-5.1.5.orig/src/luaconf.h lua-5.1.5/src/luaconf.h
+--- lua-5.1.5.orig/src/luaconf.h	2012-05-29 23:57:20.912087480 +0200
++++ lua-5.1.5/src/luaconf.h	2012-05-29 23:59:04.744090260 +0200
 @@ -94,9 +94,9 @@
  	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"

@@ -14,4 +14,3 @@ diff -Naur lua-5.1.4.org/src/luaconf.h lua-5.1.4/src/luaconf.h
  #define LUA_PATH_DEFAULT  \
  		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" \
  		            LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"
-
diff --git a/package/lua/lua-shared-libs.patch
b/package/lua/lua-shared-libs.patch
index d24015c..4d1ac30 100644
--- a/package/lua/lua-shared-libs.patch
+++ b/package/lua/lua-shared-libs.patch
@@ -1,6 +1,6 @@
-diff -Naur lua-5.1.4.org/Makefile lua-5.1.4/Makefile
---- lua-5.1.4.org/Makefile	2009-11-24 23:49:28.232820455 +0100
-+++ lua-5.1.4/Makefile	2009-11-24 23:50:35.452817115 +0100
+diff -Naur lua-5.1.5.orig/Makefile lua-5.1.5/Makefile
+--- lua-5.1.5.orig/Makefile	2012-05-29 23:57:20.928087480 +0200
++++ lua-5.1.5/Makefile	2012-05-30 00:03:55.960098059 +0200
 @@ -43,7 +43,7 @@
  # What to install.
  TO_BIN= lua luac
@@ -18,9 +18,9 @@ diff -Naur lua-5.1.4.org/Makefile lua-5.1.4/Makefile
  	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)

  ranlib:
-diff -Naur lua-5.1.4.org/src/ldo.h lua-5.1.4/src/ldo.h
---- lua-5.1.4.org/src/ldo.h	2009-11-24 23:49:28.232820455 +0100
-+++ lua-5.1.4/src/ldo.h	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/ldo.h lua-5.1.5/src/ldo.h
+--- lua-5.1.5.orig/src/ldo.h	2012-05-29 23:57:20.924087480 +0200
++++ lua-5.1.5/src/ldo.h	2012-05-30 00:05:58.172101331 +0200
 @@ -46,7 +46,7 @@
  LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
  LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
@@ -30,9 +30,9 @@ diff -Naur lua-5.1.4.org/src/ldo.h lua-5.1.4/src/ldo.h

  LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
  LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
-diff -Naur lua-5.1.4.org/src/lfunc.h lua-5.1.4/src/lfunc.h
---- lua-5.1.4.org/src/lfunc.h	2009-11-24 23:49:28.236815431 +0100
-+++ lua-5.1.4/src/lfunc.h	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/lfunc.h lua-5.1.5/src/lfunc.h
+--- lua-5.1.5.orig/src/lfunc.h	2012-05-29 23:57:20.924087480 +0200
++++ lua-5.1.5/src/lfunc.h	2012-05-30 00:07:03.036103068 +0200
 @@ -18,7 +18,7 @@
                           cast(int, sizeof(TValue *)*((n)-1)))

@@ -42,9 +42,9 @@ diff -Naur lua-5.1.4.org/src/lfunc.h lua-5.1.4/src/lfunc.h
  LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
  LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
  LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
-diff -Naur lua-5.1.4.org/src/lmem.h lua-5.1.4/src/lmem.h
---- lua-5.1.4.org/src/lmem.h	2009-11-24 23:49:28.236815431 +0100
-+++ lua-5.1.4/src/lmem.h	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/lmem.h lua-5.1.5/src/lmem.h
+--- lua-5.1.5.orig/src/lmem.h	2012-05-29 23:57:20.916087479 +0200
++++ lua-5.1.5/src/lmem.h	2012-05-30 00:08:15.932105019 +0200
 @@ -38,9 +38,9 @@
     ((v)=cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))

@@ -57,9 +57,9 @@ diff -Naur lua-5.1.4.org/src/lmem.h lua-5.1.4/src/lmem.h
  LUAI_FUNC void *luaM_growaux_ (lua_State *L, void *block, int *size,
                                 size_t size_elem, int limit,
                                 const char *errormsg);
-diff -Naur lua-5.1.4.org/src/lstring.h lua-5.1.4/src/lstring.h
---- lua-5.1.4.org/src/lstring.h	2009-11-24 23:49:28.236815431 +0100
-+++ lua-5.1.4/src/lstring.h	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/lstring.h lua-5.1.5/src/lstring.h
+--- lua-5.1.5.orig/src/lstring.h	2012-05-29 23:57:20.916087479 +0200
++++ lua-5.1.5/src/lstring.h	2012-05-30 00:09:09.036106444 +0200
 @@ -25,7 +25,7 @@

  LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
@@ -69,9 +69,9 @@ diff -Naur lua-5.1.4.org/src/lstring.h lua-5.1.4/src/lstring.h


  #endif
-diff -Naur lua-5.1.4.org/src/lundump.h lua-5.1.4/src/lundump.h
---- lua-5.1.4.org/src/lundump.h	2009-11-24 23:49:28.232820455 +0100
-+++ lua-5.1.4/src/lundump.h	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/lundump.h lua-5.1.5/src/lundump.h
+--- lua-5.1.5.orig/src/lundump.h	2012-05-29 23:57:20.920087479 +0200
++++ lua-5.1.5/src/lundump.h	2012-05-30 00:10:20.352108352 +0200
 @@ -17,7 +17,7 @@
  LUAI_FUNC void luaU_header (char* h);

@@ -81,14 +81,14 @@ diff -Naur lua-5.1.4.org/src/lundump.h
lua-5.1.4/src/lundump.h

  #ifdef luac_c
  /* print one chunk; from print.c */
-diff -Naur lua-5.1.4.org/src/Makefile lua-5.1.4/src/Makefile
---- lua-5.1.4.org/src/Makefile	2009-11-24 23:49:28.236815431 +0100
-+++ lua-5.1.4/src/Makefile	2009-11-24 23:49:54.244818140 +0100
+diff -Naur lua-5.1.5.orig/src/Makefile lua-5.1.5/src/Makefile
+--- lua-5.1.5.orig/src/Makefile	2012-05-29 23:57:20.916087479 +0200
++++ lua-5.1.5/src/Makefile	2012-05-30 00:15:43.976117018 +0200
 @@ -23,6 +23,7 @@
  PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris

  LUA_A=	liblua.a
-+LUA_SO= liblua.so
++LUA_SO=	liblua.so
  CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
  	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
  	lundump.o lvm.o lzio.o
@@ -114,7 +114,7 @@ diff -Naur lua-5.1.4.org/src/Makefile lua-5.1.4/src/Makefile
 +so:	$(ALL_SO)
 +
  $(LUA_A): $(CORE_O) $(LIB_O)
- 	$(AR) $@ $?
+ 	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
  	$(RANLIB) $@

 -$(LUA_T): $(LUA_O) $(LUA_A)
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aa0b4bf..baa459c 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,7 +4,7 @@
 #
 #############################################################

-LUA_VERSION = 5.1.4
+LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES

-- 
1.7.9.5
