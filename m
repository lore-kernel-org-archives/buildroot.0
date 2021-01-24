From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 23:24:14 +0100
Subject: [Buildroot] [git commit] package/ssdp-responder: new package
Message-ID: <20210124221022.C6B55816C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d9fdc0984c139872485a1d446c1518185af0ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Small (35k), and stand-alone, SSDP responder with built-in web server
(on port 1901) for serving description.xml when Windows scans for any
network devices on the LAN.  Also includes ssdp-scan (31k), similar to
the mdns-scan tool, to probe for SSDP capable devices.

Although it does not use fork(), it still fails to build on noMMU: lots
of missing function declarations, and lots of multicast-related structs
definitions, causing warnings like:

    ssdp-scan.c:57:12: warning: implicit declaration of function ???strdup???; did you mean ???strcmp???? [-Wimplicit-function-declaration]
    ssdp-scan.c:57:10: warning: assignment to ???char *??? from ???int??? makes pointer from integer without a cast [-Wint-conversion]

and errors like:

    ssdp.c:357:17: error: storage size of ???imr??? isn???t known
    struct ip_mreq imr;
                   ^~~

Finding the root cause why those get not defined in MMU on uClibc is
quite a head-scratching, so let's just disablessdp-responder for noMMU
architectures.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr: extend commit log to explain noMMU state]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/ssdp-responder/Config.in           | 20 ++++++++++++++
 package/ssdp-responder/S50ssdpd            | 42 ++++++++++++++++++++++++++++++
 package/ssdp-responder/ssdp-responder.hash |  3 +++
 package/ssdp-responder/ssdp-responder.mk   | 31 ++++++++++++++++++++++
 6 files changed, 98 insertions(+)

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
index 0000000000..df57546eed
--- /dev/null
+++ b/package/ssdp-responder/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SSDP_RESPONDER
+	bool "ssdp-responder"
+	depends on BR2_USE_MMU
+	help
+	  Simple Service Discovery Protocol daemon (SSDP) for networked
+	  Linux and UNIX devices. Useful in any setup, big or small, but
+	  targeted more at embedded systems that need to announce
+	  themselves to Windows systems.
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
index 0000000000..f2478e99b1
--- /dev/null
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -0,0 +1,31 @@
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
+SSDP_RESPONDER_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SSDP_RESPONDER_DEPENDENCIES += systemd
+SSDP_RESPONDER_CONF_OPTS += --with-systemd
+else
+SSDP_RESPONDER_CONF_OPTS += --without-systemd
+endif
+
+define SSDP_RESPONDER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/ssdp-responder/S50ssdpd \
+		$(TARGET_DIR)/etc/init.d/S50ssdpd
+endef
+
+define SSDP-RESPONDER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/ssdp-responder.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ssdp-responder.service
+endef
+
+$(eval $(autotools-package))
