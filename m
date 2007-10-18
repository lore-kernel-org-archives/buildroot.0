From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 05:38:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20071018123827.74BA2A6830@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 05:38:26 -0700 (Thu, 18 Oct 2007)
New Revision: 20287

Log:
Allow to remove _nofpu from directories and images

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-10-18 12:37:36 UTC (rev 20286)
+++ trunk/buildroot/Config.in	2007-10-18 12:38:26 UTC (rev 20287)
@@ -84,6 +84,14 @@
 	  Most people will leave this set to the default value of
 	  "$(BUILD_DIR)/staging_dir".
 
+config BR2_FPU_SUFFIX
+	bool "Add '_nofpu' suffix for softfloat toolchains"
+	default n
+	help
+	  If the toolchain is configured to use softfloat, then
+	  the "_nofpu" suffix will be added to the toolchain build
+	  directory name and to any rootfs image name
+
 config BR2_TOPDIR_PREFIX
 	string "Custom build dir prefix"
 	default ""

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-18 12:37:36 UTC (rev 20286)
+++ trunk/buildroot/package/Makefile.in	2007-10-18 12:38:26 UTC (rev 20287)
@@ -74,12 +74,18 @@
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
+ifeq ($(strip $(subst ",, $(BR2_FPU_SUFFIX))),y)
+COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
+else
+COND_ARCH_FPU_SUFFIX:=
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -90,10 +96,10 @@
 TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 #"))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
