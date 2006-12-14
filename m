From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:17:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061214151740.51F8F485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:17:39 -0800 (Thu, 14 Dec 2006)
New Revision: 16923

Log:
Ulrich Hecht writes: This patch downloads uClibc-locale-030818.tgz to dl and copies it from
there instead of downloading it again for every uClibc build.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-14 15:12:19 UTC (rev 16922)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-14 15:17:39 UTC (rev 16923)
@@ -26,6 +26,9 @@
 endif
 UCLIBC_CAT:=$(BZCAT)
 
+UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
+UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
+
 UCLIBC_TARGET_ARCH:=$(shell echo $(ARCH) | sed -e s'/-.*//' \
 		-e 's/i.86/i386/' \
 		-e 's/sparc.*/sparc/' \
@@ -61,11 +64,16 @@
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
 
+$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
+	mkdir -p $(DL_DIR)
+	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE_LOCALE)/$(UCLIBC_SOURCE_LOCALE)
+
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
+$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)\*.patch
+	cp -p $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 	touch $(UCLIBC_DIR)/.unpacked
 
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
