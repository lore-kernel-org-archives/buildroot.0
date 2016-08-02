From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue,  2 Aug 2016 12:24:11 -0400
Subject: [Buildroot] [PATCH] lldpd: add sysv init script
Message-ID: <20160802162411.19412-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple sysv init script to start the lldpd daemon at boot.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/lldpd/S60lldpd | 23 +++++++++++++++++++++++
 package/lldpd/lldpd.mk |  5 +++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/lldpd/S60lldpd

diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
new file mode 100644
index 0000000..0fe41fd
--- /dev/null
+++ b/package/lldpd/S60lldpd
@@ -0,0 +1,23 @@
+#!/bin/sh
+#
+# Controls lldpd.
+#
+
+case $1 in
+  start)
+    printf "Starting lldpd..."
+    start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd
+    ;;
+  stop)
+    printf "Stopping lldpd..."
+    start-stop-daemon -K -q -p /var/run/lldpd.pid 
+    ;;
+  restart)
+    $0 stop
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
+    ;;
+esac
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 416967b..6c7bf80 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -35,4 +35,9 @@ LLDPD_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
 	$(if $(BR2_PACKAGE_LLDPD_CUSTOM_TLV),--enable-custom,--disable-custom)
 
+define LLDPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
+		$(TARGET_DIR)/etc/init.d/S60lldpd
+endef
+
 $(eval $(autotools-package))
-- 
2.9.2
