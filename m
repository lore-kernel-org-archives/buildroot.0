From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 23:38:01 2006
Subject: [Buildroot] svn commit: trunk/buildroot: package/sed
	toolchain/dependencies toolc etc...
Message-ID: <20060719063759.18C6848B34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 23:37:58 -0700 (Tue, 18 Jul 2006)
New Revision: 15725

Log:
minor dependancy cleanup


Modified:
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/toolchain/dependencies/dependencies.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
   trunk/buildroot/toolchain/uClibc/uClibc.config
   trunk/buildroot/toolchain/uClibc/uClibc.config-locale
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/package/sed/sed.mk	2006-07-19 06:37:58 UTC (rev 15725)
@@ -156,3 +156,4 @@
 ifeq ($(strip $(BR2_PACKAGE_SED)),y)
 TARGETS+=sed
 endif
+.PHONY: sed host-sed

Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-07-19 06:37:58 UTC (rev 15725)
@@ -6,7 +6,7 @@
 ######################################################################
 
 dependencies: host-sed
-	$(TOPDIR)/toolchain/dependencies/dependencies.sh
+	@$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
 
@@ -21,5 +21,5 @@
 # Toplevel Makefile options
 #
 #############################################################
-# unconditionally include this one...
-TARGETS+=dependencies
+.PHONY: dependencies
+

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-07-19 06:37:58 UTC (rev 15725)
@@ -177,3 +177,4 @@
 kernel-headers-dirclean:
 	rm -rf $(LINUX_HEADERS_DIR)
 
+.PHONY: kernel-headers

Modified: trunk/buildroot/toolchain/uClibc/uClibc.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc.config	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/toolchain/uClibc/uClibc.config	2006-07-19 06:37:58 UTC (rev 15725)
@@ -151,7 +151,7 @@
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options

Modified: trunk/buildroot/toolchain/uClibc/uClibc.config-locale
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc.config-locale	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/toolchain/uClibc/uClibc.config-locale	2006-07-19 06:37:58 UTC (rev 15725)
@@ -153,7 +153,7 @@
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-19 00:06:06 UTC (rev 15724)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-19 06:37:58 UTC (rev 15725)
@@ -67,8 +67,8 @@
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ \*.patch
 	touch $(UCLIBC_DIR)/.unpacked
 
-uclibc-configured: $(UCLIBC_DIR)/.configured
-$(UCLIBC_DIR)/.configured: dependencies kernel-headers $(UCLIBC_DIR)/.unpacked
+uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.unpacked
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
