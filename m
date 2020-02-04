From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:53 -0800
Subject: [Buildroot] [PATCH v3 1/8] package/mariadb: fix permissions of data
 dir when using systemd
Message-ID: <20200204012200.7273-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysql_install_db is currently called in the systemd unit without
--user=mysql that the sysv script uses. This will generate the initial
database files with root permissions. However, mysqld runs as user mysql
so this will cause problems. We fix this by calling chown instead of
passing the user parameter because an upcoming version bump will fail when
ran this way.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into separate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
---
 package/mariadb/mysqld.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index cd308310c6..3eaef173e1 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -2,7 +2,7 @@
 Description=MySQL database server
 
 [Service]
-ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
+ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
 ExecStart=/usr/bin/mysqld_safe
 Restart=always
 User=mysql
-- 
2.25.0
