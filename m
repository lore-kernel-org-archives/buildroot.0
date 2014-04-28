From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 21:48:53 +0200
Subject: [Buildroot] [git commit] ofono: add init script
Message-ID: <20140428195235.61A2D9C961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1bfc2d2e51ae49c6f9a5cbbc2a0f87bf863f024
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jer??nimo Lopes <lopesjeronimo@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/S46ofono |   22 ++++++++++++++++++++++
 package/ofono/ofono.mk |    4 ++++
 2 files changed, 26 insertions(+), 0 deletions(-)

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
