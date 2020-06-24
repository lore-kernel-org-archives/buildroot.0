From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Jun 2020 22:43:43 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/cups: fix cups service
In-Reply-To: <20200624204347.797088-1-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
Message-ID: <20200624204347.797088-4-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cups service for systemv was erroneously installed in /etc/rcX.d and
therefore not working.
This patch adds also a buildroot style systemv init script instead of
using the example provided by the package.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/S81cupsd | 48 +++++++++++++++++++++++++++++++++++++++++++
 package/cups/cups.mk  |  9 +++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/cups/S81cupsd

diff --git a/package/cups/S81cupsd b/package/cups/S81cupsd
new file mode 100644
index 0000000000..13b43ded5e
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
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
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
index 18f01d8484..cff198b06a 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -21,7 +21,8 @@ CUPS_CONF_OPTS = \
 	--with-docdir=/usr/share/cups/doc-root \
 	--disable-gssapi \
 	--disable-pam \
-	--libdir=/usr/lib
+	--libdir=/usr/lib \
+	--with-rcdir=no
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
@@ -71,4 +72,10 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+define CUPS_INSTALL_INIT_SYSV
+	$(RM) $(TARGET_DIR)/etc/init.d/cups
+	$(INSTALL) -D -m 0755 package/cups/S81cupsd \
+		$(TARGET_DIR)/etc/init.d/S81cupsd
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
