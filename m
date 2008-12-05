From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081205152739.BABE43C8E6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:38 -0800 (Fri, 05 Dec 2008)
New Revision: 24287

Log:
toolchain/binutils: let make expand wildcards instead of the shell

Based on f97ce837 in Bernhard's tree.

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:35 UTC (rev 24286)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:38 UTC (rev 24287)
@@ -132,17 +132,16 @@
 binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
 
 binutils-clean:
-	rm -rf $(STAGING_DIR)/usr/bin/*{ar,as,ld,nm,objdump,ranlib,strip} \
-		$(STAGING_DIR)/usr/lib/{libiberty*,ldscripts}
 	-$(MAKE) -C $(BINUTILS_DIR1) DESTDIR=$(STAGING_DIR) \
 		tooldir=/usr build_tooldir=/usr uninstall
 	-$(MAKE) -C $(BINUTILS_DIR1) clean
+	rm -rf $(wildcard $(patsubst %,$(STAGING_DIR)/usr/bin/*%,ar as ld nm objdump ranlib strip c++filt)) \
+		$(wildcard $(patsubst %,$(STAGING_DIR)/usr/lib/%*,libiberty ldscripts))
 
 binutils-dirclean:
 	rm -rf $(BINUTILS_DIR1)
 
 
-
 #############################################################
 #
 # build binutils for use on the target system
@@ -183,12 +182,9 @@
 binutils_target: $(BINUTILS_TARGET_PREREQ) $(TARGET_DIR)/usr/bin/ld
 
 binutils_target-clean:
-	(cd $(TARGET_DIR)/usr/bin; \
-		rm -f addr2line ar as gprof ld nm objcopy \
-		      objdump ranlib readelf size strings strip; \
-	)
-	rm -f $(TARGET_DIR)/bin/$(REAL_GNU_TARGET_NAME)*
 	-$(MAKE) -C $(BINUTILS_DIR2) clean
+	rm -f $(TARGET_DIR)/bin/$(REAL_GNU_TARGET_NAME)* \
+		$(addprefix $(TARGET_DIR)/usr/bin/, addr2line ar as gprof ld nm objcopy objdump ranlib readelf size strings strip c++filt)
 
 binutils_target-dirclean:
 	rm -rf $(BINUTILS_DIR2)
