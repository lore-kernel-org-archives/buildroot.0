From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:24:46 -0500 (EST)
Subject: [Buildroot] [PATCH] make the default etc/init.d/S40network
	compatible with msh
Message-ID: <alpine.LFD.2.00.0812031424090.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


msh is currently the only good choice for uClinux but it doesn't
understands shell functions.  In this case there is nothing to gain
by using shell functions anyway.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: target/generic/target_busybox_skeleton/etc/init.d/S40network
===================================================================
--- target/generic/target_busybox_skeleton/etc/init.d/S40network	(revision 24219)
+++ target/generic/target_busybox_skeleton/etc/init.d/S40network	(working copy)
@@ -3,28 +3,18 @@
 # Start the network....
 #
 
-start() {
+case "$1" in
+  start)
  	echo "Starting network..."
 	/sbin/ifup -a
-}	
-stop() {
+	;;
+  stop)
 	echo -n "Stopping network..."
 	/sbin/ifdown -a
-}
-restart() {
-	stop
-	start
-}	
-
-case "$1" in
-  start)
-  	start
 	;;
-  stop)
-  	stop
-	;;
   restart|reload)
-  	restart
+	"$0" stop
+	"$0" start
 	;;
   *)
 	echo $"Usage: $0 {start|stop|restart}"
Index: target/generic/target_skeleton/etc/init.d/S40network
===================================================================
--- target/generic/target_skeleton/etc/init.d/S40network	(revision 24219)
+++ target/generic/target_skeleton/etc/init.d/S40network	(working copy)
@@ -3,28 +3,18 @@
 # Start the network....
 #
 
-start() {
+case "$1" in
+  start)
  	echo "Starting network..."
 	/sbin/ifup -a
-}	
-stop() {
+	;;
+  stop)
 	echo -n "Stopping network..."
 	/sbin/ifdown -a
-}
-restart() {
-	stop
-	start
-}	
-
-case "$1" in
-  start)
-  	start
 	;;
-  stop)
-  	stop
-	;;
   restart|reload)
-  	restart
+	"$0" stop
+	"$0" start
 	;;
   *)
 	echo $"Usage: $0 {start|stop|restart}"
