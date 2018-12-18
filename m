From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 03:02:35 -0200
Subject: [Buildroot] [PATCH 2/2] package/busybox: add init script for sysctl
In-Reply-To: <20181218050235.27187-1-casantos@datacom.com.br>
References: <20181218050235.27187-1-casantos@datacom.com.br>
Message-ID: <20181218050235.27187-3-casantos@datacom.com.br>
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

A file may be used more than once, since there can be multiple symlinks
to it. No attempt is made to prevent this.

Busybox's sysctl does not support "--quiet --system" arguments like the
sysctl provided by procps-ng, so we resort to some scripting to mimic
its behavior.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/busybox/S01sysctl  | 63 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 12 ++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 package/busybox/S01sysctl

diff --git a/package/busybox/S01sysctl b/package/busybox/S01sysctl
new file mode 100644
index 0000000000..35e0cef291
--- /dev/null
+++ b/package/busybox/S01sysctl
@@ -0,0 +1,63 @@
+#!/bin/sh
+
+PROGRAM="sysctl"
+
+SYSCTL_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
+
+# Files are read from directories in the SYSCTL_SOURCES list, in given order.
+SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/ /lib/sysctl.d/ /etc/sysctl.conf"
+
+# A file may be used more than once, since there can be multiple symlinks to
+# it. No attempt is made to prevent this.
+#
+# Busybox's sysctl does not support "--quiet --system" arguments like the
+# sysctl provided by procps-ng, so we resort to some scripting to mimic its
+# behavior.
+#
+# The "return 1" below is fruitless, at the moment, since sysctl ends with
+# status zero even if errors happen. Hopefully this will be fixed in a future
+# version of Busybox.
+apply_configs() {
+	# shellcheck disable=SC2086 # we need the word splitting
+	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
+	xargs -0 -r readlink -f | \
+	{
+		read -r file
+		[ -z "$file" ] || /sbin/sysctl -q -p "$file" $SYSCTL_ARGS || return 1
+	}
+}
+
+start() {
+	printf 'Starting %s: ' "$PROGRAM"
+	apply_configs
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
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bfcca6ed3e..bf101d7d46 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -259,6 +259,17 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 endef
 endif
 
+# Only install our sysctl scripts if no other package does it.
+ifeq ($(BR2_PACKAGE_PROCPS_NG),)
+define BUSYBOX_INSTALL_SYSCTL_SCRIPT
+	if grep -q CONFIG_BB_SYSCTL=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S01sysctl \
+			$(TARGET_DIR)/etc/init.d/S01sysctl ; \
+	fi
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
 	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
@@ -344,6 +355,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
-- 
2.19.2
