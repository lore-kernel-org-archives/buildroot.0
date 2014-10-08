From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 11:39:25 -0300
Subject: [Buildroot] [PATCH 2/2] sysklogd: add initscript
In-Reply-To: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412779165-13366-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we don't handle it in sysvinit inittab any longer let's add an
initscript to get things back into plug-and-play shape.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysklogd/S01logging  | 25 +++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk |  5 +++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/sysklogd/S01logging

diff --git a/package/sysklogd/S01logging b/package/sysklogd/S01logging
new file mode 100644
index 0000000..a0b683f
--- /dev/null
+++ b/package/sysklogd/S01logging
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting logging: "
+		/sbin/syslogd -m 0
+		/sbin/klogd
+		echo "OK"
+		;;
+	stop)
+		echo -n "Stopping logging: "
+		[ -f /var/run/klogd.pid ] && kill `cat /var/run/klogd.pid`
+		[ -f /var/run/syslogd.pid ] && kill `cat /var/run/syslogd.pid`
+		echo "OK"
+		;;
+	restart|reload)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index efc5a4d..2b60b45 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -27,4 +27,9 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	fi
 endef
 
+define SYSKLOGD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/sysklogd/S01logging \
+		$(TARGET_DIR)/etc/init.d/S01logging
+endef
+
 $(eval $(generic-package))
-- 
2.0.4
