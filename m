From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  7 Mar 2007 06:32:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: bash bison
	dropbear e2fsprogs file flex etc...
Message-ID: <20070307143223.59C0C480A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-07 06:32:22 -0800 (Wed, 07 Mar 2007)
New Revision: 18023

Log:
- some more CONFIG_UPDATEs by Haavard Skinnemoen


Modified:
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/bash/bash.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -23,7 +23,7 @@
 	# This is broken when -lintl is added to LIBS
 	$(SED) 's,LIBS_FOR_BUILD =.*,LIBS_FOR_BUILD =,g' \
 		$(BASH_DIR)/builtins/Makefile.in
-	$(CONFIG_UPDATE) $(BASH_DIR)
+	$(CONFIG_UPDATE) $(BASH_DIR)/support
 	touch $@
 
 $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked

Modified: trunk/buildroot/package/bison/bison.mk
===================================================================
--- trunk/buildroot/package/bison/bison.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/bison/bison.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -18,6 +18,7 @@
 
 $(BISON_DIR)/.unpacked: $(DL_DIR)/$(BISON_SOURCE)
 	$(BISON_CAT) $(DL_DIR)/$(BISON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(BISON_DIR)/build-aux
 	touch $(BISON_DIR)/.unpacked
 
 $(BISON_DIR)/.configured: $(BISON_DIR)/.unpacked

Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -20,6 +20,7 @@
 	$(DROPBEAR_CAT) $(DL_DIR)/$(DROPBEAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(DROPBEAR_DIR) package/dropbear/ dropbear\*.patch
 	$(SED) 's,^/\* #define DROPBEAR_MULTI.*,#define DROPBEAR_MULTI,g' $(DROPBEAR_DIR)/options.h
+	$(CONFIG_UPDATE) $(DROPBEAR_DIR)
 	touch $(DROPBEAR_DIR)/.unpacked
 
 $(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked

Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -23,6 +23,7 @@
 $(E2FSPROGS_DIR)/.unpacked: $(DL_DIR)/$(E2FSPROGS_SOURCE)
 	$(E2FSPROGS_CAT) $(DL_DIR)/$(E2FSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(E2FSPROGS_DIR) package/e2fsprogs/ e2fsprogs\*.patch
+	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
 	touch $(E2FSPROGS_DIR)/.unpacked
 
 $(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked

Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/file/file.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -54,6 +54,7 @@
 $(FILE_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
 	$(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(FILE_SOURCE_DIR) package/file/ file\*.patch
+	$(CONFIG_UPDATE) $(FILE_SOURCE_DIR)
 	touch $(FILE_SOURCE_DIR)/.unpacked
 
 $(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked

Modified: trunk/buildroot/package/flex/flex.mk
===================================================================
--- trunk/buildroot/package/flex/flex.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/flex/flex.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -29,6 +29,7 @@
 		toolchain/patch-kernel.sh $(FLEX_DIR) $(FLEX_DIR)/debian/patches \*.patch ; \
 	fi
 endif
+	$(CONFIG_UPDATE) $(FLEX_DIR)
 	touch $@
 
 $(FLEX_DIR)/.configured: $(FLEX_DIR)/.unpacked

Modified: trunk/buildroot/package/gawk/gawk.mk
===================================================================
--- trunk/buildroot/package/gawk/gawk.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/gawk/gawk.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -19,6 +19,7 @@
 $(GAWK_DIR)/.unpacked: $(DL_DIR)/$(GAWK_SOURCE)
 	$(GAWK_CAT) $(DL_DIR)/$(GAWK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GAWK_DIR) package/gawk gawk\*.patch
+	$(CONFIG_UPDATE) $(GAWK_DIR)
 	touch $(GAWK_DIR)/.unpacked
 
 $(GAWK_DIR)/.configured: $(GAWK_DIR)/.unpacked

Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -34,6 +34,7 @@
 
 $(LIBPNG_DIR)/.unpacked: $(DL_DIR)/$(LIBPNG_SOURCE)
 	$(LIBPNG_CAT) $(DL_DIR)/$(LIBPNG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBPNG_DIR)
 	touch $(LIBPNG_DIR)/.unpacked
 
 $(LIBPNG_DIR)/.configured: $(LIBPNG_DIR)/.unpacked

Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/make/make.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -18,6 +18,7 @@
 
 $(GNUMAKE_DIR)/.unpacked: $(DL_DIR)/$(GNUMAKE_SOURCE)
 	$(GNUMAKE_CAT) $(DL_DIR)/$(GNUMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(GNUMAKE_DIR)/config
 	touch $(GNUMAKE_DIR)/.unpacked
 
 $(GNUMAKE_DIR)/.configured: $(GNUMAKE_DIR)/.unpacked

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-03-07 09:47:39 UTC (rev 18022)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-03-07 14:32:22 UTC (rev 18023)
@@ -27,6 +27,7 @@
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ *.patch
+	$(CONFIG_UPDATE) $(NFS_UTILS_DIR)
 	touch $@
 
 $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
