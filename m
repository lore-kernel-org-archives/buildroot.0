From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:17:18 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mariadb: fix
 build error with newer cmake
Message-ID: <20190930121746.47E8C82C0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea8d948d7adc0cf90e264996be34be8ee463c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

When using a newer host system cmake to build MariaDB, the following build
error occurs:

    CMake Error at cmake/os/Linux.cmake:29 (STRING):
    STRING sub-command REPLACE requires at least four arguments.
    Call Stack (most recent call first):
    CMakeLists.txt:101 (INCLUDE)

    CMake Error at cmake/os/Linux.cmake:29 (STRING):
    STRING sub-command REPLACE requires at least four arguments.
    Call Stack (most recent call first):
    CMakeLists.txt:101 (INCLUDE)

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11781

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c2ff8c63dab10d2c1adca7229101b5468dac562b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-build-error-with-newer-cmake.patch    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch b/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
new file mode 100644
index 0000000000..5ffac688a3
--- /dev/null
+++ b/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
@@ -0,0 +1,44 @@
+From c90ae2ca3dff267b9e21595376d22de397f6f78f Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Tue, 20 Aug 2019 06:22:43 -0700
+Subject: [PATCH] Fix build error with newer cmake
+
+Fixes the following build error:
+
+CMake Error at cmake/os/Linux.cmake:29 (STRING):
+STRING sub-command REPLACE requires at least four arguments.
+Call Stack (most recent call first):
+CMakeLists.txt:101 (INCLUDE)
+
+CMake Error at cmake/os/Linux.cmake:29 (STRING):
+STRING sub-command REPLACE requires at least four arguments.
+Call Stack (most recent call first):
+CMakeLists.txt:101 (INCLUDE)
+
+https://jira.mariadb.org/browse/MDEV-20596
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ cmake/os/Linux.cmake | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cmake/os/Linux.cmake b/cmake/os/Linux.cmake
+index 50a2b21c838d8d6ca4cacc0704a9be4da3a57a0a..b871586acc9cfaddc3836cc9afafd85969120420 100644
+--- a/cmake/os/Linux.cmake
++++ b/cmake/os/Linux.cmake
+@@ -26,9 +26,9 @@ SET(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -D_GNU_SOURCE=1)
+ 
+ # Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
+ FOREACH(LANG C CXX)
+-  STRING(REPLACE "-rdynamic" "" 
+-  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
+-  ${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}  
++  STRING(REPLACE "-rdynamic" ""
++  "CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS"
++  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
+   )
+ ENDFOREACH()
+ 
+-- 
+2.17.1
+
