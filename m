From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 23:03:43 +0200
Subject: [Buildroot] [PATCH v5 3/9] toolchainfile.cmake: set per-config
	appended {C, CXX}FLAGS
In-Reply-To: <20161015210349.29432-1-s.martin49@gmail.com>
References: <20161015210349.29432-1-s.martin49@gmail.com>
Message-ID: <20161015210349.29432-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchainfile.cmake file already sets the build type to get close
to the Buildroot configuration.

This change sets the per-config compiler flags CMake appends, so CMake
does not mess up with the compilation flags Buildroot sets.

This change still allows overriding the these variables from the
configure command line.

Note:
  If a CMake-based project forces using a given build type and/or
  force the compiler and/or linker flag definitions (the default ones or
  the per-config ones - e.g. CMAKE_C_FLAGS/CMAKE_C_FLAGS_{DEBUG,RELEASE}),
  there is not much Buildroot can do about it.
  So, the flags will be overwritten anyway in these cases.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4->v5:
- fix cmake set call

changes v3->v4:
- new patch
---
 support/misc/toolchainfile.cmake.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 2505256..75f3fb2 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -13,6 +13,18 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
 set(CMAKE_SYSTEM_NAME Linux)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
+# Give to CMake the {C,CXX}FLAGS to append in case the project's logic
+# falls back on a build type or another (i.e. set CMAKE_{C,CXX}_FLAGS_*
+# variables).
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
 set(CMAKE_BUILD_TYPE @@BR_CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
 
-- 
2.10.0
