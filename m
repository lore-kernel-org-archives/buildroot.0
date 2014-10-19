From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:41:07 +0200
Subject: [Buildroot] [git commit] cppdb: enable postgresql support
Message-ID: <20141019144112.25CEFAF7C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2641edb8c49e0531af87eb00a35784785d604ec9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
Fix mysql support.
Add hash file.
Forcibly disable automatic db support when it's not selected.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppdb/Config.in                            |    4 +-
 .../cppdb/cppdb-0001-mysql-library-suffix.patch    |   23 ++++++++++++++++++++
 package/cppdb/cppdb.hash                           |    3 ++
 package/cppdb/cppdb.mk                             |   13 ++++++++++-
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index 120598a..19c9419 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CPPDB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Can be built without them but it's useless
-	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	help
 	  CppDB is an SQL connectivity library that is designed to provide
 	  platform and Database independent connectivity API similarly
@@ -14,6 +14,6 @@ config BR2_PACKAGE_CPPDB
 	  http://cppcms.com/sql/cppdb/
 
 comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/cppdb/cppdb-0001-mysql-library-suffix.patch b/package/cppdb/cppdb-0001-mysql-library-suffix.patch
new file mode 100644
index 0000000..e65e3e2
--- /dev/null
+++ b/package/cppdb/cppdb-0001-mysql-library-suffix.patch
@@ -0,0 +1,23 @@
+Add mysql/ to PATH_SUFFIXES for the library search for mysql.
+
+On common distros libmysqlclient* is installed and/or symlinked
+into /usr/lib.
+Since we install the libraries into /usr/lib/mysql alone cppdb
+fails to properly link to it giving runtime errors.
+
+Status: https://sourceforge.net/p/cppcms/bugs/135/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura cppdb-0.3.1.orig/CMakeLists.txt cppdb-0.3.1/CMakeLists.txt
+--- cppdb-0.3.1.orig/CMakeLists.txt	2014-10-17 11:05:57.875429748 -0300
++++ cppdb-0.3.1/CMakeLists.txt	2014-10-17 11:12:57.486775484 -0300
+@@ -196,7 +196,7 @@
+ endif()
+ 
+ if(NOT DISABLE_MYSQL)
+-	find_library(MYSQL_LIB mysqlclient)
++	find_library(MYSQL_LIB mysqlclient PATH_SUFFIXES mysql)
+ 	find_path(MYSQL_PATH mysql.h PATH_SUFFIXES mysql)
+ 	if(MYSQL_LIB AND MYSQL_PATH)
+ 		include_directories(${MYSQL_PATH})
diff --git a/package/cppdb/cppdb.hash b/package/cppdb/cppdb.hash
new file mode 100644
index 0000000..efc0eac
--- /dev/null
+++ b/package/cppdb/cppdb.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/cppcms/files/cppdb/0.3.1/
+md5	129f1d75f46114b79160b93807d5223f	cppdb-0.3.1.tar.bz2
+sha1	c0410dcc482d71696ac9206044b3a3ac03d31f96	cppdb-0.3.1.tar.bz2
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
index f7f837e..2c26c90 100644
--- a/package/cppdb/cppdb.mk
+++ b/package/cppdb/cppdb.mk
@@ -14,7 +14,18 @@ CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 CPPDB_DEPENDENCIES += mysql
-CPPDB_CONF_OPTS += -DMYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql
+else
+CPPDB_CONF_OPTS += -DDISABLE_MYSQL=ON
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+CPPDB_DEPENDENCIES += postgresql
+else
+CPPDB_CONF_OPTS += -DDISABLE_PQ=ON
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),)
+CPPDB_CONF_OPTS += -DDISABLE_SQLITE=ON
 endif
 
 $(eval $(cmake-package))
