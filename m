From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 31 Mar 2014 08:59:29 +0200
Subject: [Buildroot] [PATCH] postgresql: new package
Message-ID: <1396249169-14126-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on suggested new package by Marco Trapanese ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - change data dir from /srv/pqsql/data to /var/lib/pgsql
    (as suggested by Thomas Petazzoni)
  - fix POSTGRESQL_SITE url (removed cut and paste error)
    (as suggested by Thomas Petazzoni)
  - remove superfluous POSTGRESQL_CONF_OPT prefix option
    (as suggested by Thomas Petazzoni)
  - fix POSTGRESQL_USERS (remove superfluous own group)
    (as suggested by Yann E. MORIN)
  - fix data dir install command (remove superfluous -v option)
    (as suggested by Yann E. MORIN)
  - make readline an zlib optional (add hint in the help text
    instead)
    (as suggested by Thomas Petazzoni)

Changes v1 -> v2:
  - add postgresql user
  - add postgresql data directory
  - add sysv initialize and startup script
---
 package/Config.in                |  1 +
 package/postgresql/Config.in     | 20 +++++++++++++++
 package/postgresql/S50postgresql | 44 ++++++++++++++++++++++++++++++++
 package/postgresql/postgresql.mk | 54 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 package/postgresql/Config.in
 create mode 100644 package/postgresql/S50postgresql
 create mode 100644 package/postgresql/postgresql.mk

diff --git a/package/Config.in b/package/Config.in
index e816603..5805342 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -544,6 +544,7 @@ source "package/berkeleydb/Config.in"
 source "package/cppdb/Config.in"
 source "package/gdbm/Config.in"
 source "package/mysql/Config.in"
+source "package/postgresql/Config.in"
 source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
new file mode 100644
index 0000000..bc0305b
--- /dev/null
+++ b/package/postgresql/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_POSTGRESQL
+	bool "PostgreSQL"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_ZLIB
+	help
+	  PostgreSQL is a powerful, open source object-relational
+	  database system.
+
+	  Enable the readline package to gain readline support in
+	  pgsql (the command line interpreter), which offers
+	  command history and edit functions.
+
+	  Enable the zlib package to gain builtin compression for
+	  archives with pg_dump and pg_restore.
+
+	  http://www.postgresql.org
+
+comment "PostgreSQL needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
new file mode 100644
index 0000000..54f2119
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
+	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql '
+	echo "done"
+fi
+
+start() {
+	echo -n "Starting postgresql: "
+	su - postgres -c '/usr/bin/pg_ctl start -D /var/lib/pgsql -l logfile'
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping postgresql: "
+	su - postgres -c '/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast'
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
index 0000000..fee4aed
--- /dev/null
+++ b/package/postgresql/postgresql.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# postgresql
+#
+################################################################################
+
+POSTGRESQL_VERSION = 9.3.3
+POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
+POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
+POSTGRESQL_LICENSE = PostgreSQL
+POSTGRESQ_LICENSE_FILES = COPYRIGHT
+
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	POSTGRESQL_CONF_OPT += --disable-thread-safety
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	POSTGRESQL_DEPENDENCIES += readline
+else
+	POSTGRESQL_CONF_OPT += --wihtout-readline
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	POSTGRESQL_DEPENDENCIES += zlib
+else
+	POSTGRESQL_CONF_OPT += --wihtout-zlib
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
+	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
+endef
+
+define POSTGRESQL_INSTALL_TARGET_FIXUP
+	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
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
