From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 14:13:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  netplug
Message-ID: <20061212221342.4E56B48585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 14:13:41 -0800 (Tue, 12 Dec 2006)
New Revision: 16858

Log:
add netplug package


Added:
   trunk/buildroot/package/netplug/
   trunk/buildroot/package/netplug/Config.in
   trunk/buildroot/package/netplug/init-netplug
   trunk/buildroot/package/netplug/netplug-script
   trunk/buildroot/package/netplug/netplug.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-12 21:43:59 UTC (rev 16857)
+++ trunk/buildroot/package/Config.in	2006-12-12 22:13:41 UTC (rev 16858)
@@ -103,6 +103,7 @@
 source "package/ncurses/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
+source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/newt/Config.in"
 source "package/ntp/Config.in"

Added: trunk/buildroot/package/netplug/Config.in
===================================================================
--- trunk/buildroot/package/netplug/Config.in	2006-12-12 21:43:59 UTC (rev 16857)
+++ trunk/buildroot/package/netplug/Config.in	2006-12-12 22:13:41 UTC (rev 16858)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NETPLUG
+	bool "netplug"
+	default n
+	help
+	  A Linux daemon that manages network interfaces in
+	  response to network cables being plugged in and out.
+
+	  http://www.red-bean.com/~bos/

Added: trunk/buildroot/package/netplug/init-netplug
===================================================================
--- trunk/buildroot/package/netplug/init-netplug	2006-12-12 21:43:59 UTC (rev 16857)
+++ trunk/buildroot/package/netplug/init-netplug	2006-12-12 22:13:41 UTC (rev 16858)
@@ -0,0 +1,69 @@
+#!/bin/sh
+#
+# netplugd     This shell script takes care of starting and stopping
+#              the network plug management daemon.
+#
+# chkconfig: - 11 89
+# description: netplugd is a daemon for managing non-static network \
+#              interfaces.
+# processname: netplugd
+# pidfile: /var/run/netplugd.pid
+
+# Copyright 2003 Key Research, Inc.
+
+# Source function library.
+if [ -f /etc/init.d/functions ]; then
+	. /etc/init.d/functions
+elif [ -f /etc/rc.d/init.d/functions ]; then
+	. /etc/rc.d/init.d/functions
+fi
+
+# Source networking configuration.
+if [ -f /etc/sysconfig/network ]; then
+	. /etc/sysconfig/network
+
+	# Check that networking is up.
+	[ ${NETWORKING} = "no" ] && exit 0
+elif [ ! -f /etc/network/interfaces ]; then
+	# No network support
+	exit 0
+fi
+
+[ -x /sbin/netplugd ] || exit 0
+
+if [ -f /etc/sysconfig/netplugd ]; then
+    . /etc/sysconfig/netplugd
+fi
+
+# See how we were called.
+case "$1" in
+  start)
+	# Start daemon.
+	echo -n $"Starting network plug daemon: "
+	start-stop-daemon --start --quiet --pidfile /var/run/netplugd.pid --exec /sbin/netplugd ${NETPLUGDARGS}
+	RETVAL=$?
+	echo
+	[ $RETVAL -eq 0 ] && touch /var/lock/subsys/netplugd
+	;;
+  stop)
+	# Stop daemon.
+	echo -n $"Shutting down network plug daemon: "
+	start-stop-daemon --stop --name netplugd
+	RETVAL=$?
+	echo
+	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/netplugd
+	;;
+  restart|reload)
+	$0 stop
+	$0 start
+	;;
+  condrestart)
+	[ -f /var/lock/subsys/netplugd ] && $0 restart || :
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	RETVAL=1
+	;;
+esac
+
+exit $RETVAL


