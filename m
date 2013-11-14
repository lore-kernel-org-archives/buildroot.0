From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 14 Nov 2013 14:49:54 +0100
Subject: [Buildroot] [pkg-luarocks infra V2 08/10] luasql-sqlite3: renamed
	like with LuaRocks
In-Reply-To: <1384436996-25525-1-git-send-email-francois.perrad@gadz.org>
References: <1384436996-25525-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384436996-25525-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

before infrastructure conversion
---
 package/Config.in                        |    2 +-
 package/luasql-sqlite3/Config.in         |    8 +++++++
 package/luasql-sqlite3/luasql-sqlite3.mk |   33 ++++++++++++++++++++++++++
 package/luasql/Config.in                 |   22 -----------------
 package/luasql/luasql.mk                 |   38 ------------------------------
 5 files changed, 42 insertions(+), 61 deletions(-)
 create mode 100644 package/luasql-sqlite3/Config.in
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
 delete mode 100644 package/luasql/Config.in
 delete mode 100644 package/luasql/luasql.mk

diff --git a/package/Config.in b/package/Config.in
index 59ddd19..9c926db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -368,7 +368,7 @@ source "package/luafilesystem/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
-source "package/luasql/Config.in"
+source "package/luasql-sqlite3/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
new file mode 100644
index 0000000..3876f3d
--- /dev/null
+++ b/package/luasql-sqlite3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUASQL_SQLITE3
+	bool "luasql-sqlite3"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  LuaSQL is a simple interface from Lua to a DBMS.
+
+	  http://www.keplerproject.org/luasql
+
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
new file mode 100644
index 0000000..b114f02
--- /dev/null
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# luasql-sqlite3
+#
+################################################################################
+
+LUASQL_SQLITE3_VERSION = v2.3.0
+LUASQL_SQLITE3_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_SQLITE3_VERSION)
+LUASQL_SQLITE3_LICENSE = MIT
+LUASQL_SQLITE3_LICENSE_FILES = README
+LUASQL_SQLITE3_DEPENDENCIES = luainterpreter sqlite
+
+LUASQL_SQLITE3_MAKE_FLAGS = \
+	CC="$(TARGET_CC)" \
+	LD="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+	T="sqlite3" \
+	DRIVER_LIBS="-L$(STAGING_DIR)/usr/lib -lsqlite3"
+
+define LUASQL_SQLITE3_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_SQLITE3_MAKE_FLAGS)
+endef
+
+define LUASQL_SQLITE3_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_SQLITE3_MAKE_FLAGS) \
+		PREFIX="$(TARGET_DIR)/usr" install
+endef
+
+define LUASQL_SQLITE3_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/lua/5.1/luasql
+endef
+
+$(eval $(generic-package))
diff --git a/package/luasql/Config.in b/package/luasql/Config.in
deleted file mode 100644
index 96e04fb..0000000
--- a/package/luasql/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_LUASQL
-	bool "luasql"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
-	help
-	  LuaSQL is a simple interface from Lua to a DBMS.
-
-	  http://www.keplerproject.org/luasql
-
-if BR2_PACKAGE_LUASQL
-choice
-	prompt "LuaSQL Driver"
-	help
-	  Select backend driver for LuaSQL.
-
-config BR2_PACKAGE_LUASQL_DRIVER_SQLITE3
-	bool "SQLite3"
-	select BR2_PACKAGE_SQLITE
-	help
-	  Select if you wish to use the SQLite3 LuaSQL driver.
-
-endchoice
-endif
diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
deleted file mode 100644
index 7352e03..0000000
--- a/package/luasql/luasql.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# luasql
-#
-################################################################################
-
-LUASQL_VERSION = v2.3.0
-LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_VERSION)
-LUASQL_LICENSE = MIT
-LUASQL_LICENSE_FILES = README
-LUASQL_DEPENDENCIES = luainterpreter
-
-LUASQL_MAKE_FLAGS = \
-	CC="$(TARGET_CC)" \
-	LD="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC"
-
-ifeq ($(BR2_PACKAGE_LUASQL_DRIVER_SQLITE3),y)
-LUASQL_DEPENDENCIES += sqlite
-LUASQL_MAKE_FLAGS += \
-	T="sqlite3" \
-	DRIVER_LIBS="-L$(STAGING_DIR)/usr/lib -lsqlite3"
-endif
-
-define LUASQL_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS)
-endef
-
-define LUASQL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS) \
-		PREFIX="$(TARGET_DIR)/usr" install
-endef
-
-define LUASQL_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/lib/lua/5.1/luasql
-endef
-
-$(eval $(generic-package))
-- 
1.7.9.5
