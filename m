From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Oct 2016 18:33:14 +0200
Subject: [Buildroot] [PATCH v2 2/2] toolchainfile.cmake: rework the
	Buildroot flags addition
In-Reply-To: <20161001163314.10173-1-s.martin49@gmail.com>
References: <20161001163314.10173-1-s.martin49@gmail.com>
Message-ID: <20161001163314.10173-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the build configuration, Buildroot defines set some compiler and
linker flags that should be passed to any packages build-system.

For package using the cmake-package infrastructure, this is achieved
via the toolchainfile.cmake, which extends the CMake standard compiler
and linker flags variables with the Buildroot's flags; this allows
per-package customizations of these flags.

The implementation of these compiler and linker flags extensions is
constrained by the CMake innards:
- extending the variable content is done via the 'set' command [1],
  which accepts the CACHE and FORCE options.
  The CACHE option makes 'set' actually setting the variable only if
  it is not already set (from the CMake cache or on the command line),
  unless FORCE is also set;
- CMake processes the toolchainfile.cmake as many time as the number of
  enabled languages, so a naive implementation may:
  - introduce duplicates in the resulting compiler or linker flags in
    project enabling several languages (by default C and C++ are
    enabled [2]);
  - or force an external project to alway rebuild all sources because
    the compiler and linker flags are updated every time 'make' is run
    (c.f. #7280 [3]).

Thus, due to these CMake specifics, the implementation should take care
of a couple of things:
- keeping the per-package customization of the standard CMake flags;
- making sure the Buildroot's flags are added into the standard CMake
  flags;
- avoid introducing duplicates in resulting CMake flags.

So, this change introduces an helper in the toolchainfile.cmake file
that will extend the standard CMake flags variables with the flags
defined by Buildroot only when they are not already present (i.e. only
the first time the toolchain file is processed by CMake when configuring
a project).
Then, this helper is used to extend any standard CMake flags variables.

Fixes:
  http://autobuild.buildroot.net/results/7f1c96abd8fbb5b358a07100ab623316e9bb9dcd
  http://autobuild.buildroot.net/results/e0c93d0f6d1da0d62d4dbba211a275bfe75e9645
  http://autobuild.buildroot.net/results/53e7e4b4b6a7b48b8012799d7507f7594dbf01b2

No regression tests passed WRT bug #7280.

[1] https://cmake.org/cmake/help/v3.6/command/set.html
[2] https://cmake.org/cmake/help/v3.6/command/project.html
[3] https://bugs.busybox.net/show_bug.cgi?id=7280

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/misc/toolchainfile.cmake.in | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 649b52d..32d6df0 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -3,6 +3,33 @@
 # CMake toolchain file for Buildroot
 #
 
+# CMake process this file as many time as the number of languages activated in
+# the project.
+# Therefore, for projects activating several languages, it is necessary to take
+# care of adding only once the flags defined by Buildroot when extending the
+# compiler/linker flags.
+
+# extend_with_buildroot_flags(<CMAKE_FLAGS_VAR_NAME>)
+#
+# Extend the given flags with those preset by Buildroot, making sure they are
+# not duplicated several time, whatever the number of languages enabled in the
+# project.
+#
+# \arg : CMake compiler or linker flags variable name
+function(extend_with_buildroot_flags var_name)
+  string(REGEX REPLACE "^CMAKE_" "BUILDROOT_" __buildroot_flags "${var_name}")
+  string(FIND "${${var_name}}" "${${__buildroot_flags}}" __found)
+  if(${__found} EQUAL -1)
+    set(${var_name} "${${__buildroot_flags}} ${${var_name}}" CACHE STRING "${var_desc}" FORCE)
+  endif()
+endfunction(extend_with_buildroot_flags)
+
+# Compiler/linker flags preset by Buildroot.
+set(BUILDROOT_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
+set(BUILDROOT_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
+set(BUILDROOT_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
+set(BUILDROOT_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot executable LDFLAGS")
+
 # In order to allow the toolchain to be relocated, we calculate the
 # HOST_DIR based on this file's location: $(HOST_DIR)/usr/share/buildroot
 # and store it in RELOCATED_HOST_DIR.
@@ -13,9 +40,10 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
 set(CMAKE_SYSTEM_NAME Linux)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
-set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
-set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
-set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
+extend_with_buildroot_flags(CMAKE_C_FLAGS)
+extend_with_buildroot_flags(CMAKE_CXX_FLAGS)
+extend_with_buildroot_flags(CMAKE_EXE_LINKER_FLAGS)
+
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
@@ -31,6 +59,6 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
-  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
+  extend_with_buildroot_flags(CMAKE_Fortran_FLAGS)
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
-- 
2.10.0
