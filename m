From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  2 Mar 2018 20:34:35 +0100
Subject: [Buildroot] [Patch next v2 1/3] sqlite: add option for meta-data
 about tables/queries
In-Reply-To: <20180302193437.15573-1-ps.report@gmx.net>
References: <20180302193437.15573-1-ps.report@gmx.net>
Message-ID: <20180302193437.15573-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables SQLITE_ENABLE_COLUMN_METADATA to gain access to:

  - sqlite3_column_database_name()
  - sqlite3_column_database_name16()
  - sqlite3_column_table_name()
  - sqlite3_column_table_name16()
  - sqlite3_column_origin_name()
  - sqlite3_column_origin_name16()

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes
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
-- 
2.16.2
