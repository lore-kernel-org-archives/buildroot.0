From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 22:59:25 +0200
Subject: [Buildroot] [git commit] package/rng-tools: add SysV init script
Message-ID: <20151013205950.7133281E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f54df529dad900ca6a6ec992005b428853d2569a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: minor adjustments to make the script look more like our
standard init scripts.]

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/S21rngd      |   48 ++++++++++++++++++++++++++++++++++++++++
 package/rng-tools/rng-tools.mk |    5 ++++
 2 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/rng-tools/S21rngd b/package/rng-tools/S21rngd
new file mode 100755
index 0000000..b38be5a
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
+	start-stop-daemon -S -q -x "${DAEMON}" -- ${DAEMON_ARGS}
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
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
+		echo "OK"
+	else
+		echo "FAIL"
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
