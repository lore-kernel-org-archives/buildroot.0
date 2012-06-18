From: Dave Purdy <david.c.purdy@gmail.com>
Date: Mon, 18 Jun 2012 12:36:29 -0500
Subject: [Buildroot] [PATCH V2] p910nd: Add p910nd lightweight printserver
Message-ID: <1340040989-19507-1-git-send-email-david.c.purdy@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since V1:
	-p910nd.mk : Fixed source/site, removed need for patch, decrufted.
	-S55p910nd initscript: Reworked for start-stop-daemon usage,
	 added some basic sanity checks for config-file, lock-dir & run-dir,
	 cleaned up structure and readability, removed cruft,
	 changed do_stop so that it scans run-dir for pid-files instead of
	 looking at the config file, reworked do_start to ensure that each
	 instance of p910nd has its correct/unique process-name and pid-file,
	 and added a restart option.
	-p910nd.conf : Added clarifying documentation RE format of args/options
	-RETESTED: with a fresh rootfs build, with different daemon instances
	 (e.g. p9102d), on various devices (e.g. /dev/usb/lp3) - all successful


Signed-off-by: Dave Purdy <david.c.purdy@gmail.com>

---
 package/Config.in          |    1 +
 package/p910nd/Config.in   |    8 +++++
 package/p910nd/S55p910nd   |   76 ++++++++++++++++++++++++++++++++++++++++++++
 package/p910nd/p910nd.conf |   20 +++++++++++
 package/p910nd/p910nd.mk   |   21 ++++++++++++
 5 files changed, 126 insertions(+), 0 deletions(-)
 create mode 100644 package/p910nd/Config.in
 create mode 100644 package/p910nd/S55p910nd
 create mode 100644 package/p910nd/p910nd.conf
 create mode 100644 package/p910nd/p910nd.mk

diff --git a/package/Config.in b/package/Config.in
index 1044e9f..f5056a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -570,6 +570,7 @@ source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openswan/Config.in"
 source "package/openvpn/Config.in"
+source "package/p910nd/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
diff --git a/package/p910nd/Config.in b/package/p910nd/Config.in
new file mode 100644
index 0000000..490dace
--- /dev/null
+++ b/package/p910nd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_P910ND
+	bool "p910nd"
+	help
+	  p910nd is a small printer daemon intended for diskless
+	  workstations. Using ports 9100-9102, it accepts
+	  print jobs and passes them directly to a USB printer.
+
+	  http://p910nd.sourceforge.net/
diff --git a/package/p910nd/S55p910nd b/package/p910nd/S55p910nd
new file mode 100644
index 0000000..60b719a
--- /dev/null
+++ b/package/p910nd/S55p910nd
@@ -0,0 +1,76 @@
+#!/bin/sh
+#
+#   /etc/init.d/[S55]p910nd
+#   initscript to start p910nd printer daemon, with match pid-files and process-names
+
+
+CONFIG=/etc/p910nd.conf
+RUN_D=/var/run
+P910ND=/usr/sbin/p910nd
+SUBSYS=/var/lock/subsys
+
+# check if /etc/p910nd.conf exists, print message & exit if it doesn't
+[ ! -f $CONFIG ] && ( echo "The config file /etc/p910nd.conf is missing... exiting now." && exit 0 )
+
+#  description of config line format for /etc/p910nd.conf
+#  each configuration line must have form 
+#  N  [-b]  -f <printer_device> , where N is the port number [0|1|2], -b enables bidirectional traffic, 
+#                                 and -f specifies a printer device
+# 
+#  examples:
+#  0 -b -f /dev/usb/lp0   
+# (listen on port 9100, with bidirectional traffic, use /dev/usb/lp0, pid-file p9100d.pid)
+#
+#  2  -f /dev/usb/lp3     
+# (listen on port 9102, use /dev/usb/lp3, pid-file p9102d.pid)
+
+
+# check if /var/run exists, create it if not
+[ ! -d $RUN_D ] && mkdir -p $RUN_D
+
+# check if /var/lock/subsys exists, create it if not
+[ ! -d $SUBSYS ] && mkdir -p $SUBSYS
+
+do_start() {
+	[ -f $CONFIG ] && ( while read PORT OPTIONS; do
+   		case "$PORT" in
+    			""|\#*)
+     			continue;
+   		esac
+		P910XD_PID="p910"$PORT"d.pid"	# create the correct pid-filename, e.g. p9102d.pid
+		P910ND_ARGS=" $OPTIONS $PORT"
+		start-stop-daemon -m -p  $RUN_D/$P910XD_PID -S -x $P910ND -- $P910ND_ARGS
+		echo "starting p910nd with options" $OPTIONS "on port" $PORT "with pid-file" $P910XD_PID
+   		if [ $? -ne 0 ]; then
+    			exit 1
+		fi
+  	done
+	) < $CONFIG
+ 	exit 0
+}
+
+do_stop() {
+        for PID_F in $RUN_D/p910?d.pid; do
+                start-stop-daemon -q -K -p $PID_F 
+		rm $PID_F && echo "stopping p910nd instance with pid-file" $PID_F
+        done
+}
+
+case $1 in
+	start)
+ 	 	do_start
+  		;;
+  	stop)
+  		do_stop
+  		;;
+  	restart)
+        	do_stop
+		sleep 1
+        	do_start
+        	;;
+  	*)
+        	echo $"Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/p910nd/p910nd.conf b/package/p910nd/p910nd.conf
new file mode 100644
index 0000000..da1b7f0
--- /dev/null
+++ b/package/p910nd/p910nd.conf
@@ -0,0 +1,20 @@
+# p910nd Version 0.95 Copyright (c) 2010 Ken Yap, GPLv2
+# For additional daemon arguments, see man 8 p910nd
+#
+#  description of config line format for /etc/p910nd.conf
+#  each configuration line must have form
+#  N  [-b]  -f <printer_device> 
+#
+#  where:
+#	 N is the port number [0|1|2],
+#	-b enables (optional) bidirectional traffic, and
+#       -f specifies a printer device
+#
+#  examples:
+  0 -b -f /dev/usb/lp0
+# (listen on port 9100, bidirectional traffic, use /dev/usb/lp0, pid-file p9100d)
+#
+#  2  -f /dev/usb/lp3
+# (listen on port 9102, use /dev/usb/lp3, pid-file p9102d.pid)
+
+
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
new file mode 100644
index 0000000..94b0ddb
--- /dev/null
+++ b/package/p910nd/p910nd.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# p910nd
+#
+#############################################################
+
+P910ND_VERSION = 0.95
+P910ND_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/p910nd/$(P910ND_VERSION)
+P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+
+define P910ND_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(P910ND_MAKE_OPTS) -C $(@D)
+endef
+
+define P910ND_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
+	$(INSTALL) -m 0644 -D package/p910nd/p910nd.conf $(TARGET_DIR)/etc/p910nd.conf
+	$(INSTALL) -m 0755 -D package/p910nd/S55p910nd $(TARGET_DIR)/etc/init.d/S55p910nd
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.0.4
