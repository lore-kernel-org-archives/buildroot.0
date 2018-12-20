From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 00:31:59 -0200
Subject: [Buildroot] [PATCH v2 1/2] package/procps-ng: add init script for
 sysctl
In-Reply-To: <20181220023200.17119-1-casantos@datacom.com.br>
References: <20181220023200.17119-1-casantos@datacom.com.br>
Message-ID: <20181220023200.17119-2-casantos@datacom.com.br>
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
Changes v1->v2:
  - The "--system" option activates "--ignore", which is bad because
    invalid variable settings in the configuration files will not be
    reported on the system log. Use some scripting to mimic the --system
    behavior but still reporting errors.
  - Redirect sysctl's standard output to syslog with facility.level
    "kern.info" and standard error to syslog with facility.level
    "kern.err".
  - Do not pass "--quiet" to sysctl, since we wanto to see the results.
  - Use "Running" and "Rerunning" instead of "Starting", since we do not
    really start anything, just run a program.
  - Do nothing on "stop", since ther is no running daemon to stop.
---
 package/procps-ng/S02sysctl    | 64 ++++++++++++++++++++++++++++++++++
 package/procps-ng/procps-ng.mk |  5 +++
 2 files changed, 69 insertions(+)
 create mode 100644 package/procps-ng/S02sysctl

diff --git a/package/procps-ng/S02sysctl b/package/procps-ng/S02sysctl
new file mode 100644
index 0000000000..3a58578de4
--- /dev/null
+++ b/package/procps-ng/S02sysctl
@@ -0,0 +1,64 @@
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
+# The "--system" option activates "--ignore", which is bad because invalid
+# variable settings in the configuration files will not be reported on the
+# system log. Use some scripting to mimic the --system behavior but still
+# reporting errors. Users not interested on error report can put "-e" in
+# SYSCTL_ARGS.
+#
+# The file redirections do the following:
+#
+# - stdout is redirected to syslog with facility.level "kern.info"
+# - stderr is redirected to syslog with facility.level "kern.err"
+# - file dscriptor 4 is used to pass the result to the "start" function.
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
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 03b74784d2..6a41e9b322 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -44,4 +44,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PROCPS_NG_CONF_OPTS += --disable-numa
 endif
 
+define PROCPS_NG_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/procps-ng/S02sysctl \
+		$(TARGET_DIR)/etc/init.d/S02sysctl
+endef
+
 $(eval $(autotools-package))
-- 
2.19.2
