From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 22 Mar 2007 06:21:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070322132106.6127B4801D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-22 06:21:05 -0700 (Thu, 22 Mar 2007)
New Revision: 18201

Log:
- download eventual mpfr patchfile to dl_dir. Closes #1283


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-03-21 22:31:24 UTC (rev 18200)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-03-22 13:21:05 UTC (rev 18201)
@@ -5,6 +5,7 @@
 #############################################################
 MPFR_VERSION:=2.2.1
 MPFR_PATCH:=patches
+MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
@@ -19,19 +20,30 @@
 MPFR_BE:=no
 endif
 
+# No patch
+ifeq ($(MPFR_PATCH),)
 $(DL_DIR)/$(MPFR_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
 
-
 libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
+endif
+# need patch
+ifneq ($(MPFR_PATCH),)
+$(DL_DIR)/$(MPFR_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
 
+$(DL_DIR)/$(MPFR_PATCH_FILE):
+	$(WGET) -O $@ $(MPFR_SITE)/$(MPFR_PATCH)
+
+libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE) $(DL_DIR)/$(MPFR_PATCH_FILE)
+endif
+
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
 	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-	$(WGET) -P $(MPFR_DIR) $(MPFR_SITE)/$(MPFR_PATCH)
-	( cd $(MPFR_DIR) ; patch -p1 < $(MPFR_PATCH) ; )
+	( cd $(MPFR_DIR) ; patch -p1 < $(MPFR_PATCH_FILE) ; )
 endif
 	touch $@
 
