From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:57:43 +0200
Subject: [Buildroot] [git commit] package/iwd: add sysv init script
Message-ID: <20200617195614.53C4681556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c01692f0b85ceea638e648d5dd002e70e9688bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/S40iwd | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/iwd/iwd.mk |  7 +++++++
 2 files changed, 49 insertions(+)

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
index d074964267..853638e8ca 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -59,4 +59,11 @@ endef
 
 IWD_POST_INSTALL_TARGET_HOOKS += IWD_INSTALL_CONFIG_FILE
 
+define IWD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/iwd/S40iwd \
+		$(TARGET_DIR)/etc/init.d/S40iwd
+	mkdir -p $(TARGET_DIR)/var/lib/iwd
+	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
+endef
+
 $(eval $(autotools-package))
