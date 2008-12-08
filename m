From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 06:52:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_busybox_skeleton/etc/init.d targe etc...
Message-ID: <20081208145216.966853C7DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 06:52:16 -0800 (Mon, 08 Dec 2008)
New Revision: 24325

Log:
make the default etc/init.d/S40network compatible with msh

msh is currently the only good choice for uClinux but it doesn't
understands shell functions.  In this case there is nothing to gain
by using shell functions anyway.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Modified:
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/init.d/S40network
   trunk/buildroot/target/generic/target_skeleton/etc/init.d/S40network


Changeset:
Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/init.d/S40network
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/init.d/S40network	2008-12-08 14:41:47 UTC (rev 24324)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/init.d/S40network	2008-12-08 14:52:16 UTC (rev 24325)
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

Modified: trunk/buildroot/target/generic/target_skeleton/etc/init.d/S40network
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/init.d/S40network	2008-12-08 14:41:47 UTC (rev 24324)
+++ trunk/buildroot/target/generic/target_skeleton/etc/init.d/S40network	2008-12-08 14:52:16 UTC (rev 24325)
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
