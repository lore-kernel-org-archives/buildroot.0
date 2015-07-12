From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 02:20:10 +0200
Subject: [Buildroot] [PATCHv3] busybox: improve support for telnetd
Message-ID: <1436660410-13431-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

If target has connection to the network it might be pretty useful to
have telnet connection to it instead of serial console or even in
addition to serial console.

This changes makes the busybox package automatically install an init
script, and tune the securetty file to make telnetd work when
CONFIG_FEATURE_TELNETD_STANDALONE is enabled in the Busybox
configuration.

[Thomas:
  - don't create a new Buildroot Config.in option, just test if
    CONFIG_FEATURE_TELNETD_STANDALONE is enabled or not in the Busybox
    configuration
  - move the securetty tuning in busybox.mk instead of system.mk
  - use start-stop-daemon in the init script, in order to properly
    implement the stop and restart actions
  - misc other minor improvements in the init script.]

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S50telnet  | 36 ++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 21 +++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100755 package/busybox/S50telnet

diff --git a/package/busybox/S50telnet b/package/busybox/S50telnet
new file mode 100755
index 0000000..463a772
--- /dev/null
+++ b/package/busybox/S50telnet
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Start telnet....
+#
+
+start() {
+      echo -n "Starting telnetd: "
+      start-stop-daemon -S -q -m -b -p /var/run/telnetd.pid \
+			-x /usr/sbin/telnetd -- -F
+      [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	echo -n "Stopping telnetd: "
+	start-stop-daemon -K -q -p /var/run/telnetd.pid \
+			  -x /usr/sbin/telnetd
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+    start)
+	start
+	;;
+    stop)
+	stop
+	;;
+    restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 92874cd..35f1e96 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -168,6 +168,25 @@ endef
 BUSYBOX_DEPENDENCIES += linux-pam
 endif
 
+# Telnet support
+define BUSYBOX_INSTALL_TELNET_SCRIPT
+	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D package/busybox/S50telnet \
+			$(TARGET_DIR)/etc/init.d/S50telnet ; \
+	fi
+endef
+
+define BUSYBOX_ADJUST_TELNET_SECURETTY
+	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
+		for i in `seq 0 3` ; do \
+			grep -q "pts/$$i" $(TARGET_DIR)/etc/securetty || \
+				echo "pts/$$i" >> $(TARGET_DIR)/etc/securetty ; \
+		done ; \
+	fi
+endef
+
+BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_ADJUST_TELNET_SECURETTY
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
@@ -185,6 +204,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_SET_STANDALONE_TELNETD)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
@@ -205,6 +225,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
 $(eval $(kconfig-package))
-- 
2.4.5
