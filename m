From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 15 Dec 2006 12:42:49 +0100
Subject: [Buildroot] [Package] bsdiff
Message-ID: <20061215114249.GA9712@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Very simple but probably nice to have.


Thomas.
-------------- next part --------------
Index: package/Config.in
===================================================================
--- package/Config.in	(revision 16938)
+++ package/Config.in	(working copy)
@@ -35,6 +35,7 @@
 source "package/bison/Config.in"
 source "package/boa/Config.in"
 source "package/bridge/Config.in"
+source "package/bsdiff/Config.in"
 source "package/customize/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
Index: package/bsdiff/bsdiff.mk
===================================================================
--- package/bsdiff/bsdiff.mk	(revision 0)
+++ package/bsdiff/bsdiff.mk	(revision 0)
@@ -0,0 +1,52 @@
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
+		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 $(TARGET_CFLAGS) bsdiff.c -o bsdiff)
+	(cd $(BSDIFF_DIR) ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 $(TARGET_CFLAGS) bspatch.c -o bspatch)
+
+$(TARGET_DIR)/$(BSDIFF_TARGET_BINARY): $(BSDIFF_DIR)/$(BSDIFF_BINARY)
+	# Copying is the trick here.
+	cp -a $(BSDIFF_DIR)/bsdiff $(TARGET_DIR)/usr/bin/.
+	cp -a $(BSDIFF_DIR)/bspatch $(TARGET_DIR)/usr/bin/.
+
+bsdiff: uclibc bzip2 $(TARGET_DIR)/$(BSDIFF_TARGET_BINARY)
+
+bsdiff-source: $(DL_DIR)/$(BSDIFF_SOURCE)
+
+bsdiff-clean:
+	-rm $(TARGET_DIR)/usr/bin/bsdiff
+	-rm $(TARGET_DIR)/usr/bin/bspatch
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
Index: package/bsdiff/Config.in
===================================================================
--- package/bsdiff/Config.in	(revision 0)
+++ package/bsdiff/Config.in	(revision 0)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BSDIFF
+	bool "bsdiff"
+	default n
+	select BR2_PACKAGE_BZIP2
+	help
+	  Binary patch/diff. Selects bzip2
+
+	  http://www.daemonology.net/bsdiff/
