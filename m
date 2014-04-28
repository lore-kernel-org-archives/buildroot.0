From: =?UTF-8?q?Jer=C3=B4nimo=20Lopes?= <lopesjeronimo@gmail.com>
Date: Mon, 28 Apr 2014 12:34:52 -0300
Subject: [Buildroot] [PATCH 3/3] ofono: add init script
In-Reply-To: <1398699292-19411-1-git-send-email-lopesjeronimo@gmail.com>
References: <1398699292-19411-1-git-send-email-lopesjeronimo@gmail.com>
Message-ID: <1398699292-19411-3-git-send-email-lopesjeronimo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jer?nimo Lopes <lopesjeronimo@gmail.com>
---
 package/ofono/S46ofono | 22 ++++++++++++++++++++++
 package/ofono/ofono.mk |  4 ++++
 2 files changed, 26 insertions(+)
 create mode 100755 package/ofono/S46ofono

diff --git a/package/ofono/S46ofono b/package/ofono/S46ofono
new file mode 100755
index 0000000..34d2b6a
--- /dev/null
+++ b/package/ofono/S46ofono
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting ofono ... "
+		start-stop-daemon -S -q -m -b -p /var/run/ofonod.pid --exec /usr/sbin/ofonod -- -n
+		echo "done."
+		;;
+	stop)
+		echo -n "Stopping ofono ..."
+		start-stop-daemon -K -q -p /var/run/ofonod.pid
+		echo "done."
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 3f31447..07b354d 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -22,6 +22,10 @@ OFONO_CONF_OPT = --disable-test
 # make sure that it is defined.
 OFONO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
+define OFONO_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/ofono/S46ofono $(TARGET_DIR)/etc/init.d/S46ofono
+endef
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 	OFONO_CONF_OPT += --enable-udev
 	OFONO_DEPENDENCIES += udev
-- 
1.9.1
