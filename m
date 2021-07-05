From: Adam Duskett <aduskett@gmail.com>
Date: Sun,  4 Jul 2021 22:40:58 -0700
Subject: [Buildroot] [PATCH 3/5] package/polkit/S50polkit: new file
In-Reply-To: <20210705054100.2857251-1-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
Message-ID: <20210705054100.2857251-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Polkit source does not come with non-systemd init script. Add one that is
modeled after package/busybox/S01syslogd.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/polkit/S50polkit | 51 ++++++++++++++++++++++++++++++++++++++++
 package/polkit/polkit.mk |  4 ++++
 2 files changed, 55 insertions(+)
 create mode 100755 package/polkit/S50polkit

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
new file mode 100755
index 0000000000..38cb463b8a
--- /dev/null
+++ b/package/polkit/S50polkit
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="polkitd"
+DAEMON_PATH="/usr/lib/polkit-1/${DAEMON}"
+PIDFILE="/var/run/${DAEMON}.pid"
+POLKITD_ARGS="--no-debug"
+
+# polkitd does not create a pidfile, so pass "-n" in the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+  printf 'Starting %s: ' "${DAEMON}"
+  # shellcheck disable=SC2086 # we need the word splitting
+  start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${POLKITD_ARGS}
+  status=$?
+  if [ "$status" -eq 0 ]; then
+    echo "OK"
+  else
+    echo "FAIL"
+  fi
+  return "$status"
+}
+
+stop() {
+  printf 'Stopping %s: ' "${DAEMON}"
+  start-stop-daemon -Kqp "$PIDFILE"
+  status=$?
+  if [ "$status" -eq 0 ]; then
+    rm -f "$PIDFILE"
+    echo "OK"
+  else
+    echo "FAIL"
+  fi
+  return "$status"
+}
+
+restart() {
+  stop
+  sleep 1
+  start
+}
+
+case "$1" in
+  start|stop|restart|reload)
+    "$1";;
+  reload)
+    # Restart, since there is no true "reload" feature.
+    restart;;
+  *)
+    echo "Usage: $0 {start|stop|restart|reload}"
+    exit 1
+esac
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 7249980a79..d534c3d6f5 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -54,7 +54,11 @@ endef
 define POLKIT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(POLKIT_PKGDIR)/polkit.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/polkit.service
+endef
 
+define POLKIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
+		$(TARGET_DIR)/etc/init.d/S50polkit
 endef
 
 $(eval $(autotools-package))
-- 
2.31.1
