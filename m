From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Jun 2020 20:47:53 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/iwd: add sysv init script
In-Reply-To: <20200615184753.15197-1-ps.report@gmx.net>
References: <20200615184753.15197-1-ps.report@gmx.net>
Message-ID: <20200615184753.15197-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use start-stop-daemon (Yann E. MORIN)

Changes v2 -> v3:
  - no changes
---
 package/iwd/S40iwd | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/iwd/iwd.mk |  7 +++++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/iwd/S40iwd

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
new file mode 100644
index 0000000000..6714ca9956
--- /dev/null
+++ b/package/iwd/S40iwd
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+DAEMON="/usr/libexec/iwd"
+PIDFILE="/var/run/iwd.pid"
+
+IWD_ARGS=""
+
+[ -r "/etc/default/iwd" ] && . "/etc/default/iwd"
+
+start() {
+	printf "Starting iwd:"
+	mkdir -p /tmp/iwd/hotspot
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "$DAEMON" \
+		-- $IWD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf "Stopping iwd:"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop}"
+		exit 1
+esac
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index c58e795f99..5814d8805c 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -67,4 +67,11 @@ IWD_POST_INSTALL_TARGET_HOOKS += \
 	IWD_INSTALL_CONFIG_FILE \
 	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
 
+define IWD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/iwd/S40iwd \
+		$(TARGET_DIR)/etc/init.d/S40iwd
+	mkdir -p $(TARGET_DIR)/var/lib/iwd
+	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
+endef
+
 $(eval $(autotools-package))
-- 
2.27.0
