From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 13:32:56 +0100
Subject: [Buildroot] [git commit] lua: bump to version 5.3.4
Message-ID: <20170130125320.7C52681F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a92c6806b5a3cd1645444803e53a7d18cd18e63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop MESSAGE call]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.3.3/0012-fix-loop-parser.patch       | 31 ----------------------
 package/lua/{5.3.3 => 5.3.4}/0001-root-path.patch  |  2 +-
 .../0002-shared-libs-for-lua.patch                 |  0
 package/lua/{5.3.3 => 5.3.4}/0004-lua-pc.patch     |  2 +-
 package/lua/{5.3.3 => 5.3.4}/0011-linenoise.patch  |  2 +-
 package/lua/lua.hash                               |  4 +--
 package/lua/lua.mk                                 |  2 +-
 7 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/package/lua/5.3.3/0012-fix-loop-parser.patch b/package/lua/5.3.3/0012-fix-loop-parser.patch
deleted file mode 100644
index 7b321e5..0000000
--- a/package/lua/5.3.3/0012-fix-loop-parser.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Expression list with four or more expressions in a 'for' loop can crash the interpreter.
-
-Fetch from: https://www.lua.org/bugs.html#5.3.3-1
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
---- a/src/lparser.c
-+++ b/src/lparser.c
-@@ -323,6 +323,8 @@
-       luaK_nil(fs, reg, extra);
-     }
-   }
-+  if (nexps > nvars)
-+    ls->fs->freereg -= nexps - nvars;  /* remove extra values */
- }
- 
- 
-@@ -1160,11 +1162,8 @@
-     int nexps;
-     checknext(ls, '=');
-     nexps = explist(ls, &e);
--    if (nexps != nvars) {
-+    if (nexps != nvars)
-       adjust_assign(ls, nvars, nexps, &e);
--      if (nexps > nvars)
--        ls->fs->freereg -= nexps - nvars;  /* remove extra values */
--    }
-     else {
-       luaK_setoneret(ls->fs, &e);  /* close last expression */
-       luaK_storevar(ls->fs, &lh->v, &e);
--- 
diff --git a/package/lua/5.3.3/0001-root-path.patch b/package/lua/5.3.4/0001-root-path.patch
similarity index 95%
rename from package/lua/5.3.3/0001-root-path.patch
rename to package/lua/5.3.4/0001-root-path.patch
index d8ef8d0..a44c55c 100644
--- a/package/lua/5.3.3/0001-root-path.patch
+++ b/package/lua/5.3.4/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -188,7 +188,7 @@
+@@ -200,7 +200,7 @@
 
  #else			/* }{ */
 
diff --git a/package/lua/5.3.3/0002-shared-libs-for-lua.patch b/package/lua/5.3.4/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.3/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.4/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.3/0004-lua-pc.patch b/package/lua/5.3.4/0004-lua-pc.patch
similarity index 98%
rename from package/lua/5.3.3/0004-lua-pc.patch
rename to package/lua/5.3.4/0004-lua-pc.patch
index edf7ec3..615a7db 100644
--- a/package/lua/5.3.3/0004-lua-pc.patch
+++ b/package/lua/5.3.4/0004-lua-pc.patch
@@ -14,7 +14,7 @@ Index: b/etc/lua.pc
 +# grep '^V=' ../Makefile
 +V= 5.3
 +# grep '^R=' ../Makefile
-+R= 5.3.3
++R= 5.3.4
 +
 +# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
 +prefix= /usr
diff --git a/package/lua/5.3.3/0011-linenoise.patch b/package/lua/5.3.4/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.3.3/0011-linenoise.patch
rename to package/lua/5.3.4/0011-linenoise.patch
index f3ced2b..574e6c8 100644
--- a/package/lua/5.3.3/0011-linenoise.patch
+++ b/package/lua/5.3.4/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -83,6 +83,13 @@
+@@ -85,6 +85,13 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 04459e9..32e7472 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,6 +1,6 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 703f75caa4fdf4a911c1a72e67a27498           lua-5.3.3.tar.gz
-sha1 a0341bc3d1415b814cc738b2ec01ae56045d64ef  lua-5.3.3.tar.gz
+md5 53a9c68bcc0eda58bdc2095ad5cdfc63           lua-5.3.4.tar.gz
+sha1 79790cfd40e09ba796b01a571d4d63b52b1cd950  lua-5.3.4.tar.gz
 
 md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
 sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 131b88d..5ef61e0 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.3
+LUA_VERSION = 5.3.4
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.4
