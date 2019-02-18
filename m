From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 23:23:40 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/postgresql:
 change systemd service type to notify
Message-ID: <20190218222325.AEF0C88FDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e705c89373941b45a921b1921175303fad1dd394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eada187e77022f0da30884a826dc1767ba99abe8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
