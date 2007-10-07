From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  7 Oct 2007 11:23:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20071007182301.E9647A6AAE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-07 11:23:01 -0700 (Sun, 07 Oct 2007)
New Revision: 20196

Log:
Allow date to be added to Image

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-10-07 18:10:44 UTC (rev 20195)
+++ trunk/buildroot/Config.in	2007-10-07 18:23:01 UTC (rev 20196)
@@ -102,6 +102,19 @@
 	  build_ARCH -> build_ARCH_[SUFFIX]
 	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX]
 
+config BR2_ROOTFS_PREFIX
+	string "Custom root fs prefix"
+	default "rootfs"
+	help
+	  Add a custom string to the beginning of the root file system name.
+
+config BR2_ROOTFS_SUFFIX
+	string "Custom root fs suffix"
+	default "$(DATE)" if BR2_TARGET_ATMEL
+	default "" if !BR2_TARGET_ATMEL
+	help
+	  Add a custom string to the end of the root file system name.
+
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-07 18:10:44 UTC (rev 20195)
+++ trunk/buildroot/package/Makefile.in	2007-10-07 18:23:01 UTC (rev 20196)
@@ -65,14 +65,18 @@
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
+ifeq ($(BR2_ROOTFS_SUFFIX),)
+ROOTFS_SUFFIX:=
+else
+ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
+endif
 
-
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -82,9 +86,11 @@
 #"))
 TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 #"))
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+#TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)-$(DATE)
+#IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
