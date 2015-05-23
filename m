From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:04:26 +0300
Subject: [Buildroot] [PATCH 10/38] inadyn: start in background mode
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <a719f137d409fdbeac559237770c00e15066ef34.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless -b is specified, inadyn stays in foreground.
It does also write a pid file that can be used by start-stop-daemon.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/inadyn/S70inadyn | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index b20048c..d63dedb 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -15,12 +15,12 @@ VR_INADYN=/var/run/inadyn
 case "$1" in
 	start)
 		echo "Starting inadyn: "
-		start-stop-daemon -S -x /usr/bin/inadyn
+		start-stop-daemon -S -p /var/run/inadyn/inadyn.pid -x /usr/bin/inadyn -b
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo  "Stopping inadyn: "
-		start-stop-daemon -q -K -x /usr/bin/inadyn
+		start-stop-daemon -q -K -p /var/run/inadyn/inadyn.pid -x /usr/bin/inadyn
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		rm -f /var/run/inadyn/inadyn.pid
 		;;
-- 
2.0.3
