From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:31 +0100
Subject: [Buildroot] [RFC v3 26/30] pkg-cmake: add support for per-package
	staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-27-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-cmake.mk                | 7 +++++++
 support/misc/toolchainfile.cmake.in | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index eacd641..8cda3b3 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -72,10 +72,16 @@ define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	PKG_CONFIG_SYSROOT_DIR="$$($(2)_STAGING_DIR)" \
+	PKG_CONFIG_PATH="$$($(2)_STAGING_DIR)/usr/lib/pkgconfig" \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_C_FLAGS="$$(TARGET_CFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS="$$(TARGET_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS="$$(TARGET_LDFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS="$$(TARGET_LDFLAGS)" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
@@ -86,6 +92,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
+		-DSTAGING_DIR=$$(STAGING_DIR) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 816af13..99e2d51 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -19,11 +19,13 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
-set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@;${STAGING_DIR}/usr")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+if(NOT DEFINED ENV{PKG_CONFIG_SYSROOT_DIR})
+       set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
 
 # This toolchain file can be used both inside and outside Buildroot.
 # * When used inside Buildroot, ccache support is explicitly driven using the
-- 
2.3.1
