From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:45:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070130174532.78EF4485CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:45:30 -0800 (Tue, 30 Jan 2007)
New Revision: 17676

Log:
- add some defaults for arm and set them later on depending on the .config


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-01-30 17:38:41 UTC (rev 17675)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-01-30 17:45:30 UTC (rev 17676)
@@ -182,3 +182,20 @@
 # EXTRA_WARNINGS is not set
 # DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set
+
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-30 17:38:41 UTC (rev 17675)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-30 17:45:30 UTC (rev 17676)
@@ -64,7 +64,6 @@
 endif
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
 
 ifneq ($(BR2_ENABLE_LOCALE),)
@@ -72,7 +71,6 @@
 UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
 
 $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
-	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE_LOCALE)/$(UCLIBC_SOURCE_LOCALE)
 
 UCLIBC_LOCALE_DATA:=$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
@@ -82,7 +80,6 @@
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
-	mkdir -p $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
 ifneq ($(BR2_ENABLE_LOCALE),)
@@ -103,9 +100,9 @@
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
 		$(UCLIBC_DIR)/.config
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
-	$(SED) '/.*CONFIG_ARM.*/d' -e '/.*CONFIG_GENERIC_ARM.*/d' \
+	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
 		 $(UCLIBC_DIR)/.config
-	/bin/echo "CONFIG_$(shell echo $(BR2_ARM_TYPE))=y" >> \
+	/bin/echo "CONFIG_$(BR2_ARM_TYPE)=y" >> \
 		$(UCLIBC_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
 	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.config
