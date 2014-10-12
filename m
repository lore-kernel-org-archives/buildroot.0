From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 13:01:00 +0200
Subject: [Buildroot] [git commit] sysklogd: add initscript
Message-ID: <20141012110315.6A050B2378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=526e3d0ac6641c0a969d08f5839aa7b12b0dba9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we don't handle it in sysvinit inittab any longer let's add an
initscript to get things back into plug-and-play shape.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/S01logging  |   25 +++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk |    5 +++++
 2 files changed, 30 insertions(+), 0 deletions(-)

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
