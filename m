From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:22 +0200
Subject: [Buildroot] [PATCH 10/21] libsysfs: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c04476a83fad3f5fb2f119e8471e527667d85d87.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsysfs/libsysfs.mk |   59 +----------------------------------------
 1 files changed, 2 insertions(+), 57 deletions(-)

diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index a590151..8bf9ca5 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -22,63 +22,8 @@
 # USA
 
 LIBSYSFS_VERSION:=2.1.0
-LIBSYSFS_DIR:=$(BUILD_DIR)/sysfsutils-$(LIBSYSFS_VERSION)
 LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-diag
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
-LIBSYSFS_CAT:=$(ZCAT)
+LIBSYSFS_INSTALL_STAGING=YES
 
-$(DL_DIR)/$(LIBSYSFS_SOURCE):
-	 $(call DOWNLOAD,$(LIBSYSFS_SITE),$(LIBSYSFS_SOURCE))
-
-libsysfs-source: $(DL_DIR)/$(LIBSYSFS_SOURCE)
-
-$(LIBSYSFS_DIR)/.unpacked: $(DL_DIR)/$(LIBSYSFS_SOURCE)
-	$(LIBSYSFS_CAT) $(DL_DIR)/$(LIBSYSFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
-
-$(LIBSYSFS_DIR)/.configured: $(LIBSYSFS_DIR)/.unpacked
-	(cd $(LIBSYSFS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(LIBSYSFS_DIR)/.compiled: $(LIBSYSFS_DIR)/.configured
-	$(MAKE) -C $(LIBSYSFS_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libsysfs.so: $(LIBSYSFS_DIR)/.compiled
-	$(MAKE) -C $(LIBSYSFS_DIR) DESTDIR=$(STAGING_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libsysfs.la
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libsysfs.so: $(STAGING_DIR)/usr/lib/libsysfs.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libsysfs.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsysfs.so
-
-libsysfs: $(TARGET_DIR)/usr/lib/libsysfs.so
-
-libsysfs-clean:
-	-$(MAKE) -C $(LIBSYSFS_DIR) clean
-	-$(MAKE) -C $(LIBSYSFS_DIR) DESTDIR=$(STAGING_DIR) uninstall
-	rm -f $(TARGET_DIR)/usr/lib/libsysfs.so*
-
-libsysfs-dirclean:
-	rm -rf $(LIBSYSFS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBSYSFS),y)
-TARGETS+=libsysfs
-endif
+$(eval $(call AUTOTARGETS,package,libsysfs))
\ No newline at end of file
-- 
1.6.3.3
