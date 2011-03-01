From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 11:34:00 -0300
Subject: [Buildroot] [PATCH] qt: add option for system sqlite
Message-ID: <1298990040-27476-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to use the system sqlite library.
Also drop sqlite2 stub since it's pointless.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/qt/Config.sql.in |   30 +++++++++++++++++++++---------
 package/qt/qt.mk         |    7 ++++++-
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index b982fdb..eceb15d 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -34,16 +34,28 @@ config BR2_PACKAGE_QT_PSQL
 	  Build PostgreSQL driver
 	  If unsure, say n.
 
-config BR2_PACKAGE_QT_SQLITE
-	bool "SQLite 3 Driver"
+choice
+	prompt "SQLite 3 support"
+	default BR2_PACKAGE_QT_SQLITE_NONE
 	help
-	  Build SQLite driver
-	  If unsure, say n.
+	  Select SQLite support.
 
-config BR2_PACKAGE_QT_SQLITE2
-	bool "SQLite 2 Driver"
-	depends on BROKEN # sqlite2 not in BR
+config BR2_PACKAGE_QT_SQLITE_NONE
+	bool "No sqlite support"
 	help
-	  Build SQLite 2 driver
-	  If unsure, say n.
+	  Do not compile any kind of SQLite support.
+
+config BR2_PACKAGE_QT_SQLITE_QT
+	bool "Qt SQLite"
+	help
+	  Use Qt bundled SQLite support.
+
+config BR2_PACKAGE_QT_SQLITE_SYSTEM
+	bool "System SQLite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Use system SQLite.
+
+endchoice
+
 endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index cc90190..e8cd4ec 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -295,11 +295,16 @@ endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE+= -qt-sql-psql
 endif
-ifeq ($(BR2_PACKAGE_QT_SQLITE),y)
+ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
 QT_CONFIGURE+= -qt-sql-sqlite
 else
+ifeq ($(BR2_PACKAGE_QT_SQLITE_SYSTEM),y)
+QT_CONFIGURE+= -system-sqlite
+QT_DEP_LIBS+= sqlite
+else
 QT_CONFIGURE+= -no-sql-sqlite
 endif
+endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE2),y)
 QT_CONFIGURE+= -qt-sql-sqlite2
 endif
-- 
1.7.3.4
