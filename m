From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  6 Aug 2020 23:29:37 +0200
Subject: [Buildroot] [PATCH] package/htpdate: new package
Message-ID: <20200806212937.1236558-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding htpdate, a time syncronization software based on http.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in               |  1 +
 package/htpdate/Config.in       |  8 +++++
 package/htpdate/S43htpdate      | 56 +++++++++++++++++++++++++++++++++
 package/htpdate/htpdate.conf    |  3 ++
 package/htpdate/htpdate.hash    |  3 ++
 package/htpdate/htpdate.mk      | 36 +++++++++++++++++++++
 package/htpdate/htpdate.service | 11 +++++++
 7 files changed, 118 insertions(+)
 create mode 100644 package/htpdate/Config.in
 create mode 100644 package/htpdate/S43htpdate
 create mode 100644 package/htpdate/htpdate.conf
 create mode 100644 package/htpdate/htpdate.hash
 create mode 100644 package/htpdate/htpdate.mk
 create mode 100644 package/htpdate/htpdate.service

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..b1c3d2db92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2061,6 +2061,7 @@ menu "Networking applications"
 	source "package/haproxy/Config.in"
 	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
+	source "package/htpdate/Config.in"
 	source "package/hplip/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
diff --git a/package/htpdate/Config.in b/package/htpdate/Config.in
new file mode 100644
index 0000000000..fb0b0f3bf7
--- /dev/null
+++ b/package/htpdate/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HTPDATE
+	bool "htpdate"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The HTTP Time Protocol (HTP) is used to synchronize a computer's time
+	  with web servers as reference time source.
+
+	  https://github.com/angeloc/htpdate
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
new file mode 100644
index 0000000000..7b20053f79
--- /dev/null
+++ b/package/htpdate/S43htpdate
@@ -0,0 +1,56 @@
+#!/bin/sh
+
+DAEMON="htpdate"
+PIDFILE="/var/run/$DAEMON.pid"
+
+if [ -r "/etc/default/$DAEMON" ]; then
+	. "/etc/default/$DAEMON"
+else
+HTPDATE_OPTS="-a -s -t"
+HTPDATE_HOSTS="https://google.com"
+fi
+
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
+		-- -D -i "$PIDFILE" $HTPDATE_OPTS $HTPDATE_HOSTS
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
diff --git a/package/htpdate/htpdate.conf b/package/htpdate/htpdate.conf
new file mode 100644
index 0000000000..0c1b2eae43
--- /dev/null
+++ b/package/htpdate/htpdate.conf
@@ -0,0 +1,3 @@
+HTPDATE_OPTS="-a -s -t"
+
+HTPDATE_HOSTS="https://google.com"
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
new file mode 100644
index 0000000000..bed7f76c81
--- /dev/null
+++ b/package/htpdate/htpdate.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 08aee5132b0c73ba01485b907d037fd676d0ad89d2736bbf117ec5c5035b513a  v1.2.4.tar.gz
+sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
new file mode 100644
index 0000000000..3b57fa4da4
--- /dev/null
+++ b/package/htpdate/htpdate.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# htpdate
+#
+################################################################################
+
+HTPDATE_VERSION = 1.2.4
+HTPDATE_SOURCE = v$(HTPDATE_VERSION).tar.gz
+HTPDATE_SITE = https://github.com/angeloc/htpdate/archive
+HTPDATE_LICENSE = GPL-2.0-or-later
+HTPDATE_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
+HTPDATE_BUILD_DEPENDENCIES = openssl
+endif
+
+define HTPDATE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)
+endef
+
+define HTPDATE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
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
index 0000000000..300cf9ec8f
--- /dev/null
+++ b/package/htpdate/htpdate.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=htpdate daemon
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/htpdate
+ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate -a -s -t https://www.google.com
+
+[Install]
+WantedBy=multi-user.target
-- 
2.25.1
