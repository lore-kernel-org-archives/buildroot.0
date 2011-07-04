From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:25 +0200
Subject: [Buildroot] [PATCH 08/28] barebox: convert to GENTARGETS
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e4be0020cc5796be3a61a0ee344d8a27e88c7307.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |   59 +++++++++++++++++++++-------------------------
 1 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index bab4b4e..4ed0389 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -7,8 +7,11 @@
 BAREBOX_VERSION = 2011.05.0
 BAREBOX_SOURCE  = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE    = http://www.barebox.org/download/
-BAREBOX_DIR     = $(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-BAREBOX_CAT     = $(BZCAT)
+
+BAREBOX_INSTALL_IMAGES = YES
+ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+BAREBOX_INSTALL_TARGET = NO
+endif
 
 BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 
@@ -22,41 +25,33 @@ endif
 
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
1.7.4.1
