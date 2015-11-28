From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:02:51 +0100
Subject: [Buildroot] [git commit] package/minidlna/S60minidlnad: add
	force-reload to rebuild DB
Message-ID: <20151128180310.D669C7FC99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e08c3ac60403ca073b4366e02b352d7ea22c85e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a force-reload operation that restarts minidlnad and makes it
rebuild its database. This is what Debian does, and this is useful when
media_dir is changed in the configuration file or when inotify can not
detect changes inside the media directories (e.g. in case of a mount).

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/S60minidlnad |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/minidlna/S60minidlnad b/package/minidlna/S60minidlnad
index 92b4c95..9b158af 100644
--- a/package/minidlna/S60minidlnad
+++ b/package/minidlna/S60minidlnad
@@ -7,7 +7,7 @@ start() {
 	printf "Starting minidlna: "
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
 
