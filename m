From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  3 Jan 2007 05:44:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: at bash cvs distcc
	dm dmraid iproute2 li etc...
Message-ID: <20070103134402.E7C1B4863C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-03 05:44:01 -0800 (Wed, 03 Jan 2007)
New Revision: 17143

Log:
- add missing package-source targets
- add missing dependencies to build prerequisites in the config system


Modified:
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/bash/Config.in
   trunk/buildroot/package/cvs/Config.in
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/iproute2/iproute2.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/lvm2/lvm2.mk
   trunk/buildroot/package/nano/Config.in
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/procps/Config.in
   trunk/buildroot/package/psmisc/Config.in
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/sqlite/Config.in
   trunk/buildroot/package/sysvinit/Config.in
   trunk/buildroot/package/sysvinit/sysvinit.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/at/at.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -13,6 +13,8 @@
 $(DL_DIR)/$(AT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT_SITE)/$(AT_SOURCE)
 
+at-source: $(DL_DIR)/$(AT_SOURCE)
+
 $(AT_DIR)/.unpacked: $(DL_DIR)/$(AT_SOURCE)
 	$(AT_CAT) $(DL_DIR)/$(AT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(AT_DIR) package/at/ at\*.patch
@@ -58,7 +60,6 @@
 
 at-dirclean:
 	rm -rf $(AT_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/bash/Config.in
===================================================================
--- trunk/buildroot/package/bash/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/bash/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BASH
 	bool "bash"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  The standard GNU Bourne again shell.
 

Modified: trunk/buildroot/package/cvs/Config.in
===================================================================
--- trunk/buildroot/package/cvs/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/cvs/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CVS
 	bool "cvs"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  Concurrent Versions System - source code revision control tools.
 

Modified: trunk/buildroot/package/cvs/cvs.mk
===================================================================
--- trunk/buildroot/package/cvs/cvs.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/cvs/cvs.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(CVS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(CVS_SITE)/$(CVS_SOURCE)
 
+cvs-source: $(DL_DIR)/$(CVS_SOURCE)
+
 $(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE)
 	$(CVS_CAT) $(DL_DIR)/$(CVS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(CVS_DIR)/.unpacked

Modified: trunk/buildroot/package/distcc/distcc.mk
===================================================================
--- trunk/buildroot/package/distcc/distcc.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/distcc/distcc.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(DISTCC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DISTCC_SITE)/$(DISTCC_SOURCE)
 
+distcc-source: $(DL_DIR)/$(CVS_SOURCE)
+
 $(DISTCC_DIR)/.unpacked: $(DL_DIR)/$(DISTCC_SOURCE)
 	$(DISTCC_CAT) $(DL_DIR)/$(DISTCC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(DISTCC_DIR)/.unpacked

Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/dm/dm.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -40,6 +40,8 @@
 	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
 		$(WGET) -P $(DL_DIR) $(DM_SITE_OLD)/$(DM_SOURCE)
 
+dm-source: $(DL_DIR)/$(DM_SOURCE)
+
 $(DM_DIR)/.unpacked: $(DL_DIR)/$(DM_SOURCE)
 	$(DM_CAT) $(DL_DIR)/$(DM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(DM_DIR) package/dm/ \*.patch

Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -16,6 +16,8 @@
 $(DL_DIR)/$(DMRAID_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(DMRAID_SITE)/$(DMRAID_SOURCE)
 
+dmraid-source: $(DL_DIR)/$(DMRAID_SOURCE)
+
 $(DMRAID_DIR)/.unpacked: $(DL_DIR)/$(DMRAID_SOURCE)
 	$(DMRAID_CAT) $(DL_DIR)/$(DMRAID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(DMRAID_DIR) package/dmraid \*.patch

Modified: trunk/buildroot/package/iproute2/iproute2.mk
===================================================================
--- trunk/buildroot/package/iproute2/iproute2.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/iproute2/iproute2.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -15,6 +15,8 @@
 $(DL_DIR)/$(IPROUTE2_SOURCE):
 	$(WGET) -P $(DL_DIR) $(IPROUTE2_SITE)$(IPROUTE2_SOURCE)
 
+iproute2-source: $(DL_DIR)/$(IPROUTE2_SOURCE)
+
 $(IPROUTE2_DIR)/.unpacked: $(DL_DIR)/$(IPROUTE2_SOURCE)
 	$(IPROUTE2_CAT) $(DL_DIR)/$(IPROUTE2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(IPROUTE2_DIR)/.unpacked

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -20,6 +20,8 @@
 $(DL_DIR)/$(LIBUSB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBUSB_SITE)/$(LIBUSB_SOURCE)
 
+libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE)
+
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
 $(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -36,6 +36,8 @@
 $(DL_DIR)/$(LVM2_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LVM2_SITE)/$(LVM2_SOURCE)
 
+lvm2-source: $(DL_DIR)/$(LVM2_SOURCE)
+
 $(LVM2_DIR)/.unpacked: $(DL_DIR)/$(LVM2_SOURCE)
 	$(LVM2_CAT) $(DL_DIR)/$(LVM2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LVM2_DIR)/.unpacked

Modified: trunk/buildroot/package/nano/Config.in
===================================================================
--- trunk/buildroot/package/nano/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/nano/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NANO
 	bool "nano"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  A nice ncurses-based editor.  Started out as a clone of pico.  
 	  Great editor for new users.

Modified: trunk/buildroot/package/nano/nano.mk
===================================================================
--- trunk/buildroot/package/nano/nano.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/nano/nano.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(NANO_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
 
+nano-source: $(DL_DIR)/$(NANO_SOURCE)
+
 $(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
 	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(NANO_DIR)/.unpacked

Modified: trunk/buildroot/package/portmap/portmap.mk
===================================================================
--- trunk/buildroot/package/portmap/portmap.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/portmap/portmap.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(PORTMAP_SOURCE):
 	$(WGET) -P $(DL_DIR) $(PORTMAP_SITE)/$(PORTMAP_SOURCE)
 
+portmap-source: $(DL_DIR)/$(PORTMAP_SOURCE)
+
 $(PORTMAP_DIR)/.unpacked: $(DL_DIR)/$(PORTMAP_SOURCE)
 	$(PORTMAP_CAT) $(DL_DIR)/$(PORTMAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(PORTMAP_DIR) package/portmap/ portmap\*.patch

Modified: trunk/buildroot/package/procps/Config.in
===================================================================
--- trunk/buildroot/package/procps/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/procps/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROCPS
 	bool "procps"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...

Modified: trunk/buildroot/package/psmisc/Config.in
===================================================================
--- trunk/buildroot/package/psmisc/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/psmisc/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 

Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/rsync/rsync.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(RSYNC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(RSYNC_SITE)/$(RSYNC_SOURCE)
 
+rsync-source: $(DL_DIR)/$(RSYNC_SOURCE)
+
 $(RSYNC_DIR)/.unpacked: $(DL_DIR)/$(RSYNC_SOURCE)
 	$(RSYNC_CAT) $(DL_DIR)/$(RSYNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(RSYNC_DIR) package/rsync/ rsync\*.patch

Modified: trunk/buildroot/package/sqlite/Config.in
===================================================================
--- trunk/buildroot/package/sqlite/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/sqlite/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SQLITE
 	bool "sqlite"
 	default n
+	select BR2_PACKAGE_NCURSES
+	select BR2_READLINE
 	help
 	  SQLite is a small C library that implements a self-contained,
 	  embeddable, zero-configuration SQL database engine.

Modified: trunk/buildroot/package/sysvinit/Config.in
===================================================================
--- trunk/buildroot/package/sysvinit/Config.in	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/sysvinit/Config.in	2007-01-03 13:44:01 UTC (rev 17143)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  /sbin/init - parent of all processes
 

Modified: trunk/buildroot/package/sysvinit/sysvinit.mk
===================================================================
--- trunk/buildroot/package/sysvinit/sysvinit.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/sysvinit/sysvinit.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(SYSVINIT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SYSVINIT_SITE)/$(SYSVINIT_SOURCE)
 
+sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
+
 sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
 $(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
 	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -16,6 +16,8 @@
 $(DL_DIR)/$(THTTPD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(THTTPD_SITE)/$(THTTPD_SOURCE)
 
+thttpd-source: $(DL_DIR)/$(THTTPD_SOURCE)
+
 $(THTTPD_DIR)/.unpacked: $(DL_DIR)/$(THTTPD_SOURCE)
 	$(THTTPD_CAT) $(DL_DIR)/$(THTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(THTTPD_DIR)/.unpacked

Modified: trunk/buildroot/package/usbutils/usbutils.mk
===================================================================
--- trunk/buildroot/package/usbutils/usbutils.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/usbutils/usbutils.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(USBUTILS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(USBUTILS_SITE)/$(USBUTILS_SOURCE)
 
+usbutils-source: $(DL_DIR)/$(USBUTILS_SOURCE)
+
 usbutils-unpacked: $(USBUTILS_DIR)/.unpacked
 $(USBUTILS_DIR)/.unpacked: $(DL_DIR)/$(USBUTILS_SOURCE)
 	$(USBUTILS_CAT) $(DL_DIR)/$(USBUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/package/wget/wget.mk
===================================================================
--- trunk/buildroot/package/wget/wget.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/wget/wget.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(WGET_SOURCE):
 	$(WGET) -P $(DL_DIR) $(WGET_SITE)/$(WGET_SOURCE)
 
+wget-source: $(DL_DIR)/$(WGET_SOURCE)
+
 $(WGET_DIR)/.unpacked: $(DL_DIR)/$(WGET_SOURCE)
 	$(WGET_CAT) $(DL_DIR)/$(WGET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(WGET_DIR)/.unpacked

Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2007-01-03 03:15:58 UTC (rev 17142)
+++ trunk/buildroot/package/which/which.mk	2007-01-03 13:44:01 UTC (rev 17143)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(WHICH_SOURCE):
 	$(WGET) -P $(DL_DIR) $(WHICH_SITE)/$(WHICH_SOURCE)
 
+which-source: $(DL_DIR)/$(WHICH_SOURCE)
+
 $(WHICH_DIR)/.unpacked: $(DL_DIR)/$(WHICH_SOURCE)
 	$(WHICH_CAT) $(DL_DIR)/$(WHICH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(WHICH_DIR)/.unpacked
