From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 23 Jun 2007 02:50:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsndfile
Message-ID: <20070623095031.CA530C8057@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-23 02:50:29 -0700 (Sat, 23 Jun 2007)
New Revision: 18898

Log:
- Fixed a type in the binary target and also install to staging_dir (Julien Letessier)
- make sure that -clean also wipes the staging_dir files.


Modified:
   trunk/buildroot/package/libsndfile/libsndfile.mk


Changeset:
Modified: trunk/buildroot/package/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/libsndfile/libsndfile.mk	2007-06-22 19:01:48 UTC (rev 18897)
+++ trunk/buildroot/package/libsndfile/libsndfile.mk	2007-06-23 09:50:29 UTC (rev 18898)
@@ -7,18 +7,19 @@
 LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VER).tar.gz
 LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile/$(LIBUSB_SOURCE)
 LIBSNDFILE_DIR:=$(BUILD_DIR)/libsndfile-$(LIBSNDFILE_VER)
-LIBSNDFILE_BINARY:=libsndfile.sa
+LIBSNDFILE_BINARY:=src/.libs/libsndfile.so
 LIBSNDFILE_TARGET_BINARY:=usr/lib/libsndfile.so
 
 $(DL_DIR)/$(LIBSNDFILE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBSNDFILE_SITE)/$(LIBSNDFILE_SOURCE)
 
-$(LIBSNDFILE_DIR)/.source: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
+$(LIBSNDFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBSNDFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/libsndfile/ \*.patch
-	touch $(LIBSNDFILE_DIR)/.source
+	$(CONFIG_UPDATE) $(LIBSNDFILE_DIR)
+	touch $@
 
-$(LIBSNDFILE_DIR)/.configured: $(LIBSNDFILE_DIR)/.source
+$(LIBSNDFILE_DIR)/.configured: $(LIBSNDFILE_DIR)/.unpacked
 	(cd $(LIBSNDFILE_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -29,13 +30,14 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 	);
-	touch $(LIBSNDFILE_DIR)/.configured;
+	touch $@
 
 $(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY): $(LIBSNDFILE_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBSNDFILE_DIR)
 
 $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY): $(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY)
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) install
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) install
 	rm -Rf $(TARGET_DIR)/usr/man
 
 libsndfile: uclibc $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY)
@@ -44,12 +46,12 @@
 
 libsndfile-clean:
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
+	-$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
 	-$(MAKE) -C $(LIBSNDFILE_DIR) clean
 
 libsndfile-dirclean:
 	rm -rf $(LIBSNDFILE_DIR)
 
-
 #############################################################
 #
 # Toplevel Makefile options
