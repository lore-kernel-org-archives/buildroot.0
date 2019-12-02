From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  2 Dec 2019 11:22:14 -0800
Subject: [Buildroot] [PATCH 1/1] package/mariadb: bump version to 10.4.10
Message-ID: <20191202192214.2906-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://mariadb.com/kb/en/library/mariadb-10410-release-notes/

Changelog:
https://mariadb.com/kb/en/library/mariadb-10410-changelog/

Upgrading from 10.3 to 10.4:
https://mariadb.com/kb/en/library/upgrading-from-mariadb-103-to-mariadb-104/

The hash for README.md has been updated due to minor changes throughout
the document. The text in licensing section is unchanged.

Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
has been applied upstream.

Patch 0002-add-check-for-pam-tool-directory.patch has been added to avoid
an error occurring in the mysql_install_db script.

The startup scripts have been changed to log to /var/log/mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 ...002-add-check-for-pam-tool-directory.patch | 40 +++++++++++++++++
 ...002-fix-build-error-with-newer-cmake.patch | 44 -------------------
 package/mariadb/S97mysqld                     | 17 ++++---
 package/mariadb/mariadb.hash                  | 12 ++---
 package/mariadb/mariadb.mk                    |  5 ++-
 package/mariadb/mysqld.service                |  3 +-
 6 files changed, 63 insertions(+), 58 deletions(-)
 create mode 100644 package/mariadb/0002-add-check-for-pam-tool-directory.patch
 delete mode 100644 package/mariadb/0002-fix-build-error-with-newer-cmake.patch

diff --git a/package/mariadb/0002-add-check-for-pam-tool-directory.patch b/package/mariadb/0002-add-check-for-pam-tool-directory.patch
new file mode 100644
index 0000000000..d7636eda55
--- /dev/null
+++ b/package/mariadb/0002-add-check-for-pam-tool-directory.patch
@@ -0,0 +1,40 @@
+From 70276eca42890820e36c66876c4a7768c68a271f Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Sat, 28 Sep 2019 11:07:56 -0700
+Subject: [PATCH] add check for pam tool directory in mysql_install_db
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ scripts/mysql_install_db.sh | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/scripts/mysql_install_db.sh b/scripts/mysql_install_db.sh
+index 253cad72e0bcb69dfddf60576fe8d96bf1ab8a92..08f11b707f73ea500aa65f24a11ccf53d18bb7a2 100644
+--- a/scripts/mysql_install_db.sh
++++ b/scripts/mysql_install_db.sh
+@@ -480,13 +480,16 @@ done
+ 
+ if test -n "$user"
+ then
+-  chown $user "$pamtooldir/auth_pam_tool_dir" && \
+-  chmod 0700 "$pamtooldir/auth_pam_tool_dir"
+-  if test $? -ne 0
++  if test -d "$pamtooldir/auth_pam_tool_dir"
+   then
+-      echo "Cannot change ownership of the '$pamtooldir/auth_pam_tool_dir' directory"
+-      echo " to the '$user' user. Check that you have the necessary permissions and try again."
+-      exit 1
++      chown $user "$pamtooldir/auth_pam_tool_dir" && \
++      chmod 0700 "$pamtooldir/auth_pam_tool_dir"
++      if test $? -ne 0
++      then
++          echo "Cannot change ownership of the '$pamtooldir/auth_pam_tool_dir' directory"
++          echo " to the '$user' user. Check that you have the necessary permissions and try again."
++          exit 1
++      fi
+   fi
+   if test -z "$srcdir"
+   then
+-- 
+2.17.1
+
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
index 62357fa8c4..0cfde76bcd 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -5,7 +5,9 @@
 
 MYSQL_LIB="/var/lib/mysql"
 MYSQL_RUN="/run/mysql"
-MYSQL_PID="$MYSQL_RUN/mysqld.pid"
+MYSQL_PIDFILE="$MYSQL_RUN/mysqld.pid"
+MYSQL_LOG="/var/log/mysql"
+MYSQL_LOGFILE="$MYSQL_LOG/mysqld.log"
 MYSQL_BIN="/usr/bin"
 
 wait_for_ready() {
@@ -21,7 +23,7 @@ wait_for_ready() {
 }
 
 start() {
-	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
+	if [ "`ls -1 $MYSQL_LIB 2> /dev/null | wc -l`" = "0" ] ; then
 		printf "Creating mysql system tables ... "
 		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
 			--datadir=$MYSQL_LIB > /dev/null 2>&1
@@ -36,19 +38,22 @@ start() {
 	# so create a subdirectory for mysql.
 	install -d -o mysql -g root -m 0755 $MYSQL_RUN
 
+	# Also create logging directory as user mysql.
+	install -d -o mysql -g root -m 0755 $MYSQL_LOG
+
 	# We don't use start-stop-daemon because mysqld has its own
 	# wrapper script.
 	printf "Starting mysql ... "
-	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PID --user=mysql \
-		> /dev/null 2>&1 &
+	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PIDFILE --user=mysql \
+		--log-error=$MYSQL_LOGFILE > /dev/null 2>&1 &
 	wait_for_ready
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 
 stop() {
 	printf "Stopping mysql ... "
-	if [ -f $MYSQL_PID ]; then
-		kill `cat $MYSQL_PID` > /dev/null 2>&1
+	if [ -f "$MYSQL_PIDFILE" ]; then
+		kill `cat $MYSQL_PIDFILE` > /dev/null 2>&1
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 	else
 		echo "FAIL"
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a742d87daa..c96c9d5dca 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.18
-md5 b3524c0825c3a1c255496daea38304a0  mariadb-10.3.18.tar.gz
-sha1 922a317edd6f44baacc49831ca278e7a9878a363  mariadb-10.3.18.tar.gz
-sha256 69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc  mariadb-10.3.18.tar.gz
-sha512 817253d18f20c74f9ec8030678fd50a28b1726fd59153023a3a5e9b3f79e1f44d79feb24ae9ed72d8c1c04017110c932aba7be0610fb06245590c7f5610db242  mariadb-10.3.18.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.4.10
+md5 78f414b057a366479639193a0982bcaf  mariadb-10.4.10.tar.gz
+sha1 dddaeaefb92b753c810145fa6a886a91c465837d  mariadb-10.4.10.tar.gz
+sha256 cd50fddf86c2a47405737e342f78ebd40d5716f0fb32b976245de713bed01421  mariadb-10.4.10.tar.gz
+sha512 4a9b9a37bc3a273de4bd781dac3636256364dae6efbba45765d6b28995da3d64e180422cd10418d1c7acd7fd8843fe2a2638c07e0f56b0c09170c58812cc6b71  mariadb-10.4.10.tar.gz
 
 # Hash for license files
-sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256 fbcc1db54ebdc4af733aeaea9a00ec140f5f5fc43683f3966645450734c05747  README.md
 sha256 240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 82e3c16daf..e418081edc 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.18
+MARIADB_VERSION = 10.4.10
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
index cd308310c6..1897e514f5 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -3,7 +3,8 @@ Description=MySQL database server
 
 [Service]
 ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
-ExecStart=/usr/bin/mysqld_safe
+ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
+ExecStart=/usr/bin/mysqld_safe --pid-file=/var/run/mysql/mysqld.pid --log-error=/var/log/mysql/mysqld.log
 Restart=always
 User=mysql
 RuntimeDirectory=mysql
-- 
2.17.1
