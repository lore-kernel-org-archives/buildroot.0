From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 14:49:43 +0100
Subject: [Buildroot] [git commit] sqlcipher: new package
Message-ID: <20120124140017.6D2689039E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1541d648aa2d72f3d889a0ff78af9f3add9f4fa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SQLCipher is a fork of SQLite that adds AES encryption using OpenSSL.
It relies on tcl to generate some of its source code, so host-tcl is
required.

[Peter: select openssl]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/sqlcipher/Config.in    |   28 ++++++++++++++++++++
 package/sqlcipher/sqlcipher.mk |   56 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f219e37..b245da8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -272,6 +272,7 @@ endmenu
 menu "Database"
 source "package/berkeleydb/Config.in"
 source "package/mysql_client/Config.in"
+source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
 endmenu
 
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
new file mode 100644
index 0000000..8970115
--- /dev/null
+++ b/package/sqlcipher/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SQLCIPHER
+	bool "sqlcipher"
+	depends on !BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SQLCipher is an SQLite extension that provides 256 bits AES
+	  encryption of database files.  Note that it is a fork of SQLite
+	  and they cannot be installed side-by-side.
+	  http://sqlcipher.net
+
+config BR2_PACKAGE_SQLCIPHER_READLINE
+	bool "Command-line editing"
+	depends on BR2_PACKAGE_SQLCIPHER
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Enable command-line editing. This requires ncurses and readline.
+
+config BR2_PACKAGE_SQLCIPHER_STAT3
+	bool "Additional query optimizations (stat3)"
+	depends on BR2_PACKAGE_SQLCIPHER
+	help
+	  Adds additional logic to the ANALYZE command and to the query
+	  planner that can help SQLite to choose a better query plan under
+	  certain situations.
+
+comment "sqlcipher conflicts with sqlite"
+	depends on BR2_PACKAGE_SQLITE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
new file mode 100644
index 0000000..9ad3e55
--- /dev/null
+++ b/package/sqlcipher/sqlcipher.mk
@@ -0,0 +1,56 @@
+#############################################################
+#
+# Sqlcipher extension of sqlite
+# http://sqlcipher.net
+#
+#############################################################
+SQLCIPHER_VERSION = 1.1.9
+SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/v$(SQLCIPHER_VERSION)
+SQLCIPHER_DEPENDENCIES = openssl host-tcl
+SQLCIPHER_INSTALL_STAGING = YES
+
+SQLCIPHER_CONF_ENV = \
+	CFLAGS+=" $(SQLCIPHER_CFLAGS)" \
+	LDFLAGS+=" $(SQLCIPHER_LDFLAGS)" \
+	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh8.4
+
+SQLCIPHER_CONF_OPT = \
+	--enable-threadsafe \
+	--localstatedir=/var
+
+SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
+SQLCIPHER_LDFLAGS += -lcrypto
+
+ifneq ($(BR2_LARGEFILE),y)
+# the sqlite configure script fails to define SQLITE_DISABLE_LFS when
+# --disable-largefile is passed, breaking the build. Work around it by
+# simply adding it to CFLAGS for configure instead
+SQLCIPHER_CFLAGS += -DSQLITE_DISABLE_LFS
+endif
+
+ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
+SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLCIPHER_READLINE),y)
+SQLCIPHER_DEPENDENCIES += ncurses readline
+SQLCIPHER_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+else
+SQLCIPHER_CONF_OPT += --disable-readline
+endif
+
+define SQLCIPHER_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/sqlite3
+	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
+	rm -f $(TARGET_DIR)/usr/lib/pkgconfig/sqlite3.pc
+	rm -f $(TARGET_DIR)/usr/include/sqlite3*.h
+endef
+
+define SQLCIPHER_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/bin/sqlite3
+	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
+	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
+	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
+endef
+
+$(eval $(call AUTOTARGETS))
