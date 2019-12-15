From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 15 Dec 2019 13:33:24 -0800
Subject: [Buildroot] [PATCH v2 1/3] package/mariadb: bump version to 10.4.11
Message-ID: <20191215213326.10863-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://mariadb.com/kb/en/library/mariadb-10411-release-notes/

Changelog:
https://mariadb.com/kb/en/library/mariadb-10411-changelog/

Upgrading from 10.3 to 10.4:
https://mariadb.com/kb/en/library/upgrading-from-mariadb-103-to-mariadb-104/

The hash for README.md has been updated due to minor changes throughout
the document. The text in licensing section is unchanged.

Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
has been applied upstream.

The startup scripts have been adjusted to prevent an error from occurring
in mysql_install_db.  Instead, the initial database is created as user root.
Afterwards, chown is called to change the user and group to mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v1 -> v2:
  - bump version to 10.4.11 instead of 10.4.10
  - replace patch for mysql_install_db (suggested by Thomas)
  - split other changes to startup scripts into separate patch (suggested by Thomas)
---
 ...002-fix-build-error-with-newer-cmake.patch | 44 -------------------
 package/mariadb/S97mysqld                     |  3 +-
 package/mariadb/mariadb.hash                  | 12 ++---
 package/mariadb/mariadb.mk                    |  5 ++-
 package/mariadb/mysqld.service                |  2 +-
 5 files changed, 13 insertions(+), 53 deletions(-)
 delete mode 100644 package/mariadb/0002-fix-build-error-with-newer-cmake.patch

diff --git a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch b/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
deleted file mode 100644
index 5ffac688a3..0000000000
--- a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c90ae2ca3dff267b9e21595376d22de397f6f78f Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Tue, 20 Aug 2019 06:22:43 -0700
-Subject: [PATCH] Fix build error with newer cmake
-
-Fixes the following build error:
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-https://jira.mariadb.org/browse/MDEV-20596
-
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- cmake/os/Linux.cmake | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/os/Linux.cmake b/cmake/os/Linux.cmake
-index 50a2b21c838d8d6ca4cacc0704a9be4da3a57a0a..b871586acc9cfaddc3836cc9afafd85969120420 100644
---- a/cmake/os/Linux.cmake
-+++ b/cmake/os/Linux.cmake
-@@ -26,9 +26,9 @@ SET(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -D_GNU_SOURCE=1)
- 
- # Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
- FOREACH(LANG C CXX)
--  STRING(REPLACE "-rdynamic" "" 
--  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
--  ${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}  
-+  STRING(REPLACE "-rdynamic" ""
-+  "CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS"
-+  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
-   )
- ENDFOREACH()
- 
--- 
-2.17.1
-
diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index 62357fa8c4..270eea51dd 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -23,12 +23,13 @@ wait_for_ready() {
 start() {
 	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
 		printf "Creating mysql system tables ... "
-		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
+		$MYSQL_BIN/mysql_install_db --basedir=/usr \
 			--datadir=$MYSQL_LIB > /dev/null 2>&1
 		if [ $? != 0 ]; then
 			echo "FAIL"
 			exit 1
 		fi
+		chown -R mysql:mysql /var/lib/mysql
 		echo "OK"
 	fi
 
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a742d87daa..a8a9541ced 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.18
-md5 b3524c0825c3a1c255496daea38304a0  mariadb-10.3.18.tar.gz
-sha1 922a317edd6f44baacc49831ca278e7a9878a363  mariadb-10.3.18.tar.gz
-sha256 69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc  mariadb-10.3.18.tar.gz
-sha512 817253d18f20c74f9ec8030678fd50a28b1726fd59153023a3a5e9b3f79e1f44d79feb24ae9ed72d8c1c04017110c932aba7be0610fb06245590c7f5610db242  mariadb-10.3.18.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.4.11
+md5 d0de881ab8ead46928cafb7d558535c1  mariadb-10.4.11.tar.gz
+sha1 e633ea0bff6dcd22722bda4cdc66fdfdd1afc4a5  mariadb-10.4.11.tar.gz
+sha256 4c076232b99433b09eb3c6d62f607192b3474d022703699b8f6aef4e79de3fb9  mariadb-10.4.11.tar.gz
+sha512 2a1a8d90e326530b41a8a7d6889325cefcba5914451a48c6a20d5d5cd68004835e76e6ecac628554167a014f9c0b1487c15f37151afd771ea0166a4c40afd7d2  mariadb-10.4.11.tar.gz
 
 # Hash for license files
-sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256 fbcc1db54ebdc4af733aeaea9a00ec140f5f5fc43683f3966645450734c05747  README.md
 sha256 240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 82e3c16daf..6ad4a8e6a7 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.18
+MARIADB_VERSION = 10.4.11
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
@@ -57,6 +57,9 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 # Explicitly disable dtrace to avoid detection of a host version
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
+# Disable support for REST and JDBC
+MARIADB_CONF_OPTS += -DCONNECT_WITH_REST=OFF -DCONNECT_WITH_JDBC=OFF
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index cd308310c6..3eaef173e1 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -2,7 +2,7 @@
 Description=MySQL database server
 
 [Service]
-ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
+ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
 ExecStart=/usr/bin/mysqld_safe
 Restart=always
 User=mysql
-- 
2.24.1
