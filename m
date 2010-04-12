From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:21 +0200
Subject: [Buildroot] [PATCH 09/21] libraw1394: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c3ffac321f024712321d4366cb58ef9df98e6af2.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.mk |   64 +------------------------------------
 1 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 045cc82..002cafe 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -3,69 +3,9 @@
 # libraw1394
 #
 #############################################################
-
 LIBRAW1394_VERSION:=1.2.1
 LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
 LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
-LIBRAW1394_DIR:=$(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)
-
-$(DL_DIR)/$(LIBRAW1394_SOURCE):
-	$(call DOWNLOAD,$(LIBRAW1394_SITE),$(LIBRAW1394_SOURCE))
-
-$(LIBRAW1394_DIR)/.unpacked: $(DL_DIR)/$(LIBRAW1394_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LIBRAW1394_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(LIBRAW1394_DIR)/.configured: $(LIBRAW1394_DIR)/.unpacked
-	(cd $(LIBRAW1394_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $@
-
-$(LIBRAW1394_DIR)/.compiled: $(LIBRAW1394_DIR)/.configured
-	$(MAKE) -C $(LIBRAW1394_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBRAW1394_DIR)/src install
-
-$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/usr/lib/libraw1394.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
-
-libraw1394: $(TARGET_DIR)/usr/lib/libraw1394.so
-
-libraw1394-source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
-
-libraw1394-clean:
-	rm $(TARGET_DIR)/usr/lib/libraw1394.so*
-	-$(MAKE) -C $(LIBRAW1394_DIR) clean
-
-libraw1394-dirclean:
-	rm -rf $(LIBRAW1394_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBRAW1394),y)
-TARGETS+=libraw1394
-endif
+LIBRAW1394_INSTALL_STAGING=YES
 
+$(eval $(call AUTOTARGETS,package,libraw1394))
\ No newline at end of file
-- 
1.6.3.3
