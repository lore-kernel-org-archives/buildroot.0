From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri,  6 Mar 2015 13:34:06 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: add link-time-optimization
	support
Message-ID: <1425645246-3800-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new option BR2_GCC_ENABLE_LTO that builds gcc and binutils with LTO support.

Individual packages still have to enable LTO explicitly by passing '-flto' to
GCC, which passes it on to the linker. This option does not add that flag
globally. Some packages detect if the compiler supports LTO and enable the flag
if it does.

To support LTO, ar and ranlib must be called with an argument which triggers the
usage of the LTO plugin. Since GCC doesn't call these tools itself, it instead
provides wrappers for ar and ranlib that pass the LTO arguments. This way
existing Makefiles don't need to be changed for LTO support. However, these
wrappers are called <tuple>-gcc-ar which matches the pattern to link to the
buildroot wrapper in the external toolchain logic. So the external toolchain
logic is updated to provide the correct symlink.

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---

Changes vor v2:
    - update commit message
    - UI text change for BR2_GCC_ENABLE_LTO

 package/binutils/binutils.mk                       | 4 ++++
 package/gcc/Config.in.host                         | 7 +++++++
 package/gcc/gcc.mk                                 | 4 ++++
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9e99253..daa8c45 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -96,5 +96,9 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e07d881..fe8bfdf 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -116,6 +116,13 @@ config BR2_GCC_ENABLE_TLS
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
 
+config BR2_GCC_ENABLE_LTO
+	bool "Enable compiler link-time-optimization support"
+	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	help
+	  Since version 4.5, GCC supports link-time optimization (LTO).
+	  Select this option to turn on LTO support in GCC.
+
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ffac15c..b5d2ddb 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -132,6 +132,10 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --disable-tls
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
 else
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 78138d3..3eaf934 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -647,12 +647,20 @@ endif
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
+# When the link-time-optimazation flag '-flto' is used, then the compiler
+# and binutils have to support lto. ar/ranlib needs to be called with the
+# lto plugin. The wrappers *-gcc-ar and *-gcc-ranlib provided by GCC could
+# be used as drop-ins for ar/runlib when Makefiles are used which do not
+# pass the lto arguments.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
+		*-ar|*-ranlib|*-nm) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
 			ln -sf ext-toolchain-wrapper $$base; \
 			;; \
-- 
2.3.0
