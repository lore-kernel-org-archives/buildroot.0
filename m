From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 12:15:09 +0100
Subject: [Buildroot] [git commit] sqlite: Add new compile-time options
Message-ID: <20121104111846.7517199A11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef1e76ae433e744d2cebf23f1c6d3b6446790270
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: whitespace/wording tweaks]
Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/Config.in |   34 ++++++++++++++++++++++++++++++++++
 package/sqlite/sqlite.mk |   12 ++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 25aaa3f..8766786 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -22,3 +22,37 @@ config BR2_PACKAGE_SQLITE_STAT3
 	  planner that can help SQLite to choose a better query plan under
 	  certain situations.
 
+config BR2_PACKAGE_SQLITE_ENABLE_FTS3
+	bool "Enable version 3 of the full-text search engine"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  When this option is defined in the amalgamation
+	  (see http://www.sqlite.org/amalgamation.html), version 3 of
+	  the full-text search engine is added to the build automatically.
+
+config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
+	bool "Enable sqlite3_unlock_notify() interface"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  This option enables the sqlite3_unlock_notify() interface and its
+	  accosiated functionality. See the documentation
+	  http://www.sqlite.org/unlock_notify.html for additional information.
+
+config BR2_PACKAGE_SQLITE_SECURE_DELETE
+	bool "Set the secure_delete pragma on by default"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  This compile-time option changes the default settings of the
+	  secure_delete pragma. When this option is not used, secure_delete
+	  defaults to off. When this option is present, secure_delete defaults
+	  to on.
+
+	  The secure_delete setting causes deleted content to be overwritten
+	  with zeros. There is a small performance penalty for this since
+	  additional I/O must occur. On the other hand, secure_delete can
+	  prevent sensitive information from lingering in unused parts
+	  of the database file after it has allegedly been deleted.
+	  See the documentation on the
+	  http://www.sqlite.org/pragma.html#pragma_secure_delete
+	  for additional information.
+
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7b5b4aa..0320cc4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -21,6 +21,18 @@ ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
+SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
