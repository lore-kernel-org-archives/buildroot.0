From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 12:26:40 +0200
Subject: [Buildroot] [PATCH v2] package/rng-tools: add SysV init script
In-Reply-To: <1440086344-100325-1-git-send-email-benoit@wsystem.com>
References: <1440086344-100325-1-git-send-email-benoit@wsystem.com>
Message-ID: <1444732000-48622-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Use 'printf' instead of 'echo -n' following
   0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c.
---
 package/rng-tools/S21rngd      | 48 ++++++++++++++++++++++++++++++++++++++++++
 package/rng-tools/rng-tools.mk |  5 +++++
 2 files changed, 53 insertions(+)
 create mode 100755 package/rng-tools/S21rngd

diff --git a/package/rng-tools/S21rngd b/package/rng-tools/S21rngd
new file mode 100755
index 0000000..3cdbc38
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
+	printf "Starting ${NAME}: "
+	start-stop-daemon -S -q -x "${DAEMON}" -- ${DAEMON_ARGS} &&
+			echo "done" || echo "failed"
+}
+
+stop()
+{
+	printf "Stopping ${NAME}: "
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
index 7e975e0..cc07bdf 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -22,6 +22,11 @@ else
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
