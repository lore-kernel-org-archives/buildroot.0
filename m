From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Mar 2019 21:20:00 +0100
Subject: [Buildroot] [PATCH] package/openjpeg: security bump to latest git
 version
Message-ID: <20190312202000.28239-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current git contains fixes for a number of post-2.3.0 security issues:

git shortlog --no-merges -i --grep cve --grep overflow --grep zero v2.3.0..
Even Rouault (2):
      Avoid out-of-bounds write overflow due to uint32 overflow computation on images with huge dimensions.
      color_apply_icc_profile: avoid potential heap buffer overflow

Hugo Lefeuvre (4):
      convertbmp: fix issues with zero bitmasks
      jp3d/jpwl convert: fix write stack buffer overflow
      jp2: convert: fix null pointer dereference
      convertbmp: detect invalid file dimensions early

Karol Babioch (2):
      jp3d: Replace sprintf() by snprintf() in volumetobin()
      opj_mj2_extract: Check provided output prefix for length

Stefan Weil (1):
      Fix some potential overflow issues (#1161)

Young_X (5):
      [MJ2] To avoid divisions by zero / undefined behaviour on shift
      [JPWL] fix CVE-2018-16375
      [JPWL] imagetotga(): fix read heap buffer overflow if numcomps < 3 (#987)
      [JPWL] opj_compress: reorder checks related to code block dimensions to avoid potential int overflow
      [JP3D] To avoid divisions by zero / undefined behaviour on shift (CVE-2018-14423

ichlubna (1):
      openjp3d: Int overflow fixed (#1159)

setharnold (1):
      fix unchecked integer multiplication overflow

Drop now upstreamed 0004-install-static-lib.patch.

Add a hash for the LICENSE file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/0004-install-static-lib.patch | 27 --------------------------
 package/openjpeg/openjpeg.hash                 |  3 ++-
 package/openjpeg/openjpeg.mk                   |  4 ++--
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 package/openjpeg/0004-install-static-lib.patch

diff --git a/package/openjpeg/0004-install-static-lib.patch b/package/openjpeg/0004-install-static-lib.patch
deleted file mode 100644
index 4a3bbfa28a..0000000000
--- a/package/openjpeg/0004-install-static-lib.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 66297f07a43d2770a97c8456d20202f3d051d980 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Mon, 9 Oct 2017 11:40:43 +0200
-Subject: [PATCH] Unix build: fix regression of 2.3.0 where a shared-only or
- static-only build lacks the installation target for the library (#1019, fixes
- regression introduced by 3dfc6ca2bcf06fd1adb6b6b4cecc6c092f08ba0b)
-
-Downloaded from upstream commit
-https://github.com/uclouvain/openjpeg/commit/66297f07a43d2770a97c8456d20202f3d051d980
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/lib/openjp2/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib/openjp2/CMakeLists.txt b/src/lib/openjp2/CMakeLists.txt
-index 0b4520384..f8990ccf0 100644
---- a/src/lib/openjp2/CMakeLists.txt
-+++ b/src/lib/openjp2/CMakeLists.txt
-@@ -99,6 +99,7 @@ else()
-     set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME} openjp2_static)
-   else()
-     add_library(${OPENJPEG_LIBRARY_NAME} ${OPENJPEG_SRCS})
-+    set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME})
-   endif()
- endif()
- 
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index dd3cf26cf0..8a6fda48c4 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 3dc787c1bb6023ba846c2a0d9b1f6e179f1cd255172bde9eb75b01f1e6c7d71a  openjpeg-2.3.0.tar.gz
+sha256 3389a1aa908c2b577863da213db3a170df3edbb1432e99ae5fd3f2ac721d69d3  openjpeg-51f097e6d5754ddae93e716276fe8176b44ec548.tar.gz
+sha256 a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 9a8fdab7a4..6036ab95a3 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.3.0
-OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
+OPENJPEG_VERSION = 51f097e6d5754ddae93e716276fe8176b44ec548
+OPENJPEG_SITE = $(call github,uclouvain,openjpeg,$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
-- 
2.11.0
