From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:24 +0200
Subject: [Buildroot] [PATCH 05/14] pkg-cmake.mk: enable ccache for cmake
	packages
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-6-git-send-email-s.martin49@gmail.com>
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

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
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
 package/pkg-cmake.mk | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index b2ac2df..a032426 100644
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
@@ -161,8 +163,6 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 define TOOLCHAINFILE_CMAKE
 string(REPLACE /usr/share/buildroot "" _HOST_DIR $${CMAKE_CURRENT_LIST_DIR})
 set(CMAKE_SYSTEM_NAME Linux)
-set(CMAKE_C_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
-set(CMAKE_CXX_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
 set(CMAKE_C_FLAGS "$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)" CACHE STRING "Buildroot CFLAGS" FORCE)
 set(CMAKE_CXX_FLAGS "$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)" CACHE STRING "Buildroot CXXFLAGS" FORCE)
 set(CMAKE_INSTALL_SO_NO_EXE 0)
@@ -172,6 +172,37 @@ set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 set(ENV{PKG_CONFIG_SYSROOT_DIR} $${_HOST_DIR}/$(STAGING_SUBDIR))
+# This toolchain file can be used both inside and outside Buildroot.
+# * When used inside Buildroot, ccache support is explicitly driven using the
+#   USE_CCACHE variable.
+# * When used outside Buildroot (i.e. when USE_CCACHE is not defined), ccache
+#   support is automatically enabled if the ccache program is available.
+if(DEFINED USE_CCACHE)
+	if(USE_CCACHE)
+		set(CMAKE_ASM_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_C_COMPILER $${_HOST_DIR}/usr/bin/ccache)
+		set(CMAKE_CXX_COMPILER $${_HOST_DIR}/usr/bin/ccache)
+		set(CMAKE_C_COMPILER_ARG1 $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_CXX_COMPILER_ARG1 $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
+	else()
+		set(CMAKE_C_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_CXX_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
+	endif()
+else()
+	find_program(CCACHE ccache)
+	if(CCACHE)
+		set(CMAKE_ASM_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_C_COMPILER $${CCACHE})
+		set(CMAKE_CXX_COMPILER $${CCACHE})
+		set(CMAKE_C_COMPILER_ARG1 $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_CXX_COMPILER_ARG1 $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
+		message(STATUS "ccache program has been found and will be used for the build.")
+		message(STATUS "  To disable ccache, add -DUSE_CCACHE=OFF on the cmake command line.")
+	else()
+		set(CMAKE_C_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+		set(CMAKE_CXX_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
+	endif()
+endif()
 endef
 
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
-- 
1.9.2
