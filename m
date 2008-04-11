From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 11 Apr 2008 14:32:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmel/at91bootstrap linux
Message-ID: <20080411213210.573C33C4DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-11 14:32:09 -0700 (Fri, 11 Apr 2008)
New Revision: 21712

Log:
buildroot: additional tftpboot fixes

Patch by Jean-Christian de Rivaz


Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-04-11 12:42:23 UTC (rev 21711)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-04-11 21:32:09 UTC (rev 21712)
@@ -63,7 +63,7 @@
 $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
 	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	cp $(AT91BOOTSTRAP_TARGET) /tftpboot/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET) $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
 
 .PHONY: at91bootstrap at91bootstrap-source
 

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-11 12:42:23 UTC (rev 21711)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-11 21:32:09 UTC (rev 21712)
@@ -230,7 +230,7 @@
 endif
 
 ifeq ($(BR2_LINUX_COPYTO_TFTPBOOT),y)
-LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
+LINUX26_TARGETS+=$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 endif
 
 ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
@@ -437,9 +437,9 @@
 	mkdir -p $(TARGET_DIR)/boot
 	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
 
-/tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
-	mkdir -p /tftpboot
-	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
+$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
+	mkdir -p $(BR2_LINUX_COPYTO)
+	cp -dpf $(LINUX26_KERNEL) $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)
