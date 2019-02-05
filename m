From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 13:45:07 +0100
Subject: [Buildroot] [git commit] package/mender: adding systemv init file
Message-ID: <20190205130901.73DA48444C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88947c2fe2d49b651b42b550a775b9b35e71c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a service file for the init system v.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: <aduskett@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Peter: fix typo in stop()]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/S42mender | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/mender/mender.mk |  5 +++++
 2 files changed, 61 insertions(+)

diff --git a/package/mender/S42mender b/package/mender/S42mender
new file mode 100644
index 0000000000..665a9dd74a
--- /dev/null
+++ b/package/mender/S42mender
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# Starts mender service.
+#
+
+start() {
+	# If /var/lib/mender is a symlink to /var/run/mender, and
+	#   - the filesystem is RO (i.e. we can not rm the symlink),
+	#     create the directory pointed to by the symlink.
+	#   - the filesystem is RW (i.e. we can rm the symlink),
+	#     replace the symlink with an actual directory
+	if [ -L /var/lib/mender \
+	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
+	then
+		if rm -f /var/lib/mender >/dev/null 2>&1; then
+			mkdir -p /var/lib/mender
+		else
+			echo "No persistent location to store mender data. Data will be lost"
+			echo "at reboot. Are you sure this is what you want to do?"
+			mkdir -p "$(readlink /var/lib/mender)"
+		fi
+	fi
+
+	printf "Starting mender service: "
+	umask 077
+
+	start-stop-daemon -S -q -p /var/run/mender.pid \
+		--exec /usr/bin/mender -- -daemon
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping mender service: "
+	start-stop-daemon -K -q -p /var/run/mender.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
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
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 3203df8a47..dc4a73b0f3 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -63,4 +63,9 @@ define MENDER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mender.service
 endef
 
+define MENDER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/mender/S04mender \
+		$(TARGET_DIR)/etc/init.d/S04mender
+endef
+
 $(eval $(golang-package))
