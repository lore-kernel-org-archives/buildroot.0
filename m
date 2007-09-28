From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 12:43:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/uClibc
Message-ID: <20070928194327.E4F34A69E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 12:43:26 -0700 (Fri, 28 Sep 2007)
New Revision: 20088

Log:
Cleanup cross toolchain admin, split uclibc-menuconfig into same + uclibc-update to avoid overwriting board support file

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-28 17:17:08 UTC (rev 20087)
+++ trunk/buildroot/Makefile	2007-09-28 19:43:26 UTC (rev 20088)
@@ -422,7 +422,7 @@
 	cp $(shell find ./target/ -name $@) .config
 	-@$(MAKE) oldconfig
 
-configured: dirs host-sed kernel-headers uclibc-configured busybox-config linux26-config
+configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
 cross: $(BASE_TARGETS)
 

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-28 17:17:08 UTC (rev 20087)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-28 19:43:26 UTC (rev 20088)
@@ -227,7 +227,7 @@
 
 linux26-unpacked: $(LINUX26_DIR)/.patched
 
-linux26-config:	host-sed $(LINUX26_DIR)/.configured
+linux26-config: host-sed $(LINUX26_DIR)/.configured
 
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 17:17:08 UTC (rev 20087)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 19:43:26 UTC (rev 20088)
@@ -108,7 +108,7 @@
 UCLIBC_LOCALE_DATA=
 endif
 
-$(UCLIBC_DIR)/.unpacked: dirs kernel-headers host-sed $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
+$(UCLIBC_DIR)/.unpacked: dirs host-sed $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
@@ -366,7 +366,6 @@
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
-	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE) && \
 	touch -c $(UCLIBC_DIR)/.config
 
 
@@ -450,7 +449,7 @@
 uclibc-update: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
-uclibc-configured: $(UCLIBC_DIR)/.configured
+uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
 
