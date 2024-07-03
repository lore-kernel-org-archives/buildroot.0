Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7225AC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14518414BF;
	Wed,  3 Jul 2024 13:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzlQAGZrp-9W; Wed,  3 Jul 2024 13:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891FE410C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891FE410C3;
	Wed,  3 Jul 2024 13:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4FE31BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC8080C85
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBnS8_MWemNr for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A086A80C21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A086A80C21
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8996483BD3; Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 15:48:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ca30887794c0e9d333df7bcbb162f926bce3ca0
X-Git-Newrev: 3b3cb4e5a71aac0e1133a0f2d51984671ee958ae
X-Patchwork-Hint: ignore
Message-Id: <20240703135352.8996483BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leveldb: update the patches to be
 applied with fuzz 0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b3cb4e5a71aac0e1133a0f2d51984671ee958ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, leveldb fails to build with output:

    Applying 0002-CMake-install-libmemenv.a.patch using patch:
    patching file CMakeLists.txt
    Hunk #1 succeeded at 209 (offset 22 lines).
    Hunk #2 succeeded at 469 (offset 27 lines).
    Hunk #3 FAILED at 495.
    1 out of 3 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

    Applying 0004-cmake-Use-find_package-to-find-Snappy.patch using patch:
    patching file CMakeLists.txt
    Hunk #2 FAILED at 34.
    Hunk #3 succeeded at 301 (offset 22 lines).
    1 out of 3 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../leveldb/0002-CMake-install-libmemenv.a.patch   | 24 ++++++++++++----------
 ...004-cmake-Use-find_package-to-find-Snappy.patch | 18 ++++++++--------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index ea742b0c49..25e050eaff 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -1,4 +1,4 @@
-From 2fa960098e5b6f9daa9f7d6cab27188566859be8 Mon Sep 17 00:00:00 2001
+From ef03beb64f5e8028f6b5d65f75ee60e8b2eec594 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 12 Oct 2019 14:43:46 +0200
 Subject: [PATCH] CMake: install libmemenv.a
@@ -10,15 +10,17 @@ https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa7989
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Fabrice : updated for 1.23]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- CMakeLists.txt | 26 +++++++++++++++++++++++++-
- 1 file changed, 25 insertions(+), 1 deletion(-)
+ CMakeLists.txt | 32 +++++++++++++++++++++++++++++++-
+ 1 file changed, 31 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a65afbf..83b2425 100644
+index f8285b82c6a4..ffce93b01ed6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -187,6 +187,30 @@ target_sources(leveldb
+@@ -209,6 +209,30 @@ target_sources(leveldb
      "${LEVELDB_PUBLIC_INCLUDE_DIR}/write_batch.h"
  )
  
@@ -49,7 +51,7 @@ index a65afbf..83b2425 100644
  if (WIN32)
    target_sources(leveldb
      PRIVATE
-@@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
+@@ -445,7 +469,7 @@ int main() {
  endif(LEVELDB_BUILD_BENCHMARKS)
  
  if(LEVELDB_INSTALL)
@@ -58,8 +60,8 @@ index a65afbf..83b2425 100644
      EXPORT leveldbTargets
      RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
      LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-@@ -444,6 +462,12 @@ if(LEVELDB_INSTALL)
-     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/leveldb
+@@ -471,6 +495,12 @@ if(LEVELDB_INSTALL)
+     DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/leveldb"
    )
  
 +  install(
@@ -69,8 +71,8 @@ index a65afbf..83b2425 100644
 +  )
 +
    include(CMakePackageConfigHelpers)
-   write_basic_package_version_file(
-       "${PROJECT_BINARY_DIR}/leveldbConfigVersion.cmake"
+   configure_package_config_file(
+     "cmake/${PROJECT_NAME}Config.cmake.in"
 -- 
-2.20.1
+2.43.0
 
diff --git a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
index 714e1b0827..e254a26b9a 100644
--- a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
+++ b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
@@ -1,4 +1,4 @@
-From 450c1d88b3e1af34614294830b4dc0612d198d26 Mon Sep 17 00:00:00 2001
+From aa658d96f59d0e29f0d9208b8fbb3cce42e57edc Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Pawe=C5=82=20Bylica?= <chfast@gmail.com>
 Date: Wed, 8 May 2019 10:42:03 +0200
 Subject: [PATCH] cmake: Use find_package() to find Snappy
@@ -9,6 +9,8 @@ in static link configurations]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Fabrice : updated for 1.23]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CMakeLists.txt         | 12 ++++++++----
  cmake/FindSnappy.cmake | 31 +++++++++++++++++++++++++++++++
@@ -16,7 +18,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  create mode 100644 cmake/FindSnappy.cmake
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 78fead6..2efccda 100644
+index 436a9fe5513f..bbd179d3be59 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -6,6 +6,9 @@ cmake_minimum_required(VERSION 3.9)
@@ -29,9 +31,9 @@ index 78fead6..2efccda 100644
  # C standard can be overridden when this is used as a sub-project.
  if(NOT CMAKE_C_STANDARD)
    # This project can use C11, but will gracefully decay down to C89.
-@@ -31,13 +34,14 @@ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
- include(TestBigEndian)
- test_big_endian(LEVELDB_IS_BIG_ENDIAN)
+@@ -34,13 +37,14 @@ option(LEVELDB_BUILD_TESTS "Build LevelDB's unit tests" ON)
+ option(LEVELDB_BUILD_BENCHMARKS "Build LevelDB's benchmarks" ON)
+ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
  
 +find_package(Snappy)
 +
@@ -45,7 +47,7 @@ index 78fead6..2efccda 100644
  check_library_exists(tcmalloc malloc "" HAVE_TCMALLOC)
  
  include(CheckCXXSymbolExists)
-@@ -276,9 +280,9 @@ endif(HAVE_ATOMIC)
+@@ -298,9 +302,9 @@ endif(HAVE_ATOMIC)
  if(HAVE_CRC32C)
    target_link_libraries(leveldb crc32c)
  endif(HAVE_CRC32C)
@@ -60,7 +62,7 @@ index 78fead6..2efccda 100644
  endif(HAVE_TCMALLOC)
 diff --git a/cmake/FindSnappy.cmake b/cmake/FindSnappy.cmake
 new file mode 100644
-index 0000000..88c1de9
+index 000000000000..88c1de98f228
 --- /dev/null
 +++ b/cmake/FindSnappy.cmake
 @@ -0,0 +1,31 @@
@@ -96,5 +98,5 @@ index 0000000..88c1de9
 +  )
 +endif()
 -- 
-2.26.2
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
