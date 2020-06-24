From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Jun 2020 22:43:41 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/cups-filters: fix cups-browsed
 service
In-Reply-To: <20200624204347.797088-1-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
Message-ID: <20200624204347.797088-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cups-browsed service is compiled and installed by the package,
but the corresponding services file were not installed for
systemv and systemd.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/S82cups-browsed | 48 ++++++++++++++++++++++++++++
 package/cups-filters/cups-filters.mk | 13 +++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 package/cups-filters/S82cups-browsed

diff --git a/package/cups-filters/S82cups-browsed b/package/cups-filters/S82cups-browsed
new file mode 100644
index 0000000000..08909c7f98
--- /dev/null
+++ b/package/cups-filters/S82cups-browsed
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+DAEMON="cups-browsed"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- -c /etc/cups/cups-browsed.conf
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
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 1f17018bc5..0a2622b87b 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -19,7 +19,8 @@ CUPS_FILTERS_CONF_OPTS = \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
-	--with-jpeg
+	--with-jpeg \
+	--with-rcdir=no
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
@@ -71,4 +72,14 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
+define CUPS_FILTERS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
+		$(TARGET_DIR)/etc/init.d/S82cups-browsed
+endef
+
+define CUPS_FILTERS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 $(@D)/utils/cups-browsed.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cups-browsed.service
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
