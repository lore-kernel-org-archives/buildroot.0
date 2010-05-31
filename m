From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:49 +0200
Subject: [Buildroot] [PATCH 03/46] boot: remove references to COPYTO
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <04f5dcca7b323c328d4fafc1268b9c8fc06477f6.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk         |    6 ------
 boot/at91dataflashboot/at91dataflashboot.mk |    3 +--
 2 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 2072c6b..dc475e4 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -63,22 +63,16 @@ $(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
 ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
 	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	$(call COPY_FILE, $(AT91BOOTSTRAP_TARGET), $(BR2_TARGET_ATMEL_COPYTO), $(AT91BOOTSTRAP_BINARY))
 else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		-C $(AT91BOOTSTRAP_DIR) boot
 	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || \
 		echo "Could not copy bootstrap to BINARIES_DIR"
-ifneq ($(BR2_TARGET_ATMEL_COPYTO),)
-	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install || \
-		echo "Could not copy bootstrap to BR2_ATMEL_COPYTO"
-endif
 endif
 	touch $@
 
 #	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-#	cp $(AT91BOOTSTRAP_TARGET) $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
 
 .PHONY: at91bootstrap at91bootstrap-source
 
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 8939c28..519328c 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -31,8 +31,7 @@ DataflashBoot-dirclean:
 	rm -rf $(DATAFLASHBOOT_DIR)
 
 dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
-	$(call COPY_FILE, $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY), $(TARGET_ATMEL_COPYTO),	$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY))
-
+	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY) $(BINARIES_DIR)
 
 #############################################################
 #
-- 
1.7.0.4
