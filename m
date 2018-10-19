From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 19 Oct 2018 17:52:23 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: added S48ntpdate script
Message-ID: <1539964343-10526-1-git-send-email-oscargomezf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
---
 package/ntp/S48ntpdate | 30 ++++++++++++++++++++++++++++++
 package/ntp/S49ntp     | 42 +++++++++++++++++++++---------------------
 package/ntp/ntp.mk     |  7 +++++++
 3 files changed, 58 insertions(+), 21 deletions(-)
 create mode 100755 package/ntp/S48ntpdate

diff --git a/package/ntp/S48ntpdate b/package/ntp/S48ntpdate
new file mode 100755
index 0000000..a8d4d70
--- /dev/null
+++ b/package/ntp/S48ntpdate
@@ -0,0 +1,30 @@
+#! /bin/sh
+
+NAME=ntpdate
+NTP_SERVERS="0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
+
+start() {
+	printf "Starting $NAME: "
+	for ntpserver in $NTP_SERVERS
+	do
+		CURRENT_UNIX_TIME="$(date +%s)"
+		if [ $CURRENT_UNIX_TIME -lt 1000000000 ]; then
+			/usr/bin/ntpdate $ntpserver > /dev/null 2>&1
+		else
+			break
+		fi
+	done
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case $1 in
+	start)
+		start
+		;;
+	*)
+		echo "Usage: $0 {start}" >&2
+		exit 1
+		;;
+esac
+
+exit 0
diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 35e5874..0e90f29 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -5,30 +5,30 @@ NAME=ntpd
 # Read config file if it is present.
 if [ -r /etc/default/$NAME ]
 then
-  . /etc/default/$NAME
+	. /etc/default/$NAME
 fi
 
 case "$1" in
-  start)
-    printf "Starting $NAME: "
-    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  stop)
-    printf "Stopping $NAME: "
-    start-stop-daemon -K -q -n $NAME
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  restart|reload)
-    echo "Restarting $NAME: "
-    $0 stop
-    sleep 1
-    $0 start
-    ;;
-  *)
-    echo "Usage: $0 {start|stop|restart|reload}" >&2
-    exit 1
-    ;;
+	start)
+		printf "Starting $NAME: "
+		start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping $NAME: "
+		start-stop-daemon -K -q -n $NAME
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart|reload)
+		echo "Restarting $NAME: "
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}" >&2
+		exit 1
+		;;
 esac
 
 exit 0
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index af3c1aa..c2c910d 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -93,9 +93,16 @@ define NTP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
 endef
 
+ifeq ($(BR2_PACKAGE_NTP_NTPDATE),y)
+define NTP_INSTALL_INIT_SYSV_NTPDATE
+	$(INSTALL) -D -m 755 package/ntp/S48ntpdate $(TARGET_DIR)/etc/init.d/S48ntpdate
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
 define NTP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+	$(NTP_INSTALL_INIT_SYSV_NTPDATE)
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
-- 
1.9.1
