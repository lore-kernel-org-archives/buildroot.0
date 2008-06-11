From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Jun 2008 06:07:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080611130704.379E93C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-11 06:07:03 -0700 (Wed, 11 Jun 2008)
New Revision: 22292

Log:
u-boot: evaluate U_BOOT_ARCH at use time, rather than Makefile parse time

U_BOOT_ARCH seems to race with KERNEL_ARCH in some situations,
so it end up empty. It's only used once, so fix it by using a
use-time evaluated variable instead (=).



Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-06-11 13:05:23 UTC (rev 22291)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-06-11 13:07:03 UTC (rev 22292)
@@ -12,7 +12,7 @@
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TOOLS_BIN:=mkimage
 # u-boot still uses arch=ppc for powerpc
-U_BOOT_ARCH:=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')
+U_BOOT_ARCH=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')
 
 ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
