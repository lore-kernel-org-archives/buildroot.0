From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 13:51:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20070708205121.080C3A6831@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 13:51:19 -0700 (Sun, 08 Jul 2007)
New Revision: 19047

Log:
- add pxelinux


Modified:
   trunk/buildroot/target/x86/syslinux/Config.in
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/Config.in
===================================================================
--- trunk/buildroot/target/x86/syslinux/Config.in	2007-07-08 19:22:58 UTC (rev 19046)
+++ trunk/buildroot/target/x86/syslinux/Config.in	2007-07-08 20:51:19 UTC (rev 19047)
@@ -4,3 +4,10 @@
 	depends on BR2_i386
 	help
 	  The syslinux bootloader for x86 systems.
+
+config BR2_TARGET_PXELINUX
+	bool "pxelinux"
+	default n
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The pxelinux loader for x86 systems.

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-07-08 19:22:58 UTC (rev 19046)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-07-08 20:51:19 UTC (rev 19047)
@@ -22,7 +22,7 @@
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.31
+SYSLINUX_VERSION:=3.51
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
@@ -37,20 +37,22 @@
 syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
 
 $(SYSLINUX_DIR)/Makefile: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
-	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SYSLINUX_DIR) target/x86/syslinux/ \*.patch
 	touch -c $@
 
-$(SYSLINUX_DIR)/isolinux.bin: $(SYSLINUX_DIR)/Makefile
-	$(MAKE) -C $(SYSLINUX_DIR)
+$(SYSLINUX_DIR)/isolinux.bin $(SYSLINUX_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/Makefile
+	$(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(SYSLINUX_DIR)
 	touch -c $@
 
 syslinux: $(SYSLINUX_DIR)/isolinux.bin
+pxelinux: $(SYSLINUX_DIR)/pxelinux.bin
 
-syslinux-clean:
+pxelinux-clean syslinux-clean:
+	rm -f $(SYSLINUX_DIR)/isolinux.bin $(SYSLINUX_DIR)/pxelinux.bin
 	-$(MAKE) -C $(SYSLINUX_DIR) clean
 
-syslinux-dirclean:
+pxelinux-dirclean syslinux-dirclean:
 	rm -rf $(SYSLINUX_DIR)
 
 endif
@@ -63,3 +65,6 @@
 ifeq ($(strip $(BR2_TARGET_SYSLINUX)),y)
 TARGETS+=syslinux
 endif
+ifeq ($(strip $(BR2_TARGET_PXELINUX)),y)
+TARGETS+=pxelinux
+endif
