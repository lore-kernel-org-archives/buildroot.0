From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:42:30 +0200
Subject: [Buildroot] [git commit] libpqxx: new package
Message-ID: <20160730134334.70E0381D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=261ba28c43cdecc543420460daa43c63749184ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/libpqxx/Config.in    | 13 +++++++++++++
 package/libpqxx/libpqxx.hash |  4 ++++
 package/libpqxx/libpqxx.mk   | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f11ea9f..5584d36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -899,6 +899,7 @@ menu "Database"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
new file mode 100644
index 0000000..ddf14fd
--- /dev/null
+++ b/package/libpqxx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBPQXX
+	bool "libpqxx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_POSTGRESQL
+	help
+	  libpqxx is the official C++ client API for PostgreSQL, the
+	  enterprise-strength open-source relational database.
+
+	  http://pqxx.org/development/libpqxx/
+
+comment "libpqxx needs toolchain w/ C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_POSTGRESQL
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
index 0000000..0587190
--- /dev/null
+++ b/package/libpqxx/libpqxx.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libpqxx
+#
+################################################################################
+
+LIBPQXX_VERSION = 4.0.1
+LIBPQXX_SITE = http://pqxx.org/download/software/libpqxx
+LIBPQXX_INSTALL_STAGING = YES
+LIBPQXX_DEPENDENCIES = postgresql
+LIBPQXX_LICENSE = BSD-3c
+LIBPQXX_LICENSE_FILES = COPYING
+
+LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+
+$(eval $(autotools-package))
