From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:48:12 +0200
Subject: [Buildroot] [git commit] package/htpdate: new package
Message-ID: <20200907214022.9B88B83652@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d730282b82a390c0f20194f5afd099859ae5bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding htpdate, a time syncronization software based on http.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                      |  1 +
 package/Config.in               |  1 +
 package/htpdate/Config.in       |  8 +++++++
 package/htpdate/S43htpdate      | 51 +++++++++++++++++++++++++++++++++++++++++
 package/htpdate/htpdate.hash    |  3 +++
 package/htpdate/htpdate.mk      | 35 ++++++++++++++++++++++++++++
 package/htpdate/htpdate.service | 13 +++++++++++
 7 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 93a86811ba..b1e60e505f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -217,6 +217,7 @@ F:	package/cups/
 F:	package/cups-filters/
 F:	package/fail2ban/
 F:	package/grep/
+F:	package/htpdate/
 F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
diff --git a/package/Config.in b/package/Config.in
index 02213310a8..5afa7eec06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2082,6 +2082,7 @@ menu "Networking applications"
 	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
+	source "package/htpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
 	source "package/ibrdtn-tools/Config.in"
diff --git a/package/htpdate/Config.in b/package/htpdate/Config.in
new file mode 100644
index 0000000000..42c10c308b
--- /dev/null
+++ b/package/htpdate/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HTPDATE
+	bool "htpdate"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The HTTP Time Protocol (HTP) is used to synchronize a
+	  computer's time with web servers as reference time source.
+
+	  https://github.com/angeloc/htpdate
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
new file mode 100644
index 0000000000..75f9a995ff
--- /dev/null
+++ b/package/htpdate/S43htpdate
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="htpdate"
+PIDFILE="/var/run/$DAEMON.pid"
+
+HTPDATE_ARGS="-a -s -t https://google.com"
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
+		-- -D -i "$PIDFILE" $HTPDATE_ARGS
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
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
new file mode 100644
index 0000000000..282bcbe7ed
--- /dev/null
+++ b/package/htpdate/htpdate.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 08aee5132b0c73ba01485b907d037fd676d0ad89d2736bbf117ec5c5035b513a  htpdate-1.2.4.tar.gz
+sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
new file mode 100644
index 0000000000..99d3adafcd
--- /dev/null
+++ b/package/htpdate/htpdate.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# htpdate
+#
+################################################################################
+
+HTPDATE_VERSION = 1.2.4
+HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
+HTPDATE_LICENSE = GPL-2.0+
+HTPDATE_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
+HTPDATE_DEPENDENCIES += openssl
+endif
+
+define HTPDATE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)
+endef
+
+define HTPDATE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define HTPDATE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/htpdate/S43htpdate \
+		$(TARGET_DIR)/etc/init.d/S43htpdate
+endef
+
+define HTPDATE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/htpdate/htpdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/htpdate.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
new file mode 100644
index 0000000000..0c77550813
--- /dev/null
+++ b/package/htpdate/htpdate.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=htpdate daemon
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/htpdate
+Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
+EnvironmentFile=-/etc/default/htpdate
+ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate $HTPDATE_ARGS
+
+[Install]
+WantedBy=multi-user.target
