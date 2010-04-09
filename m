From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:01 +0200
Subject: [Buildroot] [PATCH 23/44] fakeroot: convert to the autotools
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0bdaf0679677291ba363e1ac01cb2bb774d55f29.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fakeroot/Config.in   |    4 -
 package/fakeroot/fakeroot.mk |  126 ++++-------------------------------------
 2 files changed, 13 insertions(+), 117 deletions(-)

diff --git a/package/fakeroot/Config.in b/package/fakeroot/Config.in
index 679b6b2..186b717 100644
--- a/package/fakeroot/Config.in
+++ b/package/fakeroot/Config.in
@@ -4,7 +4,3 @@ config BR2_PACKAGE_FAKEROOT
 	  Run commands in an environment faking root privileges.
 
 	  http://joostje.op.het.net/fakeroot/
-
-# dummy for fakeroot-source
-config BR2_HOST_FAKEROOT
-	bool
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index d525a4f..a8eff52 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,125 +6,25 @@
 FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
-FAKEROOT_CAT:=$(ZCAT)
-FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
-FAKEROOT_DIR1:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
-FAKEROOT_DIR2:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-target
+FAKEROOT_LIBTOOL_PATCH=NO
+HOST_FAKEROOT_LIBTOOL_PATCH=NO
 
-$(DL_DIR)/$(FAKEROOT_SOURCE):
-	 $(call DOWNLOAD,$(FAKEROOT_SITE),$(FAKEROOT_SOURCE))
-
-fakeroot-source: $(DL_DIR)/$(FAKEROOT_SOURCE)
-
-$(FAKEROOT_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FAKEROOT_SOURCE)
-	$(FAKEROOT_CAT) $(DL_DIR)/$(FAKEROOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+define FAKEROOT_PATCH_FAKEROOT_IN
 	# If using busybox getopt, make it be quiet.
 	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
-		$(FAKEROOT_SOURCE_DIR)/scripts/fakeroot.in
-	toolchain/patch-kernel.sh $(FAKEROOT_SOURCE_DIR) package/fakeroot/ \*.patch
-	touch $@
-
-
-#############################################################
-#
-# build fakeroot for use on the host system
-#
-#############################################################
+		$(@D)/scripts/fakeroot.in
+endef
 
-$(FAKEROOT_DIR1)/.configured: $(FAKEROOT_SOURCE_DIR)/.unpacked
-	mkdir -p $(FAKEROOT_DIR1)
-	(cd $(FAKEROOT_DIR1); rm -rf config.cache; \
-		CC="$(HOSTCC)" \
-		$(FAKEROOT_SOURCE_DIR)/configure $(QUIET) \
-		--prefix=$(HOST_DIR)/usr \
-	)
-	touch $@
+FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 
-$(FAKEROOT_DIR1)/faked: $(FAKEROOT_DIR1)/.configured
-	$(MAKE) -C $(FAKEROOT_DIR1)
-	touch -c $@
-
-$(HOST_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR1)/faked
-	$(MAKE) -C $(FAKEROOT_DIR1) install
-	touch -c $@
-
-host-fakeroot: $(HOST_DIR)/usr/bin/fakeroot
-
-host-fakeroot-clean:
-	-$(MAKE) -C $(FAKEROOT_DIR1) clean
-
-host-fakeroot-dirclean:
-	rm -rf $(FAKEROOT_DIR1)
-
-
-#############################################################
-#
-# build fakeroot for use on the target system
-#
-#############################################################
-
-$(FAKEROOT_DIR2)/.configured: $(FAKEROOT_SOURCE_DIR)/.unpacked
-	mkdir -p $(FAKEROOT_DIR2)
-	(cd $(FAKEROOT_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(FAKEROOT_SOURCE_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib/libfakeroot \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(FAKEROOT_DIR2)/faked: $(FAKEROOT_DIR2)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(FAKEROOT_DIR2)
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR2)/faked
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(FAKEROOT_DIR2) install
-	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-linux-faked \
+define FAKEROOT_RENAME_TARGET_BINARIES
+	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-*-faked \
 		$(TARGET_DIR)/usr/bin/faked
-	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-linux-fakeroot \
+	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-*-fakeroot \
 		$(TARGET_DIR)/usr/bin/fakeroot
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	touch -c $@
-
-fakeroot: $(TARGET_DIR)/usr/bin/fakeroot
+endef
 
-fakeroot-clean:
-	-$(MAKE) -C $(FAKEROOT_DIR2) clean
-	rm -f $(TARGET_DIR)/usr/bin/fake{d,root}
-
-fakeroot-dirclean:
-	rm -rf $(FAKEROOT_DIR2)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FAKEROOT),y)
-TARGETS+=fakeroot
-endif
+FAKEROOT_POST_INSTALL_TARGET_HOOKS += FAKEROOT_RENAME_TARGET_BINARIES
 
-ifeq ($(BR2_HOST_FAKEROOT),y)
-HOST_SOURCE+=fakeroot-source
-endif
+$(eval $(call AUTOTARGETS,package,fakeroot))
+$(eval $(call AUTOTARGETS,package,fakeroot,host))
-- 
1.6.3.3
