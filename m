From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:56 -0800
Subject: [Buildroot] [PATCH v3 4/8] package/mariadb: fix potential error
 message in sysv startup script
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-4-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to check if the initial database needs created, the startup
script calls ls -1 $MYSQL_LIB | wc -l to check the number of files in
the directory. If the directory does not exist, an error is printed.
We fix this by redirecting stderr to /dev/null for the ls call.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into seperate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
---
 package/mariadb/S97mysqld | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index 62357fa8c4..7f9ced31e9 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -21,7 +21,9 @@ wait_for_ready() {
 }
 
 start() {
-	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
+	# stderr is redirected to prevent a warning
+	# if mysql lib directory doesn't exist
+	if [ `ls -1 $MYSQL_LIB 2> /dev/null | wc -l` = 0 ] ; then
 		printf "Creating mysql system tables ... "
 		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
 			--datadir=$MYSQL_LIB > /dev/null 2>&1
-- 
2.25.0
