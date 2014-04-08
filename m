From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 01:38:10 +0200
Subject: [Buildroot] [git commit] support/check-kernel-headers: fix old
	custom toolchains without -print-sysroot
Message-ID: <20140408234056.BE2FF9C69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a82bb8a9049afefeff751c73d2cad92bb0c8b53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old toolchains, with old gcc that do not support -print-sysroot, break the
kernel-headers version check script: it fails to find the sysroot of the
toolchain, and thus ends up including the host's linux/version.h.

Most of the time, this will break early, since the host's kernel headers
will not match the toolchain settings.

But it can happen that the check is succesful, although the configuration
of the toolchain is wrong:

  - the custom toolchain has kernel headers vX.Y
  - the user selected vX.Z  (Z!=Y)
  - the host has headers vX.Y

In this case, the check passes OK, but the build of some packages later on
will break (which is exactly what those _AT_LEAST_XXX options were added to
avoid).

Fix that by passing the sysroot to the check script, instead of the cross
compiler.

We get the sysroot as thus:

  - for custom toolchains, we use the macro toolchain_find_sysroot. We can
    do that, because we already have a complete sysroot with libc.a at that
    time.

  - for internal toolchain using a custom kernel headers version, we just
    use $(STAGING_DIR). We can't use the macro as for custom toolchains
    above, because at the time we install the kernel headers, we do not yet
    have a complete sysroot with a libc.a.  But we can just use
    $(STAGING_DIR), since we're only interested in the kernel headers.

For all other types of toolchains, we already have the _AT_LEAST_XXX options
properly set, so we need not add a check in this case.

Fixes:
    http://autobuild.buildroot.net/results/f33/f331a6eff0b0b93c73af52db3a6b43e4e598577e/
    http://autobuild.buildroot.net/results/a57/a5797c025bec50c10efdcff74945aab4021d05e4/
    [...]

[Thanks to Thomas for pointing out the toolchain_find_sysroot macro!]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/linux-headers.mk             |    2 +-
 support/scripts/check-kernel-headers.sh            |   11 +----------
 toolchain/helpers.mk                               |    2 +-
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 2361e40..7b3edf4 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -40,7 +40,7 @@ endef
 ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
-		"$(TARGET_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+		$(STAGING_DIR),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
 endef
 LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index 2a0a301..82cf9ac 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-CC="${1}"
+SYSROOT="${1}"
 # Make sure we have enough version components
 HDR_VER="${2}.0.0"
 
@@ -10,15 +10,6 @@ HDR_m="${HDR_V%%.*}"
 
 EXEC="$(mktemp --tmpdir check-headers.XXXXXX)"
 
-# By the time we get here, we do not always have the staging-dir
-# already populated (think external toolchain), so we can not use
-# it.
-# So we just ask the cross compiler what its default sysroot is.
-# For multilib-aware toolchains where we should use a non-default
-# sysroot, it's not really a problem since the version of the kernel
-# headers is the same for all sysroots.
-SYSROOT=$(${CC} -print-sysroot)
-
 # We do not want to account for the patch-level, since headers are
 # not supposed to change for different patchlevels, so we mask it out.
 # This only applies to kernels >= 3.0, but those are the only one
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6875916..9595196 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -166,7 +166,7 @@ copy_toolchain_sysroot = \
 # Check the specified kernel headers version actually matches the
 # version in the toolchain.
 #
-# $1: cross-gcc path
+# $1: sysroot directory
 # $2: kernel version string, in the form: X.Y
 #
 check_kernel_headers_version = \
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 547d55d..1424c23 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -431,7 +431,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	fi ; \
 	if [ "$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM)" = "y" ]; then \
 		$(call check_kernel_headers_version,\
-			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+			$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
 			$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	fi ; \
 	if test "$(BR2_arm)" = "y" ; then \
