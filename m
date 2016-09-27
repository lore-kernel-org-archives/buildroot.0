From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 26 Sep 2016 18:53:04 -0700
Subject: [Buildroot] [RFC v3 3/3] mysql: convert to virtual package
In-Reply-To: <20160927015304.5937-1-bluemrp9@gmail.com>
References: <20160927015304.5937-1-bluemrp9@gmail.com>
Message-ID: <20160927015304.5937-4-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/Config.in                    |  3 +-
 package/mariadb/Config.in            | 32 --------------
 package/mariadb/mariadb.mk           |  1 +
 package/mysql/Config.in              | 83 ++++++++++++++++++++++++++++++++++++
 package/mysql/mysql.mk               |  7 +++
 package/oracle-mysql/Config.in       | 25 -----------
 package/oracle-mysql/oracle-mysql.mk |  1 +
 7 files changed, 93 insertions(+), 59 deletions(-)
 delete mode 100644 package/mariadb/Config.in
 create mode 100644 package/mysql/Config.in
 create mode 100644 package/mysql/mysql.mk
 delete mode 100644 package/oracle-mysql/Config.in

diff --git a/package/Config.in b/package/Config.in
index 4e71ddb..fe3ac2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,9 +909,8 @@ menu "Database"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libpqxx/Config.in"
-	source "package/mariadb/Config.in"
 	source "package/mongodb/Config.in"
-	source "package/oracle-mysql/Config.in"
+	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
 	source "package/sqlcipher/Config.in"
diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
deleted file mode 100644
index 9d70b3e..0000000
--- a/package/mariadb/Config.in
+++ /dev/null
@@ -1,32 +0,0 @@
-config BR2_PACKAGE_MARIADB
-	bool "mariadb"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_ORACLE_MYSQL
-	select BR2_PACKAGE_LIBAIO
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_READLINE
-	help
-	  MariaDB is one of the most popular database servers in the world.
-	  It's made by the original developers of MySQL and guaranteed to
-	  stay open source.
-
-	  http://www.mariadb.org/
-
-if BR2_PACKAGE_MARIADB
-
-config BR2_PACKAGE_MARIADB_SERVER
-	bool "mariadb server"
-	help
-	  Install the mariadb server on the target.
-
-endif
-
-comment "mariadb needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index bac38c2..67e6df4 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -10,6 +10,7 @@ MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERS
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
 MARIADB_INSTALL_STAGING = YES
+MARIADB_PROVIDES = mysql
 
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
new file mode 100644
index 0000000..e485d6b
--- /dev/null
+++ b/package/mysql/Config.in
@@ -0,0 +1,83 @@
+config BR2_PACKAGE_MYSQL
+	bool "mysql support"
+	help
+	  Select the desired mysql provider.
+
+if BR2_PACKAGE_MYSQL
+
+choice
+	prompt "mysql variant"
+	default BR2_PACKAGE_ORACLE_MYSQL
+	help
+	  Select either the oracle mysql server or the mariadb server
+
+config BR2_PACKAGE_MARIADB
+	bool "mariadb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_HAS_MYSQL
+	help
+	  MariaDB is one of the most popular database servers in the world.
+	  It's made by the original developers of MySQL and guaranteed to
+	  stay open source.
+
+	  http://www.mariadb.org/
+
+config BR2_PACKAGE_ORACLE_MYSQL
+	bool "oracle mysql"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_HAS_MYSQL
+	help
+	  The MySQL Open Source Database System
+
+	  http://www.mysql.com/
+
+endchoice
+
+comment "mariadb needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "oracle mysql needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_MARIADB
+
+config BR2_PACKAGE_MARIADB_SERVER
+	bool "mariadb server"
+	help
+	  Install the mariadb server on the target.
+
+endif
+
+if BR2_PACKAGE_ORACLE_MYSQL
+
+config BR2_PACKAGE_ORACLE_MYSQL_SERVER
+	bool "oracle mysql server"
+	help
+	  Install the MySQL server on the target.
+
+endif
+
+config BR2_PACKAGE_HAS_MYSQL
+	bool
+
+config BR2_PACKAGE_PROVIDES_MYSQL
+	string
+	default "mariadb"      if BR2_PACKAGE_MARIADB
+	default "oracle-mysql" if BR2_PACKAGE_ORACLE_MYSQL
+
+endif
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
new file mode 100644
index 0000000..d655625
--- /dev/null
+++ b/package/mysql/mysql.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# mysql
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/oracle-mysql/Config.in b/package/oracle-mysql/Config.in
deleted file mode 100644
index 1c2d33b..0000000
--- a/package/oracle-mysql/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_ORACLE_MYSQL
-	bool "oracle mysql"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_MARIADB
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
-	help
-	  The MySQL Open Source Database System
-
-	  http://www.mysql.com/
-
-if BR2_PACKAGE_ORACLE_MYSQL
-
-config BR2_PACKAGE_ORACLE_MYSQL_SERVER
-	bool "oracle mysql server"
-	help
-	  Install the MySQL server on the target.
-
-endif
-
-comment "oracle mysql needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 532cced..e542fb3 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -13,6 +13,7 @@ ORACLE_MYSQL_DEPENDENCIES = readline ncurses
 ORACLE_MYSQL_AUTORECONF = YES
 ORACLE_MYSQL_LICENSE = GPLv2
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
+ORACLE_MYSQL_PROVIDES = mysql
 
 # Unix socket. This variable can also be consulted by other buildroot packages
 MYSQL_SOCKET = /run/mysql/mysql.sock
-- 
2.9.3
