From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 05:39:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061215133926.E32D74857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 05:39:26 -0800 (Fri, 15 Dec 2006)
New Revision: 16941

Log:
- Only care about the locale stuff if we have locale in the first place.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-15 13:36:48 UTC (rev 16940)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-15 13:39:26 UTC (rev 16941)
@@ -63,17 +63,24 @@
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
-
+ifneq ($(UCLIBC_HAS_LOCALE),)
 $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE_LOCALE)/$(UCLIBC_SOURCE_LOCALE)
 
+UCLIBC_LOCALE_DATA:=$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
+else
+UCLIBC_LOCALE_DATA=
+endif
+
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
+$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)\*.patch
+ifneq ($(UCLIBC_HAS_LOCALE),)
 	cp -p $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
+endif
 	touch $(UCLIBC_DIR)/.unpacked
 
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
