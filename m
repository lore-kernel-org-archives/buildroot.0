From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:32:31 +0100
Subject: [Buildroot] [git commit] minidlna: add init script for sysv and
	systemd
Message-ID: <20150308133314.B33678055B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84b13410b9a9c0582e8acab02316ec1bb07d8f10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add a sleep 1 between stop and start, otherwise minidlnad
does not restart properly.]

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/S60minidlnad      |   40 ++++++++++++++++++++++++++++++++++++
 package/minidlna/minidlna.mk       |   15 +++++++++++++
 package/minidlna/minidlnad.service |   11 +++++++++
 3 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/package/minidlna/S60minidlnad b/package/minidlna/S60minidlnad
new file mode 100644
index 0000000..f99999a
--- /dev/null
+++ b/package/minidlna/S60minidlnad
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# minidlnad        Starts minidlnad.
+#
+
+start() {
+	echo -n "Starting minidlna: "
+	umask 077
+	start-stop-daemon -S -q -p /var/run/minidlna/minidlna.pid \
+		--exec /usr/sbin/minidlnad
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping minidlna: "
+	start-stop-daemon -K -q -p /var/run/minidlna/minidlna.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	# Sleep needed for minidlna to restart properly
+	sleep 1
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
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index bcbe5fa..1ff76e3 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -24,4 +24,19 @@ MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
+define MINIDLNA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/minidlna/S60minidlnad \
+		$(TARGET_DIR)/etc/init.d/S60minidlnad
+endef
+
+define MINIDLNA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
+		$(TARGET_DIR)/lib/systemd/system/minidlnad.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../minidlnad.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minidlnad.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/minidlna/minidlnad.service b/package/minidlna/minidlnad.service
new file mode 100644
index 0000000..f69476b
--- /dev/null
+++ b/package/minidlna/minidlnad.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=minidlna server
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/minidlnad
+PIDFile=/var/run/minidlna/minidlna.pid
+
+[Install]
+WantedBy=multi-user.target
