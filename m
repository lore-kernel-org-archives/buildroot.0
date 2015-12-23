From: Doug Kehn <rdkehn@yahoo.com>
Date: Wed, 23 Dec 2015 07:54:40 -0600
Subject: [Buildroot] [PATCH 1/1] package/unscd: add PID file to init script
Message-ID: <1450878880-13335-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

unscd creates/manages it's own PID file. Pass PID file reference to
start-stop-daemon.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/unscd/S46unscd | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/unscd/S46unscd b/package/unscd/S46unscd
index 7d18f94..6a51eec 100644
--- a/package/unscd/S46unscd
+++ b/package/unscd/S46unscd
@@ -2,16 +2,17 @@
 
 NAME="nscd"
 DAEMON="/usr/sbin/${NAME}"
+PID_F="/var/run/nscd/${NAME}.pid"
 
 case "$1" in
 start)
         printf "Starting ${NAME}: "
-        start-stop-daemon -S -x ${DAEMON}
+        start-stop-daemon -S -p ${PID_F} -x ${DAEMON}
         [ $? -eq 0 ] && echo "OK" || echo "FAIL"
         ;;
 stop)
         printf "Stopping ${NAME}: "
-        start-stop-daemon -K -x ${DAEMON}
+        start-stop-daemon -K -p ${PID_F}
         [ $? -eq 0 ] && echo "OK" || echo "FAIL"
         ;;
 restart|reload)
-- 
2.6.4
