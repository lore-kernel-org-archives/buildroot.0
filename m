From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 12:56:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ltt
Message-ID: <20090204125635.9F2417626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 12:56:35 +0000 (Wed, 04 Feb 2009)
New Revision: 25235

Log:
package/: remove obsolete ltt package

As discussed on the list.

Removed:
   trunk/buildroot/package/ltt/Config.in
   trunk/buildroot/package/ltt/S27tracer
   trunk/buildroot/package/ltt/ltt-gcc4.patch
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/ltt/ltt.patch

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/Config.in	2009-02-04 12:56:35 UTC (rev 25235)
@@ -86,7 +86,6 @@
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
-source "package/ltt/Config.in"
 source "package/memstat/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/module-init-tools/Config.in"

Deleted: trunk/buildroot/package/ltt/Config.in
===================================================================
--- trunk/buildroot/package/ltt/Config.in	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/ltt/Config.in	2009-02-04 12:56:35 UTC (rev 25235)
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_LTT
-	bool "LTT (Linux Trace Toolkit)"
-	depends on BROKEN
-	help
-	  A suite of tools designed to extract program execution
-	  details from the Linux operating system and interpret them.
-
-	  http://www.opersys.com/LTT/
-	  The package is obsolete and has been replaced by ltt-ng
-

