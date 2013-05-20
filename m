From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:43 +0300
Subject: [Buildroot] [PATCH 11/12] luasql: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-11-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luasql is a uniform frontend for multiple DB backends.

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in        |  1 +
 package/luasql/Config.in | 21 +++++++++++++++++++++
 package/luasql/luasql.mk | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/luasql/Config.in
 create mode 100644 package/luasql/luasql.mk

diff --git a/package/Config.in b/package/Config.in
index 3a49e59..17fa1e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -317,6 +317,7 @@ source "package/luafilesystem/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
+source "package/luasql/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/rings/Config.in"
diff --git a/package/luasql/Config.in b/package/luasql/Config.in
new file mode 100644
index 0000000..4dd011a
--- /dev/null
+++ b/package/luasql/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LUASQL
+	bool "luasql"
+	help
+	  LuaSQL is a simple interface from Lua to a DBMS.
+
+	  http://www.keplerproject.org/luasql
+
+if BR2_PACKAGE_LUASQL
+choice
+	prompt "LuaSQL Driver"
+	help
+	  Select backend driver for LuaSQL.
+
+config BR2_PACKAGE_LUASQL_DRIVER_SQLITE3
+	bool "SQLite3"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Select if you wish to use the SQLite3 LuaSQL driver.
+
+endchoice
+endif
diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
new file mode 100644
index 0000000..3480741
--- /dev/null
+++ b/package/luasql/luasql.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# luasql
+#
+#############################################################
+
+LUASQL_VERSION = 2.2.0
+LUASQL_SITE = http://github.com/downloads/keplerproject/luasql
+LUASQL_LICENSE = MIT
+LUASQL_LICENSE_FILES = README
+LUASQL_DEPENDENCIES = lua
+
+ifdef BR2_PACKAGE_LUASQL_DRIVER_SQLITE3
+LUASQL_DEPENDENCIES += sqlite
+define LUASQL_BUILD_PARAMS
+	T="sqlite3" \
+	DRIVER_LIBS="-L$(STAGING_DIR)/usr/lib -lsqlite3"
+endef
+endif
+
+define LUASQL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_BUILD_PARAMS) CC="$(TARGET_CC)" \
+		LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define LUASQL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_BUILD_PARAMS) PREFIX=/usr \
+		LUA_DIR="$(TARGET_DIR)/usr/share/lua" \
+		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUASQL_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/lib/lua/luasql"
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
