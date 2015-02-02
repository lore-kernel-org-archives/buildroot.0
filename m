From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 15:53:42 +0100
Subject: [Buildroot] [git commit] lua-modules: fix dependencies with version
	of lua
Message-ID: <20150202152924.09F66807FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb8441b861cb9ceaaefa13083aa75322af2c73b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lbase64/Config.in            |    5 +++--
 package/lrandom/lrandom.mk           |    2 +-
 package/lua-msgpack-native/Config.in |    5 +++--
 package/luaposix/Config.in           |    4 ++++
 package/lunit/Config.in              |    5 +++--
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index 48d3fdb..5ef91bf 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_2
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  A base64 library for Lua
 
 	  http://luaforge.net/projects/lbase64/
 
 comment "lbase64 needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
+	depends on !BR2_PACKAGE_LUA_5_1
+	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
index f0ee1e9..09b62c9 100644
--- a/package/lrandom/lrandom.mk
+++ b/package/lrandom/lrandom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
 LRANDOM_VERSION = 20120430.52-1
 else
 LRANDOM_VERSION = 20120430.51-1
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index c7b3373..3837228 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_2
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  This is a native, C language implementation of msgpack
 	  (http://msgpack.org) library/protocol for Lua language
@@ -9,4 +9,5 @@ config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	  https://github.com/kengonakajima/lua-msgpack-native
 
 comment "lua-msgpack-native needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
+	depends on !BR2_PACKAGE_LUA_5_1
+	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index a40c3f9..439dc42 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_3
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
@@ -13,3 +14,6 @@ config BR2_PACKAGE_LUAPOSIX
 	  APIs
 
 	  https://github.com/luaposix/luaposix
+
+comment "luaposix needs a Lua 5.1/5.2 interpreter"
+	depends on BR2_PACKAGE_LUA_5_3
diff --git a/package/lunit/Config.in b/package/lunit/Config.in
index b3620ef..d6c2c6b 100644
--- a/package/lunit/Config.in
+++ b/package/lunit/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LUNIT
 	bool "lunit"
-	depends on !BR2_PACKAGE_LUA_5_2
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  A unit testing framework for Lua.
 
 	  http://www.mroth.net/lunit/
 
 comment "lunit needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
+	depends on !BR2_PACKAGE_LUA_5_1
+	depends on !BR2_PACKAGE_LUAJIT
