From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 06:03:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080423130355.7668C3C747@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-23 06:03:53 -0700 (Wed, 23 Apr 2008)
New Revision: 21809

Log:
u-boot: tools in target (mkimage, fw_printenv and fw_setenv)


Modified:
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2008-04-23 13:03:50 UTC (rev 21808)
+++ trunk/buildroot/target/u-boot/Config.in	2008-04-23 13:03:53 UTC (rev 21809)
@@ -70,3 +70,15 @@
 	help
 	  If the option has been enabled, the output can be
 	  silenced by setting the environment variable "silent".
+
+config BR2_TARGET_UBOOT_TOOL_MKIMAGE
+	bool "mkimage tool in target"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Install mkimage tool in target.
+
+config BR2_TARGET_UBOOT_TOOL_ENV
+	bool "fw_printenv tool in target"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Install fw_printenv / fw_setenv tools in target.

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:50 UTC (rev 21808)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:53 UTC (rev 21809)
@@ -20,6 +20,15 @@
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
 endif
 
+U_BOOT_TARGET_TOOLS:=
+ifeq ($(strip $(BR2_TARGET_UBOOT_TOOL_MKIMAGE)),y)
+U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/bin/mkimage
+endif
+ifeq ($(strip $(BR2_TARGET_UBOOT_TOOL_ENV)),y)
+U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/sbin/fw_printenv
+endif
+
+
 # Define a helper function
 define insert_define
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
@@ -113,11 +122,23 @@
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
 
-u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN)
+$(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+	$(TARGET_CC) -I$(U_BOOT_DIR)/include -DUSE_HOSTCC -o $@ \
+		$(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/tools/crc32.c
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
+$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
+		-DUSE_HOSTCC -o $@ \
+		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/tools/crc32.c
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+	ln -s fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
+
+u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TARGET_TOOLS)
+
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
-	rm -f $(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
+	rm -f $(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN) $(U_BOOT_TARGET_TOOLS)
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)
