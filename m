From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Sep 2009 00:09:52 +0200
Subject: [Buildroot] [PATCH 4/5] Remove BR2_TOPDIR_PREFIX and
	BR2_TOPDIR_SUFFIX
In-Reply-To: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2f7f4e844f89b99bde1ab32524d43ee7a82825a5.1252361088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same effect can be done using out-of-tree build with O=

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           |   18 ------------------
 Makefile            |   11 +----------
 package/Makefile.in |    6 +++---
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/Config.in b/Config.in
index 1881f82..07a654c 100644
--- a/Config.in
+++ b/Config.in
@@ -98,24 +98,6 @@ config BR2_FPU_SUFFIX
 	  the "_nofpu" suffix will be added to the toolchain build
 	  directory name and to any rootfs image name
 
-config BR2_TOPDIR_PREFIX
-	string "Custom build dir prefix"
-	default ""
-	help
-	  Add a custom string to the beginning of the build directories.
-
-	  build_ARCH -> [PREFIX]_build_ARCH
-	  toolchain_build_ARCH -> [PREFIX]_toolchain_build_ARCH
-
-config BR2_TOPDIR_SUFFIX
-	string "Custom build dir suffix"
-	default ""
-	help
-	  Add a custom string to the end of the build directories.
-
-	  build_ARCH -> build_ARCH_[SUFFIX]
-	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX]
-
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"
diff --git a/Makefile b/Makefile
index 1fe9351..412189c 100644
--- a/Makefile
+++ b/Makefile
@@ -230,21 +230,12 @@ else
 BASE_DIR := $(shell mkdir -p output && cd output && pwd)
 endif
 
-TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
-TOPDIR_SUFFIX:=_$(call qstrip,$(BR2_TOPDIR_SUFFIX))
-ifeq ($(TOPDIR_PREFIX),_)
-TOPDIR_PREFIX:=
-endif
-ifeq ($(TOPDIR_SUFFIX),_)
-TOPDIR_SUFFIX:=
-endif
-
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(BASE_DIR)/dl
 endif
 
-BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+BUILD_DIR:=$(BASE_DIR)/build_$(ARCH)$(ARCH_FPU_SUFFIX)
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 0ae5bdb..093108d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,7 +112,7 @@ COND_ARCH_FPU_SUFFIX:=
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
@@ -124,8 +124,8 @@ KERNEL_CROSS=$(TARGET_CROSS)
 else
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-#TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+#TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
-- 
1.6.0.4
