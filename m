From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:04 +0200
Subject: [Buildroot] [PATCH 2/6] always append FPU_SUFFIX
In-Reply-To: <1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 Config.in           |    7 -------
 package/Makefile.in |   10 ++--------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Config.in b/Config.in
index cc83a6a..86e50ac 100644
--- a/Config.in
+++ b/Config.in
@@ -99,13 +99,6 @@ config BR2_STAGING_DIR
 	  Most people will leave this set to the default value of
 	  "$(BASE_DIR)/staging".
 
-config BR2_FPU_SUFFIX
-	bool "Add '_nofpu' suffix for softfloat toolchains"
-	help
-	  If the toolchain is configured to use softfloat, then
-	  the "_nofpu" suffix will be added to the toolchain build
-	  directory name and to any rootfs image name
-
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"
diff --git a/package/Makefile.in b/package/Makefile.in
index fa7c740..fc7b312 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -105,18 +105,12 @@ XXXX=xxxx
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
-ifeq ($(call qstrip,$(BR2_FPU_SUFFIX)),y)
-COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
-else
-COND_ARCH_FPU_SUFFIX:=
-endif
-
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -127,7 +121,7 @@ TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
-- 
1.6.3.3
