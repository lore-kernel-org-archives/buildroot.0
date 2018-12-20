From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 20:08:52 -0200
Subject: [Buildroot] [PATCH] package/shairport-sync: fix init script (stop)
Message-ID: <20181220220852.17829-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shairport-sync creates its pidfile at /var/run/shairport-sync/, so pass
that path to start-stop-daemon in the stop operation.

Also pass the executable path, allowing start-stop-daemon to check if
the PID matches the shairport-sync process, preventing killing some
other inocent daemon.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=11566

Reported-by: Bin Zhang <yangtze31@gmail.com>
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/shairport-sync/S99shairport-sync | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
index 5443ed138c..ef2fa0dcd2 100644
--- a/package/shairport-sync/S99shairport-sync
+++ b/package/shairport-sync/S99shairport-sync
@@ -6,16 +6,17 @@ OPTIONS="-d"
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
+	start-stop-daemon -K -q -p /var/run/shairport-sync/shairport-sync.pid
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     restart)
 	$0 stop
+	sleep 1
 	$0 start
 	;;
     *)
-- 
2.19.2
