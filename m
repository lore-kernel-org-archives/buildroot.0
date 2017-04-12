From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:47 +0200
Subject: [Buildroot] [PATCH 13/53] pkg-cmake: move configuration files out
	of $(HOST_DIR)/usr
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-14-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move toolchainfile.cmake and Buildroot.cmake from
$(HOST_DIR)/usr/share/buildroot to $(HOST_DIR)/share/buildroot.

Build-tested with a bunch of cmake packages.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cmake.mk                | 8 ++++----
 support/misc/toolchainfile.cmake.in | 4 ++--
 toolchain/toolchain/toolchain.mk    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 0606d26ad7..1bb3652a13 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,7 +86,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
@@ -234,10 +234,10 @@ CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
 endif
 
 # In order to allow the toolchain to be relocated, we calculate the HOST_DIR
-# based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
+# based on the toolchainfile.cmake file's location: $(HOST_DIR)/share/buildroot
 # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
 # so we have to strip "$(HOST_DIR)/" from the paths that contain it.
-$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
+$(HOST_DIR)/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	sed \
 		-e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
@@ -254,5 +254,5 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
 
-$(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake:
+$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake:
 	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake $(@)
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index c38800e598..c8c710bddd 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -4,11 +4,11 @@
 #
 
 # In order to allow the toolchain to be relocated, we calculate the
-# HOST_DIR based on this file's location: $(HOST_DIR)/usr/share/buildroot
+# HOST_DIR based on this file's location: $(HOST_DIR)/share/buildroot
 # and store it in RELOCATED_HOST_DIR.
 # All the other variables that need to refer to HOST_DIR will use the
 # RELOCATED_HOST_DIR variable.
-string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
+string(REPLACE "/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
 
 # Point cmake to the location where we have our custom modules,
 # so that it can find our custom platform description.
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index e29837357a..400cfe116b 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -37,5 +37,5 @@ endif
 
 $(eval $(virtual-package))
 
-toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-toolchain: $(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake
+toolchain: $(HOST_DIR)/share/buildroot/toolchainfile.cmake
+toolchain: $(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
-- 
2.11.0
