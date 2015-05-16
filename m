From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 17:24:16 +0200
Subject: [Buildroot] [git commit] postgresql: mark as not available for
	static linking
Message-ID: <20150516152710.277BC80136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9f709e4200c8e2e1c2d34a010897601f7e5c808
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

postgresql currently does not build in BR2_STATIC_LIBS=y
configurations, and since there is little interest in using such a big
piece of software in statically linked configuration, this commit
makes postgresql depends on !BR2_STATIC_LIBS.

Fixes:

  http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/Config.in  |    4 ++++
 package/php/Config.ext        |    5 +++++
 package/postgresql/Config.in  |    7 +++++++
 package/qt/Config.sql.in      |    4 ++++
 package/qt5/qt5base/Config.in |    5 +++++
 5 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index 0d51f5e..b4a47f2 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -33,12 +33,16 @@ if BR2_PACKAGE_BANDWIDTHD
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
 	select BR2_PACKAGE_POSTGRESQL
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable support for logging the bandwidthd data to a remote
 	  (or local) postgresql server. This data can then be viewed
 	  through a php site. See README in the source code
 	  (github.com/nroach44/bandwidthd) for more information.
 
+comment "postgresql support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
 	bool "enable sqlite3 log storage"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4995090..5324e79 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -159,9 +159,14 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
 	help
 	  PDO driver for PostgreSQL
 
+comment "PostgreSQL drivers need a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 4c53703..e9b8f48 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
+	# fails to build in a pure static linking scenario, and
+	# postgresql is unlikely to be used in a pure statically
+	# linked environment.
+	depends on !BR2_STATIC_LIBS
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
@@ -13,3 +17,6 @@ config BR2_PACKAGE_POSTGRESQL
 	  archives with pg_dump and pg_restore.
 
 	  http://www.postgresql.org
+
+comment "postgresql needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 037837f..452edd5 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -31,10 +31,14 @@ config BR2_PACKAGE_QT_ODBC
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
 	select BR2_PACKAGE_POSTGRESQL
+	depends on !BR2_STATIC_LIBS
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
 
+comment "PostgreSQL driver needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT_SQLITE_NONE
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 20fd905..df1d3dc 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -61,10 +61,15 @@ config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
 
+comment "PostgreSQL plugin needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
