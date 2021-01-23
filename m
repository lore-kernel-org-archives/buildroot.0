From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 00:15:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: new package
Message-ID: <20210123231559.3036505-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small (35k), and stand-alone, SSDP responder with built-in web server
(on port 1901) for serving description.xml when Windows scans for any
network devices on the LAN.  Also includes ssdp-scan (31k), similar to
the mdns-scan tool, to probe for SSDP capable devices.

Verified with test-pkg, no-mmu builds disabled.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/ssdp-responder/Config.in           | 20 +++++++++++
 package/ssdp-responder/S50ssdpd            | 42 ++++++++++++++++++++++
 package/ssdp-responder/ssdp-responder.hash |  3 ++
 package/ssdp-responder/ssdp-responder.mk   | 18 ++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/ssdp-responder/Config.in
 create mode 100755 package/ssdp-responder/S50ssdpd
 create mode 100644 package/ssdp-responder/ssdp-responder.hash
 create mode 100644 package/ssdp-responder/ssdp-responder.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 687a9400e0..7af3081760 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1280,6 +1280,7 @@ F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/mg/
 F:	package/netcalc/
+F:	package/ssdp-responder/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
diff --git a/package/Config.in b/package/Config.in
index f42cc01032..12bd0608e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2268,6 +2268,7 @@ endif
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
+	source "package/ssdp-responder/Config.in"
 	source "package/sshguard/Config.in"
 	source "package/sshpass/Config.in"
 	source "package/sslh/Config.in"
diff --git a/package/ssdp-responder/Config.in b/package/ssdp-responder/Config.in
new file mode 100644
index 0000000000..d6d374256e
--- /dev/null
+++ b/package/ssdp-responder/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SSDP_RESPONDER
+        bool "ssdp-responder"
+        depends on BR2_USE_MMU # fork()
+        help
+          Simple Service Discovery Protocol daemon (SSDP) for networked
+          Linux and UNIX devices. Useful in any setup, big or small, but
+          targeted more at embedded systems that need to announce
+          themselves to Windows systems.
+
+	  ssdpd is a stand-alone UNIX, no external dependencies but the
+	  standard C library.  It has a built-in web server for serving
+	  the UPnP XML description which Windows use to present the
+	  icon, by default an InternetGatewayDevice is announced.
+
+	  Also included is ssdp-scan, a tool similar to mdns-scan, which
+	  continuously scans for SSDP capable hosts on the network.
+	  Take care only to use for debugging since it scans the network
+	  quite aggressively.
+
+	  https://github.com/troglobit/ssdp-responder/
diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
new file mode 100755
index 0000000000..e33992be91
--- /dev/null
+++ b/package/ssdp-responder/S50ssdpd
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+NAME=ssdpd
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/sbin/$NAME
+CFGFILE=/etc/default/$NAME
+
+DAEMON_ARGS=""
+
+# Read configuration variable file if it is present
+[ -f $CFGFILE ] && . $CFGFILE
+
+start() {
+	printf 'Starting %s: ' "$NAME"
+	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$NAME"
+	start-stop-daemon -K -q -p $PIDFILE -x $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+    start|stop|restart)
+	"$1"
+	;;
+    reload)
+	restart
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
new file mode 100644
index 0000000000..e8cbbb4a1f
--- /dev/null
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
+sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
new file mode 100644
index 0000000000..ce057ee593
--- /dev/null
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ssdp-responder
+#
+################################################################################
+
+SSDP_RESPONDER_VERSION = 1.8
+SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
+SSDP_RESPONDER_LICENSE = ISC
+SSDP_RESPONDER_LICENSE_FILES = LICENSE
+SSDP_RESPONDER_CPE_ID_VENDOR = troglobit
+
+define SSDP_RESPONDER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/ssdp-responder/S50ssdpd \
+		$(TARGET_DIR)/etc/init.d/S50ssdpd
+endef
+
+$(eval $(autotools-package))
-- 
2.25.1
