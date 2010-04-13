From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] libraw1394: convert to the
	autotools infrastructure
Message-ID: <20100413195155.C31BA20F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=503062a3556c2d2f0d73d524fc0b4ec08be5f8fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.mk |   64 +------------------------------------
 1 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 045cc82..196c721 100644
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
-- 
1.6.3.3
