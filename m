From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:41 +0100
Subject: [Buildroot] [RFCv3 04/15] pkg-cmake: install CMake files as part of
 a package
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-5-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the toolchainfile.cmake and Buildroot.cmake files are
installed outside of any package, just triggered by the toolchain
target.

As part of the per-package SDK effort, we are trying to avoid anything
that installs to the global $(HOST_DIR), and this is one of the
remaining files installed in $(HOST_DIR) outside of any package. We
fix this by installing such files as part of the toolchain package
post-install staging hooks.

Yes, a post-install staging hook to install things to $(HOST_DIR) is a
bit weird, but the toolchain infrastructure is made of target packages
only, and they all install a lot of stuff to $(HOST_DIR) already.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - New patch
---
 package/pkg-cmake.mk             | 12 +++++++-----
 toolchain/toolchain/toolchain.mk |  3 ---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6739704e3c..6d4f948d07 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -244,8 +244,8 @@ endif
 # based on the toolchainfile.cmake file's location: $(HOST_DIR)/share/buildroot
 # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
 # so we have to strip "$(HOST_DIR)/" from the paths that contain it.
-$(HOST_DIR)/share/buildroot/toolchainfile.cmake:
-	@mkdir -p $(@D)
+define TOOLCHAIN_CMAKE_INSTALL_FILES
+	@mkdir -p $(HOST_DIR)/share/buildroot
 	sed \
 		-e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
 		-e 's#@@TARGET_CFLAGS@@#$(call qstrip,$(TARGET_CFLAGS))#' \
@@ -259,7 +259,9 @@ $(HOST_DIR)/share/buildroot/toolchainfile.cmake:
 		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
 		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
-		> $@
+		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
+	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \
+		$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
+endef
 
-$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake:
-	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake $(@)
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index b55b0c712c..283e0a74ee 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -38,6 +38,3 @@ TOOLCHAIN_INSTALL_STAGING = YES
 endif
 
 $(eval $(virtual-package))
-
-toolchain: $(HOST_DIR)/share/buildroot/toolchainfile.cmake
-toolchain: $(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
-- 
2.13.6
