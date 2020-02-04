From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 14:57:20 +0100
Subject: [Buildroot] [git commit] package/mariadb: do not pass --user=mysql
 to mysql_install_db
Message-ID: <20200204134625.7B4168B4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b74423025defaa9eaa1541987ec5cd1060cda7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently install the default database by passing --user=mysql to the
install script. With the upcoming bump to the 10.4 series, this does not
work as intended. An error occurs because of missing PAM modules. We work
around this now by creating the default db as root and calling chown to
change the files to user mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/S97mysqld | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index b895014b54..54594a9e87 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -27,12 +27,13 @@ start() {
 	# if mysql lib directory doesn't exist
 	if [ `ls -1 $MYSQL_LIB 2> /dev/null | wc -l` = 0 ] ; then
 		printf "Creating mysql system tables ... "
-		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
+		$MYSQL_BIN/mysql_install_db --basedir=/usr \
 			--datadir=$MYSQL_LIB > /dev/null 2>&1
 		if [ $? != 0 ]; then
 			echo "FAIL"
 			exit 1
 		fi
+		chown -R mysql:mysql $MYSQL_LIB
 		echo "OK"
 	fi
 
