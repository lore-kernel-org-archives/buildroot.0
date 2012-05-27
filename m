From: Dave Purdy <david.c.purdy@gmail.com>
Date: Sun, 27 May 2012 00:48:19 -0500
Subject: [Buildroot] [PATCH] p910nd: add p910nd print server
Message-ID: <1338097699-14561-1-git-send-email-david.c.purdy@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

p910nd is a lightweight, nonspooling printserver that accepts jobs
on ports 9100-9102 via network, and sends them directly to a USB
printer.  It is ideally suited for embedded devices and diskless
workstations.

---
 package/Config.in                                  |    1 +
 package/p910nd/Config.in                           |    8 +++
 package/p910nd/S55p910nd                           |   48 ++++++++++++++++++++
 ...var-lock-instead-of-var_log_subsys_p910nd.patch |   13 +++++
 package/p910nd/p910nd.default                      |    9 ++++
 package/p910nd/p910nd.mk                           |   23 +++++++++
 6 files changed, 102 insertions(+), 0 deletions(-)
 create mode 100644 package/p910nd/Config.in
 create mode 100644 package/p910nd/S55p910nd
 create mode 100644 package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
 create mode 100644 package/p910nd/p910nd.default
 create mode 100644 package/p910nd/p910nd.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..c600630 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ source "package/openntpd/Config.in"
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
index 0000000..8778a62
--- /dev/null
+++ b/package/p910nd/S55p910nd
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+DEFAULT=/etc/default/p910nd
+RUN_D=/var/run
+
+_start() {
+ mkdir -p $RUN_D
+ [ -f $DEFAULT ] && (
+  while read port options; do
+   case "$port" in
+    ""|\#*)
+     continue;
+   esac
+   p910nd $options $port
+   if [ $? -ne 0 ]; then
+    exit 1
+   fi
+  done
+ ) < $DEFAULT
+ exit 0
+}
+
+_stop() {
+ [ -f $DEFAULT ] && (
+  while read port options; do
+   case "$port" in
+    ""|\#*)
+     continue;
+   esac
+   PID_F=$RUN_D/p910${port}d.pid
+   [ -f $PID_F ] && kill $(cat $PID_F)
+   rm $PID_F
+  done
+ ) < $DEFAULT
+}
+
+case $1 in
+ start)
+  _start
+  ;;
+ stop)
+  _stop
+  ;;
+ *)
+  echo "usage: $0 (start|stop)"
+  exit 1
+esac
+exit $?
diff --git a/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch b/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
new file mode 100644
index 0000000..867b8cf
--- /dev/null
+++ b/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
@@ -0,0 +1,13 @@
+Index: p910nd/p910nd.c
+===================================================================
+--- p910nd.orig/p910nd.c	2011-11-14 22:47:41.986401420 +0100
++++ p910nd/p910nd.c	2011-11-14 22:49:27.274923524 +0100
+@@ -122,7 +122,7 @@
+ #ifdef		LOCKFILE_DIR
+ #define		LOCKFILE	LOCKFILE_DIR "/p910%cd"
+ #else
+-#define		LOCKFILE	"/var/lock/subsys/p910%cd"
++#define		LOCKFILE	"/var/lock/p910%cd"
+ #endif
+ #ifndef		PRINTERFILE
+ #define         PRINTERFILE     "/dev/lp%c"
diff --git a/package/p910nd/p910nd.default b/package/p910nd/p910nd.default
new file mode 100644
index 0000000..77317cf
--- /dev/null
+++ b/package/p910nd/p910nd.default
@@ -0,0 +1,9 @@
+# printing port list, in the form "number [options]"
+# where:
+#  - number is the port number in the range [0-9]
+#    the p910nd daemon will listen on tcp port 9100+number
+#  - options can be :
+#    -b to turn on bidirectional copying.
+#    -f to specify a different printer device.
+#
+0  -b -f /dev/usb/lp0
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
new file mode 100644
index 0000000..c229b32
--- /dev/null
+++ b/package/p910nd/p910nd.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# p910nd
+#
+#############################################################
+
+P910ND_VERSION = 0.95
+P910ND_SITE =  http://voxel.dl.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
+P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+
+define P910ND_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
+endef
+
+define P910ND_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/default
+	$(INSTALL) -m 0755 -D package/p910nd/p910nd.default $(TARGET_DIR)/etc/default/p910nd
+	$(INSTALL) -m 0755 -D package/p910nd/S55p910nd $(TARGET_DIR)/etc/init.d/S55p910nd
+
+endef
+
+$(eval $(call GENTARGETS,package,p910nd))
-- 
1.7.0.4
