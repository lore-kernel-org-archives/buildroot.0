From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:31 +0200
Subject: [Buildroot] [PATCH 08/14] remove BR2_FPU_SUFFIX
In-Reply-To: <53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
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
index 9101b2a..ca6b298 100644
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
index eb4fccb..a408caa 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -79,18 +79,12 @@ XXXX=xxxx
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
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -101,7 +95,7 @@ TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ROOTFS_SUFFIX)
 
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
-- 
1.6.3.3
