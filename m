From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:14 +0200
Subject: [Buildroot] [PATCH 02/35] yaboot: drop support
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <74ce5ad6ef0f806ed6748a2d2c58d1529e5297fa.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yaboot does not build, hasn't been updated since a long time, and
isn't very common these days on embedded PowerPC platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in        |    1 -
 boot/yaboot/Config.in |    5 -----
 boot/yaboot/yaboot.mk |   44 --------------------------------------------
 3 files changed, 0 insertions(+), 50 deletions(-)
 delete mode 100644 boot/yaboot/Config.in
 delete mode 100644 boot/yaboot/yaboot.mk

diff --git a/boot/Config.in b/boot/Config.in
index 6f2796f..78ff82c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -3,7 +3,6 @@ menu "Bootloaders"
 source "boot/grub/Config.in"
 source "boot/grub2/Config.in"
 source "boot/syslinux/Config.in"
-source "boot/yaboot/Config.in"
 source "boot/u-boot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
diff --git a/boot/yaboot/Config.in b/boot/yaboot/Config.in
deleted file mode 100644
index 75da815..0000000
--- a/boot/yaboot/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_TARGET_YABOOT
-	bool "yaboot"
-	depends on BR2_powerpc
-	help
-	  The yaboot bootloader for new world powerpc systems.
diff --git a/boot/yaboot/yaboot.mk b/boot/yaboot/yaboot.mk
deleted file mode 100644
index cbeae50..0000000
--- a/boot/yaboot/yaboot.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-ifeq ($(ARCH),powerpc)
-
-#############################################################
-#
-# yaboot
-#
-#############################################################
-
-YABOOT_SOURCE:=yaboot-1.3.13.tar.gz
-YABOOT_SITE:=http://penguinppc.org/bootloaders/yaboot
-YABOOT_DIR:=$(BUILD_DIR)/yaboot-1.3.13
-
-$(DL_DIR)/$(YABOOT_SOURCE):
-	 $(call DOWNLOAD,$(YABOOT_SITE),$(YABOOT_SOURCE))
-
-yaboot-source: $(DL_DIR)/$(YABOOT_SOURCE)
-
-$(YABOOT_DIR)/Makefile: $(DL_DIR)/$(YABOOT_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(YABOOT_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch -c $(YABOOT_DIR)/Makefile
-
-$(YABOOT_DIR)/second/yaboot: $(YABOOT_DIR)/Makefile
-	$(MAKE) -C $(YABOOT_DIR) CROSS=$(TARGET_CROSS)
-	touch -c $(YABOOT_DIR)/second/yaboot
-
-yaboot: $(YABOOT_DIR)/second/yaboot
-
-yaboot-clean:
-	$(MAKE) -C $(YABOOT_DIR) clean
-
-yaboot-dirclean:
-	rm -rf $(YABOOT_DIR)
-
-endif
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_YABOOT),y)
-TARGETS+=yaboot
-endif
-
-- 
1.6.3.3
