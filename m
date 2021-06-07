From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:52 -0000
Subject: [Buildroot] [git commit] package/seatd: install init scripts
Message-ID: <20210607144654.322D88B848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60cee128c7282353d11c538a26abad709f3d3701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add commands to the seatd package to install the systemd unit included
in the source tarball and a SysV init script, and ensure that the
"video" group gets created.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998 at free.fr:
  - model the init script after package/busybox/S01syslogd
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/seatd/S70seatd | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 package/seatd/seatd.mk | 15 +++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/package/seatd/S70seatd b/package/seatd/S70seatd
new file mode 100755
index 0000000000..32bdc40fbb
--- /dev/null
+++ b/package/seatd/S70seatd
@@ -0,0 +1,46 @@
+#! /bin/sh
+
+DAEMON="seatd"
+DAEMON_EXE="/usr/bin/${DAEMON}"
+PIDFILE="/run/${DAEMON}.pid"
+
+start() {
+	printf 'Starting %s: ' "${DAEMON}"
+	start-stop-daemon -S -x "${DAEMON_EXE}" -p "${PIDFILE}" -m -b -- -g video
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo OK
+	else
+		echo FAIL
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "${DAEMON}"
+	start-stop-daemon -K -x "${DAEMON_EXE}" -p "${PIDFILE}"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo OK
+	else
+		echo FAIL
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "${1}" in
+	start|stop|restart)
+		"${1}";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+		;;
+esac
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 2e90270555..2abcefbfaa 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -30,6 +30,21 @@ endif
 
 ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
 SEATD_CONF_OPTS += -Dseatd=enabled -Dserver=enabled
+
+define SEATD_USERS
+	- - video -1 - - - - -
+endef
+
+define SEATD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(SEATD_PKGDIR)/S70seatd \
+		$(TARGET_DIR)/etc/init.d/S70seatd
+endef
+
+define SEATD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D $(@D)/contrib/systemd/seatd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/seatd.service
+endef
+
 else
 SEATD_CONF_OPTS += -Dseatd=disabled -Dserver=disabled
 endif
