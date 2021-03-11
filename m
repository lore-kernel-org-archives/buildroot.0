From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Mar 2021 08:29:31 -0600
Subject: [Buildroot] [PATCH v11 8/9] package/clang: install a
 toolchain-wrapper for the host clang cross-compiler
In-Reply-To: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210311142932.44985-8-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

In order to use Clang as a host cross-compiler for Buildroot, we
need to provide at least the path to the sysroot (using
--sysroot) and some other compiler flags.

This series looks to reuse the toolchain wrapper for GCC since
Clang support most of the gcc flags used in the Buildroot's
toolchain wrapper. The only flag -mfused-madd (deprecated
since gcc 4.6) for mips is not supported by clang. Since
Clang require gcc >= 5.x this flag can never be used.

host-clang refers to an existing GCC-based toolchain (internal or
external) for libstdc++. However, a Buildroot external toolchain
gets a different BR_CROSS_PATH_SUFFIX. Therefore, we can't reuse the
toolchain-wrapper that gets built for the GCC-based toolchain, but
instead have to compile an additional clang-specific wrapper, called
toolchain-wrapper-clang.

After building the clang toolchain wrapper, create the symlinks needed
to force package infrastructure to use clang througt the wrapper.

Initially clang install the clang-8 binary and create all other symlinks:

 # clang -> clang-8
 # clang++ -> clang
 # clang-8
 # clang-cl -> clang
 # clang-cpp -> clang

Use a post install hook to rename the clang-8 binary to clang-8.br_real
and recreate all symlinks:

 # clang -> toolchain-wrapper-clang
 # clang++ -> toolchain-wrapper-clang
 # clang-8 -> toolchain-wrapper-clang
 # clang-8.br_real
 # clang++.br_real -> clang-8.br_real
 # clang.br_real -> clang-8.br_real
 # clang-cl -> toolchain-wrapper-clang
 # clang-cl.br_real -> clang-8.br_real
 # clang-cpp -> toolchain-wrapper-clang
 # clang-cpp.br_real -> clang-8.br_real

NOTE: *.br_real symlinks are needed as the wrapper references them

Use the previously introduced CLANG_VERSION_MAJOR variable to create
theses symlinks.

Set BR_CROSS_PATH_SUFFIX to ".br_real" as for the Buildroot's internal
GCC toolchain backend to find the "real" clang binary installed in
$(HOST_DIR)/bin.

Borrow TOOLCHAIN_WRAPPER_BUILD and TOOLCHAIN_WRAPPER_INSTALL to
build and install the specific clang toolchain wrapper.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes
v1 -> v2
[Arnout
 - Fixup commit description and clarified *.br_real
 - Simplified loop
---
 package/clang/clang.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 95b4964be3..3c75f8d6b1 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -112,5 +112,33 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
+define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/bin; \
+	rm -f clang-$(CLANG_VERSION_MAJOR).br_real; \
+	mv clang-$(CLANG_VERSION_MAJOR) clang-$(CLANG_VERSION_MAJOR).br_real; \
+	ln -sf toolchain-wrapper-clang clang-$(CLANG_VERSION_MAJOR); \
+	for i in clang clang++ clang-cl clang-cpp; do \
+		ln -snf toolchain-wrapper-clang $$i; \
+		ln -snf clang-$(CLANG_VERSION_MAJOR).br_real $$i.br_real; \
+	done
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper.c \
+		-o $(@D)/toolchain-wrapper-clang
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-clang \
+		$(HOST_DIR)/bin/toolchain-wrapper-clang
+endef
+
+HOST_CLANG_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+HOST_CLANG_POST_BUILD_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.17.1
