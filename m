From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  5 Oct 2007 05:55:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package target/cpio
	target/ext2 target/j etc...
Message-ID: <20071005125541.34F47A4692@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-05 05:55:40 -0700 (Fri, 05 Oct 2007)
New Revision: 20180

Log:
- fix some whitespace damage..
- add COPYTO settings for cpio and tar and remove that ugly hardcoded DATE from that was added by Ulf


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/target/cpio/Config.in
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/linux/Config.in
   trunk/buildroot/target/tar/Config.in
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/package/Makefile.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -72,7 +72,7 @@
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)-$(DATE)
+IMAGE:=$(BINARIES_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-

Modified: trunk/buildroot/target/cpio/Config.in
===================================================================
--- trunk/buildroot/target/cpio/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/cpio/Config.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -40,3 +40,12 @@
 
 endchoice
 
+config BR2_TARGET_ROOTFS_CPIO_COPYTO
+	string "also copy the image to..."
+	depends on BR2_TARGET_ROOTFS_CPIO
+	default ""
+	help
+	  Copies the resulting image to a secondary location
+	  like a tftp server's root directory.
+	  
+	  Example: $(IMAGE)-$(DATE).cpio$(CPIO_ROOTFS_COMPRESSOR_EXT)

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-10-05 12:55:40 UTC (rev 20180)
@@ -31,6 +31,9 @@
 CPIO_TARGET := $(CPIO_BASE)
 endif
 
+ROOTFS_CPIO_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_CPIO_COPYTO)))
+# "))
+#
 
 cpioroot-init:
 	rm -f $(TARGET_DIR)/init
@@ -61,11 +64,19 @@
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	#- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+ifeq ($(CPIO_ROOTFS_COMPRESSOR),)
+ifneq ($(ROOTFS_CPIO_COPYTO),)
+	$(Q)cp -f $(CPIO_BASE) $(ROOTFS_CPIO_COPYTO)
+endif
+endif
 
 ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
 $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT): $(CPIO_ROOTFS_COMPRESSOR_PREREQ) $(CPIO_BASE)
 	$(CPIO_ROOTFS_COMPRESSOR) $(CPIO_BASE) > $(CPIO_TARGET)
+ifneq ($(ROOTFS_CPIO_COPYTO),)
+	$(Q)cp -f $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT) $(ROOTFS_CPIO_COPYTO).$(CPIO_ROOTFS_COMPRESSOR_EXT)
 endif
+endif
 
 cpioroot: $(CPIO_TARGET)
 

Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/ext2/Config.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -8,12 +8,12 @@
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	depends on BR2_TARGET_ROOTFS_EXT2
-	default	0
+	default 0
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "inodes (leave at 0 for auto calculation)"
 	depends on BR2_TARGET_ROOTFS_EXT2
-	default	0
+	default 0
 
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
@@ -22,7 +22,7 @@
 
 config BR2_TARGET_ROOTFS_EXT2_SQUASH
 	bool "Make all files be owned by root"
-	depends on 	BR2_TARGET_ROOTFS_EXT2
+	depends on  BR2_TARGET_ROOTFS_EXT2
 	default y
 
 config BR2_TARGET_ROOTFS_EXT2_OUTPUT
@@ -31,44 +31,45 @@
 	default "$(IMAGE).ext2"
 
 choice
-        prompt "Compression method"
-        default BR2_TARGET_ROOTFS_EXT2_NONE
-        depends on BR2_TARGET_ROOTFS_EXT2
-        help
-          Select compressor for ext2 filesystem of the root filesystem
+	prompt "Compression method"
+	default BR2_TARGET_ROOTFS_EXT2_NONE
+	depends on BR2_TARGET_ROOTFS_EXT2
+	help
+	  Select compressor for ext2 filesystem of the root filesystem
 
 config BR2_TARGET_ROOTFS_EXT2_NONE
-        bool "no compression"
-        help
-         Do not compress the ext2 filesystem.
+	bool "no compression"
+	help
+	  Do not compress the ext2 filesystem.
 
 config BR2_TARGET_ROOTFS_EXT2_GZIP
-        bool "gzip"
-        help
-         Do compress the ext2 filesystem with gzip.
-         Note that you either have to have gzip installed on your host
-         or select to build a gzip for your host. See the packages submenu.
+	bool "gzip"
+	help
+	  Do compress the ext2 filesystem with gzip.
+	  Note that you either have to have gzip installed on your host
+	  or select to build a gzip for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_EXT2_BZIP2
-        bool "bzip2"
-        help
-         Do compress the ext2 filesystem with bzip2.
-         Note that you either have to have bzip2 installed on your host
-         or select to build a bzip2 for your host. See the packages submenu.
+	bool "bzip2"
+	help
+	  Do compress the ext2 filesystem with bzip2.
+	  Note that you either have to have bzip2 installed on your host
+	  or select to build a bzip2 for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_EXT2_LZMA
-        bool "lzma"
-        help
-         Do compress the ext2 filesystem with lzma.
-         Note that you either have to have lzma installed on your host
-         or select to build a lzma for your host. See the packages submenu.
+	bool "lzma"
+	help
+	  Do compress the ext2 filesystem with lzma.
+	  Note that you either have to have lzma installed on your host
+	  or select to build a lzma for your host. See the packages submenu.
 
 endchoice
 
 config BR2_TARGET_ROOTFS_EXT2_COPYTO
 	string "also copy the image to..."
-	depends on 	BR2_TARGET_ROOTFS_EXT2
+	depends on BR2_TARGET_ROOTFS_EXT2
 	default ""
 	help
 	  Copies the resulting image to a secondary location
 	  like a tftp server's root directory.
+

Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/jffs2/Config.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -49,7 +49,7 @@
 	default 0x2100
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
-	bool	"Do not use Cleanmarker"
+	bool "Do not use Cleanmarker"
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	default n
 	help
@@ -79,17 +79,17 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
-	depends on 	BR2_TARGET_ROOTFS_JFFS2
+	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_BE
 	bool "big-endian"
-	depends on 	BR2_TARGET_ROOTFS_JFFS2
+	depends on BR2_TARGET_ROOTFS_JFFS2
 
 endchoice
 
 config BR2_TARGET_ROOTFS_JFFS2_SQUASH
 	bool "Make all files be owned by root"
-	depends on 	BR2_TARGET_ROOTFS_JFFS2
+	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
 	string "Output File"
@@ -98,7 +98,7 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_COPYTO
 	string "also copy the image to..."
-	depends on 	BR2_TARGET_ROOTFS_JFFS2
+	depends on BR2_TARGET_ROOTFS_JFFS2
 	default ""
 	help
 	  Copies the resulting image to a secondary location.

Modified: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/linux/Config.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -10,7 +10,7 @@
 
 	  Note: Requires kernel-headers >= 2.6.19 since the other
 	        kernel headers are just that (headers) and not full
-		kernels. This is a feature.
+	        kernels. This is a feature.
 
 config BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG
 	bool "linux kernel experimental configuration"

Modified: trunk/buildroot/target/tar/Config.in
===================================================================
--- trunk/buildroot/target/tar/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/tar/Config.in	2007-10-05 12:55:40 UTC (rev 20180)
@@ -48,3 +48,13 @@
 	  Any other flags you want to pass to tar
 	  Refer to tar --help for details
 
+config BR2_TARGET_ROOTFS_TAR_COPYTO
+	string "also copy the image to..."
+	depends on BR2_TARGET_ROOTFS_TAR
+	default ""
+	help
+	  Copies the resulting image to a secondary location
+	  like a tftp server's root directory.
+
+	  Example: $(IMAGE)-$(DATE).tar
+

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-10-05 11:06:56 UTC (rev 20179)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-10-05 12:55:40 UTC (rev 20180)
@@ -21,6 +21,8 @@
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
+ROOTFS_TAR_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO)))
+# "))
 
 tarroot: host-fakeroot makedevs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
@@ -50,8 +52,15 @@
 	-rm -f $(TAR_TARGET).$()
 	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
 endif
+ifneq ($(ROOTFS_TAR_COPYTO),)
+	$(Q)cp -f $(TAR_TARGET) $(ROOTFS_TAR_COPYTO)
+endif
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
+EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
+# "))
+
+
 tarroot-source:
 
 tarroot-clean:
