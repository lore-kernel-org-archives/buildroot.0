From: laird at uclibc.org <laird@uclibc.org>
Date: Mon, 12 Jan 2009 12:54:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20090112125430.C33E4766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-12 12:54:30 +0000 (Mon, 12 Jan 2009)
New Revision: 24794

Log:
toolchain/external-toolchain/ext-tool.mk: Support non sysroot-able toolchains

Only copy the sysroot files if the toolchain was built with sysroot support.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2009-01-12 12:45:48 UTC (rev 24793)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2009-01-12 12:54:30 UTC (rev 24794)
@@ -46,8 +46,8 @@
 
 copy_toolchain_sysroot = \
 	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
-	cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755
+	if [ -n "$${SYSROOT_DIR}" ]; then cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
+	find $(STAGING_DIR) -type d | xargs chmod 755; fi
 
 uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)))
 
@@ -59,4 +59,4 @@
 	for libs in $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIBS))); do \
 		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
-	$(call copy_toolchain_sysroot)
\ No newline at end of file
+	$(call copy_toolchain_sysroot)
