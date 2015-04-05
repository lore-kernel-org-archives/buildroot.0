From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:02:30 +0300
Subject: [Buildroot] [RFC v2 3/6] dropbear: common service startup
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <d922d1afb082ed50f34cb1dd3c2db5f0a209b21c.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Relatively complex case, with umask and autid dependency.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dropbear/S50dropbear      | 43 ---------------------------------------
 package/dropbear/dropbear.mk      | 13 +-----------
 package/dropbear/dropbear.run     |  6 ++++++
 package/dropbear/dropbear.service | 10 ---------
 4 files changed, 7 insertions(+), 65 deletions(-)
 delete mode 100644 package/dropbear/S50dropbear
 create mode 100644 package/dropbear/dropbear.run
 delete mode 100644 package/dropbear/dropbear.service

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
deleted file mode 100644
index 2694931..0000000
--- a/package/dropbear/S50dropbear
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/sh
-#
-# Starts dropbear sshd.
-#
-
-# Allow a few customizations from a config file
-test -r /etc/default/dropbear && . /etc/default/dropbear
-
-start() {
-	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
-
-	echo -n "Starting dropbear sshd: "
-	umask 077
-	start-stop-daemon -S -q -p /var/run/dropbear.pid \
-		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-stop() {
-	echo -n "Stopping dropbear sshd: "
-	start-stop-daemon -K -q -p /var/run/dropbear.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bc65d69..fdd83f4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -51,19 +51,8 @@ define DROPBEAR_DISABLE_STANDALONE
 	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
 
-define DROPBEAR_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/dropbear.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
-endef
-
 ifeq ($(BR2_USE_MMU),y)
-define DROPBEAR_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
-		$(TARGET_DIR)/etc/init.d/S50dropbear
-endef
+DROPBEAR_INIT_RUN = dropbear.run
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 endif
diff --git a/package/dropbear/dropbear.run b/package/dropbear/dropbear.run
new file mode 100644
index 0000000..f50153d
--- /dev/null
+++ b/package/dropbear/dropbear.run
@@ -0,0 +1,6 @@
+description: Dropbear SSH daemon
+umask: 077
+pidfile: /var/run/dropbear.pid
+after: syslog network auditd
+background: /usr/sbin/dropbear -R
+foreground: /usr/sbin/dropbear -F -R
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
deleted file mode 100644
index 4e6c879..0000000
--- a/package/dropbear/dropbear.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Dropbear SSH daemon
-After=syslog.target network.target auditd.service
-
-[Service]
-ExecStart=/usr/sbin/dropbear -F -R
-ExecReload=/bin/kill -HUP $MAINPID
-
-[Install]
-WantedBy=multi-user.target
-- 
2.0.3
