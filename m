From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:52 -0700
Subject: [Buildroot] [PATCH 01/18] acpid: convert to gentargets and bump to
	2.0.6
Message-ID: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, added acpi_listen to the target. It was being stripped, but not copied.

acpi_listen is a simple shell-friendly tool which connects to acpid and listens
for events. When an event occurs, acpi_listen will print it on stdout.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/acpid/acpid.mk |   57 +++++++++++++++--------------------------------
 1 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 73c2fb8..d66a4cd 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -3,46 +3,25 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION:=1.0.8
-ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
-ACPID_SOURCE=acpid_$(ACPID_VERSION).orig.tar.gz
-ACPID_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
-
-$(DL_DIR)/$(ACPID_SOURCE):
-	$(call DOWNLOAD,$(ACPID_SITE),$(ACPID_SOURCE))
-
-$(ACPID_DIR)/.unpacked: $(DL_DIR)/$(ACPID_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(ACPID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid-$(ACPID_VERSION)\*.patch
-	touch $(ACPID_DIR)/.unpacked
-
-$(ACPID_DIR)/acpid: $(ACPID_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC)" -C $(ACPID_DIR)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpid
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpi_listen
-	touch -c $(ACPID_DIR)/acpid $(ACPID_DIR)/acpi_listen
-
-$(TARGET_DIR)/usr/sbin/acpid: $(ACPID_DIR)/acpid
-	cp -a $(ACPID_DIR)/acpid $(TARGET_DIR)/usr/sbin/acpid
+ACPID_VERSION = 2.0.6
+ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
+ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
+
+define ACPID_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(@D)/acpid
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(@D)/acpi_listen
+endef
+
+define ACPID_INSTALL_TARGET_CMDS
+	cp -a $(@D)/acpid $(TARGET_DIR)/usr/sbin/acpid
+	cp -a $(@D)/acpi_listen $(TARGET_DIR)/usr/bin/acpi_listen
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
 	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
-	touch -c $(TARGET_DIR)/usr/sbin/acpid
-
-acpid: $(TARGET_DIR)/usr/sbin/acpid
-
-acpid-source: $(DL_DIR)/$(ACPID_SOURCE)
+endef
 
-acpid-clean:
-	-$(MAKE) -C $(ACPID_DIR) clean
+define ACPID_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-acpid-dirclean:
-	rm -rf $(ACPID_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ACPID),y)
-TARGETS+=acpid
-endif
+$(eval $(call GENTARGETS,package,acpid))
-- 
1.7.3
