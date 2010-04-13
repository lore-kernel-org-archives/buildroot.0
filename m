From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:41 +0200
Subject: [Buildroot] [PATCH 29/35] at91bootstrap: remove unused/useless code
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a79791685084a2de048484a47085dc64812d57b6.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index dc475e4..1d1091e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -50,8 +50,6 @@ $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
 		$(AT91BOOTSTRAP_BOARD)_defconfig
 	touch $(AT91BOOTSTRAP_DIR)/.configured
 
-#		$(BOARD_NAME)_defconfig
-
 $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
@@ -61,19 +59,13 @@ $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 
 $(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
-ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
-	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		-C $(AT91BOOTSTRAP_DIR) boot
 	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || \
 		echo "Could not copy bootstrap to BINARIES_DIR"
-endif
 	touch $@
 
-#	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-
 .PHONY: at91bootstrap at91bootstrap-source
 
 at91bootstrap: $(AT91BOOTSTRAP_DIR)/.installed
@@ -97,8 +89,4 @@ at91bootstrap-dirclean:
 #############################################################
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
-endif
-
-at91bootstrap-status:
-	@echo AT91BOOTSTRAP_BOARD=$(AT91BOOTSTRAP_BOARD)
 
-- 
1.6.3.3
