From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon,  5 Oct 2020 13:19:51 +0300
Subject: [Buildroot] [PATCH 2/2] package/timescaledb: new package
In-Reply-To: <20201005101951.3112095-1-fido_max@inbox.ru>
References: <20201005101951.3112095-1-fido_max@inbox.ru>
Message-ID: <20201005101951.3112095-3-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TimescaleDB is an open-source database designed to make SQL scalable for time-series data.
It is engineered up from PostgreSQL and packaged as a PostgreSQL extension, providing
automatic partitioning across time and space (partitioning key), as well as full SQL support.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/Config.in                    |  1 +
 package/timescaledb/Config.in        | 11 +++++++++++
 package/timescaledb/timescaledb.hash |  3 +++
 package/timescaledb/timescaledb.mk   | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/timescaledb/Config.in
 create mode 100644 package/timescaledb/timescaledb.hash
 create mode 100644 package/timescaledb/timescaledb.mk

diff --git a/package/Config.in b/package/Config.in
index 16acc30ce6..5c50d4d523 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1379,6 +1379,7 @@ menu "Database"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
+	source "package/timescaledb/Config.in"
 	source "package/redis/Config.in"
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
diff --git a/package/timescaledb/Config.in b/package/timescaledb/Config.in
new file mode 100644
index 0000000000..e11fb14ac0
--- /dev/null
+++ b/package/timescaledb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TIMESCALEDB
+	bool "timescaledb"
+	depends on BR2_PACKAGE_POSTGRESQL
+	help
+	  TimescaleDB is an open-source database designed
+	  to make SQL scalable for time-series data.
+	  It is engineered up from PostgreSQL and packaged
+	  as a PostgreSQL extension, providing automatic
+	  partitioning across time and space (partitioning key),
+	  as well as full SQL support.
+
diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
new file mode 100644
index 0000000000..452e2efc8f
--- /dev/null
+++ b/package/timescaledb/timescaledb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d0b7a153ff3e02ecf033a869ecdf4286f8610ea76140baa84928fc3a80223e99  timescaledb-1.7.4.tar.gz
+sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
new file mode 100644
index 0000000000..958fa1e508
--- /dev/null
+++ b/package/timescaledb/timescaledb.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# timescaledb
+#
+################################################################################
+
+TIMESCALEDB_VERSION = 1.7.4
+TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
+TIMESCALEDB_LICENSE = Apache-2.0
+TIMESCALEDB_LICENSE_FILES = LICENSE
+
+TIMESCALEDB_DEPENDENCIES = postgresql
+TIMESCALEDB_CONF_OPTS += -DREGRESS_CHECKS=OFF
+TIMESCALEDB_CONF_OPTS += -DPG_PKGLIBDIR=lib/postgresql
+TIMESCALEDB_CONF_OPTS += -DPG_SHAREDIR=share/postgresql
+TIMESCALEDB_CONF_OPTS += -DPG_BINDIR=bin
+TIMESCALEDB_CONF_OPTS += -DPG_CPPFLAGS="$(POSTGRESQL_CPPFLAGS) "
+TIMESCALEDB_CONF_OPTS += -DPG_CFLAGS="$(POSTGRESQL_CFLAGS) "
+TIMESCALEDB_CONF_OPTS += -DPG_LDFLAGS="$(POSTGRESQL_LDFLAGS) "
+TIMESCALEDB_CONF_OPTS += -DPG_LIBS=" "
+
+$(eval $(cmake-package))
-- 
2.27.0
