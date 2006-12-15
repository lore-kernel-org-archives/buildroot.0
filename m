From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 06:40:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061215144055.D87C44858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 06:40:55 -0800 (Fri, 15 Dec 2006)
New Revision: 16946

Log:
- s/UCLIBC_HAS_LOCALE/BR2_ENABLE_LOCALE/g


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-15 14:37:02 UTC (rev 16945)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-15 14:40:55 UTC (rev 16946)
@@ -26,9 +26,6 @@
 endif
 UCLIBC_CAT:=$(BZCAT)
 
-UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
-UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
-
 UCLIBC_TARGET_ARCH:=$(shell echo $(ARCH) | sed -e s'/-.*//' \
 		-e 's/i.86/i386/' \
 		-e 's/sparc.*/sparc/' \
@@ -63,7 +60,11 @@
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
-ifneq ($(UCLIBC_HAS_LOCALE),)
+
+ifneq ($(BR2_ENABLE_LOCALE),)
+UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
+UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
+
 $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE_LOCALE)/$(UCLIBC_SOURCE_LOCALE)
@@ -78,8 +79,8 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)\*.patch
-ifneq ($(UCLIBC_HAS_LOCALE),)
-	cp -p $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
+ifneq ($(BR2_ENABLE_LOCALE),)
+	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 endif
 	touch $(UCLIBC_DIR)/.unpacked
 
