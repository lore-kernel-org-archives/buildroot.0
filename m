From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:26 +0100
Subject: [Buildroot] ntfs-3g: convert to Makefile.autotools.in
In-Reply-To: <1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bump version to 2009.02.1
- internal fuse support, no longer depends on libfuse/pkgconfig
---
 package/ntfs-3g/Config.in  |    3 +-
 package/ntfs-3g/ntfs-3g.mk |  101 ++++++++++---------------------------------
 2 files changed, 25 insertions(+), 79 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index da2c86a..32beb74 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,9 +1,8 @@
 comment "ntfs-3g has no inherent support for AVR32" 
 	depends on BR2_avr32 && BR2_PACKAGE_NTFS_3G
 
-config BR2_PACKAGE_NTFS-3G
+config BR2_PACKAGE_NTFS_3G
         bool "ntfs-3g"
-	select BR2_PACKAGE_PKGCONFIG
         help
 	  The NTFS-3G driver is an open source, freely available
           read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 1e78fee..44f938c 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -3,85 +3,32 @@
 # ntfs-3g
 #
 #############################################################
-#NTFS-3G_VERSION:=1.2506
-NTFS-3G_VERSION:=1.5130
-NTFS-3G_SOURCE:=ntfs-3g-$(NTFS-3G_VERSION).tgz
-NTFS-3G_SITE:=www.ntfs-3g.org
-NTFS-3G_DIR:=$(BUILD_DIR)/ntfs-3g-$(NTFS-3G_VERSION)
-NTFS-3G_BINARY:=ntfs-3g
-
-http://www.ntfs-3g.org/ntfs-3g-1.5130.tgz
-$(DL_DIR)/$(NTFS-3G_SOURCE):
-	$(call DOWNLOAD,$(NTFS-3G_SITE),$(NTFS-3G_SOURCE))
-
-$(NTFS-3G_DIR)/.source: $(DL_DIR)/$(NTFS-3G_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(NTFS-3G_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+NTFS_3G_VERSION:=2009.2.1
+NTFS_3G_SOURCE:=ntfs-3g-$(NTFS_3G_VERSION).tgz
+NTFS_3G_SITE:=http://www.ntfs-3g.org/
+NTFS_3G_CONF_OPT:=--disable-ldconfig --program-prefix=""
+NTFS_3G_INSTALL_STAGING:=yes
+
+$(eval $(call AUTOTARGETS,package,ntfs-3g))
+
+$(NTFS_3G_TARGET_INSTALL_TARGET): $(NTFS_3G_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target")
+	cp -dpf $(STAGING_DIR)/usr/lib/libntfs-3g.so* $(TARGET_DIR)/lib/
+	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/bin/ntfs-3g $(TARGET_DIR)/bin/
+	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/bin/ntfs-3g.probe $(TARGET_DIR)/bin/
 	touch $@
 
-$(NTFS-3G_DIR)/.configured: $(NTFS-3G_DIR)/.source
-	(cd $(NTFS-3G_DIR); rm -rf config.cache ; \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS)" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--libdir=/usr/lib \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--program-prefix="" \
-		--with-gnu-ld \
-		--enable-shared \
-		--enable-static \
-		, \
-		ac_cv_path_LDCONFIG=""\
-	);
+ifeq ($(BR2_ENABLE_DEBUG),)
+$(NTFS_3G_HOOK_POST_INSTALL): $(NTFS_3G_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g.probe
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/libntfs-3g.so*
 	touch $@
+endif
 
-$(NTFS-3G_DIR)/.compiled: $(NTFS-3G_DIR)/.configured
-	$(MAKE) prefix=$/usr CC=$(TARGET_CC)-C $(NTFS-3G_DIR)
-	touch $@
-#		CROSS_COMPILE="$(TARGET_CROSS)"
-
-
-
-$(STAGING_DIR)/usr/bin/ntfs-3g: $(NTFS-3G_DIR)/.compiled
-	$(MAKE) prefix=$/usr -C $(NTFS-3G_DIR) DESTDIR=$(STAGING_DIR)/ install
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/ntfs-3g: $(STAGING_DIR)/usr/bin/ntfs-3g
-	rm -f $(TARGET_DIR)/lib/libntfs-3g.so.*
-	cp -dpf $(STAGING_DIR)/lib/libntfs-3g.so.* $(TARGET_DIR)/lib/
-	-unlink $(TARGET_DIR)/usr/lib/libntfs-3g*
-	ln -s /lib/libntfs-3g.so  $(TARGET_DIR)/usr/lib/libntfs-3g.so
-	cp -dpf $(STAGING_DIR)/bin/ntfs-3g $(TARGET_DIR)/bin/
-	touch -c $@
-
-ntfs-3g: uclibc pkgconfig libfuse $(TARGET_DIR)/usr/bin/ntfs-3g
-
-ntfs-3g-source: $(DL_DIR)/$(NTFS-3G_SOURCE)
-
-ntfs-3g-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFS-3G_DIR) uninstall
-	unlink $(TARGET_DIR)/usr/lib/libntfs-3g*
+$(NTFS_3G_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFS_3G_DIR) uninstall
 	rm -f $(TARGET_DIR)/lib/libntfs-3g*
-	rm -f $(TARGET_DIR)/bin/ntfs-3g
-	-$(MAKE) -C $(NTFS-3G_DIR) clean
-
-ntfs-3g-dirclean:
-	rm -rf $(NTFS-3G_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NTFS-3G),y)
-TARGETS+=ntfs-3g
-endif
+	rm -f $(TARGET_DIR)/bin/ntfs-3g $(TARGET_DIR)/bin/ntfs-3g.probe
+	rm -f $(NTFS_3G_TARGET_INSTALL_STAGING) $(NTFS_3G_TARGET_INSTALL_TARGET) $(NTFS_3G_HOOK_POST_INSTALL)
-- 
1.5.4.3
