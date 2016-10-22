From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:20:17 +0200
Subject: [Buildroot] [git commit] toolchainfile.cmake: set per-config
	appended {C, CXX}FLAGS
Message-ID: <20161022144115.83B207FF62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12494ef48f893684d0800e7f6fe39a2ceaed0451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a build type is set, CMake does append some flags that can override
those set by Buildroot due to the gcc option parser (in which the last
argument controling an option wins).

Hereafter is a summary of the optimization and debug flags set by
Buildroot and appended by CMake.

* Flags set by Buildroot depending on the configuration:

  BR2_ENABLE_DEBUG | Optim. level        | Buildroot {C,CXX}FLAGS
  =================+=====================+=======================
          y        | BR2_OPTIMIZE_S      | -Os -gx
          y        | BR2_OPTIMIZE_G      | -Og -gx
          y        | BR2_OPTIMIZE_{0..3} | -On -gx
          n        | BR2_OPTIMIZE_S      | -Os
          n        | BR2_OPTIMIZE_G      | -Og
          n        | BR2_OPTIMIZE_{0..3} | -On

* Default flags appended by CMake depending on the build type:

  Build type     | Flags           | Effects on {C,CXX}FLAGS
  ===============+=================+===========================================
  Debug          | -g              | Force -g, compatible with BR2_ENABLE_DEBUG
  MinSizeRel     | -Os -DNDEBUG    | Set -Os, compatible with BR2_OPTIMIZE_S
  Release        | -O3 -DNDEBUG    | Set -O3, closest to the others cases,
                 |                 | though the optimization level is forced.
  RelWithDebInfo | -O2 -g -DNDEBUG | Force -g and set -O2, not friendly with BR

To avoid the CMake flags take precedence over the Buildroot ones, this
change sets in toolchainfile.cmake the per-config compiler flags CMake
can append depending on the build type Buildroot defined.
So, CMake does not mess up with the compilation flags Buildroot sets.

It is still possible to override these per-config flags on the cmake
command line.

Note:
  If a CMake-based project forces the compiler and/or linker flag
  definitions (the default ones or the per-config ones - e.g.
  CMAKE_C_FLAGS/CMAKE_C_FLAGS_{DEBUG,RELEASE}), there is not much
  Buildroot can do about it.
  So, the flags will be overwritten anyway in these cases.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - adjust comment in toolchainfile.cmake.in, as suggested by Arnout.
 - also handle CMAKE_Fortran_FLAGS_*, as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 1c5031f..a8476d9 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -13,6 +13,21 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
 set(CMAKE_SYSTEM_NAME Linux)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
+# Set the {C,CXX}FLAGS appended by CMake depending on the build type
+# defined by Buildroot. CMake defaults these variables with -g and/or
+# -O options, and they are appended at the end of the argument list,
+# so the Buildroot options are overridden. Therefore these variables
+# have to be cleared, so that the options passed in CMAKE_C_FLAGS do
+# apply.
+#
+# Note:
+#   if the project forces some of these flag variables, Buildroot is
+#   screwed up and there is nothing Buildroot can do about that :(
+set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
+set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
+set(CMAKE_C_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
+set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CXXFLAGS")
+
 # Build type from the Buildroot configuration
 set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
 
@@ -34,6 +49,8 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
+  set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
+  set(CMAKE_Fortran_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
   set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
