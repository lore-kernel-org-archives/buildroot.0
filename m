From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 00:07:10 +0100
Subject: [Buildroot] [git commit] triggerhappy: new package
Message-ID: <20141211230754.7FFA08032E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e2b80968f59bb78bda199b89a8eaac5931454e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - add BR2_USE_MMU dependency, since fork() is used
  - rename do_start() and do_stop() to just start() and stop(), as we
    do in most init scripts in Buildroot.]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/triggerhappy/Config.in       |   11 +++++++++
 package/triggerhappy/S10triggerhappy |   40 ++++++++++++++++++++++++++++++++++
 package/triggerhappy/triggerhappy.mk |   37 +++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 06bf412..48be2df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ endif
 	source "package/ti-gfx/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
+	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
diff --git a/package/triggerhappy/Config.in b/package/triggerhappy/Config.in
new file mode 100644
index 0000000..a7864b3
--- /dev/null
+++ b/package/triggerhappy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TRIGGERHAPPY
+	bool "triggerhappy"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Triggerhappy is a hotkey daemon developed with small and
+	  embedded systems in mind, e.g. linux based routers. It
+	  attaches to the input device files and interprets the event
+	  data received and executes scripts configured in its
+	  configuration.
+
+	  https://github.com/wertarbyte/triggerhappy
diff --git a/package/triggerhappy/S10triggerhappy b/package/triggerhappy/S10triggerhappy
new file mode 100755
index 0000000..8186195
--- /dev/null
+++ b/package/triggerhappy/S10triggerhappy
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+NAME=thd
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+DAEMON_ARGS="--daemon --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --pidfile $PIDFILE --user nobody /dev/input/event*"
+
+# Sanity checks
+test -x $DAEMON || exit 0
+
+[ -r /etc/default/triggerhappy ] && . /etc/default/triggerhappy
+
+start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
+                && echo "OK" || echo "FAIL"
+}
+
+stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+        start)
+                start
+                ;;
+        stop)
+                stop
+                ;;
+        restart)
+                stop
+                sleep 1
+                start
+                ;;
+        *)
+                echo "Usage: $0 {start|stop|restart}"
+                exit 1
+esac
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
new file mode 100644
index 0000000..d3dfc6a
--- /dev/null
+++ b/package/triggerhappy/triggerhappy.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# triggerhappy
+#
+################################################################################
+
+TRIGGERHAPPY_VERSION = aac9f353a28c0f414b27ac54bbbb2292c152eedc
+TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
+TRIGGERHAPPY_LICENSE = GPLv3+
+TRIGGERHAPPY_LICENSE_FILES = COPYING
+
+define TRIGGERHAPPY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		LINUX_INPUT_H=$(STAGING_DIR)/usr/include/linux/input.h \
+		-C $(@D) thd th-cmd
+endef
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+define TRIGGERHAPPY_INSTALL_UDEV_RULE
+	$(INSTALL) -D -m 0644 $(@D)/udev/triggerhappy-udev.rules \
+		$(TARGET_DIR)/lib/udev/rules.d/triggerhappy.rules
+endef
+endif
+
+define TRIGGERHAPPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/etc/triggerhappy/triggers.d
+	$(INSTALL) -D -m 0755 $(@D)/thd $(TARGET_DIR)/usr/sbin/thd
+	$(INSTALL) -D -m 0755 $(@D)/th-cmd $(TARGET_DIR)/usr/sbin/th-cmd
+	$(TRIGGERHAPPY_INSTALL_UDEV_RULE)
+endef
+
+define TRIGGERHAPPY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/triggerhappy/S10triggerhappy \
+		$(TARGET_DIR)/etc/init.d/S10triggerhappy
+endef
+
+$(eval $(generic-package))
