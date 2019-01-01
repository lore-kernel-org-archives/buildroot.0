From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 16:12:44 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/shairport-sync:
 fix init script (stop)
Message-ID: <20190101153021.DD2FF886B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fcdad2a12a965939263966fd3bfbffd7799feaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

shairport-sync creates its pidfile at /var/run/shairport-sync/, so pass
that path to start-stop-daemon in the stop operation.

Also pass the executable path, allowing start-stop-daemon to check if
the PID matches the shairport-sync process, preventing killing some
other inocent daemon.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=11566

Reported-by: Bin Zhang <yangtze31@gmail.com>
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6568b939293e46718434e284bded04b746fbd80f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/S99shairport-sync | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
index 5443ed138c..80b2fddbc6 100644
--- a/package/shairport-sync/S99shairport-sync
+++ b/package/shairport-sync/S99shairport-sync
@@ -6,16 +6,18 @@ OPTIONS="-d"
 case "$1" in
     start)
 	printf "Starting shairport-sync: "
-	start-stop-daemon -S -q -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
+	start-stop-daemon -S -q --exec /usr/bin/shairport-sync -- $OPTIONS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
 	printf "Stopping shairport-sync: "
-	start-stop-daemon -K -q -p /var/run/shairport-sync.pid
+	start-stop-daemon -K -q --exec /usr/bin/shairport-sync \
+		-p /var/run/shairport-sync/shairport-sync.pid
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     restart)
 	$0 stop
+	sleep 1
 	$0 start
 	;;
     *)
