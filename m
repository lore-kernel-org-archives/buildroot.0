From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 15:31:16 +0200
Subject: [Buildroot] [git commit] barebox: convert to GENTARGETS
Message-ID: <20110710141144.AD18B8A419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1ff88054a84f1fd6a28465aad4e6bed241e431d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add ':=' -> '=' change]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |   68 ++++++++++++++++++++++-------------------------
 1 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f3e769f..34ec5da 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,12 +4,16 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2011.05.0
-BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE:=http://www.barebox.org/download/
-BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-BAREBOX_CAT:=$(BZCAT)
-BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
+BAREBOX_VERSION = 2011.05.0
+BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
+BAREBOX_SITE = http://www.barebox.org/download/
+
+BAREBOX_INSTALL_IMAGES = YES
+ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+BAREBOX_INSTALL_TARGET = NO
+endif
+
+BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH=x86
@@ -21,41 +25,33 @@ endif
 
 BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
 
-$(DL_DIR)/$(BAREBOX_SOURCE):
-	 $(call DOWNLOAD,$(BAREBOX_SITE),$(BAREBOX_SOURCE))
-
-$(BAREBOX_DIR)/.unpacked: $(DL_DIR)/$(BAREBOX_SOURCE)
-	mkdir -p $(@D)
-	$(INFLATE$(suffix $(BAREBOX_SOURCE))) $(DL_DIR)/$(BAREBOX_SOURCE) \
-		| tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
+define BAREBOX_CONFIGURE_CMDS
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
+endef
 
-$(BAREBOX_DIR)/.patched: $(BAREBOX_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(BAREBOX_DIR) boot/barebox \
-		barebox-$(BAREBOX_VERSION)-\*.patch \
-		barebox-$(BAREBOX_VERSION)-\*.patch.$(ARCH)
-	touch $@
-
-$(BAREBOX_DIR)/.configured: $(BAREBOX_DIR)/.patched
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
-	touch $@
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_BUILD_BAREBOXENV_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
+		$(@D)/scripts/bareboxenv.c
+endef
+endif
 
-$(BAREBOX_DIR)/.built: $(BAREBOX_DIR)/.configured
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR)
-	touch $@
+define BAREBOX_BUILD_CMDS
+	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
+endef
 
-$(BAREBOX_DIR)/.installed: $(BAREBOX_DIR)/.built
-	cp $(BAREBOX_DIR)/barebox.bin $(BINARIES_DIR)
-	touch $@
+define BAREBOX_INSTALL_IMAGES_CMDS
+	cp $(@D)/barebox.bin $(BINARIES_DIR)
+endef
 
-# bareboxenv for the target
-$(TARGET_DIR)/usr/bin/bareboxenv: $(BAREBOX_DIR)/.configured
-	mkdir -p $(@D)
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $@ \
-		$(BAREBOX_DIR)/scripts/bareboxenv.c
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_INSTALL_TARGET_CMDS
+	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
+endef
+endif
 
-barebox: $(BAREBOX_DIR)/.installed \
-	$(if $(BR2_TARGET_BAREBOX_BAREBOXENV),$(TARGET_DIR)/usr/bin/bareboxenv)
+$(eval $(call GENTARGETS,boot,barebox))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 TARGETS+=barebox
-- 
1.7.3.4
