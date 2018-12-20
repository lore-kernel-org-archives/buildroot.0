From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 00:32:00 -0200
Subject: [Buildroot] [PATCH v2 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <20181220023200.17119-1-casantos@datacom.com.br>
References: <20181220023200.17119-1-casantos@datacom.com.br>
Message-ID: <20181220023200.17119-3-casantos@datacom.com.br>
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

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
  - Use a while loop to process all files.
  - Redirect sysctl's standard output to syslog with facility.level
    "kern.info" and standard error to syslog with facility.level
    "kern.err".
  - Do not pass "-q" to sysctl, since we wanto to see the results.
  - Use "Running" and "Rerunning" instead of "Starting", since we do not
    really start anything, just run a program.
  - Do nothing on "stop", since ther is no running daemon to stop.
---
 package/busybox/S02sysctl  | 66 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 12 +++++++
 2 files changed, 78 insertions(+)
 create mode 100644 package/busybox/S02sysctl

diff --git a/package/busybox/S02sysctl b/package/busybox/S02sysctl
new file mode 100644
index 0000000000..6bb2fa165e
--- /dev/null
+++ b/package/busybox/S02sysctl
@@ -0,0 +1,66 @@
+#!/bin/sh
+
+PROGRAM="sysctl"
+
+SYSCTL_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
+
+# Files are read from directories in the SYSCTL_SOURCES list, in the given
+# order. A file may be used more than once, since there can be multiple
+# symlinks to it. No attempt is made to prevent this.
+SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/ /lib/sysctl.d/ /etc/sysctl.conf"
+
+# Use some scripting to mimic the --system option of the sysctl provided by
+# procps-ng but still reporting errors. Users not interested on error report
+# can put "-e" in SYSCTL_ARGS.
+#
+# The file redirections do the following:
+#
+# - stdout is redirected to syslog with facility.level "kern.info"
+# - stderr is redirected to syslog with facility.level "kern.err"
+# - file dscriptor 4 is used to pass the result to the "start" function.
+#
+# Testing the sysctl exit code is fruitless, as at the moment, since it ends
+# with status zero even if errors happen. Hopefully this will be fixed in a
+# future version of Busybox.
+#
+run_program() {
+	# shellcheck disable=SC2086 # we need the word splitting
+	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
+	xargs -0 -r -n 1 readlink -f | {
+		prog_status="OK"
+		while :; do
+			read -r file
+			if [ -z "$file" ]; then
+				echo "$prog_status" >&4
+				break
+			fi
+			echo "* Applying $file ..."
+			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
+		done 2>&1 >&3 | /usr/bin/logger -t sysctl -p kern.err
+	} 3>&1 | /usr/bin/logger -t sysctl -p kern.info
+}
+
+start() {
+	printf '%s %s: ' "$1" "$PROGRAM"
+	status=$(run_program 4>&1)
+	echo "$status"
+	if [ "$status" = "OK" ]; then
+		return 0
+	fi
+	return 1
+}
+
+case "$1" in
+	start)
+		start "Running";;
+	restart|reload)
+		start "Rerunning";;
+	stop)
+		:;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bfcca6ed3e..0e63aa5cf6 100644
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
+		$(INSTALL) -m 0755 -D package/busybox/S02sysctl \
+			$(TARGET_DIR)/etc/init.d/S02sysctl ; \
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
