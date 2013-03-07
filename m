From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  7 Mar 2013 08:17:21 +0100
Subject: [Buildroot] [v3 2/3] luainterpreter: create virtual package
In-Reply-To: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
References: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1362640642-9951-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

luainterpreter is lua or luajit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                |    1 +
 package/lua-msgpack-native/Config.in             |    1 +
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/lua/Config.in                            |    1 +
 package/luacjson/Config.in                       |    1 +
 package/luacjson/luacjson.mk                     |    2 +-
 package/luaexpat/Config.in                       |    1 +
 package/luaexpat/luaexpat.mk                     |    2 +-
 package/luafilesystem/Config.in                  |    1 +
 package/luafilesystem/luafilesystem.mk           |    2 +-
 package/luainterpreter/Config.in                 |    2 ++
 package/luainterpreter/luainterpreter.mk         |   17 +++++++++++++++++
 package/luajit/Config.in                         |    1 +
 package/luasocket/Config.in                      |    1 +
 package/luasocket/luasocket.mk                   |    2 +-
 package/rings/Config.in                          |    1 +
 package/rings/rings.mk                           |    2 +-
 17 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 package/luainterpreter/Config.in
 create mode 100644 package/luainterpreter/luainterpreter.mk

diff --git a/package/Config.in b/package/Config.in
index faee5c3..b76da36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -292,6 +292,7 @@ source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
+source "package/luainterpreter/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 8894ee5..1014298 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  This is a native, C language implementation of msgpack
 	  (http://msgpack.org) library/protocol for Lua language
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 97ce83c..7b9329b 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -5,7 +5,7 @@
 #############################################################
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
-LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
+LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
 
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 4166730..cc62dee 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
+	select BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
diff --git a/package/luacjson/Config.in b/package/luacjson/Config.in
index 8a5624f..d3665c0 100644
--- a/package/luacjson/Config.in
+++ b/package/luacjson/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUACJSON
 	bool "luacjson"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
 	  - Fast, standards compliant encoding/parsing routines
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index 1f79d5d..69393e9 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -6,7 +6,7 @@
 LUACJSON_VERSION       = 2.1.0
 LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
 LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES  = lua
+LUACJSON_DEPENDENCIES  = luainterpreter
 LUACJSON_LICENSE       = MIT
 LUACJSON_LICENSE_FILES = LICENSE
 
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 186c5c9..f8db318 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 2d4c517..7c46fda 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -6,7 +6,7 @@
 
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
-LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_DEPENDENCIES = luainterpreter expat
 LUAEXPAT_LICENSE      = MIT
 
 
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 7c130f8..489ebf3 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 8553212..6678af0 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -6,7 +6,7 @@
 
 LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
-LUAFILESYSTEM_DEPENDENCIES = lua
+LUAFILESYSTEM_DEPENDENCIES = luainterpreter
 LUAFILESYSTEM_LICENSE = MIT
 
 ifeq ($(BR2_LARGEFILE),y)
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
new file mode 100644
index 0000000..d85d7e8
--- /dev/null
+++ b/package/luainterpreter/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HAS_LUA_INTERPRETER
+	bool
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
new file mode 100644
index 0000000..40c66aa
--- /dev/null
+++ b/package/luainterpreter/luainterpreter.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# Virtual package for luainterpreter
+#
+#############################################################
+
+LUAINTERPRETER_SOURCE =
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+LUAINTERPRETER_DEPENDENCIES = lua
+endif
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUAINTERPRETER_DEPENDENCIES = luajit
+endif
+
+$(eval $(generic-package))
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 23b2650..97013e4 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
+	select BR2_PACKAGE_HAS_LUA_INTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 4526303..619d649 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 45fb9a3..7c1fc36 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -6,7 +6,7 @@
 
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
-LUASOCKET_DEPENDENCIES = lua
+LUASOCKET_DEPENDENCIES = luainterpreter
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = LICENSE
 
diff --git a/package/rings/Config.in b/package/rings/Config.in
index d1f1efe..b1d41f3 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  Provides a way to create new Lua states from within Lua.
 
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index e2a2bd7..5823857 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -6,7 +6,7 @@
 
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
-RINGS_DEPENDENCIES = lua
+RINGS_DEPENDENCIES = luainterpreter
 RINGS_LICENSE = MIT
 
 define RINGS_BUILD_CMDS
-- 
1.7.9.5
