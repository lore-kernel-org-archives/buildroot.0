From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 21:23:45 +0200
Subject: [Buildroot] [PATCH 13/18] package-cmake: remove now-redundant
	target ccache support
In-Reply-To: <1442777030-24036-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777030-24036-1-git-send-email-arnout@mind.be>
Message-ID: <1442777030-24036-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the complexity with the different ways that CMAKE_C_COMPILER and
CMAKE_C_COMPILER_ARG1 can be set are no longer needed, it's all handled
by the toolchain wrapper now.

Note that it is still necessary to handle this for the host build.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cmake.mk                |  5 ++---
 support/misc/toolchainfile.cmake.in | 32 ++------------------------------
 2 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 574eccc..d85ff11 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -98,7 +98,6 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
-		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
@@ -245,8 +244,8 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
 		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
 		-e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
-		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
-		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
+		-e 's:@@TARGET_CC@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC))):' \
+		-e 's:@@TARGET_CXX@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX))):' \
 		-e 's:@@CMAKE_SYSTEM_PROCESSOR@@:$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR)):' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index cd41254..5cf381e 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -27,33 +27,5 @@ set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
-# * When used inside Buildroot, ccache support is explicitly driven using the
-#   USE_CCACHE variable.
-# * When used outside Buildroot (i.e. when USE_CCACHE is not defined), ccache
-#   support is automatically enabled if the ccache program is available.
-if(DEFINED USE_CCACHE)
-	if(USE_CCACHE)
-		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
-		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
-	else()
-		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
-	endif()
-else()
-	find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
-	if(CCACHE)
-		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_C_COMPILER "${CCACHE}")
-		set(CMAKE_CXX_COMPILER "${CCACHE}")
-		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
-		message(STATUS "ccache program has been found and will be used for the build.")
-		message(STATUS "  To disable ccache, add -DUSE_CCACHE=OFF on the cmake command line.")
-	else()
-		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
-	endif()
-endif()
+set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
+set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
-- 
2.5.3
