From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 12:03:53 +0200
Subject: [Buildroot] [PATCH] Rename BASE_DIR to OUTPUT_DIR
Message-ID: <1253700233-11103-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reflect the new output directory hierarchy rename the Makefile
variable BASE_DIR to OUTPUT_DIR.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 Config.in           |    4 ++--
 Makefile            |   14 +++++++-------
 package/Makefile.in |    4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Config.in b/Config.in
index cc83a6a..134b5f5 100644
--- a/Config.in
+++ b/Config.in
@@ -88,7 +88,7 @@ source	"target/device/Config.in.mirrors"
 
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
-	default "$(BASE_DIR)/staging"
+	default "$(OUTPUT_DIR)/staging"
 	help
 	  This is the location where the toolchain will be installed.  The
 	  toolchain will not work if it is moved from this location.
@@ -97,7 +97,7 @@ config BR2_STAGING_DIR
 	  will be used.
 
 	  Most people will leave this set to the default value of
-	  "$(BASE_DIR)/staging".
+	  "$(OUTPUT_DIR)/staging".
 
 config BR2_FPU_SUFFIX
 	bool "Add '_nofpu' suffix for softfloat toolchains"
diff --git a/Makefile b/Makefile
index 192fdf2..eff903e 100644
--- a/Makefile
+++ b/Makefile
@@ -227,28 +227,28 @@ else
 MAKEOVERRIDES =
 endif
 
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
-$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
+OUTPUT_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
+$(if $(OUTPUT_DIR),, $(error output directory "$(O)" does not exist))
 
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
 
-BUILD_DIR:=$(BASE_DIR)/build
+BUILD_DIR:=$(OUTPUT_DIR)/build
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
 STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
 
 # packages compiled for the host goes here
-HOST_DIR:=$(BASE_DIR)/host
+HOST_DIR:=$(OUTPUT_DIR)/host
 
 # stamp (dependency) files go here
-STAMP_DIR:=$(BASE_DIR)/stamps
+STAMP_DIR:=$(OUTPUT_DIR)/stamps
 
-BINARIES_DIR:=$(BASE_DIR)/images
-TARGET_DIR:=$(BASE_DIR)/target
+BINARIES_DIR:=$(OUTPUT_DIR)/images
+TARGET_DIR:=$(OUTPUT_DIR)/target
 
 # define values for prepatched source trees for toolchains
 VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
diff --git a/package/Makefile.in b/package/Makefile.in
index fa7c740..00a1cf9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,7 +112,7 @@ COND_ARCH_FPU_SUFFIX:=
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
+TOOLCHAIN_DIR=$(OUTPUT_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
@@ -124,7 +124,7 @@ KERNEL_CROSS=$(TARGET_CROSS)
 else
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
+TOOLCHAIN_DIR=$(OUTPUT_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
-- 
1.6.3.3
