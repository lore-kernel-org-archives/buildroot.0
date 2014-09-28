From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 20:57:26 +0200
Subject: [Buildroot] [git commit] toolchainfile.cmake.in: do not force the
	CMAKE_{C, CXX}_FLAGS to the cache
Message-ID: <20140928191300.6E0D59D7A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47544e43a5e36f6c4ee1acb06315ab974cde78b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix #7280 [1]

When the FORCE option is passed to the set command, the variable is
added/updated in the CMake cache every single time CMake processes this
command.

Because the toolchainfile.cmake prepends architecture/toolchain flags
to the CMAKE_{C,CXX}_FLAGS, this makes the CFLAGS being updated in the
generated Makefiles each time one reconfigures its project. So it
forces the compilation of everything, even when nothing has changed.

[1] https://bugs.busybox.net/show_bug.cgi?id=7280

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(tested the SimpleApp reproduction scenario described in the bug report)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/toolchainfile.cmake.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
