From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 23:36:14 +0100
Subject: [Buildroot] [git commit] Add SMS Tools Server 3 package
Message-ID: <20140128223724.505519C6BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad82e739b92354911a8a54dd6b66ea3c86c4f32a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move to hw menu, int type for nr modems, drop _BINARIES_DIR
 variable, fix config file name]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/smstools3/Config.in    |   24 ++++++++++++++++++++++
 package/smstools3/S50smsd      |   43 ++++++++++++++++++++++++++++++++++++++++
 package/smstools3/smstools3.mk |   34 +++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d6f675..631d8b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -332,6 +332,7 @@ source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/sg3_utils/Config.in"
 source "package/smartmontools/Config.in"
+source "package/smstools3/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
diff --git a/package/smstools3/Config.in b/package/smstools3/Config.in
new file mode 100644
index 0000000..72d0af6
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
+	int "Number of modems to support"
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
index 0000000..ac293c5
--- /dev/null
+++ b/package/smstools3/smstools3.mk
@@ -0,0 +1,34 @@
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
+SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
+SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
+SMSTOOLS3_CFLAGS += -D NOSTATS
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
+	$(INSTALL) -m 0755 -D $(@D)/src/smsd \
+		$(TARGET_DIR)/usr/bin/smsd
+	$(INSTALL) -m 0755 -D $(@D)/scripts/sendsms \
+		$(TARGET_DIR)/usr/bin/sendsms
+	$(INSTALL) -m 0644 -D $(@D)/examples/smsd.conf.easy \
+		$(TARGET_DIR)/etc/smsd.conf
+endef
+
+$(eval $(generic-package))
