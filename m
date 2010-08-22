From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:08 +0200
Subject: [Buildroot] [PATCH 16/20] Add new patches Lua upstream patches
	rename old ones
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7c807d20f50b4e28547e0daf5a8f49d179ed2a56.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <francois.perrad@gadz.org>

Several new upstream patches against the latest version of Lua have
appeared on http://www.lua.org/bugs.html. This commit adds them to
Buildroot, and also renames the other patches to have a coherent patch
naming: lua-bugX, where X is the identifier of the bug as visible on
http://www.lua.org/bugs.html. Note that bug 1 and 2 are not associated
with patches, which explains why the first patch is labeled lua-bug3.

Fixes bug #2365.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ion.patch => lua-bug3-boolean_expression.patch} |    0
 .../lua/{lua-table.patch => lua-bug4-table.patch}  |    0
 ..._getfenv.patch => lua-bug5-debug_getfenv.patch} |    0
 ...ormance.patch => lua-bug6-gc_performance.patch} |    0
 package/lua/lua-bug7-string_format.patch           |   20 ++++++++++++++++++++
 package/lua/lua-bug8-io_read.patch                 |   14 ++++++++++++++
 6 files changed, 34 insertions(+), 0 deletions(-)
 rename package/lua/{lua-boolean_expression.patch => lua-bug3-boolean_expression.patch} (100%)
 rename package/lua/{lua-table.patch => lua-bug4-table.patch} (100%)
 rename package/lua/{lua-debug_getfenv.patch => lua-bug5-debug_getfenv.patch} (100%)
 rename package/lua/{lua-gc_performance.patch => lua-bug6-gc_performance.patch} (100%)
 create mode 100644 package/lua/lua-bug7-string_format.patch
 create mode 100644 package/lua/lua-bug8-io_read.patch

diff --git a/package/lua/lua-boolean_expression.patch b/package/lua/lua-bug3-boolean_expression.patch
similarity index 100%
rename from package/lua/lua-boolean_expression.patch
rename to package/lua/lua-bug3-boolean_expression.patch
diff --git a/package/lua/lua-table.patch b/package/lua/lua-bug4-table.patch
similarity index 100%
rename from package/lua/lua-table.patch
rename to package/lua/lua-bug4-table.patch
diff --git a/package/lua/lua-debug_getfenv.patch b/package/lua/lua-bug5-debug_getfenv.patch
similarity index 100%
rename from package/lua/lua-debug_getfenv.patch
rename to package/lua/lua-bug5-debug_getfenv.patch
diff --git a/package/lua/lua-gc_performance.patch b/package/lua/lua-bug6-gc_performance.patch
similarity index 100%
rename from package/lua/lua-gc_performance.patch
rename to package/lua/lua-bug6-gc_performance.patch
diff --git a/package/lua/lua-bug7-string_format.patch b/package/lua/lua-bug7-string_format.patch
new file mode 100644
index 0000000..68f3197
--- /dev/null
+++ b/package/lua/lua-bug7-string_format.patch
@@ -0,0 +1,20 @@
+--- lua-5.1.4.orig/src/lstrlib.c	2008/07/11 17:27:21	1.132.1.4
++++ lua-5.1.4/src/lstrlib.c	2010/05/14 15:12:53
+@@ -754,6 +754,7 @@
+ 
+ 
+ static int str_format (lua_State *L) {
++  int top = lua_gettop(L);
+   int arg = 1;
+   size_t sfl;
+   const char *strfrmt = luaL_checklstring(L, arg, &sfl);
+@@ -768,7 +769,8 @@
+     else { /* format item */
+       char form[MAX_FORMAT];  /* to store the format (`%...') */
+       char buff[MAX_ITEM];  /* to store the formatted item */
+-      arg++;
++      if (++arg > top)
++        luaL_argerror(L, arg, "no value");
+       strfrmt = scanformat(L, strfrmt, form);
+       switch (*strfrmt++) {
+         case 'c': {
diff --git a/package/lua/lua-bug8-io_read.patch b/package/lua/lua-bug8-io_read.patch
new file mode 100644
index 0000000..fb56bcf
--- /dev/null
+++ b/package/lua/lua-bug8-io_read.patch
@@ -0,0 +1,14 @@
+--- lua-5.1.4.orig/src/liolib.c	2008/01/18 17:47:43	2.73.1.3
++++ lua-5.1.4.orig/src/liolib.c	2010/05/14 15:29:29
+@@ -276,7 +276,10 @@
+     lua_pushnumber(L, d);
+     return 1;
+   }
+-  else return 0;  /* read fails */
++  else {
++    lua_pushnil(L);  /* "result" to be removed */
++    return 0;  /* read fails */
++  }
+ }
+ 
+ 
-- 
1.7.0.4
