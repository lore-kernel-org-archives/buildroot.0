From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:22:05 +0200
Subject: [Buildroot] [PATCH 13/21] syslinux: convert to GENTARGETS
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <30c3843263205e1a6e75ccdc8accbaed57a61498.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Moreover, the installation of pxelinux and/or isolinux is now selected
to suboptions, as we traditionally do for other packages. This allows
to have a single option (BR2_TARGET_SYSLINUX) that enables the
syslinux package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/Config.in   |   14 ++++++++----
 boot/syslinux/syslinux.mk |   50 +++++++++++++++-----------------------------
 2 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 5650f91..60f3b8f 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -5,8 +5,12 @@ config BR2_TARGET_SYSLINUX
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
 
-config BR2_TARGET_PXELINUX
-	bool "pxelinux"
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  The pxelinux loader for x86 systems.
+config BR2_TARGET_SYSLINUX_ISOLINUX
+	bool "Install isolinux"
+	depends on BR2_TARGET_SYSLINUX
+	default y
+
+config BR2_TARGET_SYSLINUX_PXELINUX
+	bool "Install pxelinux"
+	depends on BR2_TARGET_SYSLINUX
+	default y
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 192e905..d1b2907 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,42 +4,29 @@
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.85
-SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
-SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
-SYSLINUX_CAT:=$(BZCAT)
-SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/3.xx/
+SYSLINUX_VERSION = 3.85
+SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/3.xx/
 
-$(DL_DIR)/$(SYSLINUX_SOURCE):
-	 $(call DOWNLOAD,$(SYSLINUX_SITE),$(SYSLINUX_SOURCE))
+SYSLINUX_INSTALL_TARGET = NO
+SYSLINUX_INSTALL_IMAGES = YES
 
-syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
+SYSLINUX_DEPENDENCIES = host-nasm
 
-$(SYSLINUX_DIR)/.unpacked: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
-	mkdir -p $(@D)
-	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(@D) boot/syslinux/ \*.patch
-	touch -c $@
+define SYSLINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(@D)
+endef
 
-$(SYSLINUX_DIR)/.compiled: $(SYSLINUX_DIR)/.unpacked
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(SYSLINUX_DIR)
-	touch -c $@
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
 
-$(BINARIES_DIR)/isolinux.bin: $(SYSLINUX_DIR)/.compiled
-	cp -a $(SYSLINUX_DIR)/core/isolinux.bin $@
+define SYSLINUX_INSTALL_IMAGES_CMDS
+	for i in $(SYSLINUX_IMAGES-y); do \
+		$(INSTALL) -D -m 0755 $(@D)/core/$$i $(BINARIES_DIR)/`basename $$i`; \
+	done
+endef
 
-$(BINARIES_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/.compiled
-	cp -a $(SYSLINUX_DIR)/core/pxelinux.bin $@
-
-syslinux: host-nasm $(BINARIES_DIR)/isolinux.bin
-pxelinux: host-nasm $(BINARIES_DIR)/pxelinux.bin
-
-pxelinux-clean syslinux-clean:
-	rm -f $(BINARIES_DIR)/isolinux.bin $(BINARIES_DIR)/pxelinux.bin
-	-$(MAKE) -C $(SYSLINUX_DIR) clean
-
-pxelinux-dirclean syslinux-dirclean:
-	rm -rf $(SYSLINUX_DIR)
+$(eval $(call GENTARGETS,boot,syslinux))
 
 #############################################################
 #
@@ -49,6 +36,3 @@ pxelinux-dirclean syslinux-dirclean:
 ifeq ($(BR2_TARGET_SYSLINUX),y)
 TARGETS+=syslinux
 endif
-ifeq ($(BR2_TARGET_PXELINUX),y)
-TARGETS+=pxelinux
-endif
-- 
1.7.1
