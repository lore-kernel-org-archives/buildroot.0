From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  8 May 2007 08:17:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cvs
Message-ID: <20070508151744.5996548012@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-08 08:17:41 -0700 (Tue, 08 May 2007)
New Revision: 18582

Log:
- bump version. Closes #1339


Modified:
   trunk/buildroot/package/cvs/cvs.mk


Changeset:
Modified: trunk/buildroot/package/cvs/cvs.mk
===================================================================
--- trunk/buildroot/package/cvs/cvs.mk	2007-05-07 04:07:06 UTC (rev 18581)
+++ trunk/buildroot/package/cvs/cvs.mk	2007-05-08 15:17:41 UTC (rev 18582)
@@ -5,7 +5,7 @@
 #############################################################
 CVS_VER:=1.12.13
 CVS_SOURCE:=cvs_$(CVS_VER).orig.tar.gz
-CVS_PATCH:=cvs_$(CVS_VER)-7.diff.gz
+CVS_PATCH:=cvs_$(CVS_VER)-8.diff.gz
 CVS_SITE:=http://ftp.debian.org/debian/pool/main/c/cvs/
 CVS_DIR:=$(BUILD_DIR)/cvs-$(CVS_VER)
 CVS_CAT:=$(ZCAT)
@@ -25,12 +25,14 @@
 $(DL_DIR)/$(CVS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(CVS_SITE)/$(CVS_SOURCE)
 
-$(DL_DIR)/$(CVS_PATCH):
+ifneq ($(CVS_PATCH),)
+CVS_PATCH_FILE=$(DL_DIR)/$(CVS_PATCH)
+$(CVS_PATCH_FILE):
 	$(WGET) -P $(DL_DIR) $(CVS_SITE)/$(CVS_PATCH)
+endif
+cvs-source: $(DL_DIR)/$(CVS_SOURCE) $(CVS_PATCH_FILE)
 
-cvs-source: $(DL_DIR)/$(CVS_SOURCE) $(DL_DIR)/$(CVS_PATCH)
-
-$(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE) $(DL_DIR)/$(CVS_PATCH)
+$(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE) $(CVS_PATCH_FILE)
 	-mkdir $(CVS_DIR)
 	$(CVS_CAT) $(DL_DIR)/$(CVS_SOURCE) | tar -C $(CVS_DIR) $(TAR_OPTIONS) -
 	$(BZCAT) $(CVS_DIR)/cvs-$(CVS_VER)/cvs-$(CVS_VER).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
@@ -47,7 +49,7 @@
 		toolchain/patch-kernel.sh $(CVS_DIR) $(CVS_DIR)/debian/patches \* ; \
 	fi
 endif
-	touch $(CVS_DIR)/.unpacked
+	touch $@
 
 $(CVS_DIR)/.configured: $(CVS_DIR)/.unpacked
 	(cd $(CVS_DIR); rm -rf config.cache; \
