From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 20 Aug 2015 17:59:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: add SysV init script
Message-ID: <1440086344-100325-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/rng-tools/S21rngd      | 48 ++++++++++++++++++++++++++++++++++++++++++
 package/rng-tools/rng-tools.mk |  5 +++++
 2 files changed, 53 insertions(+)
 create mode 100755 package/rng-tools/S21rngd

diff --git a/package/rng-tools/S21rngd b/package/rng-tools/S21rngd
new file mode 100755
index 0000000..09e23c0
--- /dev/null
+++ b/package/rng-tools/S21rngd
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+NAME="rngd"
+DAEMON="/usr/sbin/${NAME}"
+DAEMON_ARGS=""
+CFG_FILE="/etc/default/${NAME}"
+PID_FILE="/var/run/${NAME}.pid"
+
+# Read configuration variable file if it is present
+[ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
+
+start()
+{
+	echo -n "Starting ${NAME}: "
+	start-stop-daemon -S -q -x "${DAEMON}" -- ${DAEMON_ARGS} &&
+			echo "done" || echo "failed"
+}
+
+stop()
+{
+	echo -n "Stopping ${NAME}: "
+	# This daemon does not exit properly with the default TERM signal unless
+	# it's forced to work by something reading /dev/random. Killing it and
+	# removing its PID file is more straightforward.
+	if start-stop-daemon -K -q -s KILL -p "${PID_FILE}" -n "${NAME}"; then
+		rm -f "${PID_FILE}"
+		echo "done"
+	else
+		echo "failed"
+	fi
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
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}" >&2
+		exit 1
+		;;
+esac
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8648c4f..fc656ef 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -21,6 +21,11 @@ else
 RNG_TOOLS_CONF_OPTS += --without-libgcrypt
 endif
 
+define RNG_TOOLS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
+		$(TARGET_DIR)/etc/init.d/S21rngd
+endef
+
 define RNG_TOOLS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/rng-tools/rngd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rngd.service
-- 
2.1.4