Deleted: trunk/buildroot/package/ltt/S27tracer
===================================================================
--- trunk/buildroot/package/ltt/S27tracer	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/ltt/S27tracer	2009-02-04 12:56:35 UTC (rev 25235)
@@ -1,93 +0,0 @@
-#!/bin/sh
-#
-# Load tracer module and create tracer device node.
-#
-
-MODULE="tracer"
-MAIN_DEVICE="tracer"
-USER_DEVICE="tracerU"
-GROUP="root"
-MODE="664"
-
-start() {
-	if [ -e /dev/${MAIN_DEVICE} -o -e /dev/${USER_DEVICE} ]
-	then
-	    # tell the user about what we are doing
-	    echo "Deleting old tracer nodes: /dev/tracer and /dev/tracerU"
-
-	    # remove stale nodes
-	    rm -f /dev/${MAIN_DEVICE}
-	    rm -f /dev/${USER_DEVICE}
-	fi
-
-	# look for the major number
-	MAJOR=`/bin/grep " ${MODULE}$" /proc/devices | cut -d" " -f1`
-
-	# does the device exist?
-	if [ ${MAJOR} ]
-	then
-	    echo "Found tracer device with major number:" ${MAJOR}
-	else
- 	    echo "Loading tracer kernel module: "
-	    # invoke modprobe
-	    /sbin/modprobe ${MODULE}
-	    MAJOR=`/bin/grep " ${MODULE}$" /proc/devices | cut -d" " -f1`
-	    if [ ${MAJOR} ]
-	    then
-		echo "Found tracer device with major number:" ${MAJOR}
-	    else
-		echo "Did not find tracer device ... /dev entries not created ..."
-		exit 1
-	    fi
-	fi
-
-	# tell the user about what we are doing
-	echo "Creating new tracer nodes: /dev/tracer and /dev/tracerU"
-
-	# create the character special file
-	/bin/mknod /dev/${MAIN_DEVICE} c ${MAJOR} 0
-	/bin/mknod /dev/${USER_DEVICE} c ${MAJOR} 1
-
-	# set permissions and ownership
-	/bin/chgrp ${GROUP} /dev/${MAIN_DEVICE}
-	/bin/chmod ${MODE}  /dev/${MAIN_DEVICE}
-	/bin/chgrp ${GROUP} /dev/${USER_DEVICE}
-	/bin/chmod ${MODE}  /dev/${USER_DEVICE}
-}
-stop() {
-	# tell the user about what we are doing
-	echo "Deleting tracer nodes: /dev/tracer and /dev/tracerU"
-
-	# remove nodes
-	rm -f /dev/${MAIN_DEVICE}
-	rm -f /dev/${USER_DEVICE}
-
-	if lsmod | /bin/grep "^${MODULE} "
-	then
-	    echo -n "Removing tracer kernel module: "
-	    # invoke modprobe -r
-	    /sbin/modprobe -r ${MODULE}
-	    echo "OK"
-	fi
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo $"Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?

Deleted: trunk/buildroot/package/ltt/ltt-gcc4.patch
===================================================================
--- trunk/buildroot/package/ltt/ltt-gcc4.patch	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/ltt/ltt-gcc4.patch	2009-02-04 12:56:35 UTC (rev 25235)
@@ -1,23 +0,0 @@
---- orig/TraceToolkit-0.9.5/Visualizer/MainWindow.c	2002-04-15 19:23:49.000000000 -0700
-+++ TraceToolkit-0.9.5/Visualizer/MainWindow.c	2006-04-05 16:04:47.000000000 -0700
-@@ -28,6 +28,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <stdlib.h>
- #include <sys/stat.h>
- #include <gdk/gdkkeysyms.h>
- 
-@@ -3146,8 +3147,10 @@
- 
-   /* FORCEFULLY disconnect event handlers from the notebook widget */
-   /*  I didn't find any cleaner way to do this. K.Y. 9/5/2000 */
--  GTK_SIGNAL_FUNC(GTK_WIDGET_CLASS(GTK_OBJECT(pmSysView->Window->MNotebook)->klass)->key_press_event) = NULL,
--  GTK_SIGNAL_FUNC(GTK_WIDGET_CLASS(GTK_OBJECT(pmSysView->Window->MNotebook)->klass)->focus_in_event) = NULL,
-+  gtk_type_free(GTK_TYPE_SIGNAL, 
-+		GTK_SIGNAL_FUNC(GTK_WIDGET_CLASS(GTK_OBJECT(pmSysView->Window->MNotebook)->klass)->key_press_event));
-+  gtk_type_free(GTK_TYPE_SIGNAL,
-+		GTK_SIGNAL_FUNC(GTK_WIDGET_CLASS(GTK_OBJECT(pmSysView->Window->MNotebook)->klass)->focus_in_event));
- 
-   /* Connect the key press event */
-   gtk_signal_connect(GTK_OBJECT(pmSysView->Window->MWindow),

Deleted: trunk/buildroot/package/ltt/ltt.mk
===================================================================
--- trunk/buildroot/package/ltt/ltt.mk	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/ltt/ltt.mk	2009-02-04 12:56:35 UTC (rev 25235)
@@ -1,121 +0,0 @@
-#############################################################
-#
-# ltt
-#
-#############################################################
-LTT_VERSION:=0.9.5a
-LTT_SOURCE:=TraceToolkit-$(LTT_VERSION).tgz
-LTT_SITE:=http://www.opersys.com/ftp/pub/LTT
-LTT_CAT:=$(ZCAT)
-LTT_DIR1:=$(TOOL_BUILD_DIR)/TraceToolkit-$(LTT_VERSION:a=)
-LTT_DIR2:=$(BUILD_DIR)/TraceToolkit-$(LTT_VERSION:a=)
-LTT_BINARY:=Visualizer/tracevisualizer
-LTT_TARGET_BINARY:=Daemon/tracedaemon
-
-$(DL_DIR)/$(LTT_SOURCE):
-	 $(call DOWNLOAD,$(LTT_SITE),$(LTT_SOURCE))
-
-ltt-source: $(DL_DIR)/$(LTT_SOURCE)
-
-
-#############################################################
-#
-# build tracevisualizer for use on the host system
-#
-#############################################################
-$(LTT_DIR1)/.unpacked: $(DL_DIR)/$(LTT_SOURCE)
-	$(LTT_CAT) $(DL_DIR)/$(LTT_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LTT_DIR1) package/ltt ltt\*.patch
-	touch $(LTT_DIR1)/.unpacked
-
-# Build without GTK if not available
-LTT_WITHOUT_GTK:=$(shell which gtk-config > /dev/null 2>&1 || echo "--without-gtk")
-
-$(LTT_DIR1)/.configured: $(LTT_DIR1)/.unpacked
-	(cd $(LTT_DIR1); rm -rf config.cache; \
-		./configure \
-		--prefix=$(TOOL_BUILD_DIR) \
-		$(LTT_WITHOUT_GTK) \
-	)
-	touch $(LTT_DIR1)/.configured
-
-$(LTT_DIR1)/$(LTT_BINARY): $(LTT_DIR1)/.configured
-	$(MAKE) -C $(LTT_DIR1)/LibLTT
-	$(MAKE) -C $(LTT_DIR1)/Visualizer
-
-$(TOOL_BUILD_DIR)/bin/tracevisualizer: $(LTT_DIR1)/$(LTT_BINARY)
-	$(MAKE) -C $(LTT_DIR1)/LibLTT install
-	$(MAKE) -C $(LTT_DIR1)/Visualizer install
-
-host-ltt-tracevisualizer: $(TOOL_BUILD_DIR)/bin/tracevisualizer
-
-host-ltt-clean:
-	-$(MAKE) -C $(LTT_DIR1) clean
-
-host-ltt-dirclean:
-	rm -rf $(LTT_DIR1)
-
-
-#############################################################
-#
-# build tracedaemon for use on the target system
-#
-#############################################################
-$(LTT_DIR2)/.unpacked: $(DL_DIR)/$(LTT_SOURCE)
-	$(LTT_CAT) $(DL_DIR)/$(LTT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LTT_DIR2) package/ltt ltt\*.patch
-	touch $(LTT_DIR2)/.unpacked
-
-$(LTT_DIR2)/.configured: $(LTT_DIR2)/.unpacked
-	(cd $(LTT_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $(LTT_DIR2)/.configured
-
-$(LTT_DIR2)/$(LTT_TARGET_BINARY): $(LTT_DIR2)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LTT_DIR2)/LibUserTrace
-	$(MAKE) CC=$(TARGET_CC) -C $(LTT_DIR2)/Daemon
-
-$(TARGET_DIR)/usr/bin/tracedaemon: $(LTT_DIR2)/$(LTT_TARGET_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
-		-C $(LTT_DIR2)/LibUserTrace install
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
-		-C $(LTT_DIR2)/Daemon install
-	$(STRIPCMD) $(TARGET_DIR)/usr/bin/tracedaemon > /dev/null 2>&1
-	$(INSTALL) -D -m 0755 package/ltt/S27tracer $(TARGET_DIR)/etc/init.d
-
-ltt-tracedaemon: uclibc $(TARGET_DIR)/usr/bin/tracedaemon
-
-ltt-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LTT_DIR2) uninstall
-	-$(MAKE) -C $(LTT_DIR2) clean
-
-ltt-dirclean:
-	rm -rf $(LTT_DIR2)
-
-
-ltt: host-ltt-tracevisualizer ltt-tracedaemon
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LTT),y)
-TARGETS+=ltt
-endif

Deleted: trunk/buildroot/package/ltt/ltt.patch
===================================================================
--- trunk/buildroot/package/ltt/ltt.patch	2009-02-04 12:47:13 UTC (rev 25234)
+++ trunk/buildroot/package/ltt/ltt.patch	2009-02-04 12:56:35 UTC (rev 25235)
@@ -1,42 +0,0 @@
-diff -urN TraceToolkit-0.9.5.orig/LibLTT/EventDB.c TraceToolkit-0.9.5/LibLTT/EventDB.c
---- TraceToolkit-0.9.5.orig/LibLTT/EventDB.c	2002-04-15 09:10:13.000000000 -0700
-+++ TraceToolkit-0.9.5/LibLTT/EventDB.c	2005-09-29 15:09:11.000000000 -0700
-@@ -2757,7 +2757,7 @@
- 
- 	/* Increment number of custom events */
- 	pmTraceDB->NbCustom++;
--	goto NoControlEvent;
-+	continue;
- 	break;
- 
-       /* A custom event has occured */
-@@ -2800,8 +2800,6 @@
-       lLastCtrlEvent     = lEvent;
-       lLastCtrlEventTime = lEventTime;
-       }
--
--NoControlEvent:
-     } while(DBEventNext(pmTraceDB, &lEvent) == TRUE);
- 
-   /* Remember the last event and its time */
-diff -urN TraceToolkit-0.9.5.orig/LibLTT/RTAIDB.c TraceToolkit-0.9.5/LibLTT/RTAIDB.c
---- TraceToolkit-0.9.5.orig/LibLTT/RTAIDB.c	2002-04-15 20:00:05.000000000 -0700
-+++ TraceToolkit-0.9.5/LibLTT/RTAIDB.c	2005-09-29 15:09:17.000000000 -0700
-@@ -2621,7 +2621,7 @@
- 
- 	/* Increment number of custom events */
- 	pmTraceDB->NbCustom++;
--	goto NoControlEvent;
-+	continue;
- 	break;
- 
-       /* A custom event has occured */
-@@ -2936,8 +2936,6 @@
-       lLastCtrlEvent     = lEvent;
-       lLastCtrlEventTime = lEventTime;
-       }
--
--NoControlEvent:
-     } while(DBEventNext(pmTraceDB, &lEvent) == TRUE);
- 
-   /* Remember the last event and it's time */
