From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 28 Dec 2017 14:27:21 -0500
Subject: [Buildroot] [PATCH 4/4] libodb-pgsql: new package
In-Reply-To: <20171228192721.18494-1-Adamduskett@outlook.com>
References: <20171228192721.18494-1-Adamduskett@outlook.com>
Message-ID: <20171228192721.18494-5-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains the PostgreSQL ODB runtime library. Every application
that includes code generated for the PostgreSQL database will need to link to
this library.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/libodb-pgsql/Config.in         | 15 +++++++++++++++
 package/libodb-pgsql/libodb-pgsql.hash |  6 ++++++
 package/libodb-pgsql/libodb-pgsql.mk   | 16 ++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/libodb-pgsql/Config.in
 create mode 100644 package/libodb-pgsql/libodb-pgsql.hash
 create mode 100644 package/libodb-pgsql/libodb-pgsql.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca28d0be50..eb67a6a023 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -45,6 +45,7 @@ F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/libcutl/
 F:	package/libodb/
+F:	package/libodb-pgsql/
 F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
diff --git a/package/Config.in b/package/Config.in
index c7b80af455..0a8f04af13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1060,6 +1060,7 @@ menu "Database"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libodb-pgsql/Config.in"
 	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
diff --git a/package/libodb-pgsql/Config.in b/package/libodb-pgsql/Config.in
new file mode 100644
index 0000000000..28a17a7cee
--- /dev/null
+++ b/package/libodb-pgsql/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBODB_PGSQL
+	bool "libodb-pgsql"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_POSTGRESQL
+	select BR2_PACKAGE_LIBODB
+	help
+	  This package contains the PostgreSQL ODB runtime library.
+	  Every application that includes code generated for the
+	  PostgreSQL database will need to link to this library.
+
+	  https://www.codesynthesis.com/products/odb/
+
+comment "libodb-pgsql needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_POSTGRESQL
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libodb-pgsql/libodb-pgsql.hash b/package/libodb-pgsql/libodb-pgsql.hash
new file mode 100644
index 0000000000..5799f09236
--- /dev/null
+++ b/package/libodb-pgsql/libodb-pgsql.hash
@@ -0,0 +1,6 @@
+# From https://www.codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.bz2.sha1
+sha1	4628d5e296da01dbaf8658fd402b4f709f30ea2d	libodb-pgsql-2.4.0.tar.bz2
+
+# Locally Computed
+sha256	778a4d38bd1161e1f0b368815514c3335da20c7584e3d07613526dcce53523bc	libodb-pgsql-2.4.0.tar.bz2
+sha256	841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3	LICENSE
diff --git a/package/libodb-pgsql/libodb-pgsql.mk b/package/libodb-pgsql/libodb-pgsql.mk
new file mode 100644
index 0000000000..fd95439d7d
--- /dev/null
+++ b/package/libodb-pgsql/libodb-pgsql.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libodb-pgsql
+#
+################################################################################
+
+LIBODB_PGSQL_VERSION_MAJOR = 2.4
+LIBODB_PGSQL_VERSION = $(LIBODB_PGSQL_VERSION_MAJOR).0
+LIBODB_PGSQL_SOURCE = libodb-pgsql-$(LIBODB_PGSQL_VERSION).tar.bz2
+LIBODB_PGSQL_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_PGSQL_VERSION_MAJOR)
+LIBODB_PGSQL_DEPENDENCIES += postgresql libodb
+LIBODB_PGSQL_LICENSE = MIT
+LIBODB_PGSQL_LICENSE_FILES = LICENSE
+LIBODB_PGSQL_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.14.3
