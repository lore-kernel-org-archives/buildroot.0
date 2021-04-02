From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Apr 2021 23:50:16 +0200
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: don't
 unconditionally set CMAKE_CXX_COMPILER
Message-ID: <20210402212534.AB2FB860CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c2c0192a2463b8e8d0f7937b89fa83b16d93cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't unconditionally set CMAKE_CXX_COMPILER as it will raise a build
failure on qpid-proton because "if the toolchain specifies a value for
CMAKE_CXX_COMPILER, then CMake assumes the compiler works and goes
straight ahead trying to use it":
https://cmake.org/cmake/help/latest/module/CheckLanguage.html
https://issues.apache.org/jira/browse/PROTON-2365

Fixes:
 - http://autobuild.buildroot.org/results/05f344151100219c159ca4d466a453df96bf07fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: rename placeholder]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cmake.mk                |  1 +
 support/misc/toolchainfile.cmake.in | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c001051002..37078f3c34 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -264,6 +264,7 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
 		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
 		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
+		-e 's#@@TOOLCHAIN_HAS_CXX@@#$(if $(BR2_INSTALL_LIBSTDCPP),1,0)#' \
 		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
 		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index b25031a656..be575566a4 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -29,9 +29,7 @@ set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 #   if the project forces some of these flag variables, Buildroot is
 #   screwed up and there is nothing Buildroot can do about that :(
 set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
-set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
 set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
-set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
 
 # Build type from the Buildroot configuration
 set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
@@ -44,7 +42,6 @@ set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configur
 # * and make sure the project's CMake code extends them like this if needed:
 #     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_definitions")
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
-set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
 set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
 set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
 set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
@@ -62,7 +59,12 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
-set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+if(@@TOOLCHAIN_HAS_CXX@@)
+  set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
+  set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
+  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
+  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+endif()
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
   set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
   set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
