From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:47:37 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] brotli: update to version
 1.0.7
Message-ID: <20181113224459.1F3C382BA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b67ad87e887850ac47077a822f2e19de57531d44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The new version, among other changes, includes important fixes
for unaligned memory access on ARM (both for 32 and 64-bit), as well
as performance improvements and build fixes.

Patch "0001-Tell-CMake-to-not-check-for-a-C-compiler.patch" is not
needed due to the issue being fixed upstream, and therefore is removed.

Patch "0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch"
is rebased against the latest upstream changes.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit be733b54a7104911df25ec72ab44b354ad680f90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-using-BUILD_SHARED_LIBS-to-choose-static.patch | 16 +++++------
 ...-Tell-CMake-to-not-check-for-a-C-compiler.patch | 31 ----------------------
 package/brotli/brotli.hash                         |  2 +-
 package/brotli/brotli.mk                           |  2 +-
 4 files changed, 10 insertions(+), 41 deletions(-)

diff --git a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch b/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
index 33b9bb70ce..ae5386b1ce 100644
--- a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
+++ b/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
@@ -1,4 +1,4 @@
-From b60b613e7c2c9bf7a142c3c486ac6e77ad93f5d1 Mon Sep 17 00:00:00 2001
+From 7289e5a378ba13801996a84d89d8fe95c3fc4c11 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Mon, 26 Mar 2018 19:08:31 +0100
 Subject: [PATCH] CMake: Allow using BUILD_SHARED_LIBS to choose static/shared
@@ -27,7 +27,7 @@ Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 Upstream-Status: Submitted [https://github.com/google/brotli/pull/655]
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 99b9258..3867931 100644
+index fc45f80..3f87f13 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -6,6 +6,8 @@ cmake_minimum_required(VERSION 2.8.6)
@@ -120,25 +120,25 @@ index 99b9258..3867931 100644
      DIRECTORY ${BROTLI_INCLUDE_DIRS}/brotli
      DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
 diff --git a/c/fuzz/test_fuzzer.sh b/c/fuzz/test_fuzzer.sh
-index 5c754e1..e85e12f 100755
+index 9985194..4b99947 100755
 --- a/c/fuzz/test_fuzzer.sh
 +++ b/c/fuzz/test_fuzzer.sh
-@@ -14,12 +14,12 @@ mkdir bin
+@@ -13,12 +13,12 @@ mkdir bin
  cd bin
  
- cmake $BROTLI -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
+ cmake $BROTLI -DCMAKE_C_COMPILER="$CC" \
 -    -DBUILD_TESTING=OFF -DENABLE_SANITIZER=address
 -make -j$(nproc) brotlidec-static
 +    -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DENABLE_SANITIZER=address
 +make -j$(nproc) brotlidec
  
- ${CXX} -o run_decode_fuzzer -std=c++11 -fsanitize=address -I$SRC/include \
-     $SRC/fuzz/decode_fuzzer.cc $SRC/fuzz/run_decode_fuzzer.cc \
+ ${CC} -o run_decode_fuzzer -std=c99 -fsanitize=address -I$SRC/include \
+     $SRC/fuzz/decode_fuzzer.c $SRC/fuzz/run_decode_fuzzer.c \
 -    ./libbrotlidec-static.a ./libbrotlicommon-static.a
 +    ./libbrotlidec.a ./libbrotlicommon.a
  
  mkdir decode_corpora
  unzip $BROTLI/java/org/brotli/integration/fuzz_data.zip -d decode_corpora
 -- 
-2.16.3
+2.19.1
 
diff --git a/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch b/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch
deleted file mode 100644
index 410de2830e..0000000000
--- a/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fea0b1e46c486225d57e730cc0f94fa06b5b93fc Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 26 Mar 2018 12:12:00 +0100
-Subject: [PATCH] Tell CMake to not check for a C++ compiler
-
-By default CMake checks both for C and C++ compilers, while the latter
-is not needed. Setting the list of languages to just "C" in the call to
-project() removes the unneeded check.
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream-Status: Submitted [https://github.com/google/brotli/pull/653]
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2dc7232..3fbcbfb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4,7 +4,7 @@
- # support 2.8.7.
- cmake_minimum_required(VERSION 2.8.6)
- 
--project(brotli)
-+project(brotli LANGUAGES C)
- 
- # If Brotli is being bundled in another project, we don't want to
- # install anything.  However, we want to let people override this, so
--- 
-2.16.3
-
diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 954d44eb70..82163040d1 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  93adcf437d730ac403e444285ac8aefbb2c8a6b5e1b064e8ee33684c067287a8159e0ee73d2217c167881e87da73fa494792d963a15508fd42b2ac4a5b52823c  v1.0.3.tar.gz
+sha512  a82362aa36d2f2094bca0b2808d9de0d57291fb3a4c29d7c0ca0a37e73087ec5ac4df299c8c363e61106fccf2fe7f58b5cf76eb97729e2696058ef43b1d3930a  v1.0.7.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index cf1e811543..2c1ad48753 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.0.3
+BROTLI_VERSION = 1.0.7
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
