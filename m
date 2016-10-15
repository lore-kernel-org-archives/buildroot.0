From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:21:27 +0200
Subject: [Buildroot] [git commit] mysql: Make S97mysqld source a default file
Message-ID: <20161015092257.6D05281EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e278c5201251f0fb25d17cfb9e1a443a17a5f54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hardcoded parameters are used for mysql user/directory.

Make S97mysqld source a /etc/default/mysql file where these
parameters can be overridden.

Signed-off-by: Eloi BAIL <eloi.bail@savoirfairelinux.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/S97mysqld | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
index 5a660e9..110ca2c 100644
--- a/package/mysql/S97mysqld
+++ b/package/mysql/S97mysqld
@@ -1,10 +1,15 @@
 #!/bin/sh
 
+MYSQL_DIR="/var/mysql"
+MYSQL_USER="mysql"
+
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
