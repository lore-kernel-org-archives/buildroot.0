From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 11:27:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20070625182759.E1403A459E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 11:27:58 -0700 (Mon, 25 Jun 2007)
New Revision: 18934

Log:
- Add a system-V init script to ntpd. Closes #518


Added:
   trunk/buildroot/package/ntp/ntp.sysvinit

Modified:
   trunk/buildroot/package/ntp/ntp.mk


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.mk
===================================================================
--- trunk/buildroot/package/ntp/ntp.mk	2007-06-25 16:56:11 UTC (rev 18933)
+++ trunk/buildroot/package/ntp/ntp.mk	2007-06-25 18:27:58 UTC (rev 18934)
@@ -57,6 +57,7 @@
 $(TARGET_DIR)/$(NTP_TARGET_BINARY): $(NTP_DIR)/$(NTP_BINARY)
 	install -m 755 $(NTP_DIR)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
 	install -m 755 $(NTP_DIR)/$(NTP_BINARY) $(TARGET_DIR)/$(NTP_TARGET_BINARY)
+	install -m 755 package/ntp/ntp.sysvinit $(TARGET_DIR)/etc/init.d/S49ntp
 
 ntp: uclibc $(TARGET_DIR)/$(NTP_TARGET_BINARY)
 

Added: trunk/buildroot/package/ntp/ntp.sysvinit
===================================================================
--- trunk/buildroot/package/ntp/ntp.sysvinit	                        (rev 0)
+++ trunk/buildroot/package/ntp/ntp.sysvinit	2007-06-25 18:27:58 UTC (rev 18934)
@@ -0,0 +1,46 @@
+#! /bin/sh
+#
+# System-V init script for the openntp daemon
+#
+
+set -e
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DESC="network time protocol daemon"
+NAME=ntpd
+DAEMON=/usr/sbin/$NAME
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+# Read config file if it is present.
+if [ -r /etc/default/$NAME ]
+then
+	. /etc/default/$NAME
+fi
+
+case "$1" in
+  start) echo -n "Starting $DESC: $NAME"
+	start-stop-daemon -S -q -x $DAEMON
+	echo "."
+	;;
+  stop) echo -n "Stopping $DESC: $NAME"
+	start-stop-daemon -K -q -n $NAME
+	echo "."
+	;;
+  reload|force-reload) echo -n "Reloading $DESC configuration..."
+	start-stop-daemon -K -q -n $NAME -s 1
+	echo "done."
+  ;;
+  restart) echo -n "Restarting $DESC: $NAME"
+	start-stop-daemon -K -q -n $NAME
+	sleep 1
+	start-stop-daemon -S -q -x $DAEMON
+	echo "."
+	;;
+  *) echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/ntp/ntp.sysvinit
___________________________________________________________________
Name: svn:executable
   + *
