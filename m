From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Aug 2020 23:00:10 +0200
Subject: [Buildroot] [git commit] package/cups: add proper init script
Message-ID: <20200804205508.952708377E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04226ac6b7104f17f22091be8f5ce43c56abd210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cups service for systemv was erroneously installed in /etc/rcX.d and
therefore not working. Also, its init script installed in /etc/init.d
was definitely not a Buildroot-style init script.

This patch adds a Buildroot style init script instead of using the
example provided by the package.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/S81cupsd | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/cups/cups.mk  |  8 +++++++-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/package/cups/S81cupsd b/package/cups/S81cupsd
new file mode 100644
index 0000000000..45d0cbcc22
--- /dev/null
+++ b/package/cups/S81cupsd
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+DAEMON="cupsd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- -C /etc/cups/cupsd.conf -s /etc/cups/cups-files
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
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
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
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 18f01d8484..53b0e2ab08 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -21,7 +21,8 @@ CUPS_CONF_OPTS = \
 	--with-docdir=/usr/share/cups/doc-root \
 	--disable-gssapi \
 	--disable-pam \
-	--libdir=/usr/lib
+	--libdir=/usr/lib \
+	--without-rcdir
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
@@ -71,4 +72,9 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+define CUPS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/cups/S81cupsd \
+		$(TARGET_DIR)/etc/init.d/S81cupsd
+endef
+
 $(eval $(autotools-package))
