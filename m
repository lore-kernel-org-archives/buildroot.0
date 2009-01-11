From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:44:16 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20090111214416.5A26C76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:44:14 +0000 (Sun, 11 Jan 2009)
New Revision: 24772

Log:
Update at91bootstrap to 2.10

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-11 21:42:07 UTC (rev 24771)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-11 21:44:14 UTC (rev 24772)
@@ -3,9 +3,10 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION:=2.9
+#AT91BOOTSTRAP_VERSION:=2.3
+#AT91BOOTSTRAP_PATCH_LEVEL:=.4
+AT91BOOTSTRAP_VERSION:=2.10
 AT91BOOTSTRAP_PATCH_LEVEL:=
-
 AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
@@ -57,6 +58,8 @@
 		$(AT91BOOTSTRAP_BOARD)_defconfig
 	touch $(AT91BOOTSTRAP_DIR)/.configured
 
+#		$(BOARD_NAME)_defconfig
+
 $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
@@ -64,13 +67,18 @@
 		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
 		-C $(AT91BOOTSTRAP_DIR)
 
-$(AT91BOOTSTRAP_DIR)/.installed: $(AT91BOOTSTRAP_TARGET)
+$(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
+ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
+	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET) $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
+else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
-	     CROSS_COMPILE=$(TARGET_CROSS) \
-	     -C $(AT91BOOTSTRAP_DIR) boot
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		-C $(AT91BOOTSTRAP_DIR) boot
 	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install
 	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install
+endif
 	touch $@
 
 #	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
@@ -100,3 +108,7 @@
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
 endif
+
+at91bootstrap-status:
+	@echo AT91BOOTSTRAP_BOARD=$(AT91BOOTSTRAP_BOARD)
+
