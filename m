From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 22:34:37 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjpeg: fix
 build with poppler
Message-ID: <20210111220104.9AF4E8634A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=144c1afa571c491f6ab9426d3e2f8ec6dbfd2b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix build of poppler with openjpeg in version 2.4.0

Fixes:
 - http://autobuild.buildroot.org/results/e4e43519a1c70686844b08257971cc350a746636

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d92539e25594c8954eab2073a9940fd5881e04c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch b/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch
new file mode 100644
index 0000000000..b85556a679
--- /dev/null
+++ b/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch
@@ -0,0 +1,37 @@
+From 14f4c27e7c91f745a1dda9991b5deea3cbef2072 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 7 Jan 2021 14:09:50 +0100
+Subject: [PATCH] Revert "Use INC_DIR for OPENJPEG_INCLUDE_DIRS (fixes
+ uclouvain#1174)"
+
+This reverts commit 65586374d639cfc0104419992f9022174b412594 which
+breaks cross-compilation of poppler under buildroot (because of
+DESTDIR usage).
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/uclouvain/openjpeg/pull/1321]
+---
+ cmake/OpenJPEGConfig.cmake.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
+index 8a726697..2925108a 100644
+--- a/cmake/OpenJPEGConfig.cmake.in
++++ b/cmake/OpenJPEGConfig.cmake.in
+@@ -27,8 +27,12 @@ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
+   # This is an install tree
+   include(${SELF_DIR}/OpenJPEGTargets.cmake)
+ 
++  # We find a relative path from the PKG directory to header files.
++  set(PKG_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_PACKAGE_DIR@")
+   set(INC_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_INCLUDE_DIR@")
+-  get_filename_component(OPENJPEG_INCLUDE_DIRS "${INC_DIR}" ABSOLUTE)
++  file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")
++
++  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_INC_RPATH}" ABSOLUTE)
+ 
+ else()
+   if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
+-- 
+2.29.2
+
