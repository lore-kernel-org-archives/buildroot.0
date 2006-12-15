From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 05:57:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  bsdiff
Message-ID: <20061215135708.03BD64858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 05:57:07 -0800 (Fri, 15 Dec 2006)
New Revision: 16942

Log:
- Thomas Lundquist added bsdiff


Added:
   trunk/buildroot/package/bsdiff/
   trunk/buildroot/package/bsdiff/Config.in
   trunk/buildroot/package/bsdiff/bsdiff.mk


Changeset:
Added: trunk/buildroot/package/bsdiff/Config.in
===================================================================
--- trunk/buildroot/package/bsdiff/Config.in	2006-12-15 13:39:26 UTC (rev 16941)
+++ trunk/buildroot/package/bsdiff/Config.in	2006-12-15 13:57:07 UTC (rev 16942)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_BSDIFF
+	bool "bsdiff"
+	default n
+	select BR2_PACKAGE_BZIP2
+	help
+	  Binary patch/diff like xdelta but creates smaller diffs.
+	  Needs bzip2 support.
+
+	  http://www.daemonology.net/bsdiff/

Added: trunk/buildroot/package/bsdiff/bsdiff.mk
===================================================================
--- trunk/buildroot/package/bsdiff/bsdiff.mk	2006-12-15 13:39:26 UTC (rev 16941)
+++ trunk/buildroot/package/bsdiff/bsdiff.mk	2006-12-15 13:57:07 UTC (rev 16942)
@@ -0,0 +1,53 @@
+#############################################################
+#
+# bsdiff
+#
+#############################################################
+BSDIFF_VERSION:=4.3
+BSDIFF_SOURCE:=bsdiff-$(BSDIFF_VERSION).tar.gz
+BSDIFF_SITE:=http://www.daemonology.net/bsdiff
+BSDIFF_DIR:=$(BUILD_DIR)/bsdiff-$(BSDIFF_VERSION)
+BSDIFF_BINARY:=bsdiff
+BSDIFF_TARGET_BINARY:=usr/bin/bsdiff
+BSDIFF_ZCAT=$(ZCAT)
+
+$(DL_DIR)/$(BSDIFF_SOURCE):
+	$(WGET) -P $(DL_DIR) $(BSDIFF_SITE)/$(BSDIFF_SOURCE)
+
+$(BSDIFF_DIR)/.source: $(DL_DIR)/$(BSDIFF_SOURCE)
+	$(BSDIFF_ZCAT) $(DL_DIR)/$(BSDIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(BSDIFF_DIR)/.source
+
+$(BSDIFF_DIR)/$(BSDIFF_BINARY): $(BSDIFF_DIR)/.source
+	(cd $(BSDIFF_DIR) ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
+			$(TARGET_CFLAGS) bsdiff.c -o bsdiff ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
+			$(TARGET_CFLAGS) bspatch.c -o bspatch ; \
+	)
+
+$(TARGET_DIR)/$(BSDIFF_TARGET_BINARY): $(BSDIFF_DIR)/$(BSDIFF_BINARY)
+	cp -dpf $(BSDIFF_DIR)/bsdiff $(TARGET_DIR)/usr/bin/.
+	cp -dpf $(BSDIFF_DIR)/bspatch $(TARGET_DIR)/usr/bin/.
+
+bsdiff: uclibc bzip2 $(TARGET_DIR)/$(BSDIFF_TARGET_BINARY)
+
+bsdiff-source: $(DL_DIR)/$(BSDIFF_SOURCE)
+
+bsdiff-clean:
+	-rm $(TARGET_DIR)/usr/bin/{bsdiff,bspatch}
+	-rm $(BSDIFF_DIR)/{bsdiff,bspatch}
+
+bsdiff-dirclean:
+	rm -rf $(BSDIFF_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_BSDIFF)),y)
+TARGETS+=bsdiff
+endif
