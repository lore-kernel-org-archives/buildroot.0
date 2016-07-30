From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 17:00:25 +0200
Subject: [Buildroot] [git commit] minissdpd: new package
Message-ID: <20160730160731.EE31081DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0340ce3cb7b8c3b57a272fa256b4661dde961e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SSDP managing daemon.
Designed to work with miniupnpc, miniupnpd, minidlna, etc.

http://miniupnp.free.fr/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas:
 - remove patch for _GNU_SOURCE, pass it from the .mk file instead
 - add dependency on BR2_USE_MMU, fork() is used.
 - rename $IF variable in init script/systemd unit file to $IFACE, for
   clarity.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                   |  1 +
 package/minissdpd/Config.in         |  9 +++++++
 package/minissdpd/S50minissdpd      | 47 +++++++++++++++++++++++++++++++++++++
 package/minissdpd/minissdpd.hash    |  2 ++
 package/minissdpd/minissdpd.mk      | 40 +++++++++++++++++++++++++++++++
 package/minissdpd/minissdpd.service | 12 ++++++++++
 6 files changed, 111 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 00f3ffb..645fa29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1498,6 +1498,7 @@ menu "Networking applications"
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/minidlna/Config.in"
+	source "package/minissdpd/Config.in"
 	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
 	source "package/mongrel2/Config.in"
diff --git a/package/minissdpd/Config.in b/package/minissdpd/Config.in
new file mode 100644
index 0000000..226cff0
--- /dev/null
+++ b/package/minissdpd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MINISSDPD
+	bool "minissdpd"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBNFNETLINK
+	help
+	  SSDP managing daemon. Designed to work with miniupnpc,
+	  miniupnpd, minidlna, etc.
+
+	  http://miniupnp.free.fr/
diff --git a/package/minissdpd/S50minissdpd b/package/minissdpd/S50minissdpd
new file mode 100644
index 0000000..6235e06
--- /dev/null
+++ b/package/minissdpd/S50minissdpd
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+NAME=minissdpd
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/sbin/$NAME
+CFGFILE=/etc/default/$NAME
+
+IFACE=eth0
+
+# Read configuration variable file if it is present
+if [ -f $CFGFILE ]; then
+        . $CFGFILE
+fi
+
+DAEMON_ARGS="-i $IFACE"
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
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
diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
new file mode 100644
index 0000000..8d670f3
--- /dev/null
+++ b/package/minissdpd/minissdpd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	dfd637b185731e1acb412a86faa9718eb93c04ca08280541a6d22d14d1fb890f	minissdpd-1.5.tar.gz
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
new file mode 100644
index 0000000..5c8bd37
--- /dev/null
+++ b/package/minissdpd/minissdpd.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# minissdpd
+#
+################################################################################
+
+MINISSDPD_VERSION = 1.5
+MINISSDPD_SITE = http://miniupnp.free.fr/files
+MINISSDPD_LICENSE = BSD-3c
+MINISSDPD_LICENSE_FILES = LICENSE
+MINISSDPD_DEPENDENCIES = libnfnetlink
+
+define MINISSDPD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		-C $(@D)
+endef
+
+define MINISSDPD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=$(TARGET_DIR) install
+endef
+
+# Use dedicated init scripts for systemV and systemd instead of using
+# minissdpd.init.d.script as it is not compatible with buildroot init system
+define MINISSDPD_INSTALL_INIT_SYSV
+	$(RM) $(TARGET_DIR)/etc/init.d/minissdpd
+	$(INSTALL) -D -m 0755 package/minissdpd/S50minissdpd \
+		$(TARGET_DIR)/etc/init.d/S50minissdpd
+endef
+
+define MINISSDPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/minissdpd/minissdpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/minissdpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/minissdpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minissdpd.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/minissdpd/minissdpd.service b/package/minissdpd/minissdpd.service
new file mode 100644
index 0000000..59ed9c8
--- /dev/null
+++ b/package/minissdpd/minissdpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=SSDP managing daemon
+After=network.target
+
+[Service]
+Environment="IFACE=eth0"
+EnvironmentFile=/etc/default/minissdpd
+ExecStart=/usr/sbin/minissdpd -i $IFACE
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
