From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 Jan 2009 16:12:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090105161237.034D977404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-05 16:12:34 +0000 (Mon, 05 Jan 2009)
New Revision: 24693

Log:
u-boot: revert U_BOOT_TARGET part of r24646

More u-boot build unbreaking. r24646 added U_BOOT_TARGET which uses the
nonexisting BOARDNAME variable, which means that the filename expands
to -u-boot-*, confusing ln.

There's limited point in having that symlink in the first please, so simply
revert that hunk.

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 15:52:44 UTC (rev 24692)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 16:12:34 UTC (rev 24693)
@@ -14,7 +14,6 @@
 U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
-U_BOOT_TARGET:=$(BOARD_NAME)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
 U_BOOT_TOOLS_BIN:=mkimage
 U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
 MKIMAGE:=$(U_BOOT_TOOLS)
@@ -179,10 +178,8 @@
 		 -C $(U_BOOT_DIR)
 
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
-	rm -f $(BINARIES_DIR)/$(U_BOOT_TARGET)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
-	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/$(U_BOOT_TARGET)
-	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET) $(U_BOOT_BIN)) 
+	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
 
 $(U_BOOT_TOOLS):	$(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
