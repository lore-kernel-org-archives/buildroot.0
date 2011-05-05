From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 May 2011 23:39:03 +0200
Subject: [Buildroot] [git commit] Add toolchain wrapper for external
	toolchains
Message-ID: <20110505214443.D14E582DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85dc57f6fd2755d8f5b193f369dad35796e764c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple toolchain wrapper for external toolchains, which forces the
correct sysroot/march/mtune/floating point options needed to use it
with buildroot.

With this in place the external toolchain behaves similar to the internal
ones, and the special handling can be removed. This also means that the
toolchain is usable outside buildroot without having to pass any special
compiler flags.

Also adjust the downloadable external toolchain support to install under
HOST_DIR so it can be used after the temporary build files are removed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                           |    4 +-
 package/Makefile.in                                |   12 +---
 toolchain/toolchain-external/ext-tool.mk           |   84 ++++++++++++++++++--
 .../toolchain-external/ext-toolchain-wrapper.c     |   75 +++++++++++++++++
 4 files changed, 154 insertions(+), 21 deletions(-)
 create mode 100644 toolchain/toolchain-external/ext-toolchain-wrapper.c

diff --git a/Makefile b/Makefile
index d4f5e15..2c5aefe 100644
--- a/Makefile
+++ b/Makefile
@@ -284,7 +284,6 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
-TOOLCHAIN_EXTERNAL_DIR=$(BASE_DIR)/external-toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
@@ -625,8 +624,7 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
-		$(TOOLCHAIN_EXTERNAL_DIR)
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.in b/package/Makefile.in
index 391777e..faab365 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,18 +103,8 @@ TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_LOCATION=$(TOOLCHAIN_EXTERNAL_DIR)
 else
-TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-endif
-ifneq ($(TOOLCHAIN_EXTERNAL_LOCATION),)
-TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-else
-TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
-endif
+TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
 # Quotes are needed for spaces et al in path components.
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index f6249ef..0034ddf 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -41,8 +41,16 @@
 #  packages when using external toolchains. So in the end, only the
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
+#
+#  4. Build a toolchain wrapper which executes the external toolchain
+#  with a number of arguments (sysroot/march/mtune/..) hardcoded,
+#  so we're sure the correct configuration is always used and the
+#  toolchain behaves similar to an internal toolchain.
+#  This toolchain wrapper and symlinks are installed into
+#  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
+#  of Buildroot is handled identical for the 2 toolchain types.
 
-uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
+uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
@@ -97,7 +105,51 @@ endif # ! no threads
 # present in the main sysroot, and only the libraries are available in
 # each variant-specific sysroot directory.
 
-TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
+
+TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+TOOLCHAIN_EXTERNAL_DIR=$(HOST_DIR)/opt/ext-toolchain
+else
+TOOLCHAIN_EXTERNAL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+endif
+
+ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
+# if no path set, figure it out from path
+TOOLCHAIN_EXTERNAL_BIN:=$(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+else
+TOOLCHAIN_EXTERNAL_BIN:=$(TOOLCHAIN_EXTERNAL_DIR)/bin
+endif
+
+TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
+	-DBR_CROSS_PATH='"$(TOOLCHAIN_EXTERNAL_BIN)/"' \
+	-DBR_SYSROOT='"$(STAGING_DIR)"'
+
+# march/mtune/floating point mode needs to be passed to the external toolchain
+# to select the right multilib variant
+ifneq ($(CC_TARGET_TUNE_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
+endif
+ifneq ($(CC_TARGET_ARCH_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
+endif
+ifneq ($(CC_TARGET_ABI_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
+endif
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
+endif
+
+ifeq ($(BR2_VFP_FLOAT),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=vfp
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_VFPFLOAT=1
+endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
@@ -146,9 +198,9 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 $(STAMP_DIR)/ext-toolchain-checked:
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists)
-	$(Q)SYSROOT_DIR=`$(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null` ; \
+	$(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
-		SYSROOT_DIR=`readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
+		SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
 	fi ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
@@ -172,15 +224,15 @@ $(STAMP_DIR)/ext-toolchain-checked:
 # the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
 # to $(STAGING_DIR).
 $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	$(Q)SYSROOT_DIR=`$(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null` ; \
+	$(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
-		SYSROOT_DIR=`readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
+		SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
 	fi ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	ARCH_SUBDIR=`$(TARGET_CC_NO_SYSROOT) $(TARGET_CFLAGS) -print-multi-directory` ; \
+	ARCH_SUBDIR=`$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-multi-directory` ; \
 	ARCH_SYSROOT_DIR=$${SYSROOT_DIR}/$${ARCH_SUBDIR} ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	echo "Copy external toolchain libraries to target..." ; \
@@ -196,3 +248,21 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 		$(call create_lib64_symlinks) ; \
 	fi ; \
 	touch $@
+
+# Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
+# symlinks for everything else
+$(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
+	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
+	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
+		case "$$i" in \
+		*cc|*cc-*|*++|*++-*|*cpp) \
+			base=$${i##*/}; \
+			ln -sf $(@F) $$base; \
+			;; \
+		*) \
+			ln -sf $$i .; \
+			;; \
+		esac; \
+	done ;
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
+		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
new file mode 100644
index 0000000..a485e74
--- /dev/null
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -0,0 +1,75 @@
+/**
+ * Buildroot wrapper for external toolchains. This simply executes the real
+ * toolchain with a number of arguments (sysroot/arch/..) hardcoded,
+ * to ensure the external toolchain uses the correct configuration.
+ *
+ * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <limits.h>
+#include <unistd.h>
+
+#define MAXARGS 1000
+
+static char path[PATH_MAX] = BR_CROSS_PATH;
+
+static char *args[MAXARGS] = {
+	path,
+	"--sysroot", BR_SYSROOT,
+#ifdef BR_ARCH
+	"-march=" BR_ARCH,
+#endif /* BR_ARCH */
+#ifdef BR_TUNE
+	"-mtune=" BR_TUNE,
+#endif /* BR_TUNE */
+#ifdef BR_ABI
+	"-mabi=" BR_ABI,
+#endif
+#ifdef BR_SOFTFLOAT
+	"-msoft-float",
+#endif /* BR_SOFTFLOAT */
+#ifdef BR_VFPFLOAT
+	"-mfpu=vfp",
+#endif /* BR_VFPFLOAT */
+};
+
+static const char *get_basename(const char *name)
+{
+	const char *base;
+
+	base = strrchr(name, '/');
+	if (base)
+		base++;
+	else
+		base = name;
+
+	return base;
+}
+
+int main(int argc, char **argv)
+{
+	int i;
+
+	for (i=0; args[i]; i++);
+
+	if ((argc+i) >= MAXARGS) {
+		fputs("Too many arguments\n", stderr);
+		return 1;
+	}
+
+	/* forward args */
+	memcpy(&args[i], &argv[1], sizeof(argv[0]) * (argc - 1));
+
+	strcat(path, get_basename(argv[0]));
+
+	if (execv(path, args))
+		perror(path);
+
+	return 2;
+}
-- 
1.7.3.4
