From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:01:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssh
Message-ID: <20070723110100.68581A6863@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:00:59 -0700 (Mon, 23 Jul 2007)
New Revision: 19215

Log:
- add runlevel script for later use


Added:
   trunk/buildroot/package/openssh/S50sshd


Changeset:
Added: trunk/buildroot/package/openssh/S50sshd
===================================================================
--- trunk/buildroot/package/openssh/S50sshd	                        (rev 0)
+++ trunk/buildroot/package/openssh/S50sshd	2007-07-23 11:00:59 UTC (rev 19215)
@@ -0,0 +1,64 @@
+#!/bin/sh
+#
+# sshd        Starts sshd.
+#
+
+# Make sure the ssh-keygen progam exists
+[ -f /usr/bin/ssh-keygen ] || exit 0
+
+# Check for the SSH1 RSA key
+if [ ! -f /etc/ssh_host_key ] ; then
+	echo Generating RSA Key...
+	/usr/bin/ssh-keygen -t rsa1 -f /etc/ssh_host_key -C '' -N ''
+fi
+
+# Check for the SSH2 RSA key
+if [ ! -f /etc/ssh_host_rsa_key ] ; then
+	echo Generating RSA Key...
+	/usr/bin/ssh-keygen -t rsa -f /etc/ssh_host_rsa_key -C '' -N ''
+fi
+
+# Check for the SSH2 DSA key
+if [ ! -f /etc/ssh_host_dsa_key ] ; then
+	echo Generating DSA Key...
+	echo THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
+	echo
+        /usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
+fi
+                
+umask 077
+
+start() {
+ 	echo -n "Starting sshd: "
+	/usr/sbin/sshd
+	touch /var/lock/sshd
+	echo "OK"
+}	
+stop() {
+	echo -n "Stopping sshd: "
+        killall	sshd 
+	rm -f /var/lock/sshd
+	echo "OK" 
+}
+restart() {
+	stop
+	start
+}	
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart|reload)
+  	restart
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
