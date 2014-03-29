From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 11:41:14 +0100
Subject: [Buildroot] [git commit] dnsmasq: add sysv initscript
Message-ID: <20140329104126.23EB29C3EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd9c1c3f75a0236a84a5c546fee1681b1756fb19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/S80dnsmasq |   26 ++++++++++++++++++++++++++
 package/dnsmasq/dnsmasq.mk |    5 +++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
new file mode 100755
index 0000000..2ff0206
--- /dev/null
+++ b/package/dnsmasq/S80dnsmasq
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+[ -x /usr/sbin/dnsmasq ] || exit 0
+[ -f /etc/dnsmasq.conf ] || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting dnsmasq: "
+		start-stop-daemon -S -x /usr/sbin/dnsmasq
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo -n "Stopping dnsmasq: "
+		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
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
+exit 0
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9bf9b84..56d11ee 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -93,4 +93,9 @@ define DNSMASQ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
+define DNSMASQ_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/dnsmasq/S80dnsmasq \
+		$(TARGET_DIR)/etc/init.d/S80dnsmasq
+endef
+
 $(eval $(generic-package))
