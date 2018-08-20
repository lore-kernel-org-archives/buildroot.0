From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 20:18:43 +0200
Subject: [Buildroot] [git commit] oracle-mysql: fix hostname path
Message-ID: <20180820181118.CA7458DFCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bf656ead9801552f939217c5cc019fa24583b90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MySQL detects on the build machine where the hostname program is
located, and uses this value in a number of configuration files and
scripts that are generated and installed in the target:

output/target$ grep -r "bin/hostname" *
etc/inittab:::sysinit:/bin/hostname -F /etc/hostname
usr/share/mysql/mysql.server:  pid_file=$datadir/mysqlmanager-`/usr/bin/hostname`.pid
usr/share/mysql/mysql.server:  server_pid_file=$datadir/`/usr/bin/hostname`.pid
usr/bin/mysql_install_db:hostname=`/usr/bin/hostname`
usr/bin/mysqld_safe:    err_log=$DATADIR/`/usr/bin/hostname`.err
usr/bin/mysqld_safe:  pid_file="$DATADIR/`/usr/bin/hostname`.pid"

However, the hostname on the build machine may not necessarily be at
the same location as the hostname program on the target. Buildroot has
its hostname program (coming from Busybox) in /bin, but some Linux
distributions (such as Fedora) use /usr/bin/hostname, causing the
incorrect hostname paths above.

This commit fixes that by passing the appropriate autoconf cache
variable value.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Thomas: add commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oracle-mysql/oracle-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 7da5c547d9..0275a8428f 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -21,6 +21,7 @@ MYSQL_SOCKET = /run/mysql/mysql.sock
 ORACLE_MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
+	ac_cv_path_HOSTNAME=/bin/hostname \
 	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
 	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
 	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
