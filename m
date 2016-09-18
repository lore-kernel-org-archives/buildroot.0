From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:35:58 +0200
Subject: [Buildroot] [git commit] package/mysql: add MYSQL_SOCKET variable
Message-ID: <20160918175031.0F7CD8023B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd741df4bb8d0497c57f77c691ce6faa4c9a3934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add MYSQL_SOCKET variable with MySQL socket location

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/S97mysqld      | 2 +-
 package/mysql/mysql.mk       | 4 ++++
 package/mysql/mysqld.service | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
index 1d87e68..5a660e9 100644
--- a/package/mysql/S97mysqld
+++ b/package/mysql/S97mysqld
@@ -9,7 +9,7 @@ case "$1" in
 
 		# mysqld runs as user mysql, but /run is only writable by root
 		# so create a subdirectory for mysql.
-		install -d -o mysql -g root -m 0700 /run/mysql
+		install -d -o mysql -g root -m 0755 /run/mysql
 
 		# We don't use start-stop-daemon because mysqld has
 		# its own wrapper script.
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 534bd97..7af4711 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -14,6 +14,9 @@ MYSQL_AUTORECONF = YES
 MYSQL_LICENSE = GPLv2
 MYSQL_LICENSE_FILES = README COPYING
 
+# Unix socket. This variable can also be consulted by other buildroot packages
+MYSQL_SOCKET = /run/mysql/mysql.sock
+
 MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
@@ -31,6 +34,7 @@ MYSQL_CONF_OPTS = \
 	--without-readline \
 	--with-low-memory \
 	--enable-thread-safe-client \
+	--with-unix-socket-path=$(MYSQL_SOCKET) \
 	--disable-mysql-maintainer-mode
 
 # host-mysql only installs what is needed to build mysql, i.e. the
diff --git a/package/mysql/mysqld.service b/package/mysql/mysqld.service
index 2ded9c2..c9e5e42 100644
--- a/package/mysql/mysqld.service
+++ b/package/mysql/mysqld.service
@@ -5,6 +5,9 @@ Description=MySQL database server
 ExecStartPre=/bin/sh -c 'test -d /var/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/mysql'
 ExecStart=/usr/bin/mysqld_safe
 Restart=always
+User=mysql
+RuntimeDirectory=mysql
+RuntimeDirectoryMode=0755
 
 [Install]
 WantedBy=multi-user.target
