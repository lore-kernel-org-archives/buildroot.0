From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:56 +0200
Subject: [Buildroot] [git commit] prosody: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.DDCBF88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9eb40a96c70d789b7075e665183d74f371b0b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
