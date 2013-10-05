From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:06:40 +0200
Subject: [Buildroot] [git commit] mysql_client: needs thread support
Message-ID: <20131005191321.61E699B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e7b34d4db4e9a2b1004101ac12989d219e1e0e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.org/results/9b1/9b19b312651d21ea2fd54f364b11b01e4aa25e4b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in     |    1 +
 package/mysql_client/Config.in |    5 +++--
 package/php/Config.ext         |    3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4957115..da65053 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -235,6 +235,7 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  Connects to a MySQL database and issues a "show status" command.
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index 970b9b9..8c98b7a 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
 	  MySQL client
 
-comment "Mysql client requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "Mysql client requires a toolchain with C++ and thread support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 006d7dd..3ba591d 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -106,6 +106,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQL
 	bool "Mysql"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  MySQL support
@@ -114,6 +115,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	bool "Mysqli"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	select BR2_PACKAGE_PHP_EXT_MYSQL
 	help
@@ -130,6 +132,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "MySQL"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  PDO driver for MySQL
