From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:23:58 +0200
Subject: [Buildroot] [git commit branch/next] ptpd: new package
Message-ID: <20130511203103.866CE9A0A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6449bb165c8708652bbc3e0373cc6d70299afe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the new ptpd package, loosely based on the one from bug #2305.
This one handles the IEEE 1588-2002 spec.

[Peter: mark init script as executable]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ptpd/Config.in |    7 +++++++
 package/ptpd/S65ptpd   |   29 +++++++++++++++++++++++++++++
 package/ptpd/ptpd.mk   |   25 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d980871..544a431 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,6 +751,7 @@ source "package/pppd/Config.in"
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
new file mode 100755
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
