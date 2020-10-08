From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:12:56 +0200
Subject: [Buildroot] [git commit] package/timescaledb: new package
Message-ID: <20201008210211.650898F000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6c7e0c0c3fa5515629c3f1d6c7fe8fc5107db96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TimescaleDB is an open-source database designed to make SQL scalable
for time-series data.  It is engineered up from PostgreSQL and
packaged as a PostgreSQL extension, providing automatic partitioning
across time and space (partitioning key), as well as full SQL support.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/timescaledb/Config.in        | 12 ++++++++++++
 package/timescaledb/timescaledb.hash |  3 +++
 package/timescaledb/timescaledb.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3eceebfcbd..1d057f20c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1854,6 +1854,9 @@ F:	package/python-wsaccel/
 N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
+N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/timescaledb/
+
 N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 F:	package/babeld/
 F:	package/dante/
diff --git a/package/Config.in b/package/Config.in
index 22112b524e..09a332e3b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1383,6 +1383,7 @@ menu "Database"
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
+	source "package/timescaledb/Config.in"
 	source "package/unixodbc/Config.in"
 endmenu
 
diff --git a/package/timescaledb/Config.in b/package/timescaledb/Config.in
new file mode 100644
index 0000000000..af4a868527
--- /dev/null
+++ b/package/timescaledb/Config.in
@@ -0,0 +1,12 @@
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
+	  https://www.timescale.com/
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
index 0000000000..ee58c692b3
--- /dev/null
+++ b/package/timescaledb/timescaledb.mk
@@ -0,0 +1,36 @@
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
+
+# The PG_CPPFLAGS, PG_CFLAGS, PG_LDFLAGS and PG_LIBS variables must be
+# non-empty, otherwise CMake will call the pg_config script, and our
+# pg_config replacement doesn't implement --cppflags --cflags
+# --ldflags and --libs.
+TIMESCALEDB_CONF_OPTS = \
+	-DREGRESS_CHECKS=OFF \
+	-DPG_PKGLIBDIR=lib/postgresql \
+	-DPG_SHAREDIR=share/postgresql \
+	-DPG_BINDIR=bin \
+	-DPG_CPPFLAGS="$(TARGET_CPPFLAGS) " \
+	-DPG_CFLAGS="$(TARGET_CFLAGS) " \
+	-DPG_LDFLAGS="$(TARGET_LDFLAGS) " \
+	-DPG_LIBS=" "
+
+# There's no dependency on the OpenSSL package, because USE_OPENSSL
+# only tells if postgresql was built with OpenSSL support or not.
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+TIMESCALEDB_CONF_OPTS += -DUSE_OPENSSL=1
+else
+TIMESCALEDB_CONF_OPTS += -DUSE_OPENSSL=0
+endif
+
+$(eval $(cmake-package))
