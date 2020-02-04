From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 14:57:20 +0100
Subject: [Buildroot] [git commit] package/mariadb: fix permissions of data
 dir when using systemd
Message-ID: <20200204134625.4CC028B4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=add2c2ba2ec0e3fd18b6f6612dda6ab78ea6affd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mysql_install_db is currently called in the systemd unit without
--user=mysql that the sysv script uses. This will generate the initial
database files with root permissions. However, mysqld runs as user mysql
so this will cause problems. We fix this by calling chown instead of
passing the user parameter because an upcoming version bump will fail when
ran this way.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
