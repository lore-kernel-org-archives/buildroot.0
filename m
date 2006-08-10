From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 10 Aug 2006 13:08:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hotplug
Message-ID: <20060810200831.C0916485D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-10 13:08:31 -0700 (Thu, 10 Aug 2006)
New Revision: 15796

Log:
rework hotplug with a customized version not dependant on kernel sources


Added:
   trunk/buildroot/package/hotplug/diethotplug-0.5.tar

Removed:
   trunk/buildroot/package/hotplug/hotplug.patch

Modified:
   trunk/buildroot/package/hotplug/hotplug.mk


Changeset:
Added: trunk/buildroot/package/hotplug/diethotplug-0.5.tar
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/package/hotplug/diethotplug-0.5.tar
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream

Modified: trunk/buildroot/package/hotplug/hotplug.mk
===================================================================
--- trunk/buildroot/package/hotplug/hotplug.mk	2006-08-10 01:09:37 UTC (rev 15795)
+++ trunk/buildroot/package/hotplug/hotplug.mk	2006-08-10 20:08:31 UTC (rev 15796)
@@ -3,15 +3,13 @@
 # hotplug support
 #
 #############################################################
-HOTPLUG_SOURCE=diethotplug-0.4.tar.gz
+HOTPLUG_SOURCE=package/hotplug/diethotplug-0.5.tar
 HOTPLUG_SITE=http://www.kernel.org/pub/linux/utils/kernel/hotplug/
-HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-0.4
+HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-0.5
+HOTPLUG_CAT=cat
 
-$(DL_DIR)/$(HOTPLUG_SOURCE):
-	$(WGET) -P $(DL_DIR) $(HOTPLUG_SITE)/$(HOTPLUG_SOURCE)
-
-$(HOTPLUG_DIR): $(DL_DIR)/$(HOTPLUG_SOURCE)
-	zcat $(DL_DIR)/$(HOTPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+$(HOTPLUG_DIR): $(HOTPLUG_SOURCE)
+	$(HOTPLUG_CAT) $(HOTPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(HOTPLUG_DIR) package/hotplug/ hotplug\*.patch
 
 $(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)

Deleted: trunk/buildroot/package/hotplug/hotplug.patch
===================================================================
--- trunk/buildroot/package/hotplug/hotplug.patch	2006-08-10 01:09:37 UTC (rev 15795)
+++ trunk/buildroot/package/hotplug/hotplug.patch	2006-08-10 20:08:31 UTC (rev 15796)
@@ -1,33 +0,0 @@
-diff -urN diethotplug-0.4.orig/pci.c diethotplug-0.4/pci.c
---- diethotplug-0.4.orig/pci.c	Wed Jan  9 13:57:29 2002
-+++ diethotplug-0.4/pci.c	Wed Jan 30 22:35:24 2002
-@@ -68,8 +68,8 @@
- 		}
- 
- 		/* check that the class matches */
--		class_temp = pci_module_map[i].class_mask & pci_class;
--		if (pci_module_map[i].class != class_temp) {
-+		class_temp = (pci_module_map[i].class ^ pci_class) & pci_module_map[i].class_mask; 
-+		if (class_temp != 0) { 
- 			dbg ("class mask check failed %x != %x",
- 			     pci_module_map[i].class, class_temp);
- 			continue;
---- diethotplug-0.4/Makefile.orig	Wed Jan  9 14:28:05 2002
-+++ diethotplug-0.4/Makefile	Mon Jul  8 07:29:00 2002
-@@ -135,13 +135,13 @@
- 
- # Rules on how to create the generated header files
- usb_modules.h:
--	perl convert_usb.pl < /lib/modules/$(KERNEL_VERSION)/modules.usbmap > $@
-+	perl convert_usb.pl < $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/modules.usbmap > $@
- 
- pci_modules.h:
--	perl convert_pci.pl < /lib/modules/$(KERNEL_VERSION)/modules.pcimap > $@
-+	perl convert_pci.pl < $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/modules.pcimap > $@
- 
- ieee1394_modules.h:
--	perl convert_ieee1394.pl < /lib/modules/$(KERNEL_VERSION)/modules.ieee1394map > $@
-+	perl convert_ieee1394.pl < $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/modules.ieee1394map > $@
- 
- hotplug_version.h:
- 	@echo \#define HOTPLUG_VERSION \"$(VERSION)\" > $@
