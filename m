From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2009 14:47:35 +0200
Subject: [Buildroot] [git commit master] Remove BR2_TOPDIR_PREFIX and
	BR2_TOPDIR_SUFFIX
Message-ID: <20090919152748.5A3C977737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fd3800c1979d9d76e2c4f802c2d279290c102218
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The same effect can be done using out-of-tree build with O=

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           |   18 ------------------
 Makefile            |   11 +----------
 package/Makefile.in |    6 +++---
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/Config.in b/Config.in
index 146bb17..2573643 100644
--- a/Config.in
+++ b/Config.in
@@ -106,24 +106,6 @@ config BR2_FPU_SUFFIX
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
index 8b07786..d493200 100644
--- a/Makefile
+++ b/Makefile
@@ -230,21 +230,12 @@ endif
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
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
1.6.3.3
