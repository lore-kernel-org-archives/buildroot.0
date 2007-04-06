From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 07:21:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libelf
Message-ID: <20070406142101.CA3AE485DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 07:21:00 -0700 (Fri, 06 Apr 2007)
New Revision: 18349

Log:
- someone disabled shared lib support without fixing the libelf rule leading to
  useless rebuilds. Add option to install the lib to the target and not only to
  the staging_dir.


Modified:
   trunk/buildroot/package/libelf/Config.in
   trunk/buildroot/package/libelf/libelf.mk


Changeset:
Modified: trunk/buildroot/package/libelf/Config.in
===================================================================
--- trunk/buildroot/package/libelf/Config.in	2007-04-06 12:51:42 UTC (rev 18348)
+++ trunk/buildroot/package/libelf/Config.in	2007-04-06 14:21:00 UTC (rev 18349)
@@ -7,3 +7,11 @@
 	  library.
 
 	  http://www.stud.uni-hannover.de/~michael/software/
+
+config BR2_PACKAGE_LIBELF_HEADERS
+	bool "headers on the target"
+	default n
+	depends on BR2_PACKAGE_LIBELF
+	help
+	  Whether to copy the lib and the headers to the
+	  target system.

Modified: trunk/buildroot/package/libelf/libelf.mk
===================================================================
--- trunk/buildroot/package/libelf/libelf.mk	2007-04-06 12:51:42 UTC (rev 18348)
+++ trunk/buildroot/package/libelf/libelf.mk	2007-04-06 14:21:00 UTC (rev 18349)
@@ -28,6 +28,7 @@
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		libelf_cv_working_memmove=yes \
+		mr_cv_target_elf=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -35,25 +36,32 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		$(DISABLE_NLS) \
-		--disable-shared \
+		--enable-shared \
 	);
 	touch $@
 
-$(LIBELF_DIR)/libelf.so.$(LIBELF_VER): $(LIBELF_DIR)/.configured
+$(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VER): $(LIBELF_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBELF_DIR)
 
-$(STAGING_DIR)/usr/lib/libelf.a: $(LIBELF_DIR)/libelf.so.$(LIBELF_VER)
+$(STAGING_DIR)/usr/lib/libelf.a: $(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VER)
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		instroot=$(STAGING_DIR) -C $(LIBELF_DIR) install
 
+ifeq ($(BR2_PACKAGE_LIBELF_HEADERS),y)
 $(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VER): $(STAGING_DIR)/usr/lib/libelf.a
+	$(INSTALL) $(STAGING_DIR)/usr/lib/libelf* $(@D)
+	cp -dpR $(STAGING_DIR)/usr/include/{gelf.h,libelf*} $(TARGET_DIR)/usr/include/
+	$(STRIP) $@
 
 libelf: uclibc $(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VER)
-
+else
+libelf: uclibc $(STAGING_DIR)/usr/lib/libelf.so.$(LIBELF_VER)
+endif
 libelf-source: $(DL_DIR)/$(LIBELF_SOURCE)
 
 libelf-clean:
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBELF_DIR) uninstall
+	$(MAKE) instroot=$(STAGING_DIR) -C $(LIBELF_DIR) uninstall
 	-$(MAKE) -C $(LIBELF_DIR) clean
 
 libelf-dirclean:
