From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:37 -0300
Subject: [Buildroot] [PATCH 19/26] prosody: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-20-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/prosody/S50prosody | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/prosody/S50prosody b/package/prosody/S50prosody
index 84913a5f83..6fd33671fa 100644
--- a/package/prosody/S50prosody
+++ b/package/prosody/S50prosody
@@ -1,7 +1,6 @@
 #! /bin/sh
 
 NAME=prosody
-DAEMON=/usr/bin/$NAME
 
 # This must match the pidfile field in
 # /etc/prosody/prosody.cfg.lua
@@ -9,15 +8,12 @@ DAEMON=/usr/bin/$NAME
 PIDDIR=/var/run/$NAME
 PIDFILE=$PIDDIR/$NAME.pid
 
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
-
 case "$1" in
   start)
     printf "Starting $NAME: "
     mkdir -p $PIDDIR
     chown $NAME:$NAME $PIDDIR
-    start-stop-daemon -S -q -o -x $DAEMON -c $NAME
+    start-stop-daemon -S -q -o -x /usr/bin/prosody -c $NAME
     [ $? = 0 ] && echo "OK" || echo "FAIL"
     ;;
   stop)
-- 
2.14.3
