From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 11:37:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/modutils
Message-ID: <20070731183753.818D8A6041@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 11:37:52 -0700 (Tue, 31 Jul 2007)
New Revision: 19366

Log:
Install modutils first to STAGING_DIR, then copy to TARGET_DIR

Modified:
   trunk/buildroot/package/modutils/modutils.mk


Changeset:
Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2007-07-31 18:33:19 UTC (rev 19365)
+++ trunk/buildroot/package/modutils/modutils.mk	2007-07-31 18:37:52 UTC (rev 19366)
@@ -9,8 +9,8 @@
 MODUTILS_SITE=http://ftp.kernel.org/pub/linux/utils/kernel/modutils/v2.4/
 MODUTILS_DIR1=$(BUILD_DIR)/modutils-$(MODUTILS_VERSION)
 MODUTILS_DIR2=$(TOOL_BUILD_DIR)/modutils-$(MODUTILS_VERSION)
-MODUTILS_BINARY=depmod/depmod
-MODUTILS_TARGET_BINARY=$(TARGET_DIR)/sbin/$(MODUTILS_BINARY)
+MODUTILS_BINARY=depmod
+MODUTILS_TARGET_BINARY=sbin/$(MODUTILS_BINARY)
 
 STRIPPROG=$(STRIP)
 
@@ -40,20 +40,31 @@
 		--prefix=/ \
 		--sysconfdir=/etc \
 	);
-	touch $(MODUTILS_DIR1)/.configured;
+	touch $(MODUTILS_DIR1)/.configured
 
-$(MODUTILS_DIR1)/$(MODUTILS_BINARY): $(MODUTILS_DIR1)/.configured
+$(MODUTILS_DIR1)/.build: $(MODUTILS_DIR1)/.configured
 	$(MAKE1) CC=$(TARGET_CC) -C $(MODUTILS_DIR1)
-	touch -c $(MODUTILS_DIR1)/$(MODUTILS_BINARY)
+	touch $@
 
-$(TARGET_DIR)/$(MODUTILS_TARGET_BINARY): $(MODUTILS_DIR1)/$(MODUTILS_BINARY)
+$(STAGING_DIR)/$(MODUTILS_TARGET_BINARY): $(MODUTILS_DIR1)/.build
 	STRIPPROG='$(STRIPPROG)' \
-	$(MAKE) prefix=$(TARGET_DIR) -C $(MODUTILS_DIR1) install-bin
-	rm -Rf $(TARGET_DIR)/usr/man
-	touch -c $(TARGET_DIR)/$(MODUTILS_TARGET_BINARY)
+	$(MAKE) prefix=$(STAGING_DIR) -C $(MODUTILS_DIR1) install-bin
+	touch -c $@
 
-modutils: uclibc $(TARGET_DIR)/$(MODUTILS_TARGET_BINARY)
+$(TARGET_DIR)/sbin/rmmod:	$(STAGING_DIR)/$(MODUTILS_TARGET_BINARY)
+	cp -dpf $(STAGING_DIR)/sbin/depmod	$(TARGET_DIR)/sbin/depmod
+	cp -dpf $(STAGING_DIR)/sbin/insmod	$(TARGET_DIR)/sbin/insmod
+	cp -dpf $(STAGING_DIR)/sbin/modinfo	$(TARGET_DIR)/sbin/modinfo
+	ln -s	insmod $(TARGET_DIR)/sbin/kallsyms
+	ln -s	insmod $(TARGET_DIR)/sbin/ksyms
+	ln -s	insmod $(TARGET_DIR)/sbin/lsmod
+	ln -s	insmod $(TARGET_DIR)/sbin/modprobe
+	ln -s	insmod $(TARGET_DIR)/sbin/rmmod
 
+
+
+modutils: uclibc $(TARGET_DIR)/sbin/rmmod
+
 modutils-source: $(DL_DIR)/$(MODUTILS_SOURCE)
 
 modutils-clean:
@@ -63,6 +74,15 @@
 modutils-dirclean:
 	rm -rf $(MODUTILS_DIR1)
 
+modutils-target-clean:
+	rm -f $(TARGET_DIR)/sbin/depmod
+	rm -f $(TARGET_DIR)/sbin/insmod
+	rm -f $(TARGET_DIR)/sbin/modinfo
+	rm -f $(TARGET_DIR)/sbin/kallsyms
+	rm -f $(TARGET_DIR)/sbin/ksyms
+	rm -f $(TARGET_DIR)/sbin/lsmod
+	rm -f $(TARGET_DIR)/sbin/modprobe
+	rm -f $(TARGET_DIR)/sbin/rmmod
 
 #############################################################
 #
