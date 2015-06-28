From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:44 +0200
Subject: [Buildroot] [RFC v4 10/16] pkg-cmake: add GCC_SYSROOT environment
	variable to support pps feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-11-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, add the GCC_SYSROOT
environment variable and use it for building packages with cmake.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-cmake.mk                | 1 +
 support/misc/toolchainfile.cmake.in | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f17a883..8af1e48 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -85,6 +85,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	GCC_SYSROOT=$$(STAGING_DIR) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index cd41254..fa82af4 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -19,12 +19,17 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
-set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+if(DEFINED ENV{GCC_SYSROOT})
+	set(CMAKE_FIND_ROOT_PATH "$ENV{GCC_SYSROOT}")
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} "$ENV{GCC_SYSROOT}")
+else()
+	set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
 # * When used inside Buildroot, ccache support is explicitly driven using the
-- 
2.4.3
