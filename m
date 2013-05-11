From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:28:44 +0200
Subject: [Buildroot] [git commit branch/next] ptpd2: new package
Message-ID: <20130511203103.C0C2A99C6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b190e6b6d2f98dae54fb92191000fa9a66dd79e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the ptpd2 package, handles the IEEE 1588-2008 spec which is not
backward compatible to IEEE 1588-2002.

[Peter: mark init script as executable]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/ptpd2/Config.in |    7 +++++++
 package/ptpd2/S65ptpd2  |   29 +++++++++++++++++++++++++++++
 package/ptpd2/ptpd2.mk  |   26 ++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 544a431..bbacd5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -752,6 +752,7 @@ source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
 source "package/proxychains-ng/Config.in"
 source "package/ptpd/Config.in"
+source "package/ptpd2/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
diff --git a/package/ptpd2/Config.in b/package/ptpd2/Config.in
new file mode 100644
index 0000000..bf26453
--- /dev/null
+++ b/package/ptpd2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PTPD2
+	bool "ptpd2"
+	help
+	  The PTP daemon (PTPd) implements the Precision Time protocol
+	  (PTP) as defined by the IEEE-1588-2008.
+
+	  http://ptpd.sourceforge.net/
diff --git a/package/ptpd2/S65ptpd2 b/package/ptpd2/S65ptpd2
new file mode 100755
index 0000000..7d4ee7f
--- /dev/null
+++ b/package/ptpd2/S65ptpd2
@@ -0,0 +1,29 @@
+#!/bin/sh
+#
+# Start ptpd2
+#
+
+case "$1" in
+  start)
+	echo -n "Starting ptpd2: "
+	start-stop-daemon -S -q -x /usr/sbin/ptpd2 -- -g
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "OK"
+	fi
+	;;
+  stop)
+	echo -n "Stopping ptpd2: "
+	start-stop-daemon -K -q -x /usr/sbin/ptpd2
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
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
new file mode 100644
index 0000000..04a0070
--- /dev/null
+++ b/package/ptpd2/ptpd2.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# ptpd2
+#
+#############################################################
+
+PTPD2_VERSION = 2.2.2
+PTPD2_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD2_VERSION)
+PTPD2_SOURCE = ptpd-$(PTPD2_VERSION).tar.gz
+PTPD2_LICENSE = BSD-2c
+PTPD2_LICENSE_FILES = COPYRIGHT
+
+define PTPD2_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src
+endef
+
+define PTPD2_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/src/ptpd2 $(TARGET_DIR)/usr/sbin/ptpd2
+endef
+
+define PTPD2_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
+		$(TARGET_DIR)/etc/init.d/S65ptpd2
+endef
+
+$(eval $(generic-package))
