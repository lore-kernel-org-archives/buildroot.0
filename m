From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Thu,  6 Nov 2008 13:11:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20081106211155.89BD53C859@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-11-06 13:11:54 -0800 (Thu, 06 Nov 2008)
New Revision: 23945

Log:
ntp: add /etc/default/ntpd to control whether to start
 ntpd and/or ntpdate.  Also specify options and servers.

Added:
   trunk/buildroot/package/ntp/ntpd.etc.default

Modified:
   trunk/buildroot/package/ntp/ntp.mk
   trunk/buildroot/package/ntp/ntp.sysvinit


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.mk
===================================================================
--- trunk/buildroot/package/ntp/ntp.mk	2008-11-06 15:13:33 UTC (rev 23944)
+++ trunk/buildroot/package/ntp/ntp.mk	2008-11-06 21:11:54 UTC (rev 23945)
@@ -67,6 +67,10 @@
 	install -m 755 $(NTP_DIR)/sntp/sntp $(TARGET_DIR)/usr/bin/sntp
 endif
 	install -m 755 package/ntp/ntp.sysvinit $(TARGET_DIR)/etc/init.d/S49ntp
+	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
+		install -m 755 -d $(TARGET_DIR)/etc/default ; \
+		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
+	fi
 
 ntp: uclibc $(TARGET_DIR)/$(NTP_TARGET_BINARY)
 

Modified: trunk/buildroot/package/ntp/ntp.sysvinit
===================================================================
--- trunk/buildroot/package/ntp/ntp.sysvinit	2008-11-06 15:13:33 UTC (rev 23944)
+++ trunk/buildroot/package/ntp/ntp.sysvinit	2008-11-06 21:11:54 UTC (rev 23945)
@@ -9,6 +9,7 @@
 DESC="network time protocol daemon"
 NAME=ntpd
 DAEMON=/usr/sbin/$NAME
+NTPDATE_BIN=/usr/bin/ntpdate
 
 # Gracefully exit if the package has been removed.
 test -x $DAEMON || exit 0
@@ -20,9 +21,17 @@
 fi
 
 case "$1" in
-  start) echo -n "Starting $DESC: $NAME"
-	start-stop-daemon -S -q -x $DAEMON
-	echo "."
+  start)
+	if test x$NTPDATE = xyes ; then
+		echo -n "Getting initial time via ntp"
+		$NTPDATE_BIN $NTPDATE_OPTS $NTPSERVERS > /dev/null 2>&1
+		echo "."
+	fi
+	if test x$NTPD = xyes ; then
+		echo -n "Starting $DESC: $NAME"
+		start-stop-daemon -S -q -x $DAEMON
+		echo "."
+	fi
 	;;
   stop) echo -n "Stopping $DESC: $NAME"
 	start-stop-daemon -K -q -n $NAME

Added: trunk/buildroot/package/ntp/ntpd.etc.default
===================================================================
--- trunk/buildroot/package/ntp/ntpd.etc.default	                        (rev 0)
+++ trunk/buildroot/package/ntp/ntpd.etc.default	2008-11-06 21:11:54 UTC (rev 23945)
@@ -0,0 +1,9 @@
+# NTP Servers to use for ntpdate
+NTPSERVERS="pool.ntp.org"
+
+# Get initial time via ntpdate?
+NTPDATE=no
+NTPDATE_OPTS="-t 5"
+
+# Start the ntp daemon?
+NTPD=yes
