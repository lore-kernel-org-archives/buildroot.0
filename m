From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 18:02:13 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] toolchain: generate
 check-headers program under $(BUILD_DIR)
Message-ID: <20190930163113.D6C818386E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8166a6937e1556731955efd86654b6300ce64a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Some installations mount /tmp with the 'noexec' option, which prevents
running the program generated there to check the kernel headers.

Avoid the problem by generating the program under $(BUILD_DIR), passed
as the first argument to check-kernel-headers.sh.

We could globally export a TMPDIR environment variable with some path
under $(BUILD_DIR) but such solution would be too intrusive, depriving
the user from the freedom to set TMPDIR at his will (or needs).

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12241

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6136765b23abd9faba610dd54ed276a777811575)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 03355f56dd..71c6fde1c1 100644
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
index baf719ad1f..886c122263 100644
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
