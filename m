From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:41:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mutt
Message-ID: <20080511064134.3B11E3C62E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:41:33 -0700 (Sat, 10 May 2008)
New Revision: 21963

Log:
Bump mutt version

Modified:
   trunk/buildroot/package/mutt/mutt.mk


Changeset:
Modified: trunk/buildroot/package/mutt/mutt.mk
===================================================================
--- trunk/buildroot/package/mutt/mutt.mk	2008-05-09 18:15:16 UTC (rev 21962)
+++ trunk/buildroot/package/mutt/mutt.mk	2008-05-11 06:41:33 UTC (rev 21963)
@@ -3,9 +3,9 @@
 # mutt
 #
 #############################################################
-MUTT_VERSION:=1.5.16
+MUTT_VERSION:=1.5.17+20080114
 MUTT_SOURCE:=mutt_$(MUTT_VERSION).orig.tar.gz
-MUTT_PATCH:=mutt_$(MUTT_VERSION)-3.diff.gz
+MUTT_PATCH:=mutt_$(MUTT_VERSION)-1.diff.gz
 MUTT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mutt/
 MUTT_DIR:=$(BUILD_DIR)/mutt-$(MUTT_VERSION)
 MUTT_CAT:=$(ZCAT)
@@ -18,11 +18,9 @@
 $(DL_DIR)/$(MUTT_PATCH):
 	$(WGET) -P $(DL_DIR) $(MUTT_SITE)/$(MUTT_PATCH)
 
-mutt-source: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
-
 $(MUTT_DIR)/.unpacked: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
 	$(MUTT_CAT) $(DL_DIR)/$(MUTT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MUTT_DIR) package/mutt/ mutt\*.patch
+	toolchain/patch-kernel.sh $(MUTT_DIR) package/mutt/ mutt-$(MUTT_VERSION)\*.patch
 ifneq ($(MUTT_PATCH),)
 	(cd $(MUTT_DIR) && $(MUTT_CAT) $(DL_DIR)/$(MUTT_PATCH) | patch -p1)
 	if [ -d $(MUTT_DIR)/debian/patches ]; then \
@@ -56,6 +54,10 @@
 	cp -dpf $(MUTT_DIR)/$(MUTT_BINARY) $@
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
+mutt-source: $(DL_DIR)/$(MUTT_SOURCE) $(DL_DIR)/$(MUTT_PATCH)
+
+mutt-unpacked: $(MUTT_DIR)/.unpacked
+
 mutt: uclibc ncurses $(TARGET_DIR)/$(MUTT_TARGET_BINARY)
 
 mutt-clean:
