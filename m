From: Dave Purdy <david.c.purdy@gmail.com>
Date: Mon, 18 Jun 2012 16:59:29 -0500
Subject: [Buildroot] [PATCH] inadyn: new package for inadyn DDNS
	client-updater
Message-ID: <1340056769-19014-1-git-send-email-david.c.purdy@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

inadyn is a DynamicDNS client/updater which works with dyndns.com, noip.com
and many other DDNS providers.  It is minimal in footprint and requirements,
supports IP caching, multiple providers, multiple domain names, and 
a variety of other situations.


Signed-off-by: Dave Purdy <david.c.purdy@gmail.com>
---
 package/Config.in                  |    1 +
 package/inadyn/Config.in           |    8 ++++++++
 package/inadyn/S70inadyn.etc.initd |   35 +++++++++++++++++++++++++++++++++++
 package/inadyn/inadyn.conf         |   12 ++++++++++++
 package/inadyn/inadyn.mk           |   21 +++++++++++++++++++++
 5 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 package/inadyn/Config.in
 create mode 100644 package/inadyn/S70inadyn.etc.initd
 create mode 100644 package/inadyn/inadyn.conf
 create mode 100644 package/inadyn/inadyn.mk

diff --git a/package/Config.in b/package/Config.in
index 1044e9f..d489b6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -529,6 +529,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
 source "package/igh-ethercat/Config.in"
+source "package/inadyn/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
new file mode 100644
index 0000000..e8e241b
--- /dev/null
+++ b/package/inadyn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_INADYN
+	bool "inadyn"
+	help
+	  INADYN is a free DynDNS client. It gives the possibility
+	  to have your own fixed hostname registered on the internet, 
+	  although your IP might be changing. 
+
+	  https://github.com/troglobit/inadyn
diff --git a/package/inadyn/S70inadyn.etc.initd b/package/inadyn/S70inadyn.etc.initd
new file mode 100644
index 0000000..27dc040
--- /dev/null
+++ b/package/inadyn/S70inadyn.etc.initd
@@ -0,0 +1,35 @@
+#!/bin/sh
+#
+# Start & stop the inadyn client
+#
+
+CONFIG=/etc/inadyn.conf
+VR_INADYN=/var/run/inadyn
+
+# check if CONFIG exists, print message & exit if it doesn't
+[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
+
+# check if VR_INADYN exists, create it if not
+[ ! -d $VR_INADYN ] && mkdir -p $VR_INADYN
+
+case "$1" in
+        start)
+                echo "Starting inadyn."
+                start-stop-daemon -S -x /usr/sbin/inadyn
+                ;;
+        stop)
+                echo  "Stopping inadyn."
+                start-stop-daemon -q -K -x /usr/sbin/inadyn
+                rm -f /var/run/inadyn/inadyn.pid 
+                ;;
+        restart)
+                "$0" stop
+                "$0" start
+                ;;
+        *)
+                echo $"Usage: $0 {start|stop|restart}"
+                exit 1
+esac
+
+exit $?
+
diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
new file mode 100644
index 0000000..7d2b915
--- /dev/null
+++ b/package/inadyn/inadyn.conf
@@ -0,0 +1,12 @@
+# Basic configuration file for inadyn
+#
+# /etc/inadyn.conf
+background
+update_period_sec 600 # Check for a new IP every 600 seconds
+username test		# replace 'test' with your username
+password test		# replace 'test' with your password
+dyndns_system dyndns at dyndns.org   # replace w/ your provider
+
+#  uncomment the alias statement below to test it on your system
+alias test.homeip.net	
+# replace 'test.homeip.net' with yourdomainname for actual (non-test) use
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
new file mode 100644
index 0000000..583d1b2
--- /dev/null
+++ b/package/inadyn/inadyn.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# inadyn
+#
+#############################################################
+
+INADYN_VERSION = 1.98.1
+INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
+INADYN_SITE = https://github.com/downloads/troglobit/inadyn
+
+define INADYN_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define INADYN_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
+	$(INSTALL) -D -m 0644 	package/inadyn/inadyn.conf $(TARGET_DIR)/etc/inadyn.conf
+	$(INSTALL) -D -m 0755   package/inadyn/S70inadyn.etc.initd $(TARGET_DIR)/etc/init.d/S70inadyn
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.0.4
