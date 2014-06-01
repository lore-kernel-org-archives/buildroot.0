From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:25 +0200
Subject: [Buildroot] [PATCH v4 03/11] pkg-cmake.mk: enable ccache for cmake
	packages
In-Reply-To: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401614673-3703-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the generated toolchainfile.cmake to use ccache.

When toolchainfile.cmake is used inside Buildroot, using ccache during
the build is driven by a CMake knob: USE_CCACHE, automatically set by
the cmake-package infrastructure and reflecting the BR2_CCACHE value.

Since this toolchainefile.cmake file can be used outside Buildroot, and
this file also set a couple of things (among these: the sysroot cflag,
some pkg-config environment variables), it is important to set the
compiler variables as well to keep the consistency of the
cross-compilation configuration.
So, when it is used outside Buildroot, using ccache for the build is
driven by the ccache program availability.

Note that using ccache for the build is achieved by setting the *_ARG1
CMake variables to let CMake use ccache without failing in detecting
the compiler.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v3 -> v4 (Samuel):
- rebase
- make sure ccache built by Buildroot can be found when
  toolchainfile.cmakeis used outside Buildroot (Arnout)

changes v2 -> v3 (Samuel):
- rebase
- inline the -DUSE_CCACHE=... in the configure commands.
- always set the compiler variables, even when called for outside
  Buildroot.
- update commit message

changes v1 -> v2 (Luca):
- totally reimplemented based on Samuel's suggestion;
- added dependency on host-ccache for cmake packages if ccache is
  enabled.
---
 package/pkg-cmake.mk                |  2 ++
 support/misc/toolchainfile.cmake.in | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2d4a264..1de1d4a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -66,6 +66,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
+		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
@@ -83,6 +84,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index df79acd..8cf28e9 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -23,5 +23,34 @@ set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
-set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+# This toolchain file can be used both inside and outside Buildroot.
+# * When used inside Buildroot, ccache support is explicitly driven using the
+#   USE_CCACHE variable.
+# * When used outside Buildroot (i.e. when USE_CCACHE is not defined), ccache
+#   support is automatically enabled if the ccache program is available.
+if(DEFINED USE_CCACHE)
+	if(USE_CCACHE)
+		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
+		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
+		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+	else()
+		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+	endif()
+else()
+	find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
+	if(CCACHE)
+		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_C_COMPILER "${CCACHE}")
+		set(CMAKE_CXX_COMPILER "${CCACHE}")
+		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		message(STATUS "ccache program has been found and will be used for the build.")
+		message(STATUS "  To disable ccache, add -DUSE_CCACHE=OFF on the cmake command line.")
+	else()
+		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+	endif()
+endif()
-- 
1.9.2
