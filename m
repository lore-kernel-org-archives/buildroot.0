From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 23 Sep 2019 23:49:19 -0300
Subject: [Buildroot] [PATCH v2] toolchain: generate check-headers program
 under $(BUILD_DIR)
Message-ID: <20190924024919.17553-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Some installations mount /tmp with the 'noexec' option, which prevents
running the program generated there to check the kernel headers.

Avoid the problem by generating the program under $(BUILD_DIR), passed
as the first argument to check-kernel-headers.sh.

We could globally export a TMPDIR environment variable with some path
under $(BUILD_DIR) but such solution would be too intrusive, depriving
the user from the freedom to set TMPDIR at his will (or needs).

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12241
---
CC: Cerem Cem ASLAN <ceremcem@ceremcem.net>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/linux-headers/linux-headers.mk                 | 1 +
 support/scripts/check-kernel-headers.sh                | 7 ++++---
 toolchain/helpers.mk                                   | 9 ++++-----
 toolchain/toolchain-external/pkg-toolchain-external.mk | 1 +
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 46f270a0e1..676c8c44ea 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -133,6 +133,7 @@ endef
 ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
+		$(BUILD_DIR),\
 		$(STAGING_DIR),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
 endef
diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index a8cca78b27..a8b94f6a02 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -1,14 +1,15 @@
 #!/bin/sh
 
-SYSROOT="${1}"
+BUILDDIR="${1}"
+SYSROOT="${2}"
 # Make sure we have enough version components
-HDR_VER="${2}.0.0"
+HDR_VER="${3}.0.0"
 
 HDR_M="${HDR_VER%%.*}"
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
-EXEC="$(mktemp -t check-headers.XXXXXX)"
+EXEC="$(mktemp -p "${BUILDDIR}" -t .check-headers.XXXXXX)"
 
 # We do not want to account for the patch-level, since headers are
 # not supposed to change for different patchlevels, so we mask it out.
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 86d945a5b1..6a4f7223c8 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -158,13 +158,12 @@ copy_toolchain_sysroot = \
 # Check the specified kernel headers version actually matches the
 # version in the toolchain.
 #
-# $1: sysroot directory
-# $2: kernel version string, in the form: X.Y
+# $1: build directory
+# $2: sysroot directory
+# $3: kernel version string, in the form: X.Y
 #
 check_kernel_headers_version = \
-	if ! support/scripts/check-kernel-headers.sh $(1) $(2); then \
-		exit 1; \
-	fi
+	support/scripts/check-kernel-headers.sh $(1) $(2) $(3)
 
 #
 # Check the specific gcc version actually matches the version in the
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c3ddff263f..c00211d59c 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -531,6 +531,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	$$(call check_kernel_headers_version,\
+		$$(BUILD_DIR)\
 		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
-- 
2.18.1
