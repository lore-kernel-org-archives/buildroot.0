From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 16:39:10 +0200
Subject: [Buildroot] [PATCH 5/6] toolchainfile.cmake.in: do not force the
	CMAKE_{C, CXX}_FLAGS to the cache
In-Reply-To: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408113551-29932-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix #7280 [1]

When FORCE option is passed to the set command, the variable is
added/updated in the CMake cache every single time CMake process this
command.

Because the toochainfile.cmake prepends architecture/toolchain flags to
the CMAKE_{C,CXX}_FLAGS, this makes the CFLAGS being updated in the
generated Makefiles each time ones reconfigures its project. So it
forces the compilation of everything, even when nothing has changed.

[1] https://bugs.busybox.net/show_bug.cgi?id=7280

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/misc/toolchainfile.cmake.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 1dfbdba..4ca3d35 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -12,8 +12,8 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
 
 set(CMAKE_SYSTEM_NAME Linux)
 
-set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS" FORCE)
-set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS" FORCE)
+set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
+set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
 set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
-- 
2.0.4
