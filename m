From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 15:01:53 +0100
Subject: [Buildroot] [git commit] toolchain: add link-time-optimization
	support
Message-ID: <20150307142749.E241880468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=814f63ec32585f281855587fe0a287cee32e4232
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new option BR2_GCC_ENABLE_LTO that builds gcc and binutils with
LTO support.

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

[Thomas:
  - Add a separate BR2_BINUTILS_ENABLE_LTO option to enable LTO
    support in binutils. This is a blind option, selected by
    BR2_GCC_ENABLE_LTO. It just avoids having binutils.mk poke
    directly into gcc Config.in options.
  - Remove the check on the AVR32 special gcc version, which we don't
    support anymore.
  - Adapt the help text of the LTO Config.in option to no longer
    mention "Since version 4.5", since we only support gcc >= 4.5 in
    Buildroot anyway.
  - Fix typo in toolchain-external.mk comment.]

Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |    3 +++
 package/binutils/binutils.mk                       |    4 ++++
 package/gcc/Config.in.host                         |    7 +++++++
 package/gcc/gcc.mk                                 |    4 ++++
 toolchain/toolchain-external/toolchain-external.mk |    8 ++++++++
 5 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index d0ed84e..4049cf6 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -38,6 +38,9 @@ config BR2_BINUTILS_VERSION
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
 	default "2.25"		if BR2_BINUTILS_VERSION_2_25
 
+config BR2_BINUTILS_ENABLE_LTO
+	bool
+
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9e99253..ac62f1f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -96,5 +96,9 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
+ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
+HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e07d881..1a5281c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -116,6 +116,13 @@ config BR2_GCC_ENABLE_TLS
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
 
+config BR2_GCC_ENABLE_LTO
+	bool "Enable compiler link-time-optimization support"
+	select BR2_BINUTILS_ENABLE_LTO
+	help
+	  This option enables link-time optimization (LTO) support in
+	  gcc.
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
index 78138d3..612c49d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -647,12 +647,20 @@ endif
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
+# When the link-time-optimazation flag '-flto' is used, then the compiler
+# and binutils have to support lto. ar/ranlib need to be called with the
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
