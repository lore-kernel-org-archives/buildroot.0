From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon,  4 Feb 2019 19:53:40 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: change systemd service type to
 notify
In-Reply-To: <20180629183101.9705-1-joseph.kogut@gmail.com>
References: <20180629183101.9705-1-joseph.kogut@gmail.com>
Message-ID: <20190204185340.3689-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joseph Kogut <joseph.kogut@gmail.com>

During activation, pg_ctl uses exec to start the db server, which causes
the service to never finish activating when Type=forking. Upstream
recommends configuring --with-systemd and using Type=notify.

https://www.postgresql.org/docs/10/static/server-start.html

Upstream says:
    When using systemd, you can use the following service unit file
    [...]
    Using Type=notify requires that the server binary was built with
    configure --with-systemd.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/postgresql/postgresql.mk      |  8 ++++++++
 package/postgresql/postgresql.service | 12 ++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c4ba0daa17..fefbcf5f06 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -83,6 +83,14 @@ else
 POSTGRESQL_CONF_OPTS += --without-libxml
 endif
 
+# required for postgresql.service Type=notify
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+POSTGRESQL_DEPENDENCIES += systemd
+POSTGRESQL_CONF_OPTS += --with-systemd
+else
+POSTGRESQL_CONF_OPTS += --without-systemd
+endif
+
 define POSTGRESQL_USERS
 	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
 endef
diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
index 4a96258684..53e6f84f00 100644
--- a/package/postgresql/postgresql.service
+++ b/package/postgresql/postgresql.service
@@ -3,7 +3,7 @@ Description=PostgreSQL database server
 After=network.target
 
 [Service]
-Type=forking
+Type=notify
 
 # start timeout disabled because initdb may run a little
 # longer (eg. 5 minutes on RaspberryPi)
@@ -12,13 +12,17 @@ TimeoutStartSec=0
 User=postgres
 Group=postgres
 
+StandardOutput=syslog
+StandardError=syslog
 SyslogIdentifier=postgres
 PIDFile=/var/lib/pgsql/postmaster.pid
 
 ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
-ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
-ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
-ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
+ExecStart=/usr/bin/postgres -D /var/lib/pgsql
+ExecReload=/usr/bin/kill -HUP $MAINPID
+KillMode=mixed
+KillSignal=SIGINT
+TimeoutSec=0
 
 [Install]
 WantedBy=multi-user.target
-- 
2.19.2
