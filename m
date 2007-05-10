From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 May 2007 01:10:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20070510081023.F013748011@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-10 01:10:21 -0700 (Thu, 10 May 2007)
New Revision: 18602

Log:
Cleanup. Moved header file install to LIBMAD_PACKAGE_HEADERS target like zlib

Modified:
   trunk/buildroot/package/libmad/Config.in
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/Config.in
===================================================================
--- trunk/buildroot/package/libmad/Config.in	2007-05-10 02:37:44 UTC (rev 18601)
+++ trunk/buildroot/package/libmad/Config.in	2007-05-10 08:10:21 UTC (rev 18602)
@@ -2,8 +2,15 @@
 	bool "libmad"
 	default n
 	help
-	  High-quality MPEG audio decoder.  All computations are performed 
-	  with fixed-point integer arithmetic, making it ideal for systems 
+	  High-quality MPEG audio decoder.  All computations are performed
+	  with fixed-point integer arithmetic, making it ideal for systems
 	  without a floating-point unit.
 
 	  http://www.underbit.com/products/mad/
+
+config BR2_PACKAGE_LIBMAD_TARGET_HEADERS
+	bool "libmad headers in target"
+	default n
+	depends on BR2_PACKAGE_LIBMAD
+	help
+	  Put headers files in the target.

Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-05-10 02:37:44 UTC (rev 18601)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-05-10 08:10:21 UTC (rev 18602)
@@ -7,8 +7,7 @@
 LIBMAD_VERSION=0.15.1b
 LIBMAD_SOURCE=libmad-$(LIBMAD_VERSION).tar.gz
 LIBMAD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
-LIBMAD_DIR=$(BUILD_DIR)/${shell basename $(LIBMAD_SOURCE) .tar.gz}
-LIBMAD_WORKDIR=$(BUILD_DIR)/libmad-$(LIBMAD_VERSION)
+LIBMAD_DIR=$(BUILD_DIR)/libmad-$(LIBMAD_VERSION)
 LIBMAD_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(LIBMAD_SOURCE):
@@ -33,25 +32,40 @@
 	);
 	touch $(LIBMAD_DIR)/.configured
 
-$(LIBMAD_WORKDIR)/libmad.la: $(LIBMAD_DIR)/.configured
+$(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBMAD_WORKDIR)
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBMAD_DIR)
 
-$(LIBMAD_WORKDIR)/.installed: $(LIBMAD_WORKDIR)/libmad.la
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBMAD_WORKDIR) install
-	touch $(LIBMAD_WORKDIR)/.installed
+$(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
 
-libmad:	uclibc $(LIBMAD_WORKDIR)/.installed
+$(TARGET_DIR)/usr/lib/libmad.so: $(STAGING_DIR)/usr/lib/libmad.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so* $(TARGET_DIR)/usr/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libmad.so*
 
+$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so
+	mkdir -p $(TARGET_DIR)/usr/include
+	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.*a $(TARGET_DIR)/usr/lib/
+
+libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.so
+
+libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
+
 libmad-source: $(DL_DIR)/$(LIBMAD_SOURCE)
 
 libmad-clean:
-	@if [ -d $(LIBMAD_WORKDIR)/Makefile ] ; then \
-		$(MAKE) -C $(LIBMAD_WORKDIR) clean ; \
+	@if [ -d $(LIBMAD_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(LIBMAD_DIR) clean ; \
 	fi;
+	rm -f $(STAGING_DIR)/usr/lib/libmad.*
+	rm -f $(STAGING_DIR)/usr/include/mad.h
+	rm -f $(TARGET_DIR)/usr/lib/libmad.*
+	rm -f $(TARGET_DIR)/usr/include/mad.h
 
+
 libmad-dirclean:
-	rm -rf $(LIBMAD_DIR) $(LIBMAD_WORKDIR)
+	rm -rf $(LIBMAD_DIR)
 #############################################################
 #
 # Toplevel Makefile options
@@ -60,3 +74,6 @@
 ifeq ($(strip $(BR2_PACKAGE_LIBMAD)),y)
 TARGETS+=libmad
 endif
+ifeq ($(strip $(BR2_PACKAGE_LIBMAD_TARGET_HEADERS)),y)
+TARGETS+=libmad-headers
+endif
