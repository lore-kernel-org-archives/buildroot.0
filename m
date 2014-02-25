From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:08 +0100
Subject: [Buildroot] [PATCH 08/10] package/luainterpreter: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393365231.git.yann.morin.1998@free.fr>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
Message-ID: <408a8a90d6451d767048dc55c2af9194ff464171.1393365231.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
---
 package/Config.in                        | 2 +-
 package/lbase64/Config.in                | 2 +-
 package/lua-cjson/Config.in              | 2 +-
 package/lua-ev/Config.in                 | 2 +-
 package/lua-msgpack-native/Config.in     | 2 +-
 package/lua/Config.in                    | 4 ++--
 package/luaexpat/Config.in               | 2 +-
 package/luafilesystem/Config.in          | 2 +-
 package/luainterpreter/Config.in         | 6 +++---
 package/luainterpreter/luainterpreter.mk | 5 +----
 package/luajit/Config.in                 | 4 ++--
 package/luaposix/Config.in               | 2 +-
 package/luasec/Config.in                 | 2 +-
 package/luasocket/Config.in              | 2 +-
 package/luasql-sqlite3/Config.in         | 2 +-
 package/rings/Config.in                  | 2 +-
 16 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fca61d6..3a23f29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -362,7 +362,7 @@ source "package/jimtcl/Config.in"
 source "package/lua/Config.in"
 source "package/luainterpreter/Config.in"
 source "package/luajit/Config.in"
-if BR2_PACKAGE_HAS_LUA_INTERPRETER
+if BR2_PACKAGE_HAS_LUAINTERPRETER
 menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index 4593ab9..48d3fdb 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  A base64 library for Lua
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 8129fab..1f4c7c7 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
 	  - Fast, standards compliant encoding/parsing routines
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 28da114..74b5dc7 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LIBEV
 	depends on !(BR2_avr32 || BR2_bfin) # libev
 	help
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 498b30c..c7b3373 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  This is a native, C language implementation of msgpack
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 2afb7c5..0e31858 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
-	select BR2_PACKAGE_HAS_LUA_INTERPRETER
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LUA
 
 if BR2_PACKAGE_LUA
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	default "lua"
 
 choice
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 3394780..463019d 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 489ebf3..50e7975 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index a05bde1..e89a9b8 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -1,9 +1,9 @@
-config BR2_PACKAGE_HAS_LUA_INTERPRETER
+config BR2_PACKAGE_HAS_LUAINTERPRETER
 	bool
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	string
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index c37d621..2598550 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -4,9 +4,6 @@
 #
 #############################################################
 
-LUAINTERPRETER_SOURCE =
-LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
-
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 9c4ecc3..95c2e0f 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-	select BR2_PACKAGE_HAS_LUA_INTERPRETER
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LUAJIT
 
 if BR2_PACKAGE_LUAJIT
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	default "luajit"
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index a95c825..04269fb 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 48aa766..aa75e05 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUASEC
 	bool "luasec"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 619d649..45f959e 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index fca6582..3bd73f3 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUASQL_SQLITE3
 	bool "luasql-sqlite3"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
diff --git a/package/rings/Config.in b/package/rings/Config.in
index b1d41f3..87ade07 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Provides a way to create new Lua states from within Lua.
 
-- 
1.8.3.2
