From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  9 Sep 2016 01:31:58 +0200
Subject: [Buildroot] [PATCH v2] package/mysql: add MYSQL_SOCKET variable
Message-ID: <1473377518-29712-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MYSQL_SOCKET variable with default socket location for other
packages to use.

v2: move socket to /run/mysql/mysql.sock
chmod 755 /run/mysql to allow users access to it
---
 package/mysql/S97mysqld      | 2 +-
 package/mysql/mysql.mk       | 4 ++++
 package/mysql/mysqld.service | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

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
index 2ded9c2..af1815d 100644
--- a/package/mysql/mysqld.service
+++ b/package/mysql/mysqld.service
@@ -5,6 +5,8 @@ Description=MySQL database server
 ExecStartPre=/bin/sh -c 'test -d /var/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/mysql'
 ExecStart=/usr/bin/mysqld_safe
 Restart=always
+RuntimeDirectory=mysql
+RuntimeDirectoryMode=0755
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.4
