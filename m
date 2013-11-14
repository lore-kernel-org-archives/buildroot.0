From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 14 Nov 2013 21:17:26 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 07/10] lua-cjson: restore
	official name
In-Reply-To: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384460249-32410-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(need by LuaRocks)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy               |    7 +++++++
 package/Config.in              |    2 +-
 package/lua-cjson/Config.in    |   14 ++++++++++++++
 package/lua-cjson/lua-cjson.mk |   34 ++++++++++++++++++++++++++++++++++
 package/luacjson/Config.in     |   14 --------------
 package/luacjson/luacjson.mk   |   35 -----------------------------------
 6 files changed, 56 insertions(+), 50 deletions(-)
 create mode 100644 package/lua-cjson/Config.in
 create mode 100644 package/lua-cjson/lua-cjson.mk
 delete mode 100644 package/luacjson/Config.in
 delete mode 100644 package/luacjson/luacjson.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 587afe1..52bcf0a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -98,6 +98,13 @@ comment "build, or run, in unpredictable ways.               "
 comment "----------------------------------------------------"
 endif
 
+config BR2_PACKAGE_LUACJSON
+	bool "luacjson"
+	select BR2_PACKAGE_LUA_CJSON
+	select BR2_LEGACY
+	help
+	  The package luacjson was renamed lua-cjson
+
 ###############################################################################
 comment "Legacy options removed in 2013.11"
 
diff --git a/package/Config.in b/package/Config.in
index c45f7f6..59ddd19 100644
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
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
new file mode 100644
index 0000000..8129fab
--- /dev/null
+++ b/package/lua-cjson/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LUA_CJSON
+	bool "lua-cjson"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  The Lua CJSON module provides JSON support for Lua. It features:
+	  - Fast, standards compliant encoding/parsing routines
+	  - Full support for JSON with UTF-8, including decoding surrogate pairs
+	  - Optional run-time support for common exceptions to the JSON
+	    specification (infinity, NaN, ...)
+	  - No dependencies on other libraries
+
+	  (C-module)
+
+	  http://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
new file mode 100644
index 0000000..0969547
--- /dev/null
+++ b/package/lua-cjson/lua-cjson.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# lua-cjson
+#
+################################################################################
+
+LUA_CJSON_VERSION       = 2.1.0
+LUA_CJSON_SITE          = http://www.kyne.com.au/~mark/software/download
+LUA_CJSON_DEPENDENCIES  = luainterpreter
+LUA_CJSON_LICENSE       = MIT
+LUA_CJSON_LICENSE_FILES = LICENSE
+
+define LUA_CJSON_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS)"   \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)"           \
+		LD="$(TARGET_LD)"           \
+		PREFIX=$(STAGING_DIR)/usr
+endef
+
+define LUA_CJSON_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
+endef
+
+define LUA_CJSON_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define LUA_CJSON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/cjson.so
+endef
+
+$(eval $(generic-package))
diff --git a/package/luacjson/Config.in b/package/luacjson/Config.in
deleted file mode 100644
index d3665c0..0000000
--- a/package/luacjson/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_LUACJSON
-	bool "luacjson"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
-	help
-	  The Lua CJSON module provides JSON support for Lua. It features:
-	  - Fast, standards compliant encoding/parsing routines
-	  - Full support for JSON with UTF-8, including decoding surrogate pairs
-	  - Optional run-time support for common exceptions to the JSON
-	    specification (infinity, NaN, ...)
-	  - No dependencies on other libraries
-
-	  (C-module)
-
-	  http://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
deleted file mode 100644
index f973278..0000000
--- a/package/luacjson/luacjson.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# luacjson
-#
-################################################################################
-
-LUACJSON_VERSION       = 2.1.0
-LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
-LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES  = luainterpreter
-LUACJSON_LICENSE       = MIT
-LUACJSON_LICENSE_FILES = LICENSE
-
-define LUACJSON_BUILD_CMDS
-	$(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS)"   \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)"           \
-		LD="$(TARGET_LD)"           \
-		PREFIX=$(STAGING_DIR)/usr
-endef
-
-define LUACJSON_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
-endef
-
-define LUACJSON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-define LUACJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/cjson.so
-endef
-
-$(eval $(generic-package))
-- 
1.7.9.5
