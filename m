From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:52:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20071031065226.AAA0DA688F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:52:26 -0700 (Tue, 30 Oct 2007)
New Revision: 20348

Log:
Cleanup logic of mpfr build, and patch using recommended switches

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-10-31 06:40:36 UTC (rev 20347)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-10-31 06:52:26 UTC (rev 20348)
@@ -14,35 +14,25 @@
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
 MPFR_HOST_BINARY:=libmpfr$(HOST_SHREXT)
 MPFR_LIBVERSION:=1.0.1
+#MPFR_SVN_CMD:=svn co svn://scm.gforge.inria.fr/svn/mpfr/branches/2.3 mpfr-2.3
 
-# No patch
-ifeq ($(MPFR_PATCH),)
-$(DL_DIR)/$(MPFR_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
-
-libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
-endif
 # need patch
 ifneq ($(MPFR_PATCH),)
-$(DL_DIR)/$(MPFR_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
+MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE)
 
-$(DL_DIR)/$(MPFR_PATCH_FILE):
+$(MPFR_PATCH_SOURCE):
 	$(WGET) -O $@ $(MPFR_SITE)/$(MPFR_PATCH)
-
-libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE) $(DL_DIR)/$(MPFR_PATCH_FILE)
 endif
 
-ifeq ($(MPFR_PATCH),)
-$(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
-else
-$(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(DL_DIR)/$(MPFR_PATCH_FILE)
-endif
+$(DL_DIR)/$(MPFR_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
+
+$(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(MPFR_PATCH_SOURCE)
 	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-	( cd $(MPFR_DIR); patch -p1 < $(DL_DIR)/$(MPFR_PATCH_FILE); )
+	( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
 endif
 	touch $@
 
@@ -77,6 +67,10 @@
 		$(TARGET_DIR)/usr/include/
 endif
 
+.PHONY: libmpfr-source
+
+libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE) $(MPFR_PATCH_SOURCE)
+
 libmpfr: uclibc $(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
 stage-libmpfr: uclibc $(STAGING_DIR)/usr/lib/$(MPFR_BINARY)
 
