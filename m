From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jul 2016 16:37:42 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Commonize /lib/<tuple>
	symlinks for Linaro toolchains
Message-ID: <1467643062-19480-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As proposed initialy by Matthew Fornero [1], commonize the creation of
symlinks from {/usr}/lib to {/usr}/lib/<tuple> for Linaro toolchains.

This symlinks are only required for old Linaro toolchains.

[1] http://patchwork.ozlabs.org/patch/624577

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matthew Fornero <mfornero@mathworks.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 26 +++++++---------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c103b96..29c1f36 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -253,22 +253,12 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES += netbsd-queue
 endif
 
-# The Linaro ARMhf toolchain expects the libraries in
-# {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
+# The Linaro toolchain expects the libraries in
+# {/usr,}/lib/<tuple>, but Buildroot copies them to
 # {/usr,}/lib, so we need to create a symbolic link.
-define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
-	ln -snf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
-endef
-
-define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
-	ln -snf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
-endef
-
-define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/aarch64-linux-gnu
-	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
+define TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
+	ln -snf . $(TARGET_DIR)/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
+	ln -snf . $(TARGET_DIR)/usr/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
 endef
 
 # The Codescape toolchain uses a sysroot layout that places them
@@ -339,7 +329,7 @@ ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
 else
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
@@ -349,7 +339,7 @@ ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
 else
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/armeb-linux-gnueabihf
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
@@ -392,7 +382,7 @@ ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
 else
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
-- 
2.5.5
