From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Tue, 18 Nov 2014 15:54:44 +0100
Subject: [Buildroot] [PATCH V3 2/5] package/squid: add init script
In-Reply-To: <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1416322487-14247-3-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/squid/S97squid | 36 ++++++++++++++++++++++++++++++++++++
 package/squid/squid.mk |  7 +++++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/squid/S97squid

diff --git a/package/squid/S97squid b/package/squid/S97squid
new file mode 100644
index 0000000..0908784
--- /dev/null
+++ b/package/squid/S97squid
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+SQUID_BIN="/usr/sbin/squid"
+SQUID_LOG_DIR="/var/log/squid"
+SQUID_PID=/var/run/squid.pid
+SQUID_CONF=/etc/squid.conf
+SQUID_OPTS=""
+
+# (Re)create log directory and give access to squid user (nobody)
+if [ ! -d $SQUID_LOG_DIR ]; then
+	mkdir -p $SQUID_LOG_DIR 
+	chmod 777 $SQUID_LOG_DIR
+fi
+
+case "$1" in
+    start)
+	echo -n "Starting WWW-proxy squid "
+	start-stop-daemon -S -x $SQUID_BIN -- -f $SQUID_CONF $SQUID_OPTS
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	echo -n "Shutting down WWW-proxy squid "
+	start-stop-daemon -K -x $SQUID_BIN
+	;;
+    restart | force-reload)
+	$0 stop
+	sleep 2
+	$0 start
+	if [ "$?" != "0" ]; then
+		exit 1
+	fi
+	;;
+     *)
+	echo "Usage: /etc/init.d/S97squid {start|stop|restart|force-reload}"
+	exit 1
+esac
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index ed51881..b0fa69f 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -50,4 +50,11 @@ endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
 
+define SQUID_INSTALL_INIT_SYSV
+        # install start/stop script
+        @if [ ! -f $(TARGET_DIR)/etc/init.d/S97squid ]; then \
+                $(INSTALL) -m 0755 -D package/squid/S97squid $(TARGET_DIR)/etc/init.d/S97squid; \
+        fi
+endef
+
 $(eval $(autotools-package))
-- 
1.8.4.5
