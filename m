From: Joerg Krause <jkrause@posteo.de>
Date: Mon, 14 Jul 2014 22:52:47 +0200
Subject: [Buildroot] [PATCH 1/1] upmpdcli: new package
Message-ID: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the package upmpdcli. 

Signed-off-by: Joerg Krause <jkrause@posteo.de>
---
 package/upmpdcli/Config.in   | 16 ++++++++++++++++
 package/upmpdcli/S99upmpdcli | 40 ++++++++++++++++++++++++++++++++++++++++
 package/upmpdcli/upmpdcli.mk | 22 ++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 package/upmpdcli/Config.in
 create mode 100644 package/upmpdcli/S99upmpdcli
 create mode 100644 package/upmpdcli/upmpdcli.mk

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
new file mode 100644
index 0000000..d878bfc
--- /dev/null
+++ b/package/upmpdcli/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_UPMPDCLI
+	bool "upmpdcli"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+
+	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
+	  Player Daemon. It supports UPnP gapless track transitions and
+	  the OpenHome ohMedia services.
+
+	  http://www.lesbonscomptes.com/upmpdcli/
+
+comment "upmpdcli needs a toolchain w/ C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
new file mode 100644
index 0000000..314ea32
--- /dev/null
+++ b/package/upmpdcli/S99upmpdcli
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+NAME=upmpdcli
+DAEMON=/usr/bin/$NAME
+CONFFILE=/etc/$NAME.conf
+PIDFILE=/var/run/$NAME.pid
+DAEMON_ARGS="-D -c $CONFFILE"
+
+# Sanity checks
+test -f $DAEMON || exit 0
+
+do_start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --background --exec $DAEMON \
+                -- $DAEMON_ARGS \
+                && echo "OK" || echo "FAIL"
+}
+
+do_stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+        start)
+                do_start
+                ;;
+        stop)
+                do_stop
+                ;;
+        restart)
+                do_stop
+                sleep 1
+                do_start
+                ;;
+        *)
+                echo "Usage: $0 {start|stop|restart}"
+                exit 1
+esac
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
new file mode 100644
index 0000000..fa03fd4
--- /dev/null
+++ b/package/upmpdcli/upmpdcli.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# upmpdcli
+#
+################################################################################
+
+UPMPDCLI_VERSION = 0.7.1
+UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+UPMPDCLI_LICENSE = GPLv2
+UPMPDCLI_LICENSE_FILES = COPYING
+UPMPDCLI_DEPENDENCIES = expat libupnp libmpdclient
+
+# Upmpdcli only runs if user upmpdcli exists
+define UPMPDCLI_USERS
+	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli: MPD UPnP Renderer Front-End
+endef
+
+define UPMPDCLI_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
+endef
+
+$(eval $(autotools-package))
-- 
2.0.1
