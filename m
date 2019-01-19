From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:40:18 +0100
Subject: [Buildroot] [git commit] unixodbc: needs dynamic library
Message-ID: <20190119214058.21EB68A69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3183b072a0986b5c58bd5a4a296ef8e5c57f887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/1036ee061ce7f7747d5514c61866da60bcfae769

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: propagate to PHP_EXT_PDO_UNIXODBC as well]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext     | 4 ++++
 package/qt/Config.sql.in   | 4 ++++
 package/unixodbc/Config.in | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 9a90e0a8a4..d71cfb9986 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -175,10 +175,14 @@ config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 
 config BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC
 	bool "unixODBC"
+	depends on !BR2_STATIC_LIBS # unixodbc
 	select BR2_PACKAGE_UNIXODBC
 	help
 	  unixODBC driver for PDO
 
+comment "unixodbc driver needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
 comment "Human language and character encoding support"
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
