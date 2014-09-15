From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 15 Sep 2014 22:46:22 +0200
Subject: [Buildroot] [PATCH] unbound: new package
In-Reply-To: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1410813982-7774-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides Unbound, a validating, recursive, and caching DNS
resolver.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in               |  1 +
 package/unbound/Config.in       | 17 +++++++++++++
 package/unbound/S80unbound      | 54 +++++++++++++++++++++++++++++++++++++++++
 package/unbound/unbound.mk      | 43 ++++++++++++++++++++++++++++++++
 package/unbound/unbound.service | 12 +++++++++
 5 files changed, 127 insertions(+)
 create mode 100644 package/unbound/Config.in
 create mode 100644 package/unbound/S80unbound
 create mode 100644 package/unbound/unbound.mk
 create mode 100644 package/unbound/unbound.service

diff --git a/package/Config.in b/package/Config.in
index c655ee0..9506b6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1084,6 +1084,7 @@ endif
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
 	source "package/ulogd/Config.in"
+	source "package/unbound/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
diff --git a/package/unbound/Config.in b/package/unbound/Config.in
new file mode 100644
index 0000000..57bc09f
--- /dev/null
+++ b/package/unbound/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_UNBOUND
+	bool "unbound"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Unbound is a validating, recursive, and caching DNS resolver.
+
+	  http://unbound.net/
+
+comment "unbound needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/unbound/S80unbound b/package/unbound/S80unbound
new file mode 100644
index 0000000..655be88
--- /dev/null
+++ b/package/unbound/S80unbound
@@ -0,0 +1,54 @@
+#!/bin/sh
+#
+# Starts unbound DNS resolver
+#
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+NAME=nsd
+DESC="DNS Resolver"
+DAEMON=/usr/sbin/unbound
+DAEMONCTL=/usr/sbin/unbound-control
+DAEMON_ARGS="-c /etc/unbound/unbound.conf"
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
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
new file mode 100644
index 0000000..7be956f
--- /dev/null
+++ b/package/unbound/unbound.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# unbound
+#
+################################################################################
+
+UNBOUND_VERSION = 1.4.22
+UNBOUND_SITE = http://unbound.net/downloads/
+UNBOUND_LICENSE = BSD-3c
+UNBOUND_LICENSE_FILES = LICENSE
+
+UNBOUND_DEPENDENCIES = expat libevent openssl
+
+UNBOUND_CONF_OPT = \
+	--prefix=/usr \
+	--sysconfdir=/etc \
+	--disable-rpath \
+	--localstatedir=/var
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UNBOUND_CONF_OPT += --with-pidfile=/run/unbound.pid
+endif
+
+define UNBOUND_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/unbound/S80unbound \
+		$(TARGET_DIR)/etc/init.d/S80unbound
+endef
+
+define UNBOUND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/unbound/unbound.service \
+		$(TARGET_DIR)/lib/systemd/system/unbound.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf ../../../../lib/systemd/system/unbound.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/unbound.service
+endef
+
+define UNBOUND_USERS
+	unbound -1 unbound -1 * - - - DNS Resolver
+endef
+
+$(eval $(autotools-package))
diff --git a/package/unbound/unbound.service b/package/unbound/unbound.service
new file mode 100644
index 0000000..8e59e5a
--- /dev/null
+++ b/package/unbound/unbound.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Unbound DNS Resolver
+After=network.target
+
+[Service]
+PIDFile=/run/unbound.pid
+ExecStart=/usr/sbin/unbound -d
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.3
