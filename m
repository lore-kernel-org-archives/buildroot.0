From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Mon,  7 May 2018 14:10:31 +0200
Subject: [Buildroot] [RFC PATCH v2] toolchain: Integrate annobin gcc plugin
In-Reply-To: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
References: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
Message-ID: <20180507121032.25794-3-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch integrates the annobin gcc plugin into the toolchain by adding a
-fplugin=<path>/annobin.so flag to the toolchain wrapper.

This introduces a dependency on the host-annobin package to the toolchain,
so in order to break the circular dependency, the dependency on the toolchain
in the annobin package is shortcircuted to either toolchain-buildroot or
toolchain-external.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/annobin/annobin.mk                             | 8 +++++++-
 package/gcc/gcc-final/gcc-final.mk                     | 3 +++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +++
 toolchain/toolchain-wrapper.c                          | 3 +++
 toolchain/toolchain/toolchain.mk                       | 4 ++++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/annobin/annobin.mk b/package/annobin/annobin.mk
index 32a5d4b6f0..c1ee4e84f2 100644
--- a/package/annobin/annobin.mk
+++ b/package/annobin/annobin.mk
@@ -8,7 +8,13 @@ ANNOBIN_VERSION = 5.6
 ANNOBIN_SOURCE = annobin-$(ANNOBIN_VERSION).tar.xz
 ANNOBIN_SITE = https://nickc.fedorapeople.org
 
-HOST_ANNOBIN_DEPENDENCIES += toolchain
+# toolchain depends on host-annobin, so shortcircuit the reverse
+# dependency to avoid a circular dependency
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_ANNOBIN_DEPENDENCIES += toolchain-buildroot
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+HOST_ANNOBIN_DEPENDENCIES += toolchain-external
+endif
 
 # The plugin has to be configured with the same arcane configure
 # scripts used by gcc, this prevents regeneration of the scripts.
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9897d18682..2dd28b7a40 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -116,6 +116,9 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 
 HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
+ifeq ($(BR2_PACKAGE_HOST_ANNOBIN),y)
+HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(HOST_ANNOBIN_GCC_PLUGIN)"'
+endif
 HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8b2c283654..73af6777ed 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -241,6 +241,9 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ANNOBIN),y)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(HOST_ANNOBIN_GCC_PLUGIN)"'
+endif
 
 #
 # The following functions creates the symbolic links needed to get the
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c5eb813dd0..d45c9d4f59 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -94,6 +94,9 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
+#ifdef BR_ANNOBIN_GCC_PLUGIN
+        "-fplugin=" BR_ANNOBIN_GCC_PLUGIN,
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 91c9ca2eff..5e59e277a1 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -10,6 +10,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ANNOBIN),y)
+TOOLCHAIN_DEPENDENCIES += host-annobin
+endif
+
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
-- 
2.17.0
