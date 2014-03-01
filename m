From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:01 +0100
Subject: [Buildroot] [PATCH 06/13] toolchain/external: check kernel headers
	version for custom toolchain
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <35e58c57dd7df6b6131bde071ba53f171efff532.1393685422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Ensure the kernel headers version used in the custom external toolchain,
or the manually-specified kernel headers version, matches exactly the one
selected by the user.

We do not care about the patch-level, since headers are not supposed to
change between patchlevels. This applies only to kernels >= 3.0, but
those are actually the ones we do care about; we treat all 2.6.x kernels
as being a single version, since we do not support any 2.6 kernels for
packages with kernel-dependant features.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/check-kernel-headers.sh            | 21 +++++++++++++++++++++
 toolchain/helpers.mk                               | 13 +++++++++++++
 toolchain/toolchain-common.in                      | 20 ++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  7 ++++++-
 4 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100755 support/scripts/check-kernel-headers.sh

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
new file mode 100755
index 0000000..d7fe7d4
--- /dev/null
+++ b/support/scripts/check-kernel-headers.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+CC="${1}"
+# Make sure we have enough version components
+HDR_VER="${2}.0.0"
+
+HDR_M="${HDR_VER%%.*}"
+HDR_V="${HDR_VER#*.}"
+HDR_m="${HDR_V%%.*}"
+
+# We do not want to account for the patch-level, since headers are
+# not supposed to change for different patchlevels, so we mask it out.
+# This only applies to kernels >= 3.0, but those are the only one
+# we actually care about; we treat all 2.6.x kernels equally.
+
+exec ${CC} -E -x c -o - - >/dev/null 2>&1 <<_EOF_
+#include <linux/version.h>
+#if (LINUX_VERSION_CODE & ~0xFF) != KERNEL_VERSION(${HDR_M},${HDR_m},0)
+#error Incorrect kernel header version.
+#endif
+_EOF_
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 892ab4b..64d5095 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -163,6 +163,19 @@ copy_toolchain_sysroot = \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
+# Check the specified kernel headers version actually matches the
+# version in the toolchain.
+#
+# $1: cross-gcc path
+# $2: kernel version string, in the form: X.Y
+#
+check_kernel_headers_version = \
+	if ! support/scripts/check-kernel-headers.sh $(1) $(2); then \
+		echo "Incorrect selection of kernel headers"; \
+	    exit 1; \
+	fi
+
+#
 # Check the availability of a particular glibc feature. This function
 # is used to check toolchain options that are always supported by
 # glibc, so we simply check that the corresponding option is properly
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 01bb39f..8927bf7 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -169,3 +169,23 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+# This order guarantees that the highest version is set, as kconfig
+# stops affecting a value on the first matching default.
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST
+	string
+	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	default "3.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	default "3.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	default "3.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	default "3.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	default "3.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	default "3.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	default "3.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+	default "3.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	default "3.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	default "3.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	default "3.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	default "3.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	default "3.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	default "2.6"
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 51da480..378e7b2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -412,7 +412,7 @@ endef
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
-# type of C library and all C library features.
+# kernel headers version, type of C library and all C library features.
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
@@ -421,6 +421,11 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
+	if [ "$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM)" = "y" ]; then \
+		$(call check_kernel_headers_version,\
+			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+			$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	fi ; \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
 			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-- 
1.8.3.2
