From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] luasql: New package
Message-ID: <20130831213337.2C9099B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f608c7705fba9a7f83aef28afe5a841fafe527e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luasql is a uniform frontend for multiple DB backends.

[Thomas P: update version to 2.3.0 available from Github, as suggested
by Fran??ois Perrad. Fix .mk header. Use a LUASQL_MAKE_FLAGS variable,
which is more commonly used.]

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/luasql/Config.in |   21 +++++++++++++++++++++
 package/luasql/luasql.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d5453fe..27a0d55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ source "package/luafilesystem/Config.in"
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
index 0000000..6fbdccc
--- /dev/null
+++ b/package/luasql/luasql.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# luasql
+#
+################################################################################
+
+LUASQL_VERSION = v2.3.0
+LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_VERSION)
+LUASQL_LICENSE = MIT
+LUASQL_LICENSE_FILES = README
+LUASQL_DEPENDENCIES = lua
+
+LUASQL_MAKE_FLAGS = \
+	CC="$(TARGET_CC)" \
+	LD="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC"
+
+ifeq ($(BR2_PACKAGE_LUASQL_DRIVER_SQLITE3),y)
+LUASQL_DEPENDENCIES += sqlite
+LUASQL_MAKE_FLAGS += \
+	T="sqlite3" \
+	DRIVER_LIBS="-L$(STAGING_DIR)/usr/lib -lsqlite3"
+endif
+
+define LUASQL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS)
+endef
+
+define LUASQL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS) PREFIX=/usr \
+		LUA_DIR="$(TARGET_DIR)/usr/share/lua" \
+		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUASQL_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/lua/luasql
+endef
+
+$(eval $(generic-package))
