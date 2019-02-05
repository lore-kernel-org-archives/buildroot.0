From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 10:43:10 +0100
Subject: [Buildroot] [PATCH 2/5] package/mender: adding systemv init file
In-Reply-To: <1549359793-12666-1-git-send-email-angelo@amarulasolutions.com>
References: <1549359793-12666-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549359793-12666-3-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a service file for the init system v.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/S04mender | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/mender/mender.mk |  5 +++++
 2 files changed, 61 insertions(+)
 create mode 100644 package/mender/S04mender

diff --git a/package/mender/S04mender b/package/mender/S04mender
new file mode 100644
index 0000000..d5266aa
--- /dev/null
+++ b/package/mender/S04mender
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# Starts mender service.
+#
+
+start() {
+	# If /var/lib/mender is a symlink to /var/run/mender, and
+	#   - the filesystem is RO (i.e. we can not rm the symlink),
+	#     create the directory pointed to by the symlink.
+	#   - the filesystem is RW (i.e. we can rm the symlink),
+	#     replace the symlink with an actual directory
+	if [ -L /var/lib/mender \
+	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
+	then
+		if rm -f /var/lib/mender >/dev/null 2>&1; then
+			mkdir -p /var/lib/mender
+		else
+			echo "No persistent location to store mender data. Data will be lost"
+			echo "at reboot. Are you sure this is what you want to do?"
+			mkdir -p "$(readlink /var/lib/mender)"
+		fi
+	fi
+
+	printf "Starting mender service: "
+	umask 077
+
+	start-stop-daemon -S -q -p /var/run/mender.pid \
+		--exec /usr/bin/mender -- -daemon
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping mender mender: "
+	start-stop-daemon -K -q -p /var/run/mender.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 1f66615..655342c 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -63,4 +63,9 @@ define MENDER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mender.service
 endef
 
+define MENDER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/mender/S04mender \
+		$(TARGET_DIR)/etc/init.d/S04mender
+endef
+
 $(eval $(golang-package))
-- 
2.7.4
