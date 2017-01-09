From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  9 Jan 2017 11:56:54 +0100
Subject: [Buildroot] [PATCH] mysql: propagate common dependencies to
	toplevel config
Message-ID: <20170109105654.14562-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3d707d2b (mysql: rename package to oracle-mysql, make a virtual
package) introduced a user selectable virtual BR2_PACKAGE_MYSQL package, but
didn't propagate the (common) dependencies of the two variants to it, so the
virtual package can now be selected even though neither of the variants are
available.

As several packages enable mysql support when BR2_PACKAGE_MYSQL is selected,
this causes a number of autobuilder issues:

http://autobuild.buildroot.net/results/7fe/7fe0d0a3e7ed0430852dc42b718dd037557207e8/
http://autobuild.buildroot.net/results/cc4/cc4c2d936f3e1ba6c0a9782b2218de54a4ff75d2/

Fix it by propagating the common dependencies of the two variants to the
virtual package to ensure it cannot be enabled unless at least one of them
are available.

Also move the toolchain comment outside the conditional so it is visible
when mysql isn't available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/Config.in | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index e485d6b99..69ad58654 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_MYSQL
 	bool "mysql support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Select the desired mysql provider.
 
@@ -13,9 +16,6 @@ choice
 
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
@@ -32,9 +32,6 @@ config BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_ORACLE_MYSQL
 	bool "oracle mysql"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_HAS_MYSQL
@@ -45,15 +42,6 @@ config BR2_PACKAGE_ORACLE_MYSQL
 
 endchoice
 
-comment "mariadb needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "oracle mysql needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_MARIADB_SERVER
@@ -81,3 +69,7 @@ config BR2_PACKAGE_PROVIDES_MYSQL
 	default "oracle-mysql" if BR2_PACKAGE_ORACLE_MYSQL
 
 endif
+
+comment "mysql needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
