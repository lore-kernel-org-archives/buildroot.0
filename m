From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 06:17:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	toolchain/uClibc
Message-ID: <20070119141735.DAD3A4859E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 06:17:34 -0800 (Fri, 19 Jan 2007)
New Revision: 17380

Log:
- copy the _CONFIG_FILES back
- use the BUSYBOX_CONFIG_FILE if specified by the user


Modified:
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-01-19 13:32:21 UTC (rev 17379)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-01-19 14:17:34 UTC (rev 17380)
@@ -34,8 +34,10 @@
 
 BUSYBOX_UNZIP=$(BZCAT)
 
+ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_BUSYBOX_CONFIG)))
 #")
+endif
 
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
@@ -53,7 +55,7 @@
 	touch $(BUSYBOX_DIR)/.unpacked
 
 $(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
-	cp $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
+	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
 	$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\PREFIX=$(TARGET_DIR),;" \
 		$(BUSYBOX_DIR)/Rules.mak ;
@@ -111,6 +113,7 @@
 
 busybox-menuconfig: busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
+	cp -f $(BUSYBOX_DIR)/.config $(BUSYBOX_CONFIG_FILE)
 
 busybox-clean:
 	rm -f $(TARGET_DIR)/bin/busybox

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-19 13:32:21 UTC (rev 17379)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-19 14:17:34 UTC (rev 17380)
@@ -86,7 +86,7 @@
 
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.unpacked $(UCLIBC_CONFIG_FILE)
-	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
+	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH="none",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
@@ -224,6 +224,7 @@
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
+	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE) && \
 	touch $(UCLIBC_DIR)/.configured
 
 
