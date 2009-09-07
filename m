From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Sep 2009 00:09:53 +0200
Subject: [Buildroot] [PATCH 5/5] Rename the output directories
In-Reply-To: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <91f41119dff00090c4984705e86782b2f6efd1cc.1252361088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the output directory, we now have

 - build/    where all the packages are built
 - images/   where the final kernel and rootfs images are stored
 - staging/  the staging directory (containing the development files
             and libraries compiled for the target)
 - target/   which contains the target root filesystem
 - host/     which contains all the host programs
 - stamps/   which contains the stamps files

Therefore, the build_ARCH and toolchain_build_ARCH have been
removed. People willing to use the same Buildroot sources to compile
for different architectures are invited to use the O= command line
option for out-of-tree compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           |    4 ++--
 Makefile            |   10 +++++-----
 package/Makefile.in |    5 ++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Config.in b/Config.in
index 07a654c..99a543b 100644
--- a/Config.in
+++ b/Config.in
@@ -80,7 +80,7 @@ source	"target/device/Config.in.mirrors"
 
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
-	default "$(BUILD_DIR)/staging_dir"
+	default "$(BASE_DIR)/staging"
 	help
 	  This is the location where the toolchain will be installed.  The
 	  toolchain will not work if it is moved from this location.
@@ -89,7 +89,7 @@ config BR2_STAGING_DIR
 	  will be used.
 
 	  Most people will leave this set to the default value of
-	  "$(BUILD_DIR)/staging_dir".
+	  "$(BASE_DIR)/staging".
 
 config BR2_FPU_SUFFIX
 	bool "Add '_nofpu' suffix for softfloat toolchains"
diff --git a/Makefile b/Makefile
index 412189c..1c10f4c 100644
--- a/Makefile
+++ b/Makefile
@@ -235,20 +235,20 @@ ifeq ($(DL_DIR),)
 DL_DIR:=$(BASE_DIR)/dl
 endif
 
-BUILD_DIR:=$(BASE_DIR)/build_$(ARCH)$(ARCH_FPU_SUFFIX)
+BUILD_DIR:=$(BASE_DIR)/build
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
 STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
 
 # packages compiled for the host goes here
-HOST_DIR:=$(BUILD_DIR)/host_dir
+HOST_DIR:=$(BASE_DIR)/host
 
 # stamp (dependency) files go here
-STAMP_DIR:=$(BUILD_DIR)/stamps
+STAMP_DIR:=$(BASE_DIR)/stamps
 
-BINARIES_DIR:=$(BASE_DIR)/binaries/
-TARGET_DIR:=$(BUILD_DIR)/target_dir
+BINARIES_DIR:=$(BASE_DIR)/images
+TARGET_DIR:=$(BASE_DIR)/target
 
 # define values for prepatched source trees for toolchains
 VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
diff --git a/package/Makefile.in b/package/Makefile.in
index 093108d..1c21924 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,7 +112,7 @@ COND_ARCH_FPU_SUFFIX:=
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
@@ -124,8 +124,7 @@ KERNEL_CROSS=$(TARGET_CROSS)
 else
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-#TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOL_BUILD_DIR=$(BASE_DIR)/toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)
+TOOL_BUILD_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
-- 
1.6.0.4
