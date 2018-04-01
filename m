From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 21:03:50 +0200
Subject: [Buildroot] [git commit] sqlite: add option for meta-data about
 tables/queries
Message-ID: <20180401190354.C996883666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b02fed5a00f02ed303133d975ad9fcaf2d95b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables SQLITE_ENABLE_COLUMN_METADATA to gain access to:

  - sqlite3_column_database_name()
  - sqlite3_column_database_name16()
  - sqlite3_column_table_name()
  - sqlite3_column_table_name16()
  - sqlite3_column_origin_name()
  - sqlite3_column_origin_name16()

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sqlite/Config.in | 7 +++++++
 package/sqlite/sqlite.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index ec7396860c..517af50e67 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_SQLITE_STAT3
 	  query planner that can help SQLite to choose a better query
 	  plan under certain situations.
 
+config BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	bool "Enable convenient access to meta-data about tables and queries"
+	help
+	  When this option is defined there are some additional APIs
+	  enabled to acces meta-data about tables and queries (see
+	  https://sqlite.org/compile.html).
+
 config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	bool "Enable version 3 of the full-text search engine"
 	help
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e8ce92df56..d0030d43ab 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -15,6 +15,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
 endif
