From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:34:48 +0200
Subject: [Buildroot] [RFC 10/11] postgresql: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <08bc6a5fa1819c59f8e290cad33cbdc1ed694e09.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the most complicated entries. Users, files, and pre-start
initialization that must be done with a specific user id.
---
 package/postgresql/S50postgresql      | 44 -----------------------------------
 package/postgresql/postgresql.files   |  1 +
 package/postgresql/postgresql.mk      | 17 --------------
 package/postgresql/postgresql.run     |  6 +++++
 package/postgresql/postgresql.service | 24 -------------------
 package/postgresql/postgresql.users   |  1 +
 6 files changed, 8 insertions(+), 85 deletions(-)
 delete mode 100644 package/postgresql/S50postgresql
 create mode 100644 package/postgresql/postgresql.files
 create mode 100644 package/postgresql/postgresql.run
 delete mode 100644 package/postgresql/postgresql.service
 create mode 100644 package/postgresql/postgresql.users

diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
deleted file mode 100644
index 86a8d83..0000000
--- a/package/postgresql/S50postgresql
+++ /dev/null
@@ -1,44 +0,0 @@
-#!/bin/sh
-#
-# start postgresql
-#
-
-umask 077
-
-if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
-	echo "Initializing postgresql data base..."
-	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
-	echo "done"
-fi
-
-start() {
-	echo -n "Starting postgresql: "
-	su - postgres -c '/usr/bin/pg_ctl start -D /var/lib/pgsql -l logfile'
-	echo "OK"
-}
-stop() {
-	echo -n "Stopping postgresql: "
-	su - postgres -c '/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast'
-	echo "OK"
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		restart
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
-
-exit $?
diff --git a/package/postgresql/postgresql.files b/package/postgresql/postgresql.files
new file mode 100644
index 0000000..81a3a25
--- /dev/null
+++ b/package/postgresql/postgresql.files
@@ -0,0 +1 @@
+/var/lib/pgsql		d	0700	postgresql	postgresql	-	-	-	-	-
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index bc382ce..1fbe1cf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -60,10 +60,6 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
-define POSTGRESQL_USERS
-	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
-endef
-
 define POSTGRESQL_INSTALL_TARGET_FIXUP
 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
 	$(RM) -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
@@ -78,17 +74,4 @@ endef
 
 POSTGRESQL_POST_INSTALL_STAGING_HOOKS += POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
 
-define POSTGRESQL_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/postgresql/S50postgresql \
-		$(TARGET_DIR)/etc/init.d/S50postgresql
-endef
-
-define POSTGRESQL_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/postgresql/postgresql.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/postgresql.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
-endef
-
 $(eval $(autotools-package))
diff --git a/package/postgresql/postgresql.run b/package/postgresql/postgresql.run
new file mode 100644
index 0000000..c7fcf36
--- /dev/null
+++ b/package/postgresql/postgresql.run
@@ -0,0 +1,6 @@
+## PostgreSQL database server
+user postgres
+group postgres
+
+test -f /var/lib/pgsql/PG_VERSION || /usr/bin/initdb -D /var/lib/pgsql
+exec /usr/bin/postmaster -D /var/lib/pgsql
diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
deleted file mode 100644
index 4a96258..0000000
--- a/package/postgresql/postgresql.service
+++ /dev/null
@@ -1,24 +0,0 @@
-[Unit]
-Description=PostgreSQL database server
-After=network.target
-
-[Service]
-Type=forking
-
-# start timeout disabled because initdb may run a little
-# longer (eg. 5 minutes on RaspberryPi)
-TimeoutStartSec=0
-
-User=postgres
-Group=postgres
-
-SyslogIdentifier=postgres
-PIDFile=/var/lib/pgsql/postmaster.pid
-
-ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
-ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
-ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
-ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
-
-[Install]
-WantedBy=multi-user.target
diff --git a/package/postgresql/postgresql.users b/package/postgresql/postgresql.users
new file mode 100644
index 0000000..9724144
--- /dev/null
+++ b/package/postgresql/postgresql.users
@@ -0,0 +1 @@
+postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
-- 
2.0.3
