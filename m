From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:59 -0800
Subject: [Buildroot] [PATCH v3 7/8] package/mariadb: do not pass
 --user=mysql to mysql_install_db
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-7-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently install the default database by passing --user=mysql to the
install script. With the upcoming bump to the 10.4 series, this does not
work as intended. An error occurs because of missing PAM modules. We work
around this now by creating the default db as root and calling chown to
change the files to user mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into seperate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
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
 
-- 
2.25.0
