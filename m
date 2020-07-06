From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon,  6 Jul 2020 17:30:39 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/libodb-mysql: new package
In-Reply-To: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
Message-ID: <20200706153040.427457-7-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains the MySQL ODB runtime library. Every application
that includes code generated for the MySQL database will need to link
to this library.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...-syntax-issue-while-checking-ldflags.patch | 35 +++++++++++++
 .../libodb-mysql/0002-mariadb-FTBFS-fix.patch | 51 +++++++++++++++++++
 package/libodb-mysql/Config.in                | 16 ++++++
 package/libodb-mysql/libodb-mysql.hash        |  4 ++
 package/libodb-mysql/libodb-mysql.mk          | 16 ++++++
 7 files changed, 126 insertions(+)
 create mode 100644 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch
 create mode 100644 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch
 create mode 100644 package/libodb-mysql/Config.in
 create mode 100644 package/libodb-mysql/libodb-mysql.hash
 create mode 100644 package/libodb-mysql/libodb-mysql.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b18e818467..fdab3becc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1409,6 +1409,9 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
+N:	Kamel Bouhara <kamel.bouhara@gmail.com>
+F:	package/libodb-mysql/
+
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
 F:	package/openvmtools/
diff --git a/package/Config.in b/package/Config.in
index 59e714fb6a..651241dc0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1319,6 +1319,7 @@ menu "Database"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libodb-mysql/Config.in"
 	source "package/libodb-pgsql/Config.in"
 	source "package/libgit2/Config.in"
 	source "package/libpqxx/Config.in"
diff --git a/package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch b/package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch
new file mode 100644
index 0000000000..17efd8bcb8
--- /dev/null
+++ b/package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch
@@ -0,0 +1,35 @@
+From 3af12d8d0f749751e487955c24260049e7a8eec6 Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Wed, 13 May 2020 16:58:22 +0200
+Subject: [PATCH 1/2] fix syntax issue while checking ldflags
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index def5883..2d783f6 100755
+--- a/configure
++++ b/configure
+@@ -17574,7 +17574,7 @@ libmysqlclient_paths="none /usr/lib/mysql /usr/lib64/mysql"
+ 
+ for path in $libmysqlclient_paths; do
+ 
+-if test x"path" != xnone; then
++if test x"$path" != xnone; then
+   save_LDFLAGS="$LDFLAGS"
+   LDFLAGS="$LDFLAGS -L$path"
+ fi
+@@ -17753,7 +17753,7 @@ if test x"$libmysqlclient_found" = xyes; then
+   break;
+ fi
+ 
+-if test x"path" != xnone; then
++if test x"$path" != xnone; then
+   LDFLAGS="$save_LDFLAGS"
+ fi
+ 
+-- 
+2.26.2
+
diff --git a/package/libodb-mysql/0002-mariadb-FTBFS-fix.patch b/package/libodb-mysql/0002-mariadb-FTBFS-fix.patch
new file mode 100644
index 0000000000..502f05909f
--- /dev/null
+++ b/package/libodb-mysql/0002-mariadb-FTBFS-fix.patch
@@ -0,0 +1,51 @@
+From 552474a477989d0d3514f126b8e314dccc27878c Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Wed, 1 Jul 2020 08:58:24 +0200
+Subject: [PATCH 2/2] mariadb FTBFS fix
+
+From: https://sources.debian.org/patches/libodb-mysql/2.4.0-4/mariadb_FTBFS_fix.patch/
+
+Description: fix FTBFS with recent MariaDB versions
+Don't include internal an header, only the main one.
+Bug-Debian: https://bugs.debian.org/919374
+Forwarded: no
+Author: Laszlo Boszormenyi (GCS) <gcs@debian.org>
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/mysql/mysql-types.hxx | 4 ++--
+ odb/mysql/version.hxx     | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/odb/mysql/mysql-types.hxx b/odb/mysql/mysql-types.hxx
+index 1254ccd..0e8f9a8 100644
+--- a/odb/mysql/mysql-types.hxx
++++ b/odb/mysql/mysql-types.hxx
+@@ -11,9 +11,9 @@ typedef char my_bool;
+ typedef struct st_mysql_bind MYSQL_BIND;
+ 
+ #ifdef LIBODB_MYSQL_INCLUDE_SHORT
+-#  include <mysql_time.h>
++#  include <mysql.h>
+ #else
+-#  include <mysql/mysql_time.h>
++#  include <mysql/mysql.h>
+ #endif
+ 
+ #endif // ODB_MYSQL_MYSQL_TYPES_HXX
+diff --git a/odb/mysql/version.hxx b/odb/mysql/version.hxx
+index 05b4ba5..e711c2e 100644
+--- a/odb/mysql/version.hxx
++++ b/odb/mysql/version.hxx
+@@ -12,7 +12,7 @@
+ #ifdef LIBODB_MYSQL_INCLUDE_SHORT
+ #  include <mysql_version.h>
+ #else
+-#  include <mysql/mysql_version.h>
++#  include <mysql/mysql.h>
+ #endif
+ 
+ #include <odb/version.hxx>
+-- 
+2.26.2
+
diff --git a/package/libodb-mysql/Config.in b/package/libodb-mysql/Config.in
new file mode 100644
index 0000000000..55a32ce6d4
--- /dev/null
+++ b/package/libodb-mysql/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBODB_MYSQL
+	bool "libodb-mysql"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_LIBODB
+	help
+	  This package contains the MySQL ODB runtime library. Every application
+	  that includes code generated for the MySQL database will need to link
+	  to this library.
+
+	  https://www.codesynthesis.com/products/odb/
+
+comment "libodb-mysql needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+        depends on BR2_PACKAGE_MYSQL
diff --git a/package/libodb-mysql/libodb-mysql.hash b/package/libodb-mysql/libodb-mysql.hash
new file mode 100644
index 0000000000..1c35041af8
--- /dev/null
+++ b/package/libodb-mysql/libodb-mysql.hash
@@ -0,0 +1,4 @@
+sha1	2021a67577354f1d6bed50c0b257c1920760eda7	libodb-mysql-2.4.0.tar.bz2
+
+sha256	ce2fcdb6ab4a02fc0aff263a891c56949fa41b89e65d7a40d8b656d3ebf0d9bc	libodb-mysql-2.4.0.tar.bz2
+sha256	841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3	LICENSE
diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
new file mode 100644
index 0000000000..97cbcddf93
--- /dev/null
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libodb-mysql
+#
+################################################################################
+
+LIBODB_MYSQL_VERSION_MAJOR = 2.4
+LIBODB_MYSQL_VERSION = $(LIBODB_MYSQL_VERSION_MAJOR).0
+LIBODB_MYSQL_SOURCE = libodb-mysql-$(LIBODB_MYSQL_VERSION).tar.bz2
+LIBODB_MYSQL_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_MYSQL_VERSION_MAJOR)
+LIBODB_MYSQL_INSTALL_STAGING = YES
+LIBODB_MYSQL_LICENSE = GPL-2.0
+LIBODB_MYSQL_LICENSE_FILES = LICENSE
+LIBODB_MYSQL_DEPENDENCIES = libodb mysql
+
+$(eval $(autotools-package))
-- 
2.26.2
