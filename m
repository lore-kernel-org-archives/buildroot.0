From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 24 Mar 2007 04:47:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/setserial
Message-ID: <20070324114719.1376A4857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-24 04:47:00 -0700 (Sat, 24 Mar 2007)
New Revision: 18215

Log:
- fix downloading the setserial patch


Modified:
   trunk/buildroot/package/setserial/setserial.mk


Changeset:
Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2007-03-23 13:26:51 UTC (rev 18214)
+++ trunk/buildroot/package/setserial/setserial.mk	2007-03-24 11:47:00 UTC (rev 18215)
@@ -6,7 +6,7 @@
 SETSERIAL_VERSION:=2.17
 SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE:=http://ftp.debian.org/debian/pool/main/s/setserial/
-SETSERIAL_PATCH:=setserial_$(SETSERIAL_VERSION)-43.diff.gz
+SETSERIAL_PATCH_FILE:=setserial_$(SETSERIAL_VERSION)-43.diff.gz
 SETSERIAL_DIR:=$(BUILD_DIR)/setserial-$(SETSERIAL_VERSION)
 SETSERIAL_BINARY:=setserial
 SETSERIAL_TARGET_BINARY:=usr/bin/setserial
@@ -14,12 +14,20 @@
 $(DL_DIR)/$(SETSERIAL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SETSERIAL_SITE)/$(SETSERIAL_SOURCE)
 
-$(SETSERIAL_DIR)/.unpacked: $(DL_DIR)/$(SETSERIAL_SOURCE)
+ifneq ($(SETSERIAL_PATCH_FILE),)
+SETSERIAL_PATCH:=$(DL_DIR)/$(SETSERIAL_PATCH_FILE)
+$(SETSERIAL_PATCH):
+	$(WGET) -O $@ $(SETSERIAL_SITE)/$(SETSERIAL_PATCH_FILE)
+else
+SETSERIAL_PATCH:=
+endif
+
+$(SETSERIAL_DIR)/.unpacked: $(DL_DIR)/$(SETSERIAL_SOURCE) $(SETSERIAL_PATCH)
 	$(ZCAT) $(DL_DIR)/$(SETSERIAL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(SETSERIAL_DIR)
 	toolchain/patch-kernel.sh $(SETSERIAL_DIR) package/setserial setserial\*.patch
-ifneq ($(SETSERIAL_PATCH),)
-	toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(DL_DIR) $(SETSERIAL_PATCH)
+ifneq ($(SETSERIAL_PATCH_FILE),)
+	toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(DL_DIR) $(SETSERIAL_PATCH_FILE)
 	if [ -d $(SETSERIAL_DIR)/debian/patches ]; then \
 		toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(SETSERIAL_DIR)/debian/patches \*.patch ; \
 	fi
@@ -27,7 +35,7 @@
 	touch $@
 
 ifeq ($(BR2_PREFER_IMA),y)
-SETSERIAL_CFLAGS=--combine $(CFLAGS_WHOLE_PROGRAM)
+SETSERIAL_CFLAGS=$(CFLAGS_COMBINE) $(CFLAGS_WHOLE_PROGRAM)
 endif
 
 $(SETSERIAL_DIR)/.configured: $(SETSERIAL_DIR)/.unpacked
@@ -53,7 +61,7 @@
 
 setserial: uclibc $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
 
-setserial-source: $(DL_DIR)/$(SETSERIAL_SOURCE) $(DL_DIR)/$(SETSERIAL_PATCH)
+setserial-source: $(DL_DIR)/$(SETSERIAL_SOURCE) $(SETSERIAL_PATCH)
 
 setserial-clean:
 	rm -f $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
