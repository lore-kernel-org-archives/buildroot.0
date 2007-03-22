From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 22 Mar 2007 09:14:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070322161444.DE09C48016@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-22 09:14:42 -0700 (Thu, 22 Mar 2007)
New Revision: 18202

Log:
- fix previous incomplete commit of mine


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-03-22 13:21:05 UTC (rev 18201)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-03-22 16:14:42 UTC (rev 18202)
@@ -38,12 +38,16 @@
 libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE) $(DL_DIR)/$(MPFR_PATCH_FILE)
 endif
 
+ifeq ($(MPFR_PATCH),)
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
+else
+$(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(DL_DIR)/$(MPFR_PATCH_FILE)
+endif
 	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-	( cd $(MPFR_DIR) ; patch -p1 < $(MPFR_PATCH_FILE) ; )
+	( cd $(MPFR_DIR) ; patch -p1 < $(DL_DIR)/$(MPFR_PATCH_FILE) ; )
 endif
 	touch $@
 
