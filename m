From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:28:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/mariadb: fix
 potential error message in sysv startup script
Message-ID: <20200310202142.132D98FE14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f295a87c8115bd4f688da93734f5b8b9976274d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

In order to check if the initial database needs to be created, the startup
script calls ls -1 $MYSQL_LIB | wc -l to check the number of files in the
directory.  If the directory does not exist, an error is printed.  We fix
this by redirecting stderr to /dev/null for the ls call.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 22bb9b2c28a6835e8414cd0cd6cbb61223c0f0d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
