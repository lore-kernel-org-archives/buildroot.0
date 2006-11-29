From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 11:28:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/tar
Message-ID: <20061129192842.435934858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 11:28:41 -0800 (Wed, 29 Nov 2006)
New Revision: 16726

Log:
- keep the original tarball around.


Modified:
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2006-11-29 19:16:48 UTC (rev 16725)
+++ trunk/buildroot/target/tar/tarroot.mk	2006-11-29 19:28:41 UTC (rev 16726)
@@ -10,15 +10,15 @@
 TAR_COMPRESSOR:=
 TAR_COMPRESSOR_EXT:=.none
 ifeq ($(BR2_TARGET_ROOTFS_TAR_GZIP),y)
-TAR_COMPRESSOR:=gzip -9
+TAR_COMPRESSOR:=gzip -9 -c
 TAR_COMPRESSOR_EXT:=gz
 endif
 ifeq ($(BR2_TARGET_ROOTFS_TAR_BZIP2),y)
-TAR_COMPRESSOR:=bzip2 -9
+TAR_COMPRESSOR:=bzip2 -9 -c
 TAR_COMPRESSOR_EXT:=bz2
 endif
 ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
-TAR_COMPRESSOR:=lzma -9
+TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
 
@@ -42,7 +42,7 @@
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TAR_COMPRESSOR),)
 	-rm -f $(TAR_TARGET).$()
-	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET)
+	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
 endif
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
