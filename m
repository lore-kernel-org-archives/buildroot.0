From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 11:16:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/tar
Message-ID: <20061129191649.DD4C648594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 11:16:48 -0800 (Wed, 29 Nov 2006)
New Revision: 16725

Log:
- provide a choice to select the compressor to use for the final rootfs.
  Closes #1014


Modified:
   trunk/buildroot/target/tar/Config.in
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/tar/Config.in
===================================================================
--- trunk/buildroot/target/tar/Config.in	2006-11-29 19:02:47 UTC (rev 16724)
+++ trunk/buildroot/target/tar/Config.in	2006-11-29 19:16:48 UTC (rev 16725)
@@ -4,11 +4,46 @@
 	help
 	  Build a tar archive of the root filesystem
 
+choice
+	prompt "Compression method"
+	default BR2_TARGET_ROOTFS_TAR_NONE
+	depends on BR2_TARGET_ROOTFS_TAR
+	help
+	  Select compressor for tar archive of the root filesystem
+
+config BR2_TARGET_ROOTFS_TAR_NONE
+	bool "no compression"
+	help
+	 Do not compress the tarball.
+
+config BR2_TARGET_ROOTFS_TAR_GZIP
+	bool "gzip"
+	help
+	 Do compress the tarball with gzip.
+	 Note that you either have to have gzip installed on your host
+	 or select to build a gzip for your host. See the packages submenu.
+
+config BR2_TARGET_ROOTFS_TAR_BZIP2
+	bool "bzip2"
+	help
+	 Do compress the tarball with bzip2.
+	 Note that you either have to have bzip2 installed on your host
+	 or select to build a bzip2 for your host. See the packages submenu.
+
+config BR2_TARGET_ROOTFS_TAR_LZMA
+	bool "lzma"
+	help
+	 Do compress the tarball with lzma.
+	 Note that you either have to have lzma installed on your host
+	 or select to build a lzma for your host. See the packages submenu.
+
+endchoice
+
 config BR2_TARGET_ROOTFS_TAR_OPTIONS
-	string "random options to pass to tar"
+	string "other random options to pass to tar"
 	depends on BR2_TARGET_ROOTFS_TAR
 	default ""
 	help
-	  Common options:
-	   j - compress with bzip2
-	   z - compress with gzip
+	  Any other flags you want to pass to tar
+	  Refer to tar --help for details
+

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2006-11-29 19:02:47 UTC (rev 16724)
+++ trunk/buildroot/target/tar/tarroot.mk	2006-11-29 19:16:48 UTC (rev 16725)
@@ -7,6 +7,21 @@
 TAR_OPTS:=$(strip $(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 TAR_TARGET:=$(IMAGE).tar
 
+TAR_COMPRESSOR:=
+TAR_COMPRESSOR_EXT:=.none
+ifeq ($(BR2_TARGET_ROOTFS_TAR_GZIP),y)
+TAR_COMPRESSOR:=gzip -9
+TAR_COMPRESSOR_EXT:=gz
+endif
+ifeq ($(BR2_TARGET_ROOTFS_TAR_BZIP2),y)
+TAR_COMPRESSOR:=bzip2 -9
+TAR_COMPRESSOR_EXT:=bz2
+endif
+ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
+TAR_COMPRESSOR:=lzma -9
+TAR_COMPRESSOR_EXT:=lzma
+endif
+
 tarroot: host-fakeroot makedevs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -25,6 +40,10 @@
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+ifneq ($(TAR_COMPRESSOR),)
+	-rm -f $(TAR_TARGET).$()
+	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET)
+endif
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 tarroot-source:
