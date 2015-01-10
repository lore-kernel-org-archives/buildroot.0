From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 19:04:31 +0100
Subject: [Buildroot] [git commit] postgresql: add systemd service file
Message-ID: <20150110180452.CBA1B803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=828d7b2f0d22885c70e50b247b79268101c5bed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: indent using tabs.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk      |    8 ++++++++
 package/postgresql/postgresql.service |   24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index ea663a2..e53b9dd 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -69,4 +69,12 @@ define POSTGRESQL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50postgresql
 endef
 
+define POSTGRESQL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/postgresql/postgresql.service \
+		$(TARGET_DIR)/etc/systemd/system/postgresql.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../postgresql.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
new file mode 100644
index 0000000..4a96258
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
+ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
+ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
+ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
+
+[Install]
+WantedBy=multi-user.target
