From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 15 Nov 2013 14:07:36 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 07/10] lua-cjson: restore
	official name
In-Reply-To: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384520859-3189-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(need by LuaRocks)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                                   |   10 ++++++++++
 package/Config.in                                  |    2 +-
 package/{luacjson => lua-cjson}/Config.in          |    4 ++--
 .../luacjson.mk => lua-cjson/lua-cjson.mk}         |   21 ++++++++++----------
 4 files changed, 23 insertions(+), 14 deletions(-)
 rename package/{luacjson => lua-cjson}/Config.in (90%)
 rename package/{luacjson/luacjson.mk => lua-cjson/lua-cjson.mk} (56%)

diff --git a/Config.in.legacy b/Config.in.legacy
index 587afe1..a7fa821 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,16 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2014.02"
+
+config BR2_PACKAGE_LUACJSON
+	bool "luacjson has been replaced by lua-cjson"
+	select BR2_PACKAGE_LUA_CJSON
+	select BR2_LEGACY
+	help
+	  The option has been renamed BR2_PACKAGE_LUA_CJSON.
+
+###############################################################################
 comment "Legacy options removed in 2013.11"
 
 config BR2_PACKAGE_QT_JAVASCRIPTCORE
diff --git a/package/Config.in b/package/Config.in
index a8ebb27..ea8d524 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -361,7 +361,6 @@ source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/luabitop/Config.in"
-source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
@@ -370,6 +369,7 @@ source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
 source "package/luasql/Config.in"
+source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/orbit/Config.in"
diff --git a/package/luacjson/Config.in b/package/lua-cjson/Config.in
similarity index 90%
rename from package/luacjson/Config.in
rename to package/lua-cjson/Config.in
index d3665c0..8129fab 100644
--- a/package/luacjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LUACJSON
-	bool "luacjson"
+config BR2_PACKAGE_LUA_CJSON
+	bool "lua-cjson"
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
diff --git a/package/luacjson/luacjson.mk b/package/lua-cjson/lua-cjson.mk
similarity index 56%
rename from package/luacjson/luacjson.mk
rename to package/lua-cjson/lua-cjson.mk
index f973278..0969547 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -1,17 +1,16 @@
 ################################################################################
 #
-# luacjson
+# lua-cjson
 #
 ################################################################################
 
-LUACJSON_VERSION       = 2.1.0
-LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
-LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES  = luainterpreter
-LUACJSON_LICENSE       = MIT
-LUACJSON_LICENSE_FILES = LICENSE
+LUA_CJSON_VERSION       = 2.1.0
+LUA_CJSON_SITE          = http://www.kyne.com.au/~mark/software/download
+LUA_CJSON_DEPENDENCIES  = luainterpreter
+LUA_CJSON_LICENSE       = MIT
+LUA_CJSON_LICENSE_FILES = LICENSE
 
-define LUACJSON_BUILD_CMDS
+define LUA_CJSON_BUILD_CMDS
 	$(MAKE) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS)"   \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -20,15 +19,15 @@ define LUACJSON_BUILD_CMDS
 		PREFIX=$(STAGING_DIR)/usr
 endef
 
-define LUACJSON_INSTALL_TARGET_CMDS
+define LUA_CJSON_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
 endef
 
-define LUACJSON_CLEAN_CMDS
+define LUA_CJSON_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-define LUACJSON_UNINSTALL_TARGET_CMDS
+define LUA_CJSON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/cjson.so
 endef
 
-- 
1.7.9.5
