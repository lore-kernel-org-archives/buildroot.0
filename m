From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:43:58 +0200
Subject: [Buildroot] [git commit] lldpd: add sysv init script
Message-ID: <20160802201048.6A2EC818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8711d72410294b2f9ae3351c9d2c4b62f2848e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple sysv init script to start the lldpd daemon at boot.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
[Thomas: cosmetic improvements.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lldpd/S60lldpd | 25 +++++++++++++++++++++++++
 package/lldpd/lldpd.mk |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
new file mode 100644
index 0000000..3dfa6c1
--- /dev/null
+++ b/package/lldpd/S60lldpd
@@ -0,0 +1,25 @@
+#!/bin/sh
+#
+# Controls lldpd.
+#
+
+case $1 in
+    start)
+	printf "Starting lldpd: "
+	start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	printf "Stopping lldpd: "
+	start-stop-daemon -K -q -p /var/run/lldpd.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    restart)
+	$0 stop
+	$0 start
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
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
