From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:58:45 +0200
Subject: [Buildroot] [PATCH 2/6] package: added lirc
In-Reply-To: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
References: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272589129-21443-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Config.in      |    2 ++
 package/lirc/Config.in |   32 ++++++++++++++++++++++++++++++++
 package/lirc/S70lircd  |   24 ++++++++++++++++++++++++
 package/lirc/lirc.mk   |   38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 package/lirc/Config.in
 create mode 100644 package/lirc/S70lircd
 create mode 100644 package/lirc/lirc.mk

diff --git a/package/Config.in b/package/Config.in
index 6848f9f..c3a713b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -270,6 +270,7 @@ endmenu
 menu "Hardware handling"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
+source "package/lirc/Config.in"
 source "package/tslib/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
@@ -431,6 +432,7 @@ endmenu
 menu "Package managers"
 source "package/ipkg/Config.in"
 source "package/portage/Config.in"
+
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rpm/Config.in"
 endif
diff --git a/package/lirc/Config.in b/package/lirc/Config.in
new file mode 100644
index 0000000..a8a2bb6
--- /dev/null
+++ b/package/lirc/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_LIRC
+	bool "lirc"
+	help
+          LIRC is a package that supports receiving and sending IR
+          signals of the most common IR remote controls. It contains a
+          daemon that decodes and sends IR signals, a mouse daemon
+          that translates IR signals to mouse movements and a couple
+          of user programs that allow to control your computer with a
+          remote control.
+
+          A list of supported hardware is available on the main page.
+
+	  http://www.lirc.org/
+
+if BR2_PACKAGE_LIRC
+
+choice
+	prompt "lirc drivers"
+	default BR2_PACKAGE_LIRC_USERSPACE
+
+	config BR2_PACKAGE_LIRC_ALL
+		bool "all"
+
+	config BR2_PACKAGE_LIRC_USERSPACE
+		bool "userspace"
+
+	config BR2_PACKAGE_LIRC_NONE
+		bool "none"
+endchoice
+
+endif # BR2_PACKAGE_LIRC
+
diff --git a/package/lirc/S70lircd b/package/lirc/S70lircd
new file mode 100644
index 0000000..770bef5
--- /dev/null
+++ b/package/lirc/S70lircd
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+LIRCD=/usr/sbin/lircd
+PID_FILE=/var/run/lircd.pid
+LIRCFLAGS="-o /dev/lircd -P $PID_FILE"
+
+case "$1" in
+    start)
+	echo -n "Starting daemon lircd: "
+        start-stop-daemon --start --quiet --pidfile $PID_FILE --exec $LIRCD -- $LIRCFLAGS
+        echo "done"
+	;;
+    stop)
+	echo -n "Shutting down daemon lircd: "
+	start-stop-daemon --stop --quiet --pidfile $PID_FILE --exec $LIRCD
+        echo "done"
+	;;
+    *)
+        echo "Usage: $0 {start|stop}"
+        exit 1
+	;;
+esac
+
+exit 0
diff --git a/package/lirc/lirc.mk b/package/lirc/lirc.mk
new file mode 100644
index 0000000..12168f3
--- /dev/null
+++ b/package/lirc/lirc.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# lirc
+#
+#############################################################
+
+LIRC_VERSION = 0.8.6
+LIRC_SOURCE = lirc-$(LIRC_VERSION).tar.bz2
+LIRC_SITE = http://prdownloads.sourceforge.net/lirc
+LIRC_LIBTOOL_PATCH = NO
+LIRC_INSTALL_STAGING = YES
+
+LIRC_CONF_OPT = --without-x
+
+ifeq ($(BR2_PACKAGE_LIRC_ALL),y)
+LIRC_CONF_OPT += --with-driver=all
+endif
+ifeq ($(BR2_PACKAGE_LIRC_USERSPACE),y)
+LIRC_CONF_OPT += --with-driver=userspace
+endif
+ifeq ($(BR2_PACKAGE_LIRC_NONE),y)
+LIRC_CONF_OPT += --with-driver=none
+endif
+
+define LIRC_INSTALL_TARGET_SCRIPTS
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/lirc/S70lircd $(TARGET_DIR)/etc/init.d/
+endef
+
+LIRC_POST_INSTALL_TARGET_HOOKS += LIRC_INSTALL_TARGET_SCRIPTS
+
+define LIRC_UNINSTALL_TARGET_SCRIPTS
+	rm -f $(TARGET_DIR)/etc/init.d/S70lircd
+endef
+
+LIRC_POST_UNINSTALL_TARGET_HOOKS += LIRC_UNINSTALL_TARGET_SCRIPTS
+
+$(eval $(call AUTOTARGETS,package,lirc))
-- 
1.7.0.4
