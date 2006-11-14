From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 14 Nov 2006 15:22:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20061114232215.A14C848576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-14 15:22:15 -0800 (Tue, 14 Nov 2006)
New Revision: 16531

Log:
bring up to version 3.31


Modified:
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2006-11-12 17:23:45 UTC (rev 16530)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2006-11-14 23:22:15 UTC (rev 16531)
@@ -5,15 +5,20 @@
 #
 #############################################################
 
-SYSLINUX_DIR=$(BUILD_DIR)/syslinux-3.09
-SYSLINUX_SOURCE=syslinux-3.09.tar.bz2
-SYSLINUX_SITE=http://www.kernel.org/pub/linux/utils/boot/syslinux/
+SYSLINUX_VERSION:=3.31
+SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
+SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
+SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
+SYSLINUX_SITE=http://www.kernel.org/pub/linux/utils/boot/syslinux
+SYSLINUX_BIN=$(SYSLINUX_DIR2)/mtools/syslinux
 
+
 $(DL_DIR)/$(SYSLINUX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(SYSLINUX_SITE)/$(SYSLINUX_SOURCE)
 
 $(SYSLINUX_DIR)/Makefile: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
 	bzcat $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+	toolchain/patch-kernel.sh $(SYSLINUX_DIR) target/x86/syslinux/ \*.patch
 	touch -c $(SYSLINUX_DIR)/Makefile
 
 $(SYSLINUX_DIR)/isolinux.bin: $(SYSLINUX_DIR)/Makefile
