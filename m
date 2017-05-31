From: Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Wed, 31 May 2017 23:40:45 +0200
Subject: [Buildroot] [PATCH 1/1] imx-uuc: fix start-stop-daemon stop failure
Message-ID: <1496266845-11307-1-git-send-email-alexandre.esse.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The daemon service script associated with imx-uuc failed to stop the daemon 
since the PID of the process wasn't stored at start time.

Adding -m option allowed to create the uuc.pid file as expected.

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
---
 package/freescale-imx/imx-uuc/S80imx-uuc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-uuc/S80imx-uuc b/package/freescale-imx/imx-uuc/S80imx-uuc
index 8a02f88..9a92c98 100644
--- a/package/freescale-imx/imx-uuc/S80imx-uuc
+++ b/package/freescale-imx/imx-uuc/S80imx-uuc
@@ -6,7 +6,7 @@ DAEMON=/usr/bin/$NAME
 case "$1" in
     start)
 	printf "Starting $NAME: "
-	start-stop-daemon -S -q -b -p /var/run/${NAME}.pid -x $DAEMON
+	start-stop-daemon -S -q -b -m -p /var/run/${NAME}.pid -x $DAEMON
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
-- 
2.7.4
