From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:13:12 +0200
Subject: [Buildroot] [git commit] cmocka: bump to version 1.1.3
Message-ID: <20181008161209.191428E463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40d4df2156211e3f91c5340971f62a20cdf222c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removes patch for upstream commit
d677b564c2193a5cd381925c2eeaad6b23c6af2f

Adds hash for license file.

Adds patch to fix a build error encountered by br-mips64-n64-full
toolchain about uintptr_t being declared twice.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-cmocka-cmake-fix-stack-protect-check.patch | 34 ---------------------
 ...s-uptime-include-stdint.h-before-cmocka.h.patch | 35 ++++++++++++++++++++++
 package/cmocka/cmocka.hash                         |  3 +-
 package/cmocka/cmocka.mk                           |  2 +-
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch b/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
deleted file mode 100644
index c7a2c2742a..0000000000
--- a/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f9a964edde4011adf88902018cbb87723d78d0a2 Mon Sep 17 00:00:00 2001
-From: Joel Carlson <JoelsonCarl@gmail.com>
-Date: Wed, 20 Jun 2018 14:35:13 -0600
-Subject: [PATCH 1/1] cmocka cmake: fix stack protect check
-
-The cmake check for if -fstack-protect is supported needs to use
-CMAKE_REQUIRED_FLAGS and not CMAKE_REQUIRED_DEFINITIONS.
-
-Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
----
-Upstream status: submitted to cmocka mailing list
-
- cmake/Modules/CheckCCompilerFlagSSP.cmake | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/Modules/CheckCCompilerFlagSSP.cmake b/cmake/Modules/CheckCCompilerFlagSSP.cmake
-index 2fe4395..ed34eb3 100644
---- a/cmake/Modules/CheckCCompilerFlagSSP.cmake
-+++ b/cmake/Modules/CheckCCompilerFlagSSP.cmake
-@@ -19,8 +19,8 @@
- include(CheckCSourceCompiles)
- 
- function(CHECK_C_COMPILER_FLAG_SSP _FLAG _RESULT)
--   set(SAFE_CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS}")
--   set(CMAKE_REQUIRED_DEFINITIONS "${_FLAG}")
-+   set(SAFE_CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS}")
-+   set(CMAKE_REQUIRED_FLAGS "${_FLAG}")
-    check_c_source_compiles("int main(int argc, char **argv) { char buffer[256]; return buffer[argc]=0;}" ${_RESULT})
--   set(CMAKE_REQUIRED_DEFINITIONS "${SAFE_CMAKE_REQUIRED_DEFINITIONS}")
-+   set(CMAKE_REQUIRED_FLAGS "${SAFE_CMAKE_REQUIRED_FLAGS}")
- endfunction(CHECK_C_COMPILER_FLAG_SSP)
--- 
-2.7.4
-
diff --git a/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch b/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch
new file mode 100644
index 0000000000..68dbc11da8
--- /dev/null
+++ b/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch
@@ -0,0 +1,35 @@
+From dd8449ae3ba7fd05ac172f0227cd93af7f37005e Mon Sep 17 00:00:00 2001
+From: Joel Carlson <joelsoncarl@gmail.com>
+Date: Mon, 1 Oct 2018 15:01:56 -0600
+Subject: [PATCH] examples: uptime: include stdint.h before cmocka.h
+
+Fixes a build error encountered on one MIPS64 toolchain about uintptr_t
+being declared twice, first by cmocka.h and then later by the toolchains
+stdint.h.
+
+Fixes #7
+
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+---
+Fixes build error with br-mips64-n64-full
+Upstream commit: dd8449ae3ba7fd05ac172f0227cd93af7f37005e
+---
+ example/mock/uptime/test_uptime.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/example/mock/uptime/test_uptime.c b/example/mock/uptime/test_uptime.c
+index badfac9..183c276 100644
+--- a/example/mock/uptime/test_uptime.c
++++ b/example/mock/uptime/test_uptime.c
+@@ -16,6 +16,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+-- 
+2.17.1
+
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 1de4a1240f..1cbda22428 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 f02ef48a7039aa77191d525c5b1aee3f13286b77a13615d11bc1148753fc0389 cmocka-1.1.1.tar.xz
+sha256 43eabcf72a9c80e3d03f7c8a1c04e408c18d2db5121eb058a3ef732a9dfabfaf cmocka-1.1.3.tar.xz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 64f5a4ae18..281410abb3 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.1
+CMOCKA_VERSION = 1.1.3
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/1.1
 CMOCKA_LICENSE = Apache-2.0
