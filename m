From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 03:30:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080423103004.1CDDA3C737@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-23 03:30:03 -0700 (Wed, 23 Apr 2008)
New Revision: 21806

Log:
u-boot: set ARCH and CROSS_COMPILE


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 07:22:31 UTC (rev 21805)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 10:30:03 UTC (rev 21806)
@@ -11,6 +11,8 @@
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TOOLS_BIN:=mkimage
+# u-boot still uses arch=ppc for powerpc
+U_BOOT_ARCH=$(echo $(KERNEL_ARCH)|$(SED) 's/powerpc/ppc/')
 
 ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
@@ -104,7 +106,8 @@
 	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		$(MAKE) -C $(U_BOOT_DIR)
+		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(KERNEL_ARCH) \
+		 -C $(U_BOOT_DIR)
 
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
