From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 15 Sep 2014 22:46:21 +0200
Subject: [Buildroot] [PATCH] nsd: new package
Message-ID: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides NSD, an authoritative only, high performance,
simple and open source name server.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in       |  1 +
 package/nsd/Config.in   | 15 ++++++++++++++
 package/nsd/S80nsd      | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/nsd/nsd.mk      | 50 +++++++++++++++++++++++++++++++++++++++++++++
 package/nsd/nsd.service | 13 ++++++++++++
 5 files changed, 133 insertions(+)
 create mode 100644 package/nsd/Config.in
 create mode 100644 package/nsd/S80nsd
 create mode 100644 package/nsd/nsd.mk
 create mode 100644 package/nsd/nsd.service

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..c655ee0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1030,6 +1030,7 @@ endif
 	source "package/ngrep/Config.in"
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
+	source "package/nsd/Config.in"
 	source "package/ntp/Config.in"
 	source "package/nuttcp/Config.in"
 	source "package/odhcploc/Config.in"
diff --git a/package/nsd/Config.in b/package/nsd/Config.in
new file mode 100644
index 0000000..de9d213
--- /dev/null
+++ b/package/nsd/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NSD
+	bool "nsd"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NSD is an authoritative only, high performance, simple and open
+	  source name server.
+
+	  http://www.nlnetlabs.nl/projects/nsd/
+
+comment "nsd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nsd/S80nsd b/package/nsd/S80nsd
new file mode 100644
index 0000000..22c320d
--- /dev/null
+++ b/package/nsd/S80nsd
@@ -0,0 +1,54 @@
+#!/bin/sh
+#
+# Starts nsd Name Server Daemon
+#
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+NAME=nsd
+DESC="Name Server Daemon"
+DAEMON=/usr/sbin/nsd
+DAEMONCTL=/usr/sbin/nsdc
+DAEMON_ARGS="-c /etc/nsd/nsd.conf"
+PIDFILE=/var/run/$NAME.pid
+
+test -r /etc/default/$NAME && . /etc/default/$NAME
+
+DAEMON_ARGS="$DAEMON_ARGS $OPTIONS"
+
+do_start() {
+    start-stop-daemon -S -q -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
+}
+
+do_stop() {
+    start-stop-daemon -K -q -p $PIDFILE
+}
+
+do_reload() {
+    $DAEMONCTL reload >/dev/null
+}
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: "
+        do_start
+        [ $? == 0 ] && echo "OK" || echo "FAIL"
+        ;;
+    stop)
+        echo -n "Stopping $DESC: "
+        do_stop
+        [ $? == 0 ] && echo "OK" || echo "FAIL"
+        ;;
+    reload)
+        do_reload
+        ;;
+    restart)
+        do_stop
+        sleep 1
+        do_start
+        ;;
+     *)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/nsd/nsd.mk b/package/nsd/nsd.mk
new file mode 100644
index 0000000..0b008c2
--- /dev/null
+++ b/package/nsd/nsd.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# nsd
+#
+################################################################################
+
+NSD_VERSION = 4.0.3
+NSD_SITE = http://www.nlnetlabs.nl/downloads/nsd/
+NSD_LICENSE = BSD-3c
+NSD_LICENSE_FILES = LICENSE
+
+NSD_DEPENDENCIES = libevent openssl
+
+NSD_CONF_OPT = \
+	--prefix=/ \
+	--datarootdir=/usr/share
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NSD_CONF_OPT += --with-pidfile=/run/nsd/nsd.pid
+endif
+
+define NSD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/nsd/S80nsd \
+		$(TARGET_DIR)/etc/init.d/S80nsd
+endef
+
+define NSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/nsd/nsd.service \
+		$(TARGET_DIR)/lib/systemd/system/nsd.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf ../../../../lib/systemd/system/nsd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nsd.service
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/tmpfiles.d
+	echo "d /run/nsd 0755 nsd nsd -" > $(TARGET_DIR)/usr/lib/tmpfiles.d/nsd.conf
+endef
+
+define NSD_USERS
+	nsd -1 nsd -1 * /var/db/nsd - - Domain Name Server
+endef
+
+define NSD_REMOVE_SAMPLE_CONF
+	$(RM) $(TARGET_DIR)/etc/nsd/nsd.conf.sample
+endef
+
+NSD_POST_INSTALL_TARGET_HOOKS += NSD_REMOVE_SAMPLE_CONF
+
+$(eval $(autotools-package))
diff --git a/package/nsd/nsd.service b/package/nsd/nsd.service
new file mode 100644
index 0000000..5089e85
--- /dev/null
+++ b/package/nsd/nsd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=NSD Name Server Daemon
+After=network.target
+
+[Service]
+PIDFile=/run/nsd/nsd.pid
+ExecStart=/usr/sbin/nsd -d -c /etc/nsd/nsd.conf
+ExecReload=/bin/kill -HUP $MAINPID
+ExecStop=/bin/kill -TERM $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.3
