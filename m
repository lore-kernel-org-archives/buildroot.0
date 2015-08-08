From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] audit: Add startup script
Message-ID: <20150808105638.2398880428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e068bb5ff6815f50e7ce729b67e831d0d8d4ed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The startup script for the audit package did not meet the buildroot
standards when the package was initially merged. Adding a compliant
startup script for starting the audit daemon along with rotating the
logs and other features.

[Thomas:
  - Replace "Failed" by "FAIL" to be consistent with the rest of the
    init script and other packages
  - Use $(INSTALL) -D with a complete destination path to avoid having
    to create /etc/init.d before installing the init script.]

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/S01auditd |   80 +++++++++++++++++++++++++++++++++++++++++++++++
 package/audit/audit.mk  |    4 ++
 2 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/package/audit/S01auditd b/package/audit/S01auditd
new file mode 100644
index 0000000..9485739
--- /dev/null
+++ b/package/audit/S01auditd
@@ -0,0 +1,80 @@
+#!/bin/sh
+#
+# auditd       This starts and stops auditd
+#
+# description: This starts the Linux Auditing System Daemon,
+#              which collects security related events in a dedicated
+#              audit log. If this daemon is turned off, audit events
+#              will be sent to syslog.
+#
+
+NAME=auditd
+DAEMON=/usr/sbin/${NAME}
+CONFIG=/etc/audit/auditd.conf
+PIDFILE=/var/run/${NAME}.pid
+
+start(){
+	echo -n "Starting ${NAME}: "
+
+	# Create dir to store log files in if one doesn't exist. Create
+	# the directory with SELinux permissions if possible
+	command -v matchpathcon >/dev/null 2>&1
+	if [ $? = 0 ]; then
+		mkdir -p /var/log/audit -Z `matchpathcon -n /var/log/audit`
+	else
+		mkdir -p /var/log/audit
+	fi
+
+	# Run audit daemon executable
+	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
+
+	if [ $? = 0 ]; then
+		# Load the default rules
+		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+stop(){
+	echo -n "Stopping ${NAME}: "
+
+	start-stop-daemon -K -q -p ${PIDFILE}
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+reload(){
+	echo -n "Reloading ${NAME} configuration: "
+	start-stop-daemon --stop -s 1 -p ${PIDFILE} 1>/dev/null
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+rotate(){
+	echo -n "Rotating ${NAME} logs: "
+	start-stop-daemon --stop -s 10 -p ${PIDFILE} 1>/dev/null
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	reload)
+		reload
+		;;
+	rotate)
+		rotate
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|rotate}"
+		exit 1
+		;;
+esac
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index ab3e087..e30f886 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -34,6 +34,10 @@ ifeq ($(BR2_aarch64),y)
 AUDIT_CONF_OPTS += --with-aarch64
 endif
 
+define AUDIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/S01auditd
+endef
+
 define AUDIT_INSTALL_CLEANUP
 	$(RM) -rf $(TARGET_DIR)/etc/rc.d
 	$(RM) -rf $(TARGET_DIR)/etc/sysconfig
