From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:45:08 +0100
Subject: [Buildroot] [git commit] package/unscd: add PID file to init script
Message-ID: <20151223164608.BD7BF826E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccf8ecd10fe2fe398ede6b297a5df19d6d69d8ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

unscd creates/manages it's own PID file. Pass PID file reference to
start-stop-daemon.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
