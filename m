From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 13 Nov 2014 00:06:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: fix init script
Message-ID: <1415833586-6181-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shairport-sync uses libdaemon for running as daemon and creating the pidfile
which conflicts with start-stop-daemons `-b -m` options. For that reason 
shairport-sync does not start using /etc/init.d/S99shairport-sync start.

The issue is fixed by removing the background and pidfile task from
start-stop-daemon and add a daemon option `-d` to shairport-sync.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/shairport-sync/S99shairport-sync | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
index 31359fc..54d20ff 100644
--- a/package/shairport-sync/S99shairport-sync
+++ b/package/shairport-sync/S99shairport-sync
@@ -1,12 +1,12 @@
 #! /bin/sh
 
 # Additional options that are passed to Shairport Sync
-OPTIONS=""
+OPTIONS="-d"
 
 case "$1" in
     start)
 	echo -n "Starting shairport-sync: "
-	start-stop-daemon -S -q -m -b -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
+	start-stop-daemon -S -q -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
-- 
2.1.3
