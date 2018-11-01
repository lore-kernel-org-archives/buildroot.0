From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:25:45 +0100
Subject: [Buildroot] [git commit] package/postgresql: needs wchar
Message-ID: <20181101212439.4971088016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e75f6c4e9d3dca27c47bf19cc778c5613462eebf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed support for non-wchar toolchains:
https://github.com/postgres/postgres/commit/85feb77aa09cda9ff3e12cf95c757c499dc25343

Propagate the new dependency to other packages.

Fixes
http://autobuild.buildroot.net/results/b73/b73342a39167ed7f293224d4e3b23dde691b9abf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: also propagate to the php, qt and qt5base packages.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bandwidthd/Config.in      | 5 +++--
 package/collectd/Config.in        | 4 ++++
 package/php/Config.ext            | 5 +++--
 package/postgresql/Config.in      | 5 +++--
 package/python-psycopg2/Config.in | 4 ++++
 package/qt/Config.sql.in          | 5 +++--
 package/qt5/qt5base/Config.in     | 5 +++--
 7 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index 8a19733c2c..5a3529e0c4 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -35,6 +35,7 @@ if BR2_PACKAGE_BANDWIDTHD
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
@@ -42,8 +43,8 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	  through a php site. See README in the source code
 	  (github.com/nroach44/bandwidthd) for more information.
 
-comment "postgresql support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "postgresql support needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
 	bool "enable sqlite3 log storage"
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index c9e61a5622..3222547b68 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -383,6 +383,7 @@ config BR2_PACKAGE_COLLECTD_PING
 
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Connects to and executes SQL statements on a PostgreSQL
@@ -390,6 +391,9 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	  configuration, the returned values are then converted into
 	  collectd ???value lists???.
 
+comment "postgresql support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
 	help
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 51dcbbf4a4..808551e77b 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -140,13 +140,14 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
 
-comment "PostgreSQL drivers need a toolchain w/ dynamic library"
+comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 9dda54bf9f..e548d3cb27 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	# fails to build in a pure static linking scenario, and
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
@@ -18,6 +19,6 @@ config BR2_PACKAGE_POSTGRESQL
 
 	  http://www.postgresql.org
 
-comment "postgresql needs a toolchain w/ dynamic library"
+comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index ec852bb49e..ec27d706de 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Psycopg is the most popular PostgreSQL database adapter for
@@ -20,3 +21,6 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
 	  http://initd.org/psycopg/
+
+comment "python-psycopg2 needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 6d39bb974a..1e7f6ba799 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -24,13 +24,14 @@ config BR2_PACKAGE_QT_ODBC
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
 
-comment "PostgreSQL driver needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "PostgreSQL driver needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 choice
 	prompt "SQLite 3 support"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b9aba2d389..1340ea48f0 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -75,14 +75,15 @@ config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
 
-comment "PostgreSQL plugin needs a toolchain w/ dynamic library"
+comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 choice
 	prompt "SQLite 3 support"
