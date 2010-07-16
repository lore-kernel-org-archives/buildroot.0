From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Jul 2010 23:55:30 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix mysql dependency and
	disable unavailable sql drivers
Message-ID: <20100716215737.0F39682A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=470e9deec1a740d3cf87fdf7598524560632ce0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have the needed dependencies in BR for most of the SQL drivers,
so mark those options as broken.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.sql.in |    7 +++++++
 package/qt/qt.mk         |    4 +++-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 2ce8d79..b982fdb 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -6,24 +6,30 @@ menuconfig BR2_PACKAGE_QT_SQL_MODULE
 if BR2_PACKAGE_QT_SQL_MODULE
 config BR2_PACKAGE_QT_MYSQL
 	bool "MySQL Driver"
+	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	help
 	  Build MySQL driver
 	  If unsure, say n.
 
 config BR2_PACKAGE_QT_IBASE
 	bool "iBase Driver"
+	depends on BROKEN # libfbclient not in BR
 	help
 	  Build iBase driver
 	  If unsure, say n.
 
 config BR2_PACKAGE_QT_ODBC
 	bool "ODBC Driver"
+	depends on BROKEN # libodbc not in BR
 	help
 	  Build ODBC driver
 	  If unsure, say n.
 
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
+	depends on BROKEN # libpgsql not in BR
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
@@ -36,6 +42,7 @@ config BR2_PACKAGE_QT_SQLITE
 
 config BR2_PACKAGE_QT_SQLITE2
 	bool "SQLite 2 Driver"
+	depends on BROKEN # sqlite2 not in BR
 	help
 	  Build SQLite 2 driver
 	  If unsure, say n.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index dd43ae0..864e79b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -273,7 +273,9 @@ ifeq ($(BR2_PACKAGE_QT_IBASE),y)
 QT_CONFIGURE+= -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
-QT_CONFIGURE+= -qt-sql-mysql
+QT_CONFIGURE+= -qt-sql-mysql -I $(STAGING_DIR)/usr/include/mysql -L $(STAGING_DIR)/usr/lib/mysql
+
+QT_DEP_LIBS+=mysql_client
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE+= -qt-sql-odbc
-- 
1.7.1
