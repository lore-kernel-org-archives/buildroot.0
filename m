From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 18 Jan 2007 08:34:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070118163435.8CFEC4857B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-18 08:34:34 -0800 (Thu, 18 Jan 2007)
New Revision: 17368

Log:
- bump patch version


Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-01-18 16:26:43 UTC (rev 17367)
+++ trunk/buildroot/package/ed/ed.mk	2007-01-18 16:34:34 UTC (rev 17368)
@@ -4,7 +4,7 @@
 #
 #############################################################
 ED_SOURCE:=ed_0.2.orig.tar.gz
-ED_PATCH:=ed_0.2-19.diff.gz
+ED_PATCH:=ed_0.2-20.diff.gz
 ED_SITE:=http://ftp.debian.org/debian/pool/main/e/ed
 ED_CAT:=$(ZCAT)
 ED_DIR:=$(BUILD_DIR)/ed-0.2
@@ -19,12 +19,14 @@
 
 ed-source: $(DL_DIR)/$(ED_SOURCE) $(DL_DIR)/$(ED_PATCH)
 
-ed-unpacked: $(ED_DIR)/.unpacked
 $(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE) $(DL_DIR)/$(ED_PATCH)
 	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(ED_DIR) $(DL_DIR) $(ED_PATCH)
+	if [ -d $(ED_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(ED_DIR) $(ED_DIR)/debian/patches \*.patch ; \
+	fi
 	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-*.patch
-	touch $(ED_DIR)/.unpacked
+	touch $@
 
 $(ED_DIR)/.configured: $(ED_DIR)/.unpacked
 	(cd $(ED_DIR); rm -rf config.cache; \
@@ -38,13 +40,13 @@
 		--exec-prefix=/usr \
 		$(DISABLE_NLS) \
 	);
-	touch $(ED_DIR)/.configured
+	touch $@
 
 $(ED_DIR)/$(ED_BINARY): $(ED_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(ED_DIR)
 
 $(TARGET_DIR)/$(ED_TARGET_BINARY): $(ED_DIR)/$(ED_BINARY)
-	cp -a $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
+	cp -dpf $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
 
 ed: uclibc $(TARGET_DIR)/$(ED_TARGET_BINARY)
 
