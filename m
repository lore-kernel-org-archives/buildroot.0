From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 06:25:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: coreutils ed
	liblockfile libpcap nfs-uti etc...
Message-ID: <20070620132545.D498D48616@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 06:25:44 -0700 (Wed, 20 Jun 2007)
New Revision: 18870

Log:
- escape wildcards in kernel-patch patterns


Modified:
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/ed/ed.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/sysvinit/sysvinit.mk
   trunk/buildroot/package/usbmount/usbmount.mk


Changeset:
Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -21,8 +21,8 @@
 
 $(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
 	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils*.patch
-	touch $(COREUTILS_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
+	touch $@
 
 $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
 	(cd $(COREUTILS_DIR); rm -rf config.cache; \
@@ -110,7 +110,7 @@
 	# This is undefined when crosscompiling...
 	$(SED) 's,.*HAVE_PROC_UPTIME.*,#define HAVE_PROC_UPTIME 1,g' \
 		$(COREUTILS_DIR)/config.h
-	touch $(COREUTILS_DIR)/.configured
+	touch $@
 
 $(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured
 	$(MAKE) -C $(COREUTILS_DIR)

Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/ed/ed.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -25,7 +25,7 @@
 	if [ -d $(ED_DIR)/debian/patches ]; then \
 		toolchain/patch-kernel.sh $(ED_DIR) $(ED_DIR)/debian/patches \*.patch ; \
 	fi
-	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-*.patch
+	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
 	touch $@
 
 $(ED_DIR)/.configured: $(ED_DIR)/.unpacked

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -17,8 +17,8 @@
 
 $(LIBLOCKFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBLOCKFILE_SOURCE)
 	$(LIBLOCKFILE_CAT) $(DL_DIR)/$(LIBLOCKFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBLOCKFILE_DIR) package/liblockfile/ *.patch
-	touch $(LIBLOCKFILE_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(LIBLOCKFILE_DIR) package/liblockfile/ \*.patch
+	touch $@
 
 $(LIBLOCKFILE_DIR)/.configured: $(LIBLOCKFILE_DIR)/.unpacked
 	(cd $(LIBLOCKFILE_DIR); rm -rf config.cache; \
@@ -31,13 +31,13 @@
 		--build=$(GNU_HOST_NAME) \
 		--enable-shared \
 	);
-	touch $(LIBLOCKFILE_DIR)/.configured
+	touch $@
 
 $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
 	mkdir -p $(STAGING_DIR)/man/man1 $(STAGING_DIR)/man/man3
 	$(MAKE) -C $(LIBLOCKFILE_DIR) prefix= ROOT=$(STAGING_DIR) install
 	ln -sf $(LIBLOCKFILE_BINARY) $(STAGING_DIR)/lib/liblockfile.so.1
-	cp -a $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/lib
+	cp -dpf $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/lib
 
 $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY)
 	-mkdir -p $(TARGET_DIR)/usr/lib

Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -34,7 +34,7 @@
 
 $(LIBPCAP_DIR)/.unpacked: $(DL_DIR)/$(LIBPCAP_SOURCE)
 	$(LIBPCAP_CAT) $(DL_DIR)/$(LIBPCAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ *.patch
+	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
 	touch $@
 
 $(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -26,7 +26,7 @@
 $(NFS_UTILS_DIR)/.unpacked: $(DL_DIR)/$(NFS_UTILS_SOURCE)
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch
-	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ *.patch
+	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ \*.patch
 	$(CONFIG_UPDATE) $(NFS_UTILS_DIR)
 	touch $@
 

Modified: trunk/buildroot/package/sysvinit/sysvinit.mk
===================================================================
--- trunk/buildroot/package/sysvinit/sysvinit.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/sysvinit/sysvinit.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -19,8 +19,8 @@
 sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
 $(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
 	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSVINIT_DIR) package/sysvinit/ sysvinit-*.patch
-	touch $(SYSVINIT_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(SYSVINIT_DIR) package/sysvinit/ sysvinit-\*.patch
+	touch $@
 
 $(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
 	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC=$(TARGET_CC) -C $(SYSVINIT_DIR)/src

Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-06-20 13:19:40 UTC (rev 18869)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-06-20 13:25:44 UTC (rev 18870)
@@ -18,7 +18,7 @@
 
 $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
 	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION)*.patch
+	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION)\*.patch
 	touch $@
 
 $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
@@ -26,6 +26,7 @@
 	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ] ; then \
                 $(INSTALL) -m 0644 -D $(USBMOUNT_DIR)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
         fi;
+	touch -c $@
 
 usbmount: uclibc $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
 
