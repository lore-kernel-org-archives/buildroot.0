From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Jan 2019 23:05:41 +0100
Subject: [Buildroot] [PATCH 1/1] unixodbc: needs dynamic library
Message-ID: <20190118220541.11023-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1036ee061ce7f7747d5514c61866da60bcfae769

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt/Config.sql.in   | 4 ++++
 package/unixodbc/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 1e7f6ba799..71a198242f 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -16,11 +16,15 @@ config BR2_PACKAGE_QT_MYSQL
 
 config BR2_PACKAGE_QT_ODBC
 	bool "ODBC Driver"
+	depends on !BR2_STATIC_LIBS # unixodbc
 	select BR2_PACKAGE_UNIXODBC
 	help
 	  Build ODBC driver
 	  If unsure, say n.
 
+comment "ODBC driver needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/unixodbc/Config.in b/package/unixodbc/Config.in
index d5434d1ef1..eb0ad9c541 100644
--- a/package/unixodbc/Config.in
+++ b/package/unixodbc/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_UNIXODBC
 	bool "unixodbc"
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  The unixODBC Project goals are to develop and promote
 	  unixODBC to be the definitive standard for ODBC on non MS
 	  Windows platforms.
 
 	  http://www.unixodbc.org
+
+comment "unixodbc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.14.1
