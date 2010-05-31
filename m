From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:28 +0200
Subject: [Buildroot] [PATCH 42/46] at91dataflashboot: various fixes
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6fe790e84ec62e03222ee55d30686f4ddb2579d9.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the URL, fix the directory to which it gets unpacked, fix make
target names to be lower-case only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 519328c..dcbe1ef 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -5,29 +5,27 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
-DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
+DATAFLASHBOOT_SITE:=ftp://www.at91.com/pub/buildroot/
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
-DATAFLASHBOOT_DIR:=$(BUILD_DIR)/$(DATAFLASHBOOT_NAME)
+DATAFLASHBOOT_DIR:=$(BUILD_DIR)/at91dataflashboot-$(DATAFLASHBOOT_VERSION)
 DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin
 
 $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
 	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
 
 $(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
-	mkdir -p $(BUILD_DIR)
-	ls $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(@D)
+	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $(DATAFLASHBOOT_DIR)/.unpacked
 
 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.unpacked
 	ls $(DATAFLASHBOOT_DIR)/.unpacked
 	make -C $(DATAFLASHBOOT_DIR) CROSS_COMPILE=$(TARGET_CROSS)
 
-DataflashBoot-clean:
+dataflashboot-clean:
 	make -C $(DATAFLASHBOOT_DIR) clean
 
-DataflashBoot-dirclean:
+dataflashboot-dirclean:
 	rm -rf $(DATAFLASHBOOT_DIR)
 
 dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
-- 
1.7.0.4
