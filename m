From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:00:51 +0200
Subject: [Buildroot] [git commit] package/cups-filters: improve cups-browsed
 init integration
Message-ID: <20200629205830.DD6E1861A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fe54a4536c87a757c75b3bd4dfe0f11b819bdc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cups-browsed service is compiled and installed by the package,
but the corresponding services file were not installed for
systemv and systemd.

Specifying --without-rcdir allows to not install the init script
provided with cups-filters, and we provide our own,
Buildroot-compatible init script.

For systemd, we install the upstream-provided service file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups-filters/S82cups-browsed | 48 ++++++++++++++++++++++++++++++++++++
 package/cups-filters/cups-filters.mk | 13 +++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

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
index 1f17018bc5..ffd1fd8945 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -19,7 +19,8 @@ CUPS_FILTERS_CONF_OPTS = \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
-	--with-jpeg
+	--with-jpeg \
+	--without-rcdir
 
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
