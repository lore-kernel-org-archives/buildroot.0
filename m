From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:42:16 +0100
Subject: [Buildroot] [PATCH 08/10] luasql-sqlite3: renamed like with LuaRocks
In-Reply-To: <cover.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <f3ac9e465370b706b5af4acbb36f6e0291016034.1387744636.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  7 +++++++
 package/Config.in                        |  2 +-
 package/luasql-sqlite3/Config.in         |  8 ++++++++
 package/luasql-sqlite3/luasql-sqlite3.mk | 33 +++++++++++++++++++++++++++++++
 package/luasql/Config.in                 | 22 ---------------------
 package/luasql/luasql.mk                 | 34 --------------------------------
 6 files changed, 49 insertions(+), 57 deletions(-)
 create mode 100644 package/luasql-sqlite3/Config.in
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
 delete mode 100644 package/luasql/Config.in
 delete mode 100644 package/luasql/luasql.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ce05177..160e5f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -118,6 +118,13 @@ config BR2_PACKAGE_NETKITTELNET
 	  been deprecated since 2012.11. 'busybox' provides a telnet
 	  client and should be used instead.
 
+config BR2_PACKAGE_LUASQL
+	bool "luasql has been replaced by luasql-sqlite3"
+	select BR2_PACKAGE_LUASQL_SQLITE3
+	select BR2_LEGACY
+	help
+	  The option has been renamed BR2_PACKAGE_LUASQL_SQLITE3.
+
 config BR2_PACKAGE_LUACJSON
 	bool "luacjson has been replaced by lua-cjson"
 	select BR2_PACKAGE_LUA_CJSON
diff --git a/package/Config.in b/package/Config.in
index b9b03d9..b76bcf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -361,6 +361,7 @@ source "package/lbase64/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
+source "package/luasql-sqlite3/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
@@ -369,7 +370,6 @@ source "package/luafilesystem/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
-source "package/luasql/Config.in"
 source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
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
index a1447cc..0000000
--- a/package/luasql/luasql.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# luasql
-#
-################################################################################
-
-LUASQL_VERSION = v2.3.0
-LUASQL_SITE = $(call github,keplerproject,luasql,$(LUASQL_VERSION))
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
-$(eval $(generic-package))
-- 
1.8.1.2
