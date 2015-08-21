From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 21 Aug 2015 19:55:18 +0200
Subject: [Buildroot] [PATCH] package/minidlna/S60minidlnad: add force-reload
	to rebuild DB
Message-ID: <1440179718-1864-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a force-reload operation that restarts minidlnad and makes it
rebuild its database. This is what Debian does, and this is useful when
media_dir is changed in the configuration file or when inotify can not
detect changes inside the media directories (e.g. in case of a mount).

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/minidlna/S60minidlnad | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/minidlna/S60minidlnad b/package/minidlna/S60minidlnad
index f99999a..b4b62ba 100644
--- a/package/minidlna/S60minidlnad
+++ b/package/minidlna/S60minidlnad
@@ -7,7 +7,7 @@ start() {
 	echo -n "Starting minidlna: "
 	umask 077
 	start-stop-daemon -S -q -p /var/run/minidlna/minidlna.pid \
-		--exec /usr/sbin/minidlnad
+		--exec /usr/sbin/minidlnad -- "$@"
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
@@ -19,7 +19,7 @@ restart() {
 	stop
 	# Sleep needed for minidlna to restart properly
 	sleep 1
-	start
+	start "$@"
 }
 
 case "$1" in
@@ -32,8 +32,11 @@ case "$1" in
   restart|reload)
 	restart
 	;;
+  force-reload)
+	restart -R
+	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart|force-reload}"
 	exit 1
 esac
 
-- 
2.1.4
