From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] boot: remove references to
	COPYTO
Message-ID: <20100614203434.8A2BE80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5eaa0e7faea81f21c5d0c9fb8c3b8fd8a53386b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
