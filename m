From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 12:08:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20090219120816.58CC9766F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-19 12:08:11 +0000 (Thu, 19 Feb 2009)
New Revision: 25386

Log:
pppd: fix build without UCLIBC_HAS_BSD_ERR

Replace the BSD specific warn() with a call to syslog.
Patch by Gustavo Zacarias, closes #109.

Added:
   trunk/buildroot/package/pppd/pppd-2.4.4-nobsd.patch

Modified:
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Added: trunk/buildroot/package/pppd/pppd-2.4.4-nobsd.patch
===================================================================
--- trunk/buildroot/package/pppd/pppd-2.4.4-nobsd.patch	                        (rev 0)
+++ trunk/buildroot/package/pppd/pppd-2.4.4-nobsd.patch	2009-02-19 12:08:11 UTC (rev 25386)
@@ -0,0 +1,21 @@
+diff -Nura ppp-2.4.4/pppd/plugins/rp-pppoe/discovery.c ppp-2.4.4-nobsd/pppd/plugins/rp-pppoe/discovery.c
+--- ppp-2.4.4/pppd/plugins/rp-pppoe/discovery.c	2005-03-22 07:22:32.000000000 -0300
++++ ppp-2.4.4-nobsd/pppd/plugins/rp-pppoe/discovery.c	2009-02-17 09:01:27.000000000 -0200
+@@ -598,7 +598,7 @@
+     do {
+ 	padiAttempts++;
+ 	if (padiAttempts > MAX_PADI_ATTEMPTS) {
+-	    warn("Timeout waiting for PADO packets");
++	    syslog(LOG_WARNING, "Timeout waiting for PADO packets");
+ 	    close(conn->discoverySocket);
+ 	    conn->discoverySocket = -1;
+ 	    return;
+@@ -627,7 +627,7 @@
+     do {
+ 	padrAttempts++;
+ 	if (padrAttempts > MAX_PADI_ATTEMPTS) {
+-	    warn("Timeout waiting for PADS packets");
++	    syslog(LOG_WARNING, "Timeout waiting for PADS packets");
+ 	    close(conn->discoverySocket);
+ 	    conn->discoverySocket = -1;
+ 	    return;

Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2009-02-19 10:28:36 UTC (rev 25385)
+++ trunk/buildroot/package/pppd/pppd.mk	2009-02-19 12:08:11 UTC (rev 25386)
@@ -21,6 +21,7 @@
 
 $(PPPD_DIR)/.unpacked: $(DL_DIR)/$(PPPD_SOURCE)
 	$(PPPD_CAT) $(DL_DIR)/$(PPPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PPPD_DIR) package/pppd/ pppd\*.patch
 	$(SED) 's/ -DIPX_CHANGE -DHAVE_MMAP//' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/*/Makefile.linux
