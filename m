From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 03:02:34 -0200
Subject: [Buildroot] [PATCH 1/2] package/procps-ng: add init script for
 sysctl
In-Reply-To: <20181218050235.27187-1-casantos@datacom.com.br>
References: <20181218050235.27187-1-casantos@datacom.com.br>
Message-ID: <20181218050235.27187-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple init script that invokes sysctl early in the initialization
process to configure kernel parameters. This is already performed by
systemd (systemd-sysctl) but there is no sysvinit/busybox counterpart.

Files are read from directories in the following list in the given order
from top to bottom:

    /run/sysctl.d/*.conf
    /etc/sysctl.d/*.conf
    /usr/local/lib/sysctl.d/*.conf
    /usr/lib/sysctl.d/*.conf
    /lib/sysctl.d/*.conf
    /etc/sysctl.conf

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/procps-ng/S01sysctl    | 41 ++++++++++++++++++++++++++++++++++
 package/procps-ng/procps-ng.mk |  5 +++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/procps-ng/S01sysctl

diff --git a/package/procps-ng/S01sysctl b/package/procps-ng/S01sysctl
new file mode 100644
index 0000000000..e93bdb9e17
--- /dev/null
+++ b/package/procps-ng/S01sysctl
@@ -0,0 +1,41 @@
+#!/bin/sh
+
+PROGRAM="sysctl"
+
+SYSCTL_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
+
+start() {
+	printf 'Starting %s: ' "$PROGRAM"
+	# shellcheck disable=SC2086 # we need the word splitting
+	/sbin/sysctl --quiet --system $SYSCTL_ARGS
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
+	printf 'Stopping %s: OK\n' "$PROGRAM"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+        start|stop)
+		"$1";;
+	restart|reload)
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 03b74784d2..e40aeb5a2a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -44,4 +44,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PROCPS_NG_CONF_OPTS += --disable-numa
 endif
 
+define PROCPS_NG_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/procps-ng/S01sysctl \
+		$(TARGET_DIR)/etc/init.d/S01sysctl
+endef
+
 $(eval $(autotools-package))
-- 
2.19.2
