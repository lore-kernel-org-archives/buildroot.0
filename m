From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Oct 2020 20:47:38 +0200
Subject: [Buildroot] [PATCH v2] package/libubootenv: bump to version 0.3.1
Message-ID: <20201021184738.1036988-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...xt-do-not-force-the-build-of-a-share.patch | 24 ++++++++++++-------
 package/libubootenv/libubootenv.hash          |  2 +-
 package/libubootenv/libubootenv.mk            |  4 ++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
index c1196d615..2a234af78 100644
--- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -22,25 +22,33 @@ EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON"
 Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
 [Upstream status: http://patchwork.ozlabs.org/patch/1103437/]
 ---
- src/CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ src/CMakeLists.txt | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 051732b..c5f6dcb 100644
+index a04dd11..3a2115d 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -10,10 +10,9 @@ SET(include_HEADERS
-   libuboot.h
- )
+@@ -12,17 +12,15 @@ SET(include_HEADERS
+ 
+ include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
  
 -add_library(ubootenv SHARED ${libubootenv_SOURCES} ${include_HEADERS})
 +add_library(ubootenv ${libubootenv_SOURCES} ${include_HEADERS})
- SET_TARGET_PROPERTIES(ubootenv PROPERTIES SOVERSION ${SOVERSION})
+ SET_TARGET_PROPERTIES(ubootenv PROPERTIES VERSION ${VERSION} SOVERSION ${SOVERSION})
  
 -ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
+-SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
  add_executable(fw_printenv fw_printenv.c)
  add_executable(fw_setenv fw_setenv.c)
  target_link_libraries(fw_printenv ubootenv z)
+ target_link_libraries(fw_setenv ubootenv z)
+ 
+-install (TARGETS ubootenv ubootenv_static DESTINATION ${CMAKE_INSTALL_LIBDIR})
++install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install (FILES libuboot.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
+ install (TARGETS fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
 -- 
-2.7.4
+2.25.1
 
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 6ef2aa788..a655ed234 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15fe743c661e19e0fba6a91cad6e8e295e6358cb917f3752a0bf6e742027252c  libubootenv-86bd30a14e153a18f670b25708795253d8736f0f.tar.gz
+sha256  4c52dd908b69f18cdd5721b3f24573fb276e61115f66edb74906d766ca60399f  libubootenv-0.3.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 65260b70e..61516710a 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 86bd30a14e153a18f670b25708795253d8736f0f
-LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_VERSION = 0.3.1
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
 LIBUBOOTENV_INSTALL_STAGING = YES
-- 
2.25.1
