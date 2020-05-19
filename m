From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 19 May 2020 09:28:49 +0200
Subject: [Buildroot] [PATCH 7/8] package/libodb-mysql: new package
In-Reply-To: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
References: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
Message-ID: <20200519072850.898877-8-kamel.bouhara@bootlin.com>
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
 ...-syntax-issue-while-checking-ldflags.patch | 35 +++++++++++++++++++
 package/libodb-mysql/Config.in                | 16 +++++++++
 package/libodb-mysql/libodb-mysql.hash        |  4 +++
 package/libodb-mysql/libodb-mysql.mk          | 16 +++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch
 create mode 100644 package/libodb-mysql/Config.in
 create mode 100644 package/libodb-mysql/libodb-mysql.hash
 create mode 100644 package/libodb-mysql/libodb-mysql.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index abdee8541a..73a3a44ef8 100644
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
index 0000000000..9d2013e3a0
--- /dev/null
+++ b/package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch
@@ -0,0 +1,35 @@
+From 3af12d8d0f749751e487955c24260049e7a8eec6 Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Wed, 13 May 2020 16:58:22 +0200
+Subject: [PATCH] fix syntax issue while checking ldflags
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
+2.25.0
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
2.25.0
