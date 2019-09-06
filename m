From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:40 +0200
Subject: [Buildroot] [PATCH 04/11] package/clang: install a
 toolchain-wrapper for the host clang cross-compiler
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-5-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to use clang as a host cross-compiler for Buildroot, we need
to provide at least the path to the sysroot (using --sysroot) and
some other compiler flags.

Hoppefully, we can reuse the toolchain wrapper for gcc since
clang support most of the gcc flags used in the Buildroot's toolchain
wrapper.

Only the flag -mfused-madd (deprecated since gcc 4.6) for mips is
not supported by clang. Since Clang require gcc >= 5.x this flag
can never be used.

Since host-clang is always build by Buildroot as an internal toolchain,
we have to use a second toolchain-wrapper called toolchain-wrapper-clang
when an external toolchain is used.
Inded, the two wrapper use a different path BR_CROSS_PATH_SUFFIX in this
case.

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

Use the previously introduced CLANG_VERSION_MAJOR variable to create
theses symlinks.

Set BR_CROSS_PATH_SUFFIX to ".br_real" as for the Buildroot's internal
GCC toolchain backend to find the "real" clang binary installed in
$(HOST_DIR)/bin.

Borrow TOOLCHAIN_WRAPPER_BUILD and TOOLCHAIN_WRAPPER_INSTALL to
build and install the specific clang toolchain wrapper.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.mk | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 857ec148ac..148df8e611 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -110,5 +110,39 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
+define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/bin; \
+	for i in clang clang-$(CLANG_VERSION_MAJOR) clang++ clang-cl clang-cpp; do \
+		case "$$i" in \
+		*clang-$(CLANG_VERSION_MAJOR)) \
+			rm -f $$i.br_real; \
+			mv $$i $$i.br_real; \
+			ln -sf toolchain-wrapper-clang $$i; \
+			;; \
+		*) \
+			ln -snf toolchain-wrapper-clang $$i; \
+			ln -snf clang-$(CLANG_VERSION_MAJOR).br_real $$i.br_real; \
+			;; \
+		esac; \
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
2.21.0
