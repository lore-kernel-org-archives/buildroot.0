From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  2 Oct 2008 07:32:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20081002143208.0F0B83C647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-02 07:32:07 -0700 (Thu, 02 Oct 2008)
New Revision: 23578

Log:
gcc: make sure that /usr/lib exists on target before installing shared libs

On very lite systems the /usr/lib directory might not exist before libstdc++ is
installed. This patch makes sure the directory exists.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-02 14:24:45 UTC (rev 23577)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-02 14:32:07 UTC (rev 23578)
@@ -340,6 +340,7 @@
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+	mkdir -p $(TARGET_DIR)/usr/lib
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-02 14:24:45 UTC (rev 23577)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-02 14:32:07 UTC (rev 23578)
@@ -369,6 +369,7 @@
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+	mkdir -p $(TARGET_DIR)/usr/lib
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
