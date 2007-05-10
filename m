From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 May 2007 02:18:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libid3tag
Message-ID: <20070510091837.702DE4800E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-10 02:18:35 -0700 (Thu, 10 May 2007)
New Revision: 18603

Log:
libid3tag package. Needed by madplay

Added:
   trunk/buildroot/package/libid3tag/
   trunk/buildroot/package/libid3tag/Config.in
   trunk/buildroot/package/libid3tag/libid3tag.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-05-10 08:10:21 UTC (rev 18602)
+++ trunk/buildroot/package/Config.in	2007-05-10 09:18:35 UTC (rev 18603)
@@ -239,6 +239,7 @@
 
 if BR2_AUDIO_SUPPORT
 source "package/asterisk/Config.in"
+source "package/libid3tag/Config.in"
 source "package/libmad/Config.in"
 source "package/libsndfile/Config.in"
 source "package/mpg123/Config.in"

Added: trunk/buildroot/package/libid3tag/Config.in
===================================================================
--- trunk/buildroot/package/libid3tag/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libid3tag/Config.in	2007-05-10 09:18:35 UTC (rev 18603)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBID3TAG
+	bool "libid3tag"
+	default n
+	help
+	  ID3 tag reading library from the MAD project.
+
+	  http://www.underbit.com/products/mad/

Added: trunk/buildroot/package/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/libid3tag/libid3tag.mk	                        (rev 0)
+++ trunk/buildroot/package/libid3tag/libid3tag.mk	2007-05-10 09:18:35 UTC (rev 18603)
@@ -0,0 +1,66 @@
+#############################################################
+#
+# libid3tag
+#
+#############################################################
+
+LIBID3TAG_VERSION=0.15.1b
+LIBID3TAG_SOURCE=libid3tag-$(LIBID3TAG_VERSION).tar.gz
+LIBID3TAG_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
+LIBID3TAG_DIR=$(BUILD_DIR)/libid3tag-$(LIBID3TAG_VERSION)
+LIBID3TAG_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBID3TAG_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBID3TAG_SITE)/$(LIBID3TAG_SOURCE)
+
+$(LIBID3TAG_DIR)/.unpacked: $(DL_DIR)/$(LIBID3TAG_SOURCE)
+	$(LIBID3TAG_CAT) $(DL_DIR)/$(LIBID3TAG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LIBID3TAG_DIR)/.unpacked
+
+$(LIBID3TAG_DIR)/.configured: $(LIBID3TAG_DIR)/.unpacked
+	(cd $(LIBID3TAG_DIR); rm -rf config.cache; \
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
+	touch $(LIBID3TAG_DIR)/.configured
+
+$(LIBID3TAG_DIR)/libid3tag.la: $(LIBID3TAG_DIR)/.configured
+	rm -f $@
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBID3TAG_DIR)
+
+$(STAGING_DIR)/usr/lib/libid3tag.so: $(LIBID3TAG_DIR)/libid3tag.la
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
+
+$(TARGET_DIR)/usr/lib/libid3tag.so: $(STAGING_DIR)/usr/lib/libid3tag.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
+
+libid3tag: uclibc $(TARGET_DIR)/usr/lib/libid3tag.so
+
+libid3tag-source: $(DL_DIR)/$(LIBID3TAG_SOURCE)
+
+libid3tag-clean:
+	@if [ -d $(LIBID3TAG_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(LIBID3TAG_DIR) clean ; \
+	fi;
+	rm -f $(STAGING_DIR)/usr/lib/libid3tag.so*
+
+
+libid3tag-dirclean:
+	rm -rf $(LIBID3TAG_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBID3TAG)),y)
+TARGETS+=libid3tag
+endif
