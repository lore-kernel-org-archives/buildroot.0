From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 23 Jan 2014 16:38:04 +0100
Subject: [Buildroot] [PATCH v2] Add SMS Tools Server 3 package
Message-ID: <1390491484-1394-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 Changes since v1:
 - 80x '#' in smstools3.mk header
 - use 'install' instead of 'cp'
 - took Gustavo's remarks into account:
   * help text for BR2_PACKAGE_SMSTOOLS3_NB_MODEMS option
   * install binaries in /usr/bin/
   * use xxx_INSTALL_INIT_SYSV for init script installation

 package/Config.in              |    1 +
 package/smstools3/Config.in    |   24 ++++++++++++++++++++++
 package/smstools3/S50smsd      |   43 ++++++++++++++++++++++++++++++++++++++++
 package/smstools3/smstools3.mk |   37 ++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 package/smstools3/Config.in
 create mode 100644 package/smstools3/S50smsd
 create mode 100644 package/smstools3/smstools3.mk

diff --git a/package/Config.in b/package/Config.in
index e502cde..1f4fe14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -901,6 +901,7 @@ source "package/samba/Config.in"
 source "package/sconeserver/Config.in"
 source "package/ser2net/Config.in"
 source "package/smcroute/Config.in"
+source "package/smstools3/Config.in"
 source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
diff --git a/package/smstools3/Config.in b/package/smstools3/Config.in
new file mode 100644
index 0000000..6ca533f
--- /dev/null
+++ b/package/smstools3/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SMSTOOLS3
+	bool "smstools3"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The SMS Server Tools 3 is a SMS Gateway software which can send and
+	  receive short messages through GSM modems and mobile phones.
+
+	  http://smstools3.kekekasvi.com/
+
+if BR2_PACKAGE_SMSTOOLS3
+
+config BR2_PACKAGE_SMSTOOLS3_NB_MODEMS
+	string "Number of modems to support"
+	default 1
+	help
+	  To reduce memory footprint of SMS Server Tools, you can specify the
+	  exact number of modems connected to your board. By default only 1
+	  modem is used.
+
+endif
+
+comment "smstools3 needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/smstools3/S50smsd b/package/smstools3/S50smsd
new file mode 100644
index 0000000..239c3e3
--- /dev/null
+++ b/package/smstools3/S50smsd
@@ -0,0 +1,43 @@
+#!/bin/sh
+#
+# Starts the SMS Server Tools 3
+#
+
+NAME=smsd
+DAEMON=/usr/bin/$NAME
+PIDFILE=/var/run/$NAME.pid
+SPOOL=/var/spool/sms
+
+start()
+{
+	echo -n "Starting $NAME: "
+	mkdir -p $SPOOL/outgoing
+	mkdir -p $SPOOL/incoming
+	mkdir -p $SPOOL/checked
+	start-stop-daemon -S -q -p $PIDFILE --exec $DAEMON -- -c /etc/smsd.conf && echo "OK" || echo "Failed"
+}
+
+stop()
+{
+	echo -n "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE && echo "OK" || echo "Failed"
+	rm -f $PIDFILE
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
new file mode 100644
index 0000000..edc57cb
--- /dev/null
+++ b/package/smstools3/smstools3.mk
@@ -0,0 +1,37 @@
+###############################################################################
+#
+# smstools3
+#
+###############################################################################
+
+SMSTOOLS3_VERSION = 3.1.15
+SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages/
+SMSTOOLS3_LICENSE = GPLv2+
+SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
+
+SMSTOOLS3_NB_MODEMS = $(call qstrip,$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS))
+SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
+SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(SMSTOOLS3_NB_MODEMS)
+SMSTOOLS3_CFLAGS += -D NOSTATS
+SMSTOOLS3_TARGET_BINARIES_DIR = $(TARGET_DIR)/usr/bin
+
+define SMSTOOLS3_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(SMSTOOLS3_CFLAGS)" -C $(@D)
+endef
+
+define SMSTOOLS3_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/smstools3/S50smsd \
+		$(TARGET_DIR)/etc/init.d/S50smsd
+endef
+
+define SMSTOOLS3_INSTALL_TARGET_CMDS
+	mkdir -p $(SMSTOOLS3_TARGET_BINARIES_DIR)
+	$(INSTALL) -m 0755 -D $(@D)/src/smsd \
+		$(SMSTOOLS3_TARGET_BINARIES_DIR)/smsd
+	$(INSTALL) -m 0755 -D $(@D)/scripts/sendsms \
+		$(SMSTOOLS3_TARGET_BINARIES_DIR)/sendsms
+	$(INSTALL) -m 0644 -D $(@D)/examples/smsd.conf.easy \
+		$(TARGET_DIR)/etc/smsd.conf.easy
+endef
+
+$(eval $(generic-package))
-- 
1.7.5.4
