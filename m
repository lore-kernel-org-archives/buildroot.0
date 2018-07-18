From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 18 Jul 2018 06:28:46 -0700
Subject: [Buildroot] [PATCH 1/1] mariadb: bump version to 10.2.16
Message-ID: <20180718132846.3176-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://mariadb.com/kb/en/mariadb-10216-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10216-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash |  6 +++---
 package/mariadb/mariadb.mk   | 10 +++++-----
 package/mysql/Config.in      |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 7eea62ab7b..97fc1d8262 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.1.33/
-sha256 94312c519f2c0c25e1964c64e22aff0036fb22dfb2685638f43a6b2211395d2d  mariadb-10.1.33.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.2.16/
+sha256 c182ee93bacee9c1395a4cece56acfc433bc5153ec627c4898927b93eee54dc4  mariadb-10.2.16.tar.gz
 
 # Hash for license files
-sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
+sha256 dec3c92fdc58070facec08db681aa6b9cb05fd21e463358161c1df92e1c0653f  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index ce846d9cda..c60ba3b4d8 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.33
+MARIADB_VERSION = 10.2.16
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
-MARIADB_LICENSE_FILES = README COPYING
+MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
@@ -67,7 +67,7 @@ MARIADB_CONF_OPTS += \
 	-DMYSQL_DATADIR=/var/lib/mysql \
 	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
-HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
+HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
 
 # Some helpers must be compiled for host in order to crosscompile mariadb for
 # the target. They are then included by import_executables.cmake which is
@@ -104,13 +104,13 @@ define MARIADB_INSTALL_INIT_SYSTEMD
 endef
 endif
 
+# We don't need mysql_config on the target as it's only useful in staging
+# We also don't need the test suite on the target
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
 	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
 		$(TARGET_DIR)/etc/mysql/my.cnf
-	# We don't need this on the target as it's only useful in staging
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
-	# Remove test suite
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
 
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 278dc73e57..140c2314d4 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -17,6 +17,7 @@ choice
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS #dlopen
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
-- 
2.18.0
