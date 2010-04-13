From: Thomas Brandstetter <thomas.brandstetter@me.com>
Date: Tue, 13 Apr 2010 23:49:17 +0200
Subject: [Buildroot] [PATCH] pciutils: convert to the autotools
	infrastructure
Message-ID: <78409DB4-3D71-4100-81B8-653F239F8E31@me.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Brandstetter <tbrandstetter@me.com>
---
 package/pciutils/pciutils.mk |   81 ++++++++---------------------------------
 1 files changed, 16 insertions(+), 65 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 7b19c5b..12d45f3 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -1,80 +1,31 @@
 #############################################################
 #
-# pciutils
+# PCIUTILS
 #
 #############################################################
-PCIUTILS_VERSION:=3.0.1
-PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
-PCIUTILS_CAT:=$(ZCAT)
-PCIUTILS_SITE:=ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
-PCIUTILS_DIR:=$(BUILD_DIR)/pciutils-$(PCIUTILS_VERSION)
-
-# Yet more targets...
-PCIIDS_SITE:=http://pciids.sourceforge.net/
-PCIIDS_SOURCE:=pci.ids.bz2
-PCIIDS_CAT:=$(BZCAT)
 
+PCIUTILS_VERSION = 3.1.7
+PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
+PCIUTILS_CONFIGURE_CMDS = echo ""
+PCIUTILS_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-PCIUTILS_HAVE_ZLIB=yes
-PCIIDS_FILE=pci.ids.gz
-PCIIDS_COMPRESSOR=gzip -9 -c
+	PCIUTILS_ZLIB=yes
 else
-PCIUTILS_HAVE_ZLIB=no
-PCIIDS_FILE=pci.ids
-PCIIDS_COMPRESSOR=cat
+	PCIUTILS_ZLIB=no
 endif
+PCIUTILS_DNS=no
+PCIUTILS_SHARED=yes
+PCIUTILS_MAKE_OPT = CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) SHARED=$
(PCIUTILS_SHARED) ZLIB=$(PCIUTILS_ZLIB) DNS=$(PCIUTILS_DNS) SHAREDIR=/usr/share/misc
 
-$(DL_DIR)/$(PCIUTILS_SOURCE):
-	 $(call DOWNLOAD,$(PCIUTILS_SITE),$(PCIUTILS_SOURCE))
-
-$(DL_DIR)/$(PCIIDS_SOURCE):
-	$(call DOWNLOAD,$(PCIIDS_SITE),$(PCIIDS_SOURCE))
+$(eval $(call AUTOTARGETS,package,pciutils))
 
-$(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
-	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) | $(PCIIDS_COMPRESSOR) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
-	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils-$(PCIUTILS_VERSION)\*.patch
-	#$(CONFIG_UPDATE) $(@D)
+$(PCIUTILS_HOOK_POST_EXTRACT):
 	$(SED) 's/uname -s/echo Linux/' \
 		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
-		$(PCIUTILS_DIR)/lib/configure
+		$(PCIUTILS_DIR)/lib/configure	
 	touch $@
 
-$(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
-		SHAREDIR="/usr/share/misc" \
-		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
-		HOST=$(KERNEL_ARCH)-linux \
-		PREFIX=/usr
+$(PCIUTILS_HOOK_POST_INSTALL):
+	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/lspci
+	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/setpci
 	touch $@
-
-$(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
-	$(INSTALL) $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-$(TARGET_DIR)/sbin/setpci: $(PCIUTILS_DIR)/.compiled
-	$(INSTALL) $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-$(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
-	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $@
-
-pciutils: $(if $(BR2_PACKAGE_ZLIB),zlib) $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
-
-pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
-
-pciutils-clean:
-	-$(MAKE) -C $(PCIUTILS_DIR) clean
-	rm -f $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids*
-
-pciutils-dirclean:
-	rm -rf $(PCIUTILS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PCIUTILS),y)
-TARGETS+=pciutils
-endif
-- 
1.6.3.3
