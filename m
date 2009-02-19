From: hamish at uclibc.org <hamish@uclibc.org>
Date: Thu, 19 Feb 2009 05:31:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20090219053107.C0182764B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2009-02-19 05:31:05 +0000 (Thu, 19 Feb 2009)
New Revision: 25378

Log:
Enable multilink PPP (no reason to disable it)
Add configuration item to enable filtering (requires libpcap)


Modified:
   trunk/buildroot/package/pppd/Config.in
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Modified: trunk/buildroot/package/pppd/Config.in
===================================================================
--- trunk/buildroot/package/pppd/Config.in	2009-02-19 01:25:42 UTC (rev 25377)
+++ trunk/buildroot/package/pppd/Config.in	2009-02-19 05:31:05 UTC (rev 25378)
@@ -4,3 +4,13 @@
 	  An implementation of the Point-to-point protocol.
 
 	  http://www.samba.org/ppp/
+
+config BR2_PACKAGE_PPPD_FILTER
+	depends on BR2_PACKAGE_PPPD
+	select BR2_PACKAGE_LIBPCAP
+	bool "filtering"
+	help
+	  Packet filtering abilities for pppd. If enabled,
+	  the pppd active-filter and pass-filter options
+	  are available.
+

Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2009-02-19 01:25:42 UTC (rev 25377)
+++ trunk/buildroot/package/pppd/pppd.mk	2009-02-19 05:31:05 UTC (rev 25378)
@@ -17,15 +17,17 @@
 
 pppd-source: $(DL_DIR)/$(PPPD_SOURCE)
 
+PPPD_OPTIONS_$(BR2_PACKAGE_PPPD_FILTER) += FILTER=y
+
 $(PPPD_DIR)/.unpacked: $(DL_DIR)/$(PPPD_SOURCE)
 	$(PPPD_CAT) $(DL_DIR)/$(PPPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(SED) 's/ -DIPX_CHANGE -DHAVE_MMAP//' $(PPPD_DIR)/pppd/Makefile.linux
-	$(SED) 's/HAVE_MULTILINK=y/#HAVE_MULTILINK=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/*/Makefile.linux
 	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/pppd/plugins/*/Makefile.linux
 	$(SED) 's/ -o root//' $(PPPD_DIR)/*/Makefile.linux
 	$(SED) 's/ -g daemon//' $(PPPD_DIR)/*/Makefile.linux
+	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
 	touch $@
 
 $(PPPD_DIR)/.configured: $(PPPD_DIR)/.unpacked
@@ -52,10 +54,10 @@
 	touch $@
 
 $(PPPD_DIR)/$(PPPD_BINARY): $(PPPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR)
+	$(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_OPTIONS_y)
 
 $(TARGET_DIR)/$(PPPD_TARGET_BINARY): $(PPPD_DIR)/$(PPPD_BINARY)
-	$(MAKE1) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) install
+	$(MAKE1) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) install $(PPPD_OPTIONS_y)
 ifneq ($(BR2_ENABLE_LOCALE),y)
 	rm -rf $(TARGET_DIR)/usr/share/locale
 endif
