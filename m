From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] smartmontools: convert to the
	autotools infrastructure
Message-ID: <20100413195154.D338F20F94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=25afa562f6a20eaa538ff7ae93ab60e94680dee4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smartmontools/smartmontools.mk |   69 +-------------------------------
 1 files changed, 1 insertions(+), 68 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index fde76b0..d768b34 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -7,72 +7,5 @@ SMARTMONTOOLS_VERSION:=5.33
 SMARTMONTOOLS_SOURCE:=smartmontools-$(SMARTMONTOOLS_VERSION).tar.gz
 SMARTMONTOOLS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 SMARTMONTOOLS_DIR:=$(BUILD_DIR)/smartmontools-$(SMARTMONTOOLS_VERSION)
-SMARTMONTOOLS_CAT:=$(ZCAT)
-SMARTMONTOOLS_BINARY:=smartctl
-SMARTMONTOOLS_BINARY2:=smartd
-SMARTMONTOOLS_TARGET_BINARY:=usr/sbin/smartctl
-SMARTMONTOOLS_TARGET_BINARY2:=usr/sbin/smartd
 
-$(DL_DIR)/$(SMARTMONTOOLS_SOURCE):
-	 $(call DOWNLOAD,$(SMARTMONTOOLS_SITE),$(SMARTMONTOOLS_SOURCE))
-
-smartmontools-source: $(DL_DIR)/$(SMARTMONTOOLS_SOURCE)
-
-$(SMARTMONTOOLS_DIR)/.unpacked: $(DL_DIR)/$(SMARTMONTOOLS_SOURCE)
-	$(SMARTMONTOOLS_CAT) $(DL_DIR)/$(SMARTMONTOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SMARTMONTOOLS_DIR) package/smartmontools/ \*.patch
-	touch $(SMARTMONTOOLS_DIR)/.unpacked
-
-$(SMARTMONTOOLS_DIR)/.configured: $(SMARTMONTOOLS_DIR)/.unpacked
-	(cd $(SMARTMONTOOLS_DIR); rm -rf config.cache; \
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
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(SMARTMONTOOLS_DIR)/.configured
-
-$(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY): $(SMARTMONTOOLS_DIR)/.configured
-	$(MAKE) -C $(SMARTMONTOOLS_DIR)
-	$(STRIPCMD) $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY)
-	$(STRIPCMD) $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY2)
-	touch -c $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY)
-
-$(TARGET_DIR)/$(SMARTMONTOOLS_TARGET_BINARY): $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY)
-	cp $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY) $(TARGET_DIR)/usr/sbin/
-
-$(TARGET_DIR)/$(SMARTMONTOOLS_TARGET_BINARY2): $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY)
-	cp $(SMARTMONTOOLS_DIR)/$(SMARTMONTOOLS_BINARY2) $(TARGET_DIR)/usr/sbin/
-
-smartmontools: $(TARGET_DIR)/$(SMARTMONTOOLS_TARGET_BINARY)
-
-smartmontools-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(SMARTMONTOOLS_DIR) uninstall
-	-$(MAKE) -C $(SMARTMONTOOLS_DIR) clean
-
-smartmontools-dirclean:
-	rm -rf $(SMARTMONTOOLS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SMARTMONTOOLS),y)
-TARGETS+=smartmontools
-endif
+$(eval $(call AUTOTARGETS,package,smartmontools))
-- 
1.6.3.3