Property changes on: trunk/buildroot/package/netplug/init-netplug
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/netplug/netplug-script
===================================================================
--- trunk/buildroot/package/netplug/netplug-script	2006-12-12 21:43:59 UTC (rev 16857)
+++ trunk/buildroot/package/netplug/netplug-script	2006-12-12 22:13:41 UTC (rev 16858)
@@ -0,0 +1,57 @@
+#!/bin/sh
+#
+# netplug - policy agent for netplugd
+#
+# Copyright 2003 Key Research, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License, version 2, as
+# published by the Free Software Foundation.  You are forbidden from
+# redistributing or modifying it under the terms of any other license,
+# including other versions of the GNU General Public License.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+
+
+PATH=/usr/bin:/bin:/usr/sbin:/sbin
+export PATH
+
+dev="$1"
+action="$2"
+
+case "$action" in
+in)
+    if [ -x /sbin/ifup ]; then
+	exec /sbin/ifup $dev
+    else
+	echo "Please teach me how to plug in an interface!" 1>&2
+	exit 1
+    fi
+    ;;
+out)
+    if [ -x /sbin/ifdown ]; then
+	# At least on Fedora Core 1, the call to ip addr flush infloops
+	# /sbin/ifdown $dev && exec /sbin/ip addr flush $dev
+	exec /sbin/ifdown $dev
+    else
+	echo "Please teach me how to unplug an interface!" 1>&2
+	exit 1
+    fi
+    ;;
+probe)
+    # exec /sbin/ip link set $dev up >/dev/null 2>&1
+    if [ -x /sbin/ifconfig ]; then
+	exec /sbin/ifconfig $dev up >/dev/null 2>&1
+    else
+	echo "Failed to probe an interface!" 1>&2
+	exit 1
+    fi
+    ;;
+*)
+    echo "I have been called with a funny action of '%s'!" 1>&2
+    exit 1
+    ;;
+esac


Property changes on: trunk/buildroot/package/netplug/netplug-script
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/netplug/netplug.mk
===================================================================
--- trunk/buildroot/package/netplug/netplug.mk	2006-12-12 21:43:59 UTC (rev 16857)
+++ trunk/buildroot/package/netplug/netplug.mk	2006-12-12 22:13:41 UTC (rev 16858)
@@ -0,0 +1,53 @@
+#############################################################
+#
+# netplug
+#
+#############################################################
+NETPLUG_VER=1.2.9
+NETPLUG_SOURCE=netplug-$(NETPLUG_VER).tar.bz2
+NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
+NETPLUG_DIR=$(BUILD_DIR)/netplug-$(NETPLUG_VER)
+NETPLUG_CAT:=bzcat
+NETPLUG_BINARY:=netplugd
+NETPLUG_TARGET_BINARY:=sbin/netplugd
+
+$(DL_DIR)/$(NETPLUG_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NETPLUG_SITE)/$(NETPLUG_SOURCE)
+
+netplug-source: $(DL_DIR)/$(NETPLUG_SOURCE)
+
+$(NETPLUG_DIR)/.unpacked: $(DL_DIR)/$(NETPLUG_SOURCE)
+	$(NETPLUG_CAT) $(DL_DIR)/$(NETPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(NETPLUG_DIR) package/netplug/ netplug\*.patch
+	touch $(NETPLUG_DIR)/.unpacked
+
+$(NETPLUG_DIR)/$(NETPLUG_BINARY): $(NETPLUG_DIR)/.unpacked
+	$(MAKE) CC=$(TARGET_CC) -C $(NETPLUG_DIR)
+	$(STRIP) $(NETPLUG_DIR)/$(NETPLUG_BINARY)
+
+$(TARGET_DIR)/$(NETPLUG_TARGET_BINARY): $(NETPLUG_DIR)/$(NETPLUG_BINARY)
+	$(INSTALL) -m 644 -D $(NETPLUG_DIR)/etc/netplugd.conf $(TARGET_DIR)/etc/netplug/netplugd.conf
+	$(INSTALL) -m 755 -D package/netplug/netplug-script $(TARGET_DIR)/etc/netplug.d/netplug
+	$(INSTALL) -m 755 -D package/netplug/init-netplug $(TARGET_DIR)/etc/init.d/S29netplug
+	$(INSTALL) -m 755 -D $(NETPLUG_DIR)/$(NETPLUG_BINARY) $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
+	touch -c $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
+
+netplug: uclibc $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
+
+netplug-clean:
+	rm -f $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
+	rm -rf $(TARGET_DIR)/etc/netplug*
+	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
+	-$(MAKE) -C $(NETPLUG_DIR) clean
+
+netplug-dirclean:
+	rm -rf $(NETPLUG_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_NETPLUG)),y)
+TARGETS+=netplug
+endif
