From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:28:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ifplugd
Message-ID: <20080531072813.C3EE13C8E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:28:12 -0700 (Sat, 31 May 2008)
New Revision: 22139

Log:
package: ifplugd package


Added:
   trunk/buildroot/package/ifplugd/
   trunk/buildroot/package/ifplugd/Config.in
   trunk/buildroot/package/ifplugd/ifplugd-cross.patch
   trunk/buildroot/package/ifplugd/ifplugd-fix-headers.patch
   trunk/buildroot/package/ifplugd/ifplugd.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-05-31 07:28:09 UTC (rev 22138)
+++ trunk/buildroot/package/Config.in	2008-05-31 07:28:12 UTC (rev 22139)
@@ -158,6 +158,7 @@
 source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
+source "package/ifplugd/Config.in"
 source "package/irda-utils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"

Added: trunk/buildroot/package/ifplugd/Config.in
===================================================================
--- trunk/buildroot/package/ifplugd/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ifplugd/Config.in	2008-05-31 07:28:12 UTC (rev 22139)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_IFPLUGD
+	bool "ifplugd"
+	default n
+	select BR2_PACKAGE_LIBDAEMON
+	help
+	  Ifplugd is a daemon which will automatically configure your
+	  ethernet device when a cable is plugged in and automatically
+	  de-configure it if the cable is pulled out. This is useful
+	  on laptops with onboard network adapters, since it will only
+	  configure the interface when a cable is really connected.
+
+	  http://0pointer.de/lennart/projects/ifplugd/

Added: trunk/buildroot/package/ifplugd/ifplugd-cross.patch
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd-cross.patch	                        (rev 0)
+++ trunk/buildroot/package/ifplugd/ifplugd-cross.patch	2008-05-31 07:28:12 UTC (rev 22139)
@@ -0,0 +1,17 @@
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ifplugd-0.28/configure
+===================================================================
+--- ifplugd-0.28.orig/configure
++++ ifplugd-0.28/configure
+@@ -5430,7 +5430,7 @@
+   echo $ECHO_N "(cached) $ECHO_C" >&6
+ else
+   if test "$cross_compiling" = yes; then
+-  ac_cv_func_malloc_0_nonnull=no
++  ac_cv_func_malloc_0_nonnull=yes
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */

Added: trunk/buildroot/package/ifplugd/ifplugd-fix-headers.patch
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd-fix-headers.patch	                        (rev 0)
+++ trunk/buildroot/package/ifplugd/ifplugd-fix-headers.patch	2008-05-31 07:28:12 UTC (rev 22139)
@@ -0,0 +1,24 @@
+---
+ src/interface.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ifplugd-0.28/src/interface.c
+===================================================================
+--- ifplugd-0.28.orig/src/interface.c
++++ ifplugd-0.28/src/interface.c
+@@ -23,7 +23,6 @@
+ #endif
+ 
+ #include <linux/sockios.h>
+-#include <linux/if_ether.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+@@ -32,6 +31,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <stdio.h>
+ #include <ctype.h>
+ #include <stdlib.h>

Added: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	                        (rev 0)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-05-31 07:28:12 UTC (rev 22139)
@@ -0,0 +1,29 @@
+#############################################################
+#
+# ifplugd
+#
+#############################################################
+IFPLUGD_VERSION = 0.28
+IFPLUGD_SOURCE = ifplugd-$(IFPLUGD_VERSION).tar.gz
+IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd/
+IFPLUGD_AUTORECONF = NO
+IFPLUGD_INSTALL_STAGING = NO
+IFPLUGD_INSTALL_TARGET = YES
+
+IFPLUGD_CONF_OPT = --disable-lynx
+
+IFPLUGD_DEPENDENCIES = uclibc libdaemon
+
+$(eval $(call AUTOTARGETS,package,ifplugd))
+
+$(IFPLUGD_HOOK_POST_INSTALL):
+	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
+	$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/
+	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.action \
+		$(TARGET_DIR)/etc/ifplugd/
+	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.init \
+		$(TARGET_DIR)/etc/init.d/S45ifplugd
+	# continue booting without waiting for fork (no -w option)
+	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf
+	# don't use bash for init script
+	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
