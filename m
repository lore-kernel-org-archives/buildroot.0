From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Fri, 14 Nov 2008 14:52:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20081114225248.9B86F3C834@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-11-14 14:52:48 -0800 (Fri, 14 Nov 2008)
New Revision: 24048

Log:
ntp.sysvinit: fix 'restart' (don't exit on failed commands with set -e)

Modified:
   trunk/buildroot/package/ntp/ntp.sysvinit


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.sysvinit
===================================================================
--- trunk/buildroot/package/ntp/ntp.sysvinit	2008-11-14 22:14:12 UTC (rev 24047)
+++ trunk/buildroot/package/ntp/ntp.sysvinit	2008-11-14 22:52:48 UTC (rev 24048)
@@ -3,8 +3,6 @@
 # System-V init script for the openntp daemon
 #
 
-set -e
-
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 DESC="network time protocol daemon"
 NAME=ntpd
@@ -41,11 +39,10 @@
 	start-stop-daemon -K -q -n $NAME -s 1
 	echo "done."
   ;;
-  restart) echo -n "Restarting $DESC: $NAME"
-	start-stop-daemon -K -q -n $NAME
+  restart) echo "Restarting $DESC: $NAME"
+	$0 stop
 	sleep 1
-	start-stop-daemon -S -q -x $DAEMON
-	echo "."
+	$0 start
 	;;
   *) echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
 	exit 1
