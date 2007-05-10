From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 May 2007 02:20:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  madplay
Message-ID: <20070510092021.3B33448011@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-10 02:20:20 -0700 (Thu, 10 May 2007)
New Revision: 18604

Log:
madplay package

Added:
   trunk/buildroot/package/madplay/
   trunk/buildroot/package/madplay/Config.in
   trunk/buildroot/package/madplay/madplay.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-05-10 09:18:35 UTC (rev 18603)
+++ trunk/buildroot/package/Config.in	2007-05-10 09:20:20 UTC (rev 18604)
@@ -242,6 +242,7 @@
 source "package/libid3tag/Config.in"
 source "package/libmad/Config.in"
 source "package/libsndfile/Config.in"
+source "package/madplay/Config.in"
 source "package/mpg123/Config.in"
 endif
 

Added: trunk/buildroot/package/madplay/Config.in
===================================================================
--- trunk/buildroot/package/madplay/Config.in	                        (rev 0)
+++ trunk/buildroot/package/madplay/Config.in	2007-05-10 09:20:20 UTC (rev 18604)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MADPLAY
+	bool "madplay"
+	default n
+	select BR2_PACKAGE_LIBMAD
+	select BR2_PACKAGE_LIBID3TAG
+	help
+	  MAD is a high-quality fixed-point MPEG audio decoder with
+	  24-bit output. The implementation is entirely new, based on
+	  the ISO/IEC standards, and performs especially well on systems
+	  without native floating-point support.
+
+	  http://www.underbit.com/products/mad/

Added: trunk/buildroot/package/madplay/madplay.mk
===================================================================
--- trunk/buildroot/package/madplay/madplay.mk	                        (rev 0)
+++ trunk/buildroot/package/madplay/madplay.mk	2007-05-10 09:20:20 UTC (rev 18604)
@@ -0,0 +1,60 @@
+#############################################################
+#
+# madplay
+#
+#############################################################
+
+MADPLAY_VERSION=0.15.2b
+MADPLAY_SOURCE=madplay-$(MADPLAY_VERSION).tar.gz
+MADPLAY_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
+MADPLAY_DIR=$(BUILD_DIR)/madplay-$(MADPLAY_VERSION)
+MADPLAY_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(MADPLAY_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MADPLAY_SITE)/$(MADPLAY_SOURCE)
+
+$(MADPLAY_DIR)/.unpacked: $(DL_DIR)/$(MADPLAY_SOURCE)
+	$(MADPLAY_CAT) $(DL_DIR)/$(MADPLAY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(MADPLAY_DIR)/.unpacked
+
+$(MADPLAY_DIR)/.configured: $(MADPLAY_DIR)/.unpacked
+	(cd $(MADPLAY_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		$(DISABLE_NLS) \
+	);
+	touch $(MADPLAY_DIR)/.configured
+
+$(MADPLAY_DIR)/src/madplay: $(MADPLAY_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(MADPLAY_DIR)
+
+$(MADPLAY_DIR)/.installed: $(MADPLAY_DIR)/src/madplay
+	$(MAKE) -C $(MADPLAY_DIR) DESTDIR=$(TARGET_DIR) install
+	touch $(MADPLAY_DIR)/.installed
+
+madplay: uclibc libmad $(MADPLAY_DIR)/.installed
+
+madplay-source: $(DL_DIR)/$(MADPLAY_SOURCE)
+
+madplay-clean:
+	@if [ -d $(MADPLAY_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(MADPLAY_DIR) clean ; \
+	fi;
+
+madplay-dirclean:
+	rm -rf $(MADPLAY_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MADPLAY)),y)
+TARGETS+=madplay
+endif
