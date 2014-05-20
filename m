From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 20 May 2014 22:43:47 +0200
Subject: [Buildroot] [PATCH] postgresql: add systemd service file
Message-ID: <1400618627-4970-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk      |  8 ++++++++
 package/postgresql/postgresql.service | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 package/postgresql/postgresql.service

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2606e25..0823a27 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -54,4 +54,12 @@ define POSTGRESQL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50postgresql
 endef
 
+define POSTGRESQL_INSTALL_INIT_SYSTEMD
+        $(INSTALL) -D -m 644 package/postgresql/postgresql.service \
+                $(TARGET_DIR)/etc/systemd/system/postgresql.service
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        ln -fs ../postgresql.service \
+                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
new file mode 100644
index 0000000..69be1bb
--- /dev/null
+++ b/package/postgresql/postgresql.service
@@ -0,0 +1,24 @@
+[Unit]
+Description=PostgreSQL database server
+After=network.target
+
+[Service]
+Type=forking
+
+# start timeout disabled because initdb may run a little
+# longer (eg. 5 minutes on RaspberryPi)
+TimeoutStartSec=0
+
+User=postgres
+Group=postgres
+
+SyslogIdentifier=postgres
+PIDFile=/var/lib/pgsql/postmaster.pid
+
+ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
+ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -l /var/lib/pgsql/logfile
+ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
+ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
+
+[Install]
+WantedBy=multi-user.target
-- 
1.8.1.4
