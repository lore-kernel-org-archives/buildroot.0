From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 23:47:56 +0200
Subject: [Buildroot] [git commit branch/next] qt5: mysql and sqlite plugins
Message-ID: <20130530215051.AE7AE9A6A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b78baafbda4b97c96793231f559735139506ee1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added support for mysql and sqlite plugins. Configuration is based on qt package.

[Peter: strip trailing spaces]
Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/Config.in  |   36 ++++++++++++++++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk |   15 +++++++++++++++
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 7974357..9c7fd15 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -43,6 +43,42 @@ config BR2_PACKAGE_QT5BASE_SQL
 	help
 	  This options enables the Qt5Sql library.
 
+if BR2_PACKAGE_QT5BASE_SQL
+config BR2_PACKAGE_QT5BASE_MYSQL
+	bool "MySQL Plugin"
+	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	depends on BR2_USE_MMU # mysql
+	help
+	  Build MySQL plugin
+	  If unsure, say n.
+choice
+	prompt "SQLite 3 support"
+	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
+	help
+	  Select SQLite support.
+
+config BR2_PACKAGE_QT5BASE_SQLITE_NONE
+	bool "No sqlite support"
+	help
+	  Do not compile any kind of SQLite support.
+
+config BR2_PACKAGE_QT5BASE_SQLITE_QT
+	bool "Qt SQLite"
+	help
+	  Use Qt bundled SQLite support.
+
+config BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM
+	bool "System SQLite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Use system SQLite.
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_QT5BASE_TEST
 	bool "test module"
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7c6a093..cfa06ea 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -60,6 +60,21 @@ QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
 endif
 
+# Qt5 SQL Plugins
+ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
+ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
+QT5BASE_CONFIGURE_OPTS += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
+QT5BASE_DEPENDENCIES   += mysql_client
+else
+QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
+endif
+
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
+endif
+
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
