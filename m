From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Dec 2014 08:44:34 +0100
Subject: [Buildroot] [git commit] transmission: use start() / stop() in init
	script like elsewhere
Message-ID: <20141212074528.3312B7F9D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20b4a4e8d1821e52c2d89a286df8526ac60e006f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other init scripts in Buildroot use start()/stop() instead of
do_start()/do_stop(), so change it here as well for consistency

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/S92transmission |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index f226154..1870522 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -66,7 +66,7 @@ SCRIPTNAME=/etc/init.d/$NAME
 # Function that starts the daemon/service
 #
 
-do_start()
+start()
 {
     # Export the configuration/web directory, if set
     if [ -n "$TRANSMISSION_HOME" ]; then
@@ -91,7 +91,7 @@ do_start()
 #
 # Function that stops the daemon/service
 #
-do_stop()
+stop()
 {
         # Return
         #   0 if daemon has been stopped
@@ -121,7 +121,7 @@ do_stop()
 case "$1" in
   start)
         echo "Starting $DESC" "$NAME..."
-        do_start
+        start
         case "$?" in
                 0|1) echo "   Starting $DESC $NAME succeeded" ;;
                 *)   echo "   Starting $DESC $NAME failed" ;;
@@ -129,7 +129,7 @@ case "$1" in
         ;;
   stop)
         echo "Stopping $DESC $NAME..."
-        do_stop
+        stop
         case "$?" in
                 0|1) echo "   Stopping $DESC $NAME succeeded" ;;
                 *)   echo "   Stopping $DESC $NAME failed" ;;
@@ -141,10 +141,10 @@ case "$1" in
         # 'force-reload' alias
         #
         echo "Restarting $DESC $NAME..."
-        do_stop
+        stop
         case "$?" in
           0|1)
-                do_start
+                start
                 case "$?" in
                     0|1) echo "   Restarting $DESC $NAME succeeded" ;;
                     *)   echo "   Restarting $DESC $NAME failed: couldn't start $NAME" ;;
