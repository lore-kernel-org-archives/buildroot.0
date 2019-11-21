From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 21 Nov 2019 11:15:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/postgresql: enable data checksums
 by default for initdb
Message-ID: <20191121101552.6845-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal de Bruijn <pmjdebruijn@pcode.nl>

This makes PostgreSQL as robust as possible by default

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/postgresql/S50postgresql      | 2 +-
 package/postgresql/postgresql.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
index 3c0c520..ce72e12 100644
--- a/package/postgresql/S50postgresql
+++ b/package/postgresql/S50postgresql
@@ -7,7 +7,7 @@ umask 077
 
 if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
 	echo "Initializing postgresql data base..."
-	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8'
+	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8 -o --data-checksums'
 	echo "done"
 fi
 
diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
index 4bbe742..2f5d2a9 100644
--- a/package/postgresql/postgresql.service
+++ b/package/postgresql/postgresql.service
@@ -17,7 +17,7 @@ StandardError=syslog
 SyslogIdentifier=postgres
 PIDFile=/var/lib/pgsql/postmaster.pid
 
-ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8; fi"
+ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8 -o --data-checksums; fi"
 ExecStart=/usr/bin/postgres -D /var/lib/pgsql
 ExecReload=/usr/bin/kill -HUP $MAINPID
 KillMode=mixed
-- 
2.7.4
