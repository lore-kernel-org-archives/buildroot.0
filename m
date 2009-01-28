From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 21:38:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  radvd
Message-ID: <20090128213850.79B5B768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 21:38:49 +0000 (Wed, 28 Jan 2009)
New Revision: 25107

Log:
Add radvd to the list of packages

Add radvd, the IPv6 router advertisement daemon.

Signed-off-by: Amand Tihon <amand.tihon@alrj.org>

Added:
   trunk/buildroot/package/radvd/
   trunk/buildroot/package/radvd/Config.in
   trunk/buildroot/package/radvd/S50radvd
   trunk/buildroot/package/radvd/radvd.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-28 20:09:03 UTC (rev 25106)
+++ trunk/buildroot/package/Config.in	2009-01-28 21:38:49 UTC (rev 25107)
@@ -189,6 +189,7 @@
 source "package/openswan/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
+source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"

Added: trunk/buildroot/package/radvd/Config.in
===================================================================
--- trunk/buildroot/package/radvd/Config.in	                        (rev 0)
+++ trunk/buildroot/package/radvd/Config.in	2009-01-28 21:38:49 UTC (rev 25107)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RADVD
+	bool "radvd"
+	select BR2_PACKAGE_FLEX
+	depends on BR2_INET_IPV6
+	help
+	  IPv6 Router Advertisement Daemon.
+
+	  http://www.litech.org/radvd/

Added: trunk/buildroot/package/radvd/S50radvd
===================================================================
--- trunk/buildroot/package/radvd/S50radvd	                        (rev 0)
+++ trunk/buildroot/package/radvd/S50radvd	2009-01-28 21:38:49 UTC (rev 25107)
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+RADVD=/usr/sbin/radvd
+
+echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+
+echo -n "Starting radvd: "
+if [ ! -x "${RADVD}" ]; then
+	echo "missing"
+	exit 1
+fi
+
+if ${RADVD} ; then
+	echo "done"
+else
+	echo "failed"
+	exit 1
+fi


Property changes on: trunk/buildroot/package/radvd/S50radvd
___________________________________________________________________
Added: svn:executable
   + *

Added: trunk/buildroot/package/radvd/radvd.mk
===================================================================
--- trunk/buildroot/package/radvd/radvd.mk	                        (rev 0)
+++ trunk/buildroot/package/radvd/radvd.mk	2009-01-28 21:38:49 UTC (rev 25107)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# radvd
+#
+#############################################################
+RADVD_VERSION:=1.2
+RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
+RADVD_SITE:=http://www.litech.org/radvd/dist/
+RADVD_AUTORECONF:=no
+RADVD_INSTALL_STAGING:=no
+RADVD_INSTALL_TARGET:=YES
+RADVD_DEPENDENCIES:=uclibc flex
+RADVD_MAKE:=$(MAKE1)
+RADVD_CONF_OPT:= --program-prefix=''
+
+$(eval $(call AUTOTARGETS,package,radvd))
+
+$(RADVD_HOOK_POST_INSTALL): $(RADVD_TARGET_INSTALL_TARGET)
+	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
+	touch $@
