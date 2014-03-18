From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 18 Mar 2014 23:36:00 +0100
Subject: [Buildroot] [PATCH v2] postgresql: new package
Message-ID: <1395182160-26138-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on suggested new package by Marco Trapanese ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add postgresql user
  - add postgresql data directory
  - add sysv initialize and startup script
---
 package/Config.in                |  1 +
 package/postgresql/Config.in     | 13 ++++++++++++
 package/postgresql/S50postgresql | 44 ++++++++++++++++++++++++++++++++++++++++
 package/postgresql/postgresql.mk | 44 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 package/postgresql/Config.in
 create mode 100644 package/postgresql/S50postgresql
 create mode 100644 package/postgresql/postgresql.mk

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..f8a86ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -539,6 +539,7 @@ source "package/berkeleydb/Config.in"
 source "package/cppdb/Config.in"
 source "package/gdbm/Config.in"
 source "package/mysql/Config.in"
+source "package/postgresql/Config.in"
 source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
new file mode 100644
index 0000000..efc296f
--- /dev/null
+++ b/package/postgresql/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_POSTGRESQL
+	bool "PostgreSQL"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_ZLIB
+	help
+	  PostgreSQL is a powerful, open source object-relational
+	  database system.
+
+	  http://www.postgresql.org
+
+comment "PostgreSQL needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
new file mode 100644
index 0000000..06cb4d5
--- /dev/null
+++ b/package/postgresql/S50postgresql
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# start postgresql
+#
+
+umask 077
+
+if [ ! -f /srv/pgsql/data/PG_VERSION ]; then
+	echo "Initializing postgresql data base..."
+	su - postgres -c '/usr/bin/pg_ctl initdb -D /srv/pgsql/data '
+	echo "done"
+fi
+
+start() {
+	echo -n "Starting postgresql: "
+	su - postgres -c '/usr/bin/pg_ctl start -D /srv/pgsql/data -l logfile'
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping postgresql: "
+	su - postgres -c '/usr/bin/pg_ctl stop -D /srv/pgsql/data -m fast'
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
new file mode 100644
index 0000000..f4edc69
--- /dev/null
+++ b/package/postgresql/postgresql.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# postgresql
+#
+################################################################################
+
+POSTGRESQL_VERSION = 9.3.3
+POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
+POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)/$(POSTGRESQL_SOURCE)
+POSTGRESQL_LICENSE = PostgreSQL
+POSTGRESQ_LICENSE_FILES = COPYRIGHT
+POSTGRESQL_DEPENDENCIES = readline zlib
+POSTGRESQL_CONF_OPT = --prefix=/usr
+
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	POSTGRESQL_CONF_OPT += --disable-thread-safety
+endif
+
+ifeq ($(BR2_PACKAGE_TZDATA),y)
+	POSTGRESQL_DEPENDENCIES += tzdata
+	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	POSTGRESQL_DEPENDENCIES += openssl
+	POSTGRESQL_CONF_OPT += --with-openssl
+endif
+
+define POSTGRESQL_USERS
+	postgres -1 postgres -1 * /srv/pgsql/data /bin/sh postgres PostgreSQL Server
+endef
+
+define POSTGRESQL_INSTALL_TARGET_FIXUP
+	$(INSTALL) -v -dm700 $(TARGET_DIR)/srv/pgsql/data
+endef
+
+POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
+
+define POSTGRESQL_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/postgresql/S50postgresql \
+		$(TARGET_DIR)/etc/init.d/S50postgresql
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.4
