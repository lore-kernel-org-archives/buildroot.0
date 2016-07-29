From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jul 2016 16:28:37 +0200
Subject: [Buildroot] [PATCH 1/1] minissdpd: new package
Message-ID: <1469802517-17937-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SSDP managing daemon.
Designed to work with miniupnpc, miniupnpd, minidlna, etc.

http://miniupnp.free.fr/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                                  |  1 +
 .../0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch    | 32 +++++++++++++++
 package/minissdpd/Config.in                        |  8 ++++
 package/minissdpd/S50minissdpd                     | 47 ++++++++++++++++++++++
 package/minissdpd/minissdpd.hash                   |  2 +
 package/minissdpd/minissdpd.mk                     | 38 +++++++++++++++++
 package/minissdpd/minissdpd.service                | 12 ++++++
 7 files changed, 140 insertions(+)
 create mode 100644 package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch
 create mode 100644 package/minissdpd/Config.in
 create mode 100644 package/minissdpd/S50minissdpd
 create mode 100644 package/minissdpd/minissdpd.hash
 create mode 100644 package/minissdpd/minissdpd.mk
 create mode 100644 package/minissdpd/minissdpd.service

diff --git a/package/Config.in b/package/Config.in
index ee7ba39..616df66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1495,6 +1495,7 @@ menu "Networking applications"
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/minidlna/Config.in"
+	source "package/minissdpd/Config.in"
 	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
 	source "package/mongrel2/Config.in"
diff --git a/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch b/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch
new file mode 100644
index 0000000..35854c5
--- /dev/null
+++ b/package/minissdpd/0001-Set-_GNU_SOURCE-in-asyncsendto.c.patch
@@ -0,0 +1,32 @@
+From 8ea177d974259c91f7e520d4b5b2abf07a1bbce2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Fri, 29 Jul 2016 13:32:09 +0200
+Subject: [PATCH 1/1] Set _GNU_SOURCE in asyncsendto.c
+
+Add #define on _GNU_SOURCE at the very beginning of asyncsendto.c file
+as this file uses in6_pktinfo which is protected by __USE_GNU in
+libc/inet/netinet/in.h. Currently, this flag is set by the Makefile in
+CFLAGS however CFLAGS could be overwritten by the build system.
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ minissdpd/asyncsendto.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/asyncsendto.c b/minissdpd/asyncsendto.c
+index bd21e93..3e5eba3 100644
+--- a/asyncsendto.c
++++ b/asyncsendto.c
+@@ -5,6 +5,9 @@
+  * This software is subject to the conditions detailed
+  * in the LICENCE file provided within the distribution */
+ 
++// for struct in6_pktinfo
++#define _GNU_SOURCE
++
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/time.h>
+-- 
+2.7.4
+
diff --git a/package/minissdpd/Config.in b/package/minissdpd/Config.in
new file mode 100644
index 0000000..b5a73f0
--- /dev/null
+++ b/package/minissdpd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MINISSDPD
+	bool "minissdpd"
+	select BR2_PACKAGE_LIBNFNETLINK
+	help
+	  SSDP managing daemon.
+	  Designed to work with miniupnpc, miniupnpd, minidlna, etc.
+
+	  http://miniupnp.free.fr/
diff --git a/package/minissdpd/S50minissdpd b/package/minissdpd/S50minissdpd
new file mode 100644
index 0000000..76b6ae3
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
+IF=eth0
+
+# Read configuration variable file if it is present
+if [ -f $CFGFILE ]; then
+        . $CFGFILE
+fi
+
+DAEMON_ARGS="-i $IF"
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
index 0000000..eddef0f
--- /dev/null
+++ b/package/minissdpd/minissdpd.mk
@@ -0,0 +1,38 @@
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
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define MINISSDPD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
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
index 0000000..4a520f5
--- /dev/null
+++ b/package/minissdpd/minissdpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=SSDP managing daemon
+After=network.target
+
+[Service]
+Environment="IF=eth0"
+EnvironmentFile=/etc/default/minissdpd
+ExecStart=/usr/sbin/minissdpd -i $IF
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
