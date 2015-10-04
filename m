From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] qpid-proton: remove now-redundant ccache
	handling patch
Message-ID: <20151004162325.338C681DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca0d298f43966e92a20be13292336ab1cc9f8f9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although this patch is still relevant for upstream, we don't need it
anymore in buildoort because we no longer have _ARG1.

Note that it would be relevant again if we would add host-qpid-proton.
However, the 0.10 release already has the fix.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-C-compiler-detection-with-_ARG1-_ARG2.patch |   52 --------------------
 1 files changed, 0 insertions(+), 52 deletions(-)

diff --git a/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch b/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
deleted file mode 100644
index 16f4aba..0000000
--- a/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f24be9ae9ab01c7507a366e9d5529c444f0b7edd Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Fri, 10 Jul 2015 10:13:47 +0200
-Subject: [PATCH] proton-c: fix C compiler detection with _ARG1/_ARG2
-
-The C compiler commandline in CMake is composed by the concatenation of
-CMAKE_C_COMPILER + CMAKE_C_COMPILER_ARG1 + CMAKE_C_COMPILER_ARG2.
-
-In most use cases the two additional argument variables are empty, thus
-CMAKE_C_COMPILER can be used without any noticeable difference.
-
-The Buildroot embedded Linux build system [0], however, optionally exploits the
-CMAKE_C_COMPILER_ARG1 variable to speed up the cross-compilation of CMake-based
-packages using ccache. It does so by setting [1]:
-
-  CMAKE_C_COMPILER      = /path/to/ccache
-  CMAKE_C_COMPILER_ARG1 = /path/to/cross-gcc
-
-This works fine with other CMake-based packages, but proton-c's CMakeLists.txt
-calls gcc to extract the compiler version. It does so by calling
-"${CMAKE_C_COMPILER} -dumpversion", without honoring the two extra arguments.
-Within Buildroot with ccache enabled, this means calling
-"/path/to/ccache -dumpversion", which fails with the error:
-
-  ccache: invalid option -- 'd'
-
-Fix the compiler check by adding the two arguments.
-
-[0] http://buildroot.net/
-[1] http://git.buildroot.net/buildroot/tree/support/misc/toolchainfile.cmake.in?id=2015.05
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- proton-c/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/proton-c/CMakeLists.txt b/proton-c/CMakeLists.txt
-index 93449a9..8c31a89 100644
---- a/proton-c/CMakeLists.txt
-+++ b/proton-c/CMakeLists.txt
-@@ -218,7 +218,7 @@ if (CMAKE_COMPILER_IS_GNUCC)
-     set (COMPILE_LANGUAGE_FLAGS "-std=c99")
-     set (COMPILE_PLATFORM_FLAGS "-std=gnu99")
- 
--    execute_process(COMMAND ${CMAKE_C_COMPILER} -dumpversion OUTPUT_VARIABLE GCC_VERSION
-+    execute_process(COMMAND ${CMAKE_C_COMPILER} ${CMAKE_C_COMPILER_ARG1} ${CMAKE_C_COMPILER_ARG2} -dumpversion OUTPUT_VARIABLE GCC_VERSION
-       OUTPUT_STRIP_TRAILING_WHITESPACE)
-     if (${GCC_VERSION} VERSION_LESS "4.3.0")
-       # Only a concern if contibuting code back.
--- 
-1.9.1
-
