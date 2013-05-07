From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 May 2013 13:39:44 -0300
Subject: [Buildroot] [PATCH 1/2] ptpd: new package
Message-ID: <1367944785-27159-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the new ptpd package, loosely based on the one from bug #2305.
This one handles the IEEE 1588-2002 spec.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in      |  1 +
 package/ptpd/Config.in |  7 +++++++
 package/ptpd/S65ptpd   | 29 +++++++++++++++++++++++++++++
 package/ptpd/ptpd.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/ptpd/Config.in
 create mode 100644 package/ptpd/S65ptpd
 create mode 100644 package/ptpd/ptpd.mk

diff --git a/package/Config.in b/package/Config.in
index 2cf2443..7546d51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -753,6 +753,7 @@ source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
 source "package/proxychains-ng/Config.in"
+source "package/ptpd/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
diff --git a/package/ptpd/Config.in b/package/ptpd/Config.in
new file mode 100644
index 0000000..2d87ca3
--- /dev/null
+++ b/package/ptpd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PTPD
+	bool "ptpd"
+	help
+	  The PTP daemon (PTPd) implements the Precision Time protocol
+	  (PTP) as defined by the IEEE-1588-2002.
+
+	  http://ptpd.sourceforge.net/
diff --git a/package/ptpd/S65ptpd b/package/ptpd/S65ptpd
new file mode 100644
index 0000000..4206c5e
--- /dev/null
+++ b/package/ptpd/S65ptpd
@@ -0,0 +1,29 @@
+#!/bin/sh
+#
+# Start ptpd
+#
+
+case "$1" in
+  start)
+	echo -n "Starting ptpd: "
+	start-stop-daemon -S -q -x /usr/sbin/ptpd -- -S
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "OK"
+	fi
+	;;
+  stop)
+	echo -n "Stopping ptpd: "
+	start-stop-daemon -K -q -x /usr/sbin/ptpd
+	echo "OK"
+	;;
+  restart|reload)
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
new file mode 100644
index 0000000..481a64e
--- /dev/null
+++ b/package/ptpd/ptpd.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# ptpd
+#
+#############################################################
+
+PTPD_VERSION = 1.1.0
+PTPD_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD_VERSION)
+PTPD_LICENSE = BSD
+PTPD_LICENSE_FILES = COPYRIGHT
+
+define PTPD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src
+endef
+
+define PTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/src/ptpd $(TARGET_DIR)/usr/sbin/ptpd
+endef
+
+define PTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/ptpd/S65ptpd \
+		$(TARGET_DIR)/etc/init.d/S65ptpd
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
