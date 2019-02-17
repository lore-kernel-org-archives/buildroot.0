From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Feb 2019 10:35:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/glm: bump to version 0.9.9.3
Message-ID: <20190217093529.5634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Disable tests as they are enabled by default since version 0.9.9.1:
  https://github.com/g-truc/glm/commit/d307d390193f4027faec48ac79d7f74b2bec6e56
- Static and shared libraries are always built since version 0.9.9.1:
  https://github.com/g-truc/glm/commit/a23dd2f800185a5e233534fed82fc5c2840fbe5c
  So, add a patch to fix this behavior and disable them as GLM is
  header-ony
- Add hash for license file (now in manual.md#section0)

Fixes:
 - http://autobuild.buildroot.org/results/3cf1fd3387bd4952470edcfcb93d44f58c9e7ff7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-add-BUILD_-SHARED-STATIC-_LIBS-options.patch | 62 ++++++++++++++++++++++
 package/glm/glm.hash                               |  3 +-
 package/glm/glm.mk                                 | 10 +++-
 3 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 package/glm/0001-CMakeLists-add-BUILD_-SHARED-STATIC-_LIBS-options.patch

diff --git a/package/glm/0001-CMakeLists-add-BUILD_-SHARED-STATIC-_LIBS-options.patch b/package/glm/0001-CMakeLists-add-BUILD_-SHARED-STATIC-_LIBS-options.patch
new file mode 100644
index 0000000000..8f4acdc2fa
--- /dev/null
+++ b/package/glm/0001-CMakeLists-add-BUILD_-SHARED-STATIC-_LIBS-options.patch
@@ -0,0 +1,62 @@
+From efd91329baae4ceeac47307c6634af999a07bb2e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Feb 2019 23:45:21 +0100
+Subject: [PATCH] CMakeLists: add BUILD_{SHARED,STATIC}_LIBS options
+
+Add BUILD_SHARED_LIBS and BUILD_STATIC_LIBS options to allow the user
+to enable/disable building of shared and static library
+
+This is especially useful when cross-compiling as some toolchains are
+not always able to build a shared or a static library
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/g-truc/glm/pull/871]
+---
+ CMakeLists.txt     | 2 ++
+ glm/CMakeLists.txt | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ceccb1e1..10bb1af0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,6 +12,8 @@ include(CMakePackageConfigHelpers)
+ enable_testing()
+ 
+ option(GLM_QUIET "No CMake Message" OFF)
++option(BUILD_SHARED_LIBS "Build shared library" ON)
++option(BUILD_STATIC_LIBS "Build static library" ON)
+ option(GLM_TEST_ENABLE_CXX_98 "Enable C++ 98" OFF)
+ option(GLM_TEST_ENABLE_CXX_11 "Enable C++ 11" OFF)
+ option(GLM_TEST_ENABLE_CXX_14 "Enable C++ 14" OFF)
+diff --git a/glm/CMakeLists.txt b/glm/CMakeLists.txt
+index 01c594f4..032340d4 100644
+--- a/glm/CMakeLists.txt
++++ b/glm/CMakeLists.txt
+@@ -44,6 +44,7 @@ source_group("SIMD Files" FILES ${SIMD_HEADER})
+ 
+ include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
+ 
++if(BUILD_STATIC_LIBS)
+ add_library(glm_static STATIC ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
+ 	${ROOT_SOURCE}    ${ROOT_INLINE}    ${ROOT_HEADER}
+ 	${CORE_SOURCE}    ${CORE_INLINE}    ${CORE_HEADER}
+@@ -51,7 +52,9 @@ add_library(glm_static STATIC ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
+ 	${GTC_SOURCE}     ${GTC_INLINE}     ${GTC_HEADER}
+ 	${GTX_SOURCE}     ${GTX_INLINE}     ${GTX_HEADER}
+ 	${SIMD_SOURCE}    ${SIMD_INLINE}    ${SIMD_HEADER})
++endif()
+ 
++if(BUILD_SHARED_LIBS)
+ add_library(glm_shared SHARED ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
+ 	${ROOT_SOURCE}    ${ROOT_INLINE}    ${ROOT_HEADER}
+ 	${CORE_SOURCE}    ${CORE_INLINE}    ${CORE_HEADER}
+@@ -59,4 +62,5 @@ add_library(glm_shared SHARED ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
+ 	${GTC_SOURCE}     ${GTC_INLINE}     ${GTC_HEADER}
+ 	${GTX_SOURCE}     ${GTX_INLINE}     ${GTX_HEADER}
+ 	${SIMD_SOURCE}    ${SIMD_INLINE}    ${SIMD_HEADER})
++endif()
+ 
+-- 
+2.14.1
+
diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index c87d4ca2f6..87401111c5 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a220e60f8711265595be3221e530d632d5823641ecd46a3a54bc174933bff14c  glm-0.9.8.4.tar.gz
+sha256 fba9fd177073a36c5a7798c74b28e79ba6deb8f4bb0d2dbfc0e207c27da7e12c  glm-0.9.9.3.tar.gz
+sha256 7b27b9d9be8ef1ad8d51d58eaefca1babc4287227c90344390a1759c86dc6d6f  manual.md
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index 1f23146dda..4c789e75d7 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.8.4
+GLM_VERSION = 0.9.9.3
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
-GLM_LICENSE_FILES = copying.txt
+GLM_LICENSE_FILES = manual.md
 
 # GLM is a header-only library, it only makes sense
 # to have it installed into the staging directory.
 GLM_INSTALL_STAGING = YES
 GLM_INSTALL_TARGET = NO
 
+# Don't build libraries as GLM is header-only
+GLM_CONF_OPTS = \
+	-DGLM_TEST_ENABLE=OFF \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DBUILD_STATIC_LIBS=OFF
+
 $(eval $(cmake-package))
-- 
2.14.1
