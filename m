From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 05:51:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libelf
Message-ID: <20070406125144.D3FC3485E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 05:51:42 -0700 (Fri, 06 Apr 2007)
New Revision: 18348

Log:
- bump version. memmove works so let configure know about this fact


Modified:
   trunk/buildroot/package/libelf/libelf.mk


Changeset:
Modified: trunk/buildroot/package/libelf/libelf.mk
===================================================================
--- trunk/buildroot/package/libelf/libelf.mk	2007-04-06 11:55:37 UTC (rev 18347)
+++ trunk/buildroot/package/libelf/libelf.mk	2007-04-06 12:51:42 UTC (rev 18348)
@@ -3,7 +3,7 @@
 # libelf
 #
 #############################################################
-LIBELF_VER=0.8.5
+LIBELF_VER=0.8.9
 LIBELF_SOURCE=libelf-$(LIBELF_VER).tar.gz
 LIBELF_SITE=http://www.mr511.de/software/
 LIBELF_DIR=$(BUILD_DIR)/libelf-$(LIBELF_VER)
@@ -16,16 +16,18 @@
 $(DL_DIR)/$(LIBELF_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBELF_SITE)/$(LIBELF_SOURCE)
 
-$(LIBELF_DIR)/.source: $(DL_DIR)/$(LIBELF_SOURCE)
+$(LIBELF_DIR)/.unpacked: $(DL_DIR)/$(LIBELF_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBELF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBELF_DIR) package/libelf libelf\*.patch
-	touch $(LIBELF_DIR)/.source
+	$(CONFIG_UPDATE) $(LIBELF_DIR)
+	touch $@
 
-$(LIBELF_DIR)/.configured: $(LIBELF_DIR)/.source
+$(LIBELF_DIR)/.configured: $(LIBELF_DIR)/.unpacked
 	(cd $(LIBELF_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		libelf_cv_working_memmove=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -35,13 +37,13 @@
 		$(DISABLE_NLS) \
 		--disable-shared \
 	);
-	touch $(LIBELF_DIR)/.configured;
+	touch $@
 
 $(LIBELF_DIR)/libelf.so.$(LIBELF_VER): $(LIBELF_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBELF_DIR)
 
 $(STAGING_DIR)/usr/lib/libelf.a: $(LIBELF_DIR)/libelf.so.$(LIBELF_VER)
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) ${INSTALL}="install -D" \
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		instroot=$(STAGING_DIR) -C $(LIBELF_DIR) install
 
 $(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VER): $(STAGING_DIR)/usr/lib/libelf.a
