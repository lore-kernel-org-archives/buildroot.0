From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 28 Jul 2016 17:20:31 -0400
Subject: [Buildroot] [PATCH 1/1] libpqxx: new package
Message-ID: <20160728212031.14768-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in            |  1 +
 package/libpqxx/Config.in    | 14 ++++++++++++++
 package/libpqxx/libpqxx.hash |  4 ++++
 package/libpqxx/libpqxx.mk   | 17 +++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/libpqxx/Config.in
 create mode 100644 package/libpqxx/libpqxx.hash
 create mode 100644 package/libpqxx/libpqxx.mk

diff --git a/package/Config.in b/package/Config.in
index 0f0c376..fb8c5ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ menu "Database"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
new file mode 100644
index 0000000..a4fd4a1
--- /dev/null
+++ b/package/libpqxx/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBPQXX
+	bool "libpqxx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_POSTGRESQL
+	help
+	  libpqxx is the official C++ client API for ?PostgreSQL, the
+	  enterprise-strength open-source relational database.
+
+	  http://pqxx.org/development/libpqxx/
+
+comment "libpqxx needs postgresql and toolchain w/ C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_POSTGRESQL
+	depends on !BR2_STATIC_LIBS # postgresql depends on static
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
new file mode 100644
index 0000000..65c50c6
--- /dev/null
+++ b/package/libpqxx/libpqxx.hash
@@ -0,0 +1,4 @@
+# From: http://pqxx.org/download/software/libpqxx/libpqxx-4.0.1.tar.gz.md5sum
+md5	6ea888b9ba85dd7cef1b182dc5f223a2  libpqxx-4.0.1.tar.gz
+# Locally computed after verifying md5sum:
+sha256	097ceda2797761ce517faa5bee186c883df1c407cb2aada613a16773afeedc38  libpqxx-4.0.1.tar.gz
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
new file mode 100644
index 0000000..be81654
--- /dev/null
+++ b/package/libpqxx/libpqxx.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libpqxx
+#
+################################################################################
+
+LIBPQXX_VERSION = 4.0.1
+LIBPQXX_SITE = http://pqxx.org/download/software/libpqxx
+LIBPQXX_SOURCE = libpqxx-$(LIBPQXX_VERSION).tar.gz
+LIBPQXX_INSTALL_STAGING = YES
+LIBPQXX_DEPENDENCIES = postgresql
+LIBPQXX_LICENSE = BSD
+LIBPQXX_LICENSE_FILES = COPYING
+
+LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+
+$(eval $(autotools-package))
-- 
2.8.4.windows.1
