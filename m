From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 13:33:24 -0300
Subject: [Buildroot] [PATCHv2] cppdb: new package
Message-ID: <1381854804-19065-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/cppdb/Config.in | 15 +++++++++++++++
 package/cppdb/cppdb.mk  | 20 ++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/cppdb/Config.in
 create mode 100644 package/cppdb/cppdb.mk

diff --git a/package/Config.in b/package/Config.in
index 226d916..16cb36d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ endmenu
 
 menu "Database"
 source "package/berkeleydb/Config.in"
+source "package/cppdb/Config.in"
 source "package/gdbm/Config.in"
 source "package/mysql_client/Config.in"
 source "package/redis/Config.in"
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
new file mode 100644
index 0000000..f0c48e3
--- /dev/null
+++ b/package/cppdb/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CPPDB
+	bool "cppdb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Can be built without them but it's useless
+	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE
+	help
+	  CppDB is an SQL connectivity library that is designed to provide
+	  platform and Database independent connectivity API similarly
+	  to what JDBC, ODBC and other connectivity libraries do.
+
+	  http://cppcms.com/sql/cppdb/
+
+comment "cppdb needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
new file mode 100644
index 0000000..7cb858f
--- /dev/null
+++ b/package/cppdb/cppdb.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cppdb
+#
+################################################################################
+
+CPPDB_VERSION = 0.3.1
+CPPDB_SOURCE = cppdb-$(CPPDB_VERSION).tar.bz2
+CPPDB_SITE = http://downloads.sourceforge.net/project/cppcms/cppdb/$(CPPDB_VERSION)
+CPPDB_INSTALL_STAGING = YES
+CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
+CPPDB_LICENSE = Boost-v1.0 or MIT
+CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
+
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+CPPDB_DEPENDENCIES += mysql_client
+CPPDB_CONF_OPT += -DMYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql
+endif
+
+$(eval $(cmake-package))
-- 
1.8.1.5
