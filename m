From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:59:19 +0200
Subject: [Buildroot] [git commit] dante: new package
Message-ID: <20160705160138.08F7A81F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=467e3ea2b9c309506719dbffc01c807dcfcfd897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas:
 - Add dependency on BR2_USE_MMU
 - Rewrap Config.in help text
 - PID file goes in /var/run/
 - Daemon to start is /usr/sbin/sockd, not /usr/sbin/dante
 - Remove staging installation, as it is not needed
 - Remove --enable-debug, since that's not what BR2_ENABLE_DEBUG is
   meant for
 - Install an example configuration file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in           |  1 +
 package/dante/Config.in     | 11 +++++++++++
 package/dante/S50dante      | 40 ++++++++++++++++++++++++++++++++++++++++
 package/dante/dante.hash    |  2 ++
 package/dante/dante.mk      | 34 ++++++++++++++++++++++++++++++++++
 package/dante/dante.service | 15 +++++++++++++++
 6 files changed, 103 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4d3d202..145828e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1406,6 +1406,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/dante/Config.in"
 	source "package/dhcp/Config.in"
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
diff --git a/package/dante/Config.in b/package/dante/Config.in
new file mode 100644
index 0000000..41a8999
--- /dev/null
+++ b/package/dante/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DANTE
+	bool "dante"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Dante is a product developed by Inferno Nettverk A/S. It
+	  consists of a SOCKS server and a SOCKS client, implementing
+	  RFC 1928 and related standards. It is a flexible product
+	  that can be used to provide convenient and secure network
+	  connectivity.
+
+	  http://www.inet.no/dante/
diff --git a/package/dante/S50dante b/package/dante/S50dante
new file mode 100644
index 0000000..ed51a84
--- /dev/null
+++ b/package/dante/S50dante
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Starts dante
+#
+
+# Allow a few customizations from a config file
+test -r /etc/default/dante && . /etc/default/dante
+
+start() {
+	printf "Starting dante: "
+	start-stop-daemon -S -q -p /var/run/dante.pid \
+		--exec /usr/sbin/sockd -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping dante: "
+	start-stop-daemon -K -q -p /var/run/dante.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/dante/dante.hash b/package/dante/dante.hash
new file mode 100644
index 0000000..38dea61
--- /dev/null
+++ b/package/dante/dante.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53	dante-1.4.1.tar.gz
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
new file mode 100644
index 0000000..1bab648
--- /dev/null
+++ b/package/dante/dante.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# dante
+#
+################################################################################
+
+DANTE_VERSION = 1.4.1
+DANTE_SITE = http://www.inet.no/dante/files
+DANTE_LICENSE = BSD-3c
+DANTE_LICENSE_FILES = LICENSE
+
+# Dante uses a *VERY* old configure.ac
+DANTE_LIBTOOL_PATCH = NO
+
+DANTE_CONF_OPTS += --disable-client --disable-preload
+
+define DANTE_INSTALL_CONFIG_FILE
+	$(INSTALL) -D -m 644 $(@D)/example/sockd.conf \
+		$(TARGET_DIR)/etc/sockd.conf
+endef
+
+DANTE_POST_INSTALL_TARGET_HOOKS += DANTE_INSTALL_CONFIG_FILE
+
+define DANTE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dante/dante.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dante.service
+endef
+
+define DANTE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/dante/S50dante \
+		$(TARGET_DIR)/etc/init.d/S50dante
+endef
+
+$(eval $(autotools-package))
diff --git a/package/dante/dante.service b/package/dante/dante.service
new file mode 100644
index 0000000..b783cee
--- /dev/null
+++ b/package/dante/dante.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=SOCKS v4 and v5 compatible proxy server and client
+Requires=network.target
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/default/dante
+PIDFile=/run/dante.pid
+ExecStart=/usr/sbin/sockd -D -p /run/dante.pid $DAEMON_ARGS
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
