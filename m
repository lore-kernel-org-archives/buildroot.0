From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 27 Dec 2015 10:06:17 +0200
Subject: [Buildroot] [PATCH 1/1] ypbind-mt: new package
Message-ID: <1451203577-17775-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Build tested with i586 glibc toolchain
Build and runtime tested on arm (i.MX6) glibc toolchain

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in                                  |    1 +
 .../ypbind-mt/0001-Remove_man_dir_from_build.patch |   16 ++++
 package/ypbind-mt/Config.in                        |   20 ++++
 package/ypbind-mt/S70ypbind                        |   99 ++++++++++++++++++++
 package/ypbind-mt/ypbind-mt.mk                     |   21 +++++
 5 files changed, 157 insertions(+)
 create mode 100644 package/ypbind-mt/0001-Remove_man_dir_from_build.patch
 create mode 100644 package/ypbind-mt/Config.in
 create mode 100755 package/ypbind-mt/S70ypbind
 create mode 100644 package/ypbind-mt/ypbind-mt.mk

diff --git a/package/Config.in b/package/Config.in
index dd44743..953c412 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1465,6 +1465,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/ypbind-mt/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/ypbind-mt/0001-Remove_man_dir_from_build.patch b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
new file mode 100644
index 0000000..10ebed7
--- /dev/null
+++ b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
@@ -0,0 +1,16 @@
+Remove the man directory from the build in order to avoid trying to build the
+commented targets ypbind.8 and ypconf.5
+
+Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
+
+--- a/Makefile.am	2014-12-04 16:27:18.000000000 +0200
++++ b/Makefile.am	2015-12-16 15:00:21.950050679 +0200
+@@ -5,7 +5,7 @@
+ #
+ AUTOMAKE_OPTIONS = 1.6 gnits dist-bzip2
+ #
+-SUBDIRS = lib src man po
++SUBDIRS = lib src po
+ 
+ CLEANFILES = *~
+ 
diff --git a/package/ypbind-mt/Config.in b/package/ypbind-mt/Config.in
new file mode 100644
index 0000000..241d3e5
--- /dev/null
+++ b/package/ypbind-mt/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_YPBIND_MT
+	bool "ypbind-mt"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_YP_TOOLS
+	select BR2_PACKAGE_RPCBIND # runtime
+	help
+	  The ypbind-mt package contains a multithreaded ypbind daemon
+	  for Linux. It uses threads for better response and supports
+	  the ypbind protocols version 1, 2 and 3.
+
+	  For NIS authentication you also need to select the "linux-pam"
+	  package.
+
+	  https://github.com/thkukuk/ypbind-mt
+
+comment "ypbind-mt needs a toolchain w/ threads, RPC"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/ypbind-mt/S70ypbind b/package/ypbind-mt/S70ypbind
new file mode 100755
index 0000000..08df322
--- /dev/null
+++ b/package/ypbind-mt/S70ypbind
@@ -0,0 +1,99 @@
+#! /bin/sh
+# Copyright (c) 2004 Author: Thorsten Kukuk <kukuk@suse.de>
+#
+# /etc/init.d/ypbind
+#
+#   and symbolic its link
+#
+# /usr/sbin/rcypbind
+#
+# System startup script for the ypbind daemon
+#
+### BEGIN INIT INFO
+# Provides: ypbind
+# Required-Start: $remote_fs $portmap
+# Should-Start: ypserv slpd
+# Required-Stop: portmap
+# Default-Start: 3 5
+# Default-Stop: 0 1 2 6
+# Short-Description: Start ypbind (necessary for a NIS client)
+# Description: ypbind finds the server for NIS domains and maintains
+#	the NIS binding information.
+### END INIT INFO
+
+YPBIND_BIN=/usr/sbin/ypbind
+pidfile=/var/run/ypbind.pid
+
+[ -f /etc/default/ypbind ] && . /etc/default/ypbind
+
+case "$1" in
+    start)
+	echo -n "Starting ypbind"
+	## If the domainname is not set, skip starting of ypbind
+	## and return with "program not configured"
+        /usr/bin/ypdomainname &> /dev/null
+        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           if [ -f /etc/defaultdomain ]; then
+             XDOMAINNAME=`cat /etc/defaultdomain`
+             /usr/bin/ypdomainname "$XDOMAINNAME"
+	   fi
+           /usr/bin/ypdomainname &> /dev/null
+           if [ $? -ne 0 -o -z "`/usr/bin/ypdomainname 2>/dev/null`" ]; then
+	     # Tell the user this has skipped
+	     echo -n " . . . . . . . . . . No domainname set"
+             # service is not configured
+	     exit 1
+           fi
+        fi
+
+	## If we don't have a /etc/yp.conf file, skip starting of
+        ## ypbind and return with "program not configured"
+        ## if you add the -broadcast Option later, comment this out.
+	if [ ! -f /etc/yp.conf -a "$YPBIND_BROADCAST" != "yes" ] ; then
+	  # Tell the user this has skipped
+	  echo -n " . . . . . . . . . . ${attn}/etc/yp.conf not found${norm}"
+          # service is not configured
+	  exit 1
+        fi
+
+	# evaluate the OPTIONS for ypbind-mt
+	OPTIONS=""
+	test "$YPBIND_LOCAL_ONLY" = "yes" && OPTIONS="-local-only $OPTIONS"
+	test "$YPBIND_BROADCAST" = "yes" && OPTIONS="-broadcast $OPTIONS"
+	test "$YPBIND_BROKEN_SERVER" = "yes" && OPTIONS="-broken-server $OPTIONS"
+
+	start-stop-daemon --start --quiet --pidfile $pidfile --exec $YPBIND_BIN -- $YPBIND_OPTIONS $OPTIONS
+        if [ $? -eq 0 ]; then
+            notfound=1
+            for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
+                ypwhich &>/dev/null && { notfound=0 ; break; };
+                echo -n " ."
+                sleep 1;
+            done
+            if [ $notfound -eq 1 ]; then
+                echo -n " ${warn}No NIS server found${norm}";
+	    fi
+        else
+            exit 1
+        fi
+	;;
+    stop)
+	echo -n "Shutting down ypbind"
+	start-stop-daemon --stop --quiet --pidfile $pidfile
+	# Remove static data, else glibc will continue to use NIS
+        rm -f /var/yp/binding/* /var/run/ypbind.pid
+	;;
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+    reload | force-reload)
+	echo -n "Reload service ypbind"
+	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
+	;;
+    *)
+	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
+	exit 1
+	;;
+esac
diff --git a/package/ypbind-mt/ypbind-mt.mk b/package/ypbind-mt/ypbind-mt.mk
new file mode 100644
index 0000000..cfdf9c7
--- /dev/null
+++ b/package/ypbind-mt/ypbind-mt.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ypbind-mt
+#
+################################################################################
+
+YPBIND_MT_VERSION = ypbind-mt-2_2
+YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))
+YPBIND_MT_LICENSE = GPLv2+
+YPBIND_MT_LICENSE_FILES = COPYING
+YPBIND_MT_AUTORECONF = YES
+YPBIND_MT_DEPENDENCIES = host-pkgconf
+YPBIND_MT_CONF_ENV = \
+	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
+	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"
+
+define YPBIND_MT_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 755 package/ypbind-mt/S70ypbind $(TARGET_DIR)/etc/init.d/S70ypbind
+endef
+
+$(eval $(autotools-package))
-- 
1.7.9.5
