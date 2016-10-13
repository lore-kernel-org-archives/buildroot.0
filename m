From: Eloi BAIL <eloi.bail@savoirfairelinux.com>
Date: Thu, 13 Oct 2016 14:28:02 -0400
Subject: [Buildroot] [PATCH 1/1] mysql: Make S97mysqld source a default file
Message-ID: <1476383282-10739-1-git-send-email-eloi.bail@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hardcoded parameters are used for mysql installation.
Make S97mysqld source a /etc/default/mysql file where these
parameters can be overridden.

Signed-off-by: Eloi BAIL <eloi.bail@savoirfairelinux.com>
---
 package/mysql/S97mysqld | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
index 5a660e9..638790f 100644
--- a/package/mysql/S97mysqld
+++ b/package/mysql/S97mysqld
@@ -1,10 +1,14 @@
 #!/bin/sh
 
+MYSQL_DIR="/var/mysql"
+MYSQL_USER="mysql"
+[ -r /etc/default/mysql ] && . /etc/default/mysql
+
 case "$1" in
 	start)
-		if [ ! -d /var/mysql/mysql ] ; then
+		if [ ! -d $MYSQL_DIR/mysql ] ; then
 			echo "Creating MySQL system tables..."
-			mysql_install_db --user=mysql --ldata=/var/mysql
+			mysql_install_db --user=$MYSQL_USER --ldata=$MYSQL_DIR
 		fi
 
 		# mysqld runs as user mysql, but /run is only writable by root
-- 
2.7.4
