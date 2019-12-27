From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Dec 2019 13:42:08 +0100
Subject: [Buildroot] [RFC v2 2/2] package/qt5: bump latest version to 5.14.0
In-Reply-To: <20191227124208.4039-1-ps.report@gmx.net>
References: <20191227124208.4039-1-ps.report@gmx.net>
Message-ID: <20191227124208.4039-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base:
 - rebased 0004-double-conversion-enable-for-microblaze.patch

qt5declarative:
 - rebased 0001-qsgtexture-fix-debug-build-with-uclibc.patch

qt5tools:
 - add 0001-Disable-designer-tool-fixes-configure-error.patch
   ToDo: add proper fix/workaround

qt5webengine:
 - update 3rdparty license file list

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes
---
 package/qt5/Config.in                         |   4 +-
 package/qt5/qt5.mk                            |   4 +-
 package/qt5/qt53d/qt53d.hash                  |   4 +-
 ...tbase-Fix-build-error-when-using-EGL.patch |   0
 ...ble-conversion-enable-for-microblaze.patch |  24 +-
 .../qt5base/{5.13.2 => 5.14.0}/qt5base.hash   |   4 +-
 package/qt5/qt5charts/qt5charts.hash          |   4 +-
 .../{5.13.2 => 5.14.0}/qt5connectivity.hash   |   4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  20 +-
 .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
 .../qt5graphicaleffects.hash                  |   4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
 package/qt5/qt5location/qt5location.hash      |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
 .../{5.13.2 => 5.14.0}/qt5quickcontrols2.hash |   4 +-
 package/qt5/qt5script/qt5script.hash          |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
 .../{5.13.2 => 5.14.0}/qt5serialbus.hash      |   4 +-
 .../{5.13.2 => 5.14.0}/qt5serialport.hash     |   4 +-
 package/qt5/qt5svg/qt5svg.hash                |   4 +-
 ...-designer-tool-fixes-configure-error.patch |  44 ++++
 package/qt5/qt5tools/qt5tools.hash            |   4 +-
 .../qt5virtualkeyboard.hash                   |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
 .../{5.13.2 => 5.14.0}/qt5webengine.hash      | 209 ++++++++++--------
 package/qt5/qt5webengine/chromium-latest.inc  | 143 ++++++------
 package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
 package/qt5/qt5webview/qt5webview.hash        |   4 +-
 .../{5.13.2 => 5.14.0}/qt5x11extras.hash      |   4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
 33 files changed, 310 insertions(+), 238 deletions(-)
 rename package/qt5/qt5base/{5.13.2 => 5.14.0}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.13.2 => 5.14.0}/0004-double-conversion-enable-for-microblaze.patch (59%)
 rename package/qt5/qt5base/{5.13.2 => 5.14.0}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.13.2 => 5.14.0}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.13.2 => 5.14.0}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (73%)
 rename package/qt5/qt5quickcontrols2/{5.13.2 => 5.14.0}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.13.2 => 5.14.0}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.13.2 => 5.14.0}/qt5serialport.hash (65%)
 create mode 100644 package/qt5/qt5tools/5.14.0/0001-Disable-designer-tool-fixes-configure-error.patch
 rename package/qt5/qt5virtualkeyboard/{5.13.2 => 5.14.0}/qt5virtualkeyboard.hash (70%)
 rename package/qt5/qt5webengine/{5.13.2 => 5.14.0}/qt5webengine.hash (80%)
 rename package/qt5/qt5x11extras/{5.13.2 => 5.14.0}/qt5x11extras.hash (65%)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3572990a13..9e4d137d76 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -33,13 +33,13 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.13)"
+	bool "Latest (5.14)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.13, which is licensed under
+	  This option builds Qt 5.14, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs a toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index fc1606df80..82c0803f9d 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.13
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION_MAJOR = 5.14
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index a854a7e4ac..3db9b88dcd 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qt3d-everywhere-src-5.13.2.tar.xz.sha256
-sha256 d1b9fc0be82264b5f76c3a5330901dff95c1f2bcb67916c3fac6bad4ff69adc9 qt3d-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qt3d-everywhere-src-5.14.0.tar.xz.sha256
+sha256 515b57d0f99be48f70817cf73bc8a0c0e63f7c9c41dbf35fc8baf065fc752515 qt3d-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.13.2/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.14.0/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.13.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.14.0/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.13.2/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.14.0/0004-double-conversion-enable-for-microblaze.patch
similarity index 59%
rename from package/qt5/qt5base/5.13.2/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.14.0/0004-double-conversion-enable-for-microblaze.patch
index c91d812695..a772eb978e 100644
--- a/package/qt5/qt5base/5.13.2/0004-double-conversion-enable-for-microblaze.patch
+++ b/package/qt5/qt5base/5.14.0/0004-double-conversion-enable-for-microblaze.patch
@@ -1,4 +1,4 @@
-From 014958d2d17045dd63d93cb3061d1e40b15725b7 Mon Sep 17 00:00:00 2001
+From a02b5e3bb41026ca6031d01942a093e9ce54edf3 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 21 Aug 2018 21:11:40 +0200
 Subject: [PATCH] double-conversion: enable for microblaze
@@ -6,24 +6,24 @@ Subject: [PATCH] double-conversion: enable for microblaze
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Rebased for Qt5.12.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.14.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- .../double-conversion/include/double-conversion/utils.h        | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ src/3rdparty/double-conversion/include/double-conversion/utils.h | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index 7622fe6162..d29de95094 100644
+index 70e697ca..2bb8e389 100644
 --- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
 +++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -94,7 +94,8 @@ int main(int argc, char** argv) {
-     defined(_MIPS_ARCH_MIPS32R2) || \
+@@ -102,6 +102,7 @@ int main(int argc, char** argv) {
      defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-     defined(__riscv) || defined(__EMSCRIPTEN__) || \
--    defined(__or1k__)
-+    defined(__or1k__)  || \
-+    defined(__microblaze__)
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
++    defined(__microblaze__) || \
+     defined(__EMSCRIPTEN__)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
  #elif defined(__mc68000__) || \
-     defined(__pnacl__) || defined(__native_client__)
 -- 
-2.19.2
+2.23.0
 
diff --git a/package/qt5/qt5base/5.13.2/qt5base.hash b/package/qt5/qt5base/5.14.0/qt5base.hash
similarity index 73%
rename from package/qt5/qt5base/5.13.2/qt5base.hash
rename to package/qt5/qt5base/5.14.0/qt5base.hash
index 2ae6279926..7013485d00 100644
--- a/package/qt5/qt5base/5.13.2/qt5base.hash
+++ b/package/qt5/qt5base/5.14.0/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtbase-everywhere-src-5.13.2.tar.xz.sha256
-sha256 26b6b686d66a7ad28eaca349e55e2894e5a735f3831e45f2049e93b1daa92121 qtbase-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtbase-everywhere-src-5.14.0.tar.xz.sha256
+sha256 4ef921c0f208a1624439801da8b3f4344a3793b660ce1095f2b7f5c4246b9463 qtbase-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index f1111d3c47..0bf1cc86c2 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtcharts-everywhere-src-5.13.2.tar.xz.sha256
-sha256 3bad81c3cfb32cf72fb0ce2ac2794d031cf78a3902b4715f89c09b2d0e041e87 qtcharts-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtcharts-everywhere-src-5.14.0.tar.xz.sha256
+sha256 ce7e22ca84e6a5fb85d6eb9e196407e0fa02848187548a2c388668e71f41a346 qtcharts-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash b/package/qt5/qt5connectivity/5.14.0/qt5connectivity.hash
similarity index 65%
rename from package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.14.0/qt5connectivity.hash
index 3567d91c86..23bd5bd362 100644
--- a/package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.14.0/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtconnectivity-everywhere-src-5.13.2.tar.xz.sha256
-sha256 644e234eb64f602ef5cdeb8802ef9b58e75478f1124f001937275d62ed692e17 qtconnectivity-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtconnectivity-everywhere-src-5.14.0.tar.xz.sha256
+sha256 2843b3b479d0feba0624eb4ae41382b99db77b87a6b7dea5aacdf3b33644f0bd qtconnectivity-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.13.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.14.0/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 73%
rename from package/qt5/qt5declarative/5.13.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.14.0/0001-qsgtexture-fix-debug-build-with-uclibc.patch
index 1c0f6eccc5..b6de49e169 100644
--- a/package/qt5/qt5declarative/5.13.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
+++ b/package/qt5/qt5declarative/5.14.0/0001-qsgtexture-fix-debug-build-with-uclibc.patch
@@ -1,4 +1,4 @@
-From 2a5711651bee9d021733da19126a71aeda45e646 Mon Sep 17 00:00:00 2001
+From dfa9555010535003eac69788597f53d3ff44168f Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 29 Nov 2018 23:33:10 +0100
 Subject: [PATCH] qsgtexture: fix debug build with uclibc
@@ -23,17 +23,19 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://github.com/qt/qtdeclarative/pull/4]
+[Rebased for Qt5.14.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- src/quick/scenegraph/util/qsgtexture.cpp | 2 +-
+ src/quick/scenegraph/coreapi/qsgtexture.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/quick/scenegraph/util/qsgtexture.cpp b/src/quick/scenegraph/util/qsgtexture.cpp
-index fea92a512..a26191006 100644
---- a/src/quick/scenegraph/util/qsgtexture.cpp
-+++ b/src/quick/scenegraph/util/qsgtexture.cpp
-@@ -53,7 +53,7 @@
- #endif
+diff --git a/src/quick/scenegraph/coreapi/qsgtexture.cpp b/src/quick/scenegraph/coreapi/qsgtexture.cpp
+index dfbe4d3f..6a7bc79b 100644
+--- a/src/quick/scenegraph/coreapi/qsgtexture.cpp
++++ b/src/quick/scenegraph/coreapi/qsgtexture.cpp
+@@ -46,7 +46,7 @@
  #include <private/qsgmaterialshader_p.h>
+ #include <QtGui/private/qrhi_p.h>
  
 -#if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID) && defined(__GLIBC__)
 +#if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID) && defined(__GLIBC__) && !defined(__UCLIBC__)
@@ -41,5 +43,5 @@ index fea92a512..a26191006 100644
  #endif
  
 -- 
-2.14.1
+2.23.0
 
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index bb23649ecf..eabb1a3519 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtdeclarative-everywhere-src-5.13.2.tar.xz.sha256
-sha256 d9a524f45fe9e136cda2252f9d7013ec17046d907e3f39606db920987c22d1fd qtdeclarative-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtdeclarative-everywhere-src-5.14.0.tar.xz.sha256
+sha256 bbf11ee33d6f0d6bd6c4dc641d4f2aafbc7c6cd3b421a658955302d441dc9d8e qtdeclarative-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 83bb0472d4..d7d7e6ea35 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtgraphicaleffects-everywhere-src-5.13.2.tar.xz.sha256
-sha256 297a89bb6c771f849c4ce866e5c98dadf665163b3dab03bc48a58f51424e7e66 qtgraphicaleffects-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtgraphicaleffects-everywhere-src-5.14.0.tar.xz.sha256
+sha256 d931637d97cbb0e57bf2d78bf0eb06494f21a05d2e6a17e7c4f4f2a2fabc23cd qtgraphicaleffects-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index b78e14f8db..7d13efac56 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtimageformats-everywhere-src-5.13.2.tar.xz.sha256
-sha256 6968649fdccc7d633cf9ada25f1bdaf0a2fb45a214d58c2c47896166d4553ac0 qtimageformats-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtimageformats-everywhere-src-5.14.0.tar.xz.sha256
+sha256 959f169af5fc09ef248062a457b78a667acafee71e57ea14fb14ff6f5dd898d5 qtimageformats-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 5aeb73ef70..36db3cb455 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtlocation-everywhere-src-5.13.2.tar.xz.sha256
-sha256 5fe4b824d3dc6c800682ff986333ec09edb9c27582066e928b1862b4d58212e3 qtlocation-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtlocation-everywhere-src-5.14.0.tar.xz.sha256
+sha256 87906fd100dd93ed495a4db2c435dcfab073d399ea11d5e18727cc782fac4cd1 qtlocation-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index c497149f44..657d01325a 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtmultimedia-everywhere-src-5.13.2.tar.xz.sha256
-sha256 5f885459d46ea2f2bb24597678befd4913d8f88029730d01984f51f9c367b9f4 qtmultimedia-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtmultimedia-everywhere-src-5.14.0.tar.xz.sha256
+sha256 e7901aa32fe71f1409cf73a0c62f27b98f434688e7b16ea8591b29cd8f90ad5e qtmultimedia-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index d2b61be2d3..c102051b9c 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtquickcontrols-everywhere-src-5.13.2.tar.xz.sha256
-sha256 d6e64d8db13ada55fcb0d5e8ca26097085680087d931435c6c6db859d87493ea qtquickcontrols-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtquickcontrols-everywhere-src-5.14.0.tar.xz.sha256
+sha256 6dd477bcb36a94ab417faab5e607f7a07c217c4ca3f751d8d76d475ab0f3558e qtquickcontrols-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.14.0/qt5quickcontrols2.hash
similarity index 54%
rename from package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.14.0/qt5quickcontrols2.hash
index 568dd84b15..b329653aa2 100644
--- a/package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.14.0/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtquickcontrols2-everywhere-src-5.13.2.tar.xz.sha256
-sha256 90ee8be7b66cc65f3f22e71a0b35adab5c169ac4f8ebc6f9e7685228bf8a7d70 qtquickcontrols2-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtquickcontrols2-everywhere-src-5.14.0.tar.xz.sha256
+sha256 827bf86db44ce4f698f172378313db04e1cb81c593e9342bdd95bb1708f27911 qtquickcontrols2-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 4cb90eeea3..1d00ce965f 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtscript-everywhere-src-5.13.2.tar.xz.sha256
-sha256 3d92691c25577fbf7511d40253de0cd9d31444ea5a0aa860f65efb9fa0f3ce70 qtscript-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtscript-everywhere-src-5.14.0.tar.xz.sha256
+sha256 6715ed5294013edfc338367b63ee6df2438965e4626435f30837e26a2151d3b9 qtscript-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 3841a293a8..96cd36076b 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtscxml-everywhere-src-5.13.2.tar.xz.sha256
-sha256 e489dff21e18c1e7f72ffd31af82404f845bd90824c6b978140591366398a9d9 qtscxml-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtscxml-everywhere-src-5.14.0.tar.xz.sha256
+sha256 7ed1497dc35f9b5d16a1ad529c3c181973ecae71b31db04aaeb5743f15b4feab qtscxml-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index a14e6a590e..3bd592c990 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtsensors-everywhere-src-5.13.2.tar.xz.sha256
-sha256 46f73bbfddfd78a419c6424d6839318774b84c955a7f7a96c12c590f6d8fb177 qtsensors-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtsensors-everywhere-src-5.14.0.tar.xz.sha256
+sha256 306fc19309b218b062eb6415e2a8364c5c3b53c2942e200012d45f0c33717926 qtsensors-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.14.0/qt5serialbus.hash
similarity index 60%
rename from package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.14.0/qt5serialbus.hash
index cd5a39845c..539ed9b47b 100644
--- a/package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.14.0/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtserialbus-everywhere-src-5.13.2.tar.xz.sha256
-sha256 48159393b1368976b5324eac48424e2a6e5d63c783194d0576a978151f882da3 qtserialbus-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtserialbus-everywhere-src-5.14.0.tar.xz.sha256
+sha256 4c6a79a7c993200cd5043a321b9b0597a4e678f58e6b5b32931cce59bcab7694 qtserialbus-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.13.2/qt5serialport.hash b/package/qt5/qt5serialport/5.14.0/qt5serialport.hash
similarity index 65%
rename from package/qt5/qt5serialport/5.13.2/qt5serialport.hash
rename to package/qt5/qt5serialport/5.14.0/qt5serialport.hash
index b1cbe3cc72..37fc802890 100644
--- a/package/qt5/qt5serialport/5.13.2/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.14.0/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtserialport-everywhere-src-5.13.2.tar.xz.mirrorlist
-sha256 7677ffc1dce3b75c0a98d07d215588a8dccb5c276c55b4ecd60c35ed1c89cb34 qtserialport-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtserialport-everywhere-src-5.14.0.tar.xz.mirrorlist
+sha256 4b647a66ae4da6b05b41b49ed296012002c1951f8a3ee24e0f2aa493f48e1ed3 qtserialport-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 18f2c57095..4902fb176f 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtsvg-everywhere-src-5.13.2.tar.xz.sha256
-sha256 849e2e357e1333b64ecb728352f652cd8d916f029ed848f775b15d0b500cb7d7 qtsvg-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtsvg-everywhere-src-5.14.0.tar.xz.sha256
+sha256 1ee51a66e1996f96bf7fd4c696079c4cb22ea2bc710d47535c1daf3638d8f393 qtsvg-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/5.14.0/0001-Disable-designer-tool-fixes-configure-error.patch b/package/qt5/qt5tools/5.14.0/0001-Disable-designer-tool-fixes-configure-error.patch
new file mode 100644
index 0000000000..786fd5c356
--- /dev/null
+++ b/package/qt5/qt5tools/5.14.0/0001-Disable-designer-tool-fixes-configure-error.patch
@@ -0,0 +1,44 @@
+From ba3c7c2233e8d4875abd6c391764d87a9bd59c5d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 17 Dec 2019 11:01:59 +0100
+Subject: [PATCH] Disable designer tool (fixes configure error).
+
+Fixes:
+
+  .../build/qt5tools-5.14.0/src/designer/src/components/lib/lib.pro
+  Project ERROR: Multiple modules claim plugin type 'designer' (uitools, in addition to designer)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/linguist/linguist/linguist.pro | 2 +-
+ src/src.pro                        | 3 ---
+ 2 files changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/linguist/linguist/linguist.pro b/src/linguist/linguist/linguist.pro
+index af74df8..d7dfd7a 100644
+--- a/src/linguist/linguist/linguist.pro
++++ b/src/linguist/linguist/linguist.pro
+@@ -1,4 +1,4 @@
+-QT += core-private gui-private widgets xml uitools-private printsupport
++QT += core-private gui-private widgets xml printsupport
+ 
+ DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII
+ 
+diff --git a/src/src.pro b/src/src.pro
+index 5c256ea..6d079be 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -7,10 +7,7 @@ qtHaveModule(widgets) {
+         QT_FOR_CONFIG += widgets
+         qtConfig(pushbutton):qtConfig(toolbutton) {
+             SUBDIRS = assistant \
+-                      designer \
+                       pixeltool
+-
+-            linguist.depends = designer
+         }
+         qtHaveModule(quick):qtConfig(thread):qtConfig(toolbutton): SUBDIRS += distancefieldgenerator
+     }
+-- 
+2.23.0
+
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index a14553486d..06b5891888 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qttools-everywhere-src-5.13.2.tar.xz.sha256
-sha256 919a2713b6d2d7873a09ad85bd93cf4282606e5bf84d5884250f665a253ec06e qttools-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qttools-everywhere-src-5.14.0.tar.xz.sha256
+sha256 8d7f8612ab6078fe7289d8a8dd8112b550fd0f51b5455df2dcfba651c30c3adf qttools-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.14.0/qt5virtualkeyboard.hash
similarity index 70%
rename from package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.14.0/qt5virtualkeyboard.hash
index 1301e51ef5..8d9c6c35a4 100644
--- a/package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.14.0/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtvirtualkeyboard-everywhere-src-5.13.2.tar.xz.sha256
-sha256 8e368dde237d21666f6cc8512a060e205388e519a4d7559c0505cc75224ed62b qtvirtualkeyboard-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtvirtualkeyboard-everywhere-src-5.14.0.tar.xz.sha256
+sha256 2f3362bf7999b912a4e92d0e9b5378089bc8dfcf270fe226bc68f2050de31410 qtvirtualkeyboard-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 42354cd36b..9235723679 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwayland-everywhere-src-5.13.2.tar.xz.sha256
-sha256 3c9b2358d9cee02552b875db93b56f3b9bc3b0f4df7a2ff7e8b72f2a8f2ca952 qtwayland-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtwayland-everywhere-src-5.14.0.tar.xz.sha256
+sha256 32d4fadb3a8dcee8953e6d92ee567927cd7649be6fc8dd378480664902c22610 qtwayland-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 08d681dafb..2fcfbebb62 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebchannel-everywhere-src-5.13.2.tar.xz.sha256
-sha256 f452d419d8b19b566835f316bbf282dabc8b1c2a74c9c98c1aec4184465e9c13 qtwebchannel-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtwebchannel-everywhere-src-5.14.0.tar.xz.sha256
+sha256 0cb8dd07b34da8d44f8a14701409ce87fce5010f9b57273b357717c2dfd35383 qtwebchannel-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.13.2/qt5webengine.hash b/package/qt5/qt5webengine/5.14.0/qt5webengine.hash
similarity index 80%
rename from package/qt5/qt5webengine/5.13.2/qt5webengine.hash
rename to package/qt5/qt5webengine/5.14.0/qt5webengine.hash
index 8fc44e517e..6543113e07 100644
--- a/package/qt5/qt5webengine/5.13.2/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.14.0/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebengine-everywhere-src-5.13.2.tar.xz.sha256
-sha256 adcf56b5de6f34744bba2307b696fc75611884f4270e87dfa760d6e99dd711bb qtwebengine-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtwebengine-everywhere-src-5.14.0.tar.xz.sha256
+sha256 74f8c11cc318612c8d9dc87cf791badb1efe7080c10d8b3ed5843b249a942d32 qtwebengine-everywhere-src-5.14.0.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -11,6 +11,7 @@ sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE
 
 # Locally calculated with:
 # for i in $(find src/3rdparty/ -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before') ; do echo -n "sha256 " ; sha256sum $i ; done | sort --key=3
+sha256 3ed00dd93c75655599456c83cba2f69c6824fd53f24fc24206ba27b65057709d  src/3rdparty/chromium/base/third_party/cityhash/COPYING
 sha256 d04360743ae3338bb08ab2106b51e24309e3ca4b1c6b1186139531ade351b7e3  src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE
 sha256 96e7ccbf8d17e319dd77c4ebd4965b64a820bbcc3142a2478fbf95af77417b6a  src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE
 sha256 5d85142a5609ad177a2d7a2e7cae060b886b8b42f25c5b9803cf0cb5ee04ad2f  src/3rdparty/chromium/base/third_party/icu/LICENSE
@@ -31,16 +32,19 @@ sha256 a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  src/3rd
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/net/third_party/quiche/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/net/third_party/uri_template/LICENSE
 sha256 834ee20e8fc3235722ed801bae30cc539c2775be656ff9cc2810fe674e53d5ec  src/3rdparty/chromium/ppapi/LICENSE
-sha256 8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  src/3rdparty/chromium/third_party/abseil-cpp/LICENSE
+sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  src/3rdparty/chromium/third_party/abseil-cpp/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE
 sha256 bf4da21bd20bcfb5b60b7ecc67fa864a79be049e21d6178076887f178dd6c71a  src/3rdparty/chromium/third_party/angle/LICENSE
 sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE
 sha256 86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE
 sha256 a08ba10adec47027ef8078848729837b1c5a42f140718d7afd65c23f1eeec392  src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE
 sha256 31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE
+sha256 bfec18debedcb337f8af53f143ccf0b1575d0b7c30deaee137f10397eca0d353  src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE
+sha256 1cb2d2f0c068fe473ae53779068384bac433e033af76e75d29a79223315a5e49  src/3rdparty/chromium/third_party/apache-mac/LICENSE
 sha256 29028ec63522121b5545046e0c4d3ccc1e01fc8d9aaa3272554f74829cdacf84  src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE
 sha256 b23e682fda7310afe43505ed6041919ccff8f9e0c6799ebd7542cbcef11102e3  src/3rdparty/chromium/third_party/apple_apsl/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE
 sha256 584e795ba5833279c327245594d6dc216fc664144fa3626a0bdf136bc00af76c  src/3rdparty/chromium/third_party/arcore-android-sdk/LICENSE
 sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/axe-core/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/bazel/LICENSE
@@ -49,8 +53,8 @@ sha256 a661d10f8f194b1963a75bb4d308f17b078cc064624313a556902d89705f6876  src/3rd
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE
 sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2
 sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2/lighthouse/LICENSE
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2_worker/lighthouse/LICENSE
+sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits/lighthouse/LICENSE
+sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits_worker/lighthouse/LICENSE
 sha256 a3f2fe2ac6b471aa80c737c5d283dd049bdc903a73835ee6d4d2cac02fdd53bf  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE
 sha256 c6daa4e8737d15aa7140b4f7eb82b9d4829bd2fd27132c43e282203b9c67dfc4  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE_python
 sha256 13110d66c514a7890c4b388a353bc08fa094fe13d5ed7f3a222cc0a0caa3fd17  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE
@@ -58,10 +62,11 @@ sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rd
 sha256 1490793b8913f0fa78af7bf2e70076f54272748e278f065c50794529eaed8e74  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE
 sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/third_party/blink/renderer/devtools/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/blink/renderer/devtools/scripts/closure/COPYING
+sha256 6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2  src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Noto/LICENSE_OFL.txt
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE
-sha256 4165ae4c9c71da3e655a9acee8ee3368bba20f0702f4dcc994da315132ab90de  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md
+sha256 5a7b465d39b5e018bc40cc34162176269f7c476989cb4dbcf0ec0b81701545a7  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md
 sha256 88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/enum/enum/LICENSE
 sha256 663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/h2/LICENSE
 sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hpack/LICENSE
@@ -69,10 +74,10 @@ sha256 16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  src/3rd
 sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hyperframe/LICENSE
 sha256 63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE
 sha256 df336397e09e764416fc33b555703b1cdddd3a0cfea8a013ad1cad565c8be2f5  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE
-sha256 60bd7c54856bf9387221bde5ab55d516d7cea15870d0fed69406bcd1c8ec7c9d  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
-sha256 201d494a3f42450a28df2f0919a147e9a5296e841df5d415172a0ca8b558d0a8  src/3rdparty/chromium/third_party/boringssl/src/third_party/android-cmake/LICENSE
+sha256 64fee5ec1a356f70c7c258b344b64e87a98a66fe1bd49d5fd34573350e43567b  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
 sha256 0c125a4dab5ab869473e6491db22f6c0a7f8a4de58588d03bb2b16c0c8ebd7de  src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/LICENSE
+sha256 c544adf8f0d43453d9fdf6c11da19605d12d89806a7870653169b8cc97f5bb53  src/3rdparty/chromium/third_party/boringssl/src/third_party/sike/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE
 sha256 5740985669353ef52e0f320413ff68dc62b6c23a596cd78b6d6b80764f1c50ab  src/3rdparty/chromium/third_party/bouncycastle/LICENSE
 sha256 f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  src/3rdparty/chromium/third_party/breakpad/breakpad/LICENSE
@@ -92,6 +97,7 @@ sha256 17afb4516438c26ee15213c5a082206340d976a68472b8eab2499d7bce4debec  src/3rd
 sha256 1920d2326ebbad34dcbd9681b4fe4926f113aa5e7dc9a92fceb456d859ee142e  src/3rdparty/chromium/third_party/catapult/tracing/third_party/d3/LICENSE
 sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/catapult/tracing/third_party/devscripts/COPYING
 sha256 e8b80a53d0f95a3cf0f992f8cfc6b3911a7f32f47e0e4a8d4fd66582eeae9484  src/3rdparty/chromium/third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md
+sha256 be3fd324066af702fad2a9ef05664ce9665495ebc1824fd7b28960802ec7891e  src/3rdparty/chromium/third_party/catapult/tracing/third_party/jpeg-js/LICENSE
 sha256 aae03c510d63d96de72d37ce5650fbbac63b322d09ac0ee0df50b8950329e840  src/3rdparty/chromium/third_party/catapult/tracing/third_party/jszip/LICENSE.markdown
 sha256 1f194a987fa1dc60e4bcf5e04e0fc03fff8f2ee587c52136adb2cebb397250b8  src/3rdparty/chromium/third_party/catapult/tracing/third_party/mocha/LICENSE
 sha256 a04665b3b2de56c66730c1f720f528175739e4104f79073614aa611da1e85539  src/3rdparty/chromium/third_party/catapult/tracing/third_party/pako/LICENSE
@@ -100,144 +106,150 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 3d1d2669d0ba87069b5e202f106193c4eb0e140a2aead31dca9670a0581dd979  src/3rdparty/chromium/third_party/chaijs/LICENSE
 sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  src/3rdparty/chromium/third_party/checkstyle/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20
+sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/LICENSE
+sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE
 sha256 212846e0145aa50fb3a5aef254a370311a93acf6c1e792e47e0068d64c8c3885  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE
 sha256 4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE
 sha256 f40ee07401827b6ac9cf0aee1aaffb00e42a3f2c729f9c83f96a3daafef5d944  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/getopt/LICENSE
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/glibc/COPYING.LIB
+sha256 e5881019d8766c1e88a5fe1dbca4ba40c78011d41fcb18f6e9f50df60182685b  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/xnu/APPLE_LICENSE
 sha256 a1f30b77c01e0995fa32a00119e00749e8731ee8a3c4c3549bce74083c72b0b6  src/3rdparty/chromium/third_party/crc32c/src/LICENSE
 sha256 e9427cf6abc4eaeda0bcd094fca46af4067970079f426b65d5cbacb87bff6366  src/3rdparty/chromium/third_party/cros_system_api/LICENSE
 sha256 09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE
 sha256 7a3cb0e5055874e67db9aa2d5fe26de23204fa994ffbad198901ffe9c812a717  src/3rdparty/chromium/third_party/d3/src/LICENSE
+sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  src/3rdparty/chromium/third_party/dav1d/libdav1d/COPYING
+sha256 2da4494d2a8b5c742afbb905b10621e40129284c977ac138e3081ed0d9d83aed  src/3rdparty/chromium/third_party/dav1d/LICENSE
 sha256 b77e952e3feaebd807d27784988b19fb60f83f9fc9a0c03e6aedbbffd5d6f8ee  src/3rdparty/chromium/third_party/dawn/LICENSE
 sha256 43452b94e6aa0c2d076ad25b87f580c11571689d52f3aa1a1f7bdcab31a0bd15  src/3rdparty/chromium/third_party/decklink/LICENSE
 sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/devscripts/COPYING
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE
-sha256 a19859c623cc60b717560cafb5fe64244735022c1200b65a649a3c2eef912fb4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE
-sha256 491b4012bfc95982e66859c59641be20f4fd2c9b3bc2b6a7f26b6166e462dda1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/node_modules/acorn/LICENSE
-sha256 e2ddad70d6b6bcfec887c32d7143a77ccbdb58e38d9c43f5b7f30f715b874b80  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE
-sha256 a25dce9c94c3ad622574cffbefd4b8845b418aa65df966d97e3204ad276ed240  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv-keywords/LICENSE
-sha256 4969b0ff94c4f2ad3f1613d95b3966cb4c3147d8b893654aced81029241de176  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE
+sha256 cfa72b62b9ae173078823a3796b25c027a9071046a263beddf966df67018ce06  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE
+sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE
+sha256 e85e131fa4ed25538ff1f4962ced1fb6f68b079bd9164a790597a0f30b8fd030  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-escapes/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE
 sha256 c8442419dc614089ea022b3da6bfc089b41a58fb7b9030d1e651f2f36189dce2  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/argparse/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/array-union/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/array-uniq/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/arrify/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/babel-code-frame/node_modules/chalk/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/babel-code-frame/node_modules/strip-ansi/LICENSE
-sha256 a1bd5deadb6a06dd74efa852c1b8b23f63b67f2214fbe9c8bd591da51da69268  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE
+sha256 69dee148a2cc470554dfa7142e830662062394d0fe67cddd379aba90dc60d6b3  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/astral-regex/license
+sha256 517913953e6a69da35bccb95c2d801f70d73e8f267cdad1a1615bfe8974ad3ad  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/code-frame/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/highlight/LICENSE
+sha256 a1bd5deadb6a06dd74efa852c1b8b23f63b67f2214fbe9c8bd591da51da69268  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE.md
+sha256 68f12f6e2c33688699249c01d8f9623c534da20aa71989c57b061b7bc1676d14  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/brace-expansion/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/callsites/license
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/node_modules/ansi-styles/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/node_modules/supports-color/LICENSE
-sha256 7d043a9e52b7e1e3acab9ca3377e30ca72d25d39ad6e6c5a22b407fe39c6d703  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE
-sha256 aa7c48d39d3bb837efa4fce39f971fa6ae8e5cb148724af8867a7a4a7121ad6a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/circular-json/LICENSE
+sha256 7df1d6cf5b4112cbe277a84269e02ae631603a9a3a21b8328a34c30b8c3dd1ab  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-cursor/LICENSE
 sha256 33fa5470b2195e410b075a32516b6ad27784b8a8ff74ae90cfd60c14b76e6644  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-width/LICENSE
-sha256 29f4d474804f60aae177d7fed67d0d613d00006640cc9cf80077eef03fb9a2cc  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/co/LICENSE
 sha256 693866fc419c6f61c8570438ec00659d156ec2b4d4a4d04091711f5f11a365d4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-convert/LICENSE
 sha256 7357445bac398c76c0aef75a587009fe406d40de6a79789eb5b7ecbbad317ef2  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-name/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-map/LICENSE
-sha256 96b29c9aaa611a05349b362d48c2ffce0966fe408401a2d1a157be312c035b5f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-stream/LICENSE
-sha256 33b734d60042d0fe0c92dd1fc1e874193a1c899ec3e276a2eb935d2d0bf5b710  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/core-util-is/LICENSE
-sha256 b1344bd78ebcbf8a359225ec444d038a653c6a5f9ecf405a50d4a5c11fbf27d1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE
+sha256 aaa78451b6fecd1b9c4594c796c133c0e90cad100372ff8bc6de615e9ef9adf1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE
 sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/debug/LICENSE
 sha256 f2042f3634c4136d06b5139c9c6aefb81a3a462b514548bc1845953233dfba98  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/deep-is/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/del/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE
+sha256 5c272e206669b79ee20fa89fa8fa888d5b56186f16c55a5614753ad3412e2ae9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.closure-compiler
 sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.esprima
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/emoji-regex/LICENSE-MIT.txt
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/escape-string-regexp/LICENSE
 sha256 db83f2ede67f36cfab1ea0721ea2ee97515863e9a65346881f305e430451cc91  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint/LICENSE
-sha256 8be44da6cc59e890c406d6d05c3ce1850f29bb2e0da2a2d686d593e5ad3ecf59  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE
+sha256 d3a724e2ed749f172ff70b62a1d0631b7d4b0ea273782365a3464d4e2d6b6dbd  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE
+sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-utils/LICENSE
+sha256 d8bf34ff6d190640a01e7704ad78253fc181bc128949d71273fbbaa12f33c0b4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-visitor-keys/LICENSE
 sha256 6273faa0d14a54972c0341a724010eb8cd928ee486745a9eea8cf80680ba5098  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/espree/LICENSE
-sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE
-sha256 ac68116ae73740de4190892f334992e449a124600924ec761e64319d3aac9e6e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/LICENSE
-sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE
-sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE
+sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE.BSD
+sha256 ac68116ae73740de4190892f334992e449a124600924ec761e64319d3aac9e6e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/license.txt
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE.BSD
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE.BSD
 sha256 e33b7bc13a0e5ea9ed6718e12e99a5b0b60276162f0195aa7f342397f4b0155d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/external-editor/LICENSE
 sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-deep-equal/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-json-stable-stringify/LICENSE
-sha256 942a98cb8846a6354266193f173c1354615827fbb7d67f68399599dff12c4d6a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE
+sha256 942a98cb8846a6354266193f173c1354615827fbb7d67f68399599dff12c4d6a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE.md
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/figures/LICENSE
 sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/file-entry-cache/LICENSE
 sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flat-cache/LICENSE
+sha256 5097efeab30293dd7e26d6960b6b94f1aeca958d22f1eca3535c482a891e95a9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flatted/LICENSE
 sha256 8465b04b67f473341171b5c9c8b2c741a4a395b3f6ed58339b3a4f4db3db7472  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fs.realpath/LICENSE
 sha256 e67aed7df22dc8031e4fcf5338fe91cb33e3817e5c58a99a2a2802eea9069791  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/functional-red-black-tree/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globals/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globby/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE
-sha256 2fc5460f1526810979054ecd18cd01349b57f38ea56d1e920afdea34d104540c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/graceful-fs/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-ansi/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE
+sha256 6236fa0b88a4a0cce3dda0367979491b2052b3c8d6b1c10b3668de083e86a7f0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE
+sha256 a2a19c04f527f7582fb2e58887f0a90f403732fc6accd7322287f0f5949b489e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/LICENSE
+sha256 3672fb6ef1c214578dfee689643516c2685f61ab08d130517ca8ea24f383a840  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/node_modules/is-glob/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE
 sha256 ac779f7314c74f232ef847ea86e714abe25cf6eeb5cc97b69451b74e2af6492d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/iconv-lite/LICENSE
+sha256 9c94db23dc4b1e9aaee5d195668b916afc71efed54af226b66cf0ccc4389c1c0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ignore/LICENSE-MIT
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/import-fresh/license
 sha256 05dc4d785ac3a488676d3ed10e901b75ad89dafcc63f8e66610fd4a39cc5c7e8  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inflight/LICENSE
 sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inherits/LICENSE
+sha256 e6c3f1bc47f97cdeef953f6c109b6392be0d059ae94659faf550e61b7a75ebc7  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/strip-ansi/license
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/isexe/LICENSE
+sha256 73b5283588baa142c5baaef5f56d3e8fdea7a30b214e8c5737e87640f882453a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-extglob/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-fullwidth-code-point/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-path-inside/LICENSE
+sha256 4cd903859549d4b20b571041f96dfae1136ed079c476126268f9d7cc1b611150  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-glob/LICENSE
 sha256 44191656d296391e0ec97e32f5385f0d02b6f2992694082d22ea04ba0f66f9e4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-promise/LICENSE
-sha256 4ceea53e36c7ff67a946e9905e50b41f350ef7b107c59afec9b91cbe97fbcaea  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-resolvable/LICENSE
 sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-schema-traverse/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-stable-stringify-without-jsonify/LICENSE
-sha256 e8d64ff1e54883c69759db53d10adfaa8e09b6ef628788885fe8068bc1fdb1b7  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE
+sha256 2213d91c606205c71eb051a199478cdc2adde945893404d7f1421436dd6d5cc1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE
 sha256 a07bc24468b9654ce76a547d47a2db282d07733b715db4c73a98bd63961f9550  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-yaml/LICENSE
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/levn/LICENSE
-sha256 e159c6d48c989185448658f276375bfb2300362ec6d4ae5525a2d49c4bcb947d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lru-cache/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE
+sha256 f71e8ed126b46346494aad5486874cd8f0aafe95092ed67d2e3cb6110f939abc  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimatch/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimist/LICENSE
 sha256 05991c2e8f070b69ec5b656c2c12fd07cd0153dd157d39b050b82af59b319a01  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mkdirp/LICENSE
-sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/license.md
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mute-stream/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/object-assign/LICENSE
+sha256 bd220c219b05e6c22b7c23613ca926f60932d07c9fe141dd6e04b80dbc4b4e52  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/nice-try/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/once/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/onetime/LICENSE
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/optionator/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/os-tmpdir/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/parent-module/license
+sha256 9c791b69df62b2264d0a846786f82b00bd6943200a0b10eba66a1ba7a7785fc8  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-dirname/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-absolute/LICENSE
-sha256 0e356f8c0a756758ce04a143b1871585402b6bcf8f8e6a26873beb9992242e7a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-inside/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pify/LICENSE
-sha256 6ee0feb1f6ef996ff5a68600f8cf98909cf412d39ef3cdceaefd87d636fa1b7f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pinkie/LICENSE
-sha256 6ee0feb1f6ef996ff5a68600f8cf98909cf412d39ef3cdceaefd87d636fa1b7f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pinkie-promise/LICENSE
-sha256 5822e0d816e53e3537b306a4132cb7a70881897cf51bf483282148a602979076  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pluralize/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-key/license
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/prelude-ls/LICENSE
-sha256 ecdccbcf39024f624ded480c01c0b25458e1eca8f26ecf040933865ce56d9a4f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/process-nextick-args/LICENSE
 sha256 d7d2a7786de7c7cfd96f920c6f12927d74e1d2a861ca4498bf465c3bc3f4c21c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/progress/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pseudomap/LICENSE
-sha256 ec62dc96da0099b87f4511736c87309335527fb7031639493e06c95728dc8c54  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/readable-stream/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/require-uncached/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/punycode/LICENSE-MIT.txt
+sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/regexpp/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/restore-cursor/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rimraf/LICENSE
 sha256 e5c1364118b39fa98b959138ce4aa4d0e68cfbee12d115e69730579fecb1dc1b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/run-async/LICENSE
-sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safe-buffer/LICENSE
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm2015/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm5/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/src/LICENSE.txt
+sha256 4bc935e71be198c67ddf3c2b5fddb195f6edc182bfc155a96a6db61b44b494b9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safer-buffer/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/semver/LICENSE
 sha256 e6fdf7ac2af533b4436d99aa75df32aa78690510f7d68a3e73e8576967298d2f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-command/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-regex/LICENSE
-sha256 e05b1eaf5b5f99b7ad75cd1f38858ff9a311780b97715ead67936d60bf96aa7e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE
+sha256 e05b1eaf5b5f99b7ad75cd1f38858ff9a311780b97715ead67936d60bf96aa7e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE.txt
 sha256 3dc3b3d3a284d871f7f307655c90fb101d73abbf87bbddeefd2f67883353bdbc  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/slice-ansi/LICENSE
 sha256 a4cdda44b5adea4731d53dcae78fb5124f8fd853e994f01e25d8c33a7daf818b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/sprintf-js/LICENSE
-sha256 11f2aafb37d06b3ee5bdaf06e9811141d0da05263c316f3d627f45c20d43261b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string_decoder/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string-width/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/node_modules/ansi-regex/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-json-comments/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE
-sha256 ef088ddea300fe4ea038bc47db929e320033b66981cf12a20b517d6b66a2fa3e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE
+sha256 37b6932865726cf59cbfb8b32a5c9fd82c834c2deba4d53aa4a6b433ae69cdda  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/string-width/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/strip-ansi/license
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/text-table/LICENSE
-sha256 e8734448285a2dd773d40136ed5d5e8163a70701dd540cdc796cfca232f67d55  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE
+sha256 e8734448285a2dd773d40136ed5d5e8163a70701dd540cdc796cfca232f67d55  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.APACHE2
 sha256 d72dea1a8cdf3f4dfa2f594253d0c5b37baefc76e806f5ecb0e426393edcd505  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.MIT
 sha256 162413c61e0982abe89a06bf7a02ec760dc49a7364d838bd9f01daebb5b95954  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tmp/LICENSE
+sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tslib/LICENSE.txt
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/type-check/LICENSE
-sha256 26181ebee1063f3dc6766a3b6d05999a0da058f172eadf2ca5d15105ffd9735a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/typedarray/LICENSE
-sha256 0154425673db15cdfa80ecba2c9b1f1a867f7197a006764712849bfc3a93cbb7  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/util-deprecate/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/which/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wordwrap/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wrappy/LICENSE
-sha256 daca23d50b0f54d36d6da1b16c82dfea6461e2ae20de0e869957e44cc6d34781  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/write/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/yallist/LICENSE
+sha256 0ead7e8cd8b0bc66a981ee69acaf1297ffa838cfce1b156a039bb24f997c0a27  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/write/LICENSE
 sha256 4f5753ce8acf3feafc758599058746d30bda07bc0d4cc3a6a1eb8e039fdba1dc  src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/errorprone/LICENSE
 sha256 9021fdb5341ebbb2eb5c771ac5cfac527790673179d3b21a42de1ab2798ec30f  src/3rdparty/chromium/third_party/espresso/LICENSE
 sha256 46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76  src/3rdparty/chromium/third_party/expat/files/COPYING
@@ -250,8 +262,7 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rd
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/ffmpeg/COPYING.GPLv3
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv2.1
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv3
-sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
-sha256 5d0c892ea452c3828f1e311637cde4e3a04eb6431554308b3fcdac8c1b330168  src/3rdparty/chromium/third_party/fips181/COPYING
+sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
 sha256 f45cc81b400a048b56c9edbd4c3317f7a8958463dfd55aa96f268ecfd6baa12c  src/3rdparty/chromium/third_party/flac/COPYING.FDL
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rdparty/chromium/third_party/flac/COPYING.GPL
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  src/3rdparty/chromium/third_party/flac/COPYING.LGPL
@@ -263,6 +274,7 @@ sha256 e09d954054165670b6a669e6da59673d9e85f343b9983e92a220623ff0198f8c  src/3rd
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/LICENSE
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/src/COPYING
 sha256 fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT
+sha256 56e67061ab590046b09876a084478ea87c4ece1579deb194347096e61c2537dd  src/3rdparty/chromium/third_party/fuchsia-sdk/LICENSE
 sha256 9f5db2544e04e3e0fb39ea277b9bb6f8efcc8bb84f6264630978ce4708495535  src/3rdparty/chromium/third_party/gestures/gestures/LICENSE
 sha256 4bd9e329f9b268bd0dec2df0560a03382fe426adf83daa7b314d2f46b9b22c9a  src/3rdparty/chromium/third_party/gestures/LICENSE
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/gif_player/LICENSE
@@ -279,15 +291,14 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 ca382aa537f8923d6c0991fb976d184a2009eb76080313bf10dcecdc9311f0dd  src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE
 sha256 f54c49d3ff865458c5d3c68c3367a1f6e0d7b3f686f8c88a6a563ef90f84ad9e  src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE
 sha256 96e5bbd81970983d666e702fa56f67dfd2fdaa363b8a4266e8d98847374cd7c8  src/3rdparty/chromium/third_party/hamcrest/LICENSE
-sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING
-sha256 ec20cbe051200fc846caf4dc253cf660e874a2d9e4f3a682e08354b567fae409  src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/hb-ucdn/COPYING
+sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/hunspell/COPYING
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  src/3rdparty/chromium/third_party/hunspell/COPYING.LESSER
 sha256 53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  src/3rdparty/chromium/third_party/hunspell/COPYING.MPL
 sha256 610809f1586ee4d22468f1e97c256153cea8be7a662193db70d6ca424e0f17c8  src/3rdparty/chromium/third_party/iaccessible2/LICENSE
 sha256 a412a53925efc6b50800bf8519a2e033949243d5a5a8c5422bae8a5007ad09c8  src/3rdparty/chromium/third_party/iccjpeg/LICENSE
 sha256 d18e75f216f177d41304f5e94c2cba7d1bf9f8f8583a0777cceb5cca0c5ad137  src/3rdparty/chromium/third_party/icu4j/LICENSE
-sha256 4eac19453ddf356478db3be6b101a6d872d0046cdc8222df1ff5c997dd4b9fbe  src/3rdparty/chromium/third_party/icu/LICENSE
+sha256 6a18c5fac70d7860b57f5b72b4e2c9a1ba6b3d2741eef7ff9767c5379364f10d  src/3rdparty/chromium/third_party/icu/LICENSE
 sha256 c62d7697c03979f5056d28b338fafc7a1152820f7b379adf4a9d88cd37160f96  src/3rdparty/chromium/third_party/icu/license.html
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/third_party/icu/scripts/LICENSE
 sha256 8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  src/3rdparty/chromium/third_party/ijar/LICENSE
@@ -295,10 +306,11 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 b9be92f13356083392d97da13cab8ae543c7911f44eff5289b693da8b17b9e08  src/3rdparty/chromium/third_party/inspector_protocol/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/intellij/LICENSE
 sha256 7a92c5e7a83b5ddcc693bb84ea8bdb842308509c1758cffdfe24717609154c75  src/3rdparty/chromium/third_party/isimpledom/LICENSE
+sha256 ed8d7a24769ac9d57d08769b5f8be27519dd8811d06b0995dbe8ca6714e96d08  src/3rdparty/chromium/third_party/jacoco/LICENSE
+sha256 33b6816eb449962d307495946519ed78cef8743819f6f1d60e8b3d4e86c38b1c  src/3rdparty/chromium/third_party/javalang/LICENSE
 sha256 7975c0027cfa5d08253fbb6ff4676acc38248bd5e046d0dbab3d810971e97970  src/3rdparty/chromium/third_party/jinja2/LICENSE
-sha256 923e74e5ae41345038da0a56dfdc983356917fbbb139176e654d1b33100b723f  src/3rdparty/chromium/third_party/jmake/LICENSE
 sha256 76c45ece83a26117f86f4e349e7df118708e061e87225328fb478ce1e8b3eb86  src/3rdparty/chromium/third_party/jsoncpp/LICENSE
-sha256 76c45ece83a26117f86f4e349e7df118708e061e87225328fb478ce1e8b3eb86  src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE
+sha256 95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/jstemplate/COPYING
 sha256 71a19392a0eb3255ab2055ed978bb0f93865cea84d31a3510eaffb74d8981e7f  src/3rdparty/chromium/third_party/khronos/LICENSE
 sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  src/3rdparty/chromium/third_party/leveldatabase/src/LICENSE
@@ -315,9 +327,9 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rd
 sha256 fb3ab1e1621c6c469499a6ba1e926c027f32af3063c0456282f89382591cc46a  src/3rdparty/chromium/third_party/libevdev/LICENSE
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE
 sha256 19af539b1ec692ea9ccf71b6ea97d602bcf7187eab27b0ea806aea1cd10b0b13  src/3rdparty/chromium/third_party/libjpeg/LICENSE
-sha256 fffd497be5f4ae0a10b8258e191125fb58b90250ecbf3c79398d79604dd00b7d  src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md
+sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md
 sha256 3bf128851aff9f392953276ea8ade3e41da0f40b853fde58ec21034aa91ccc31  src/3rdparty/chromium/third_party/libovr/LICENSE
-sha256 913b3eb6f19defc77c00e2bebbbce464326331b0b59eb6d1d1b23d68a8c27f6b  src/3rdparty/chromium/third_party/libpng/LICENSE
+sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  src/3rdparty/chromium/third_party/libpng/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/libprotobuf-mutator/src/LICENSE
 sha256 a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  src/3rdparty/chromium/third_party/libsecret/LICENSE
 sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  src/3rdparty/chromium/third_party/libsrtp/LICENSE
@@ -337,8 +349,8 @@ sha256 31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  src/3rd
 sha256 7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  src/3rdparty/chromium/third_party/libxslt/linux/COPYING
 sha256 7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  src/3rdparty/chromium/third_party/libxslt/src/Copyright
 sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  src/3rdparty/chromium/third_party/libyuv/LICENSE
+sha256 0d4077a7055ead389c4c5a9a6ac4bb8b784fc6e9e37be2caf544fcceed26cb16  src/3rdparty/chromium/third_party/lottie/LICENSE
 sha256 6e3e0a978f1e136cb3efb89702f4314671581a0c70c9a52447669e00f7b129e8  src/3rdparty/chromium/third_party/lzma_sdk/LICENSE
-sha256 7973776647df23457a9910075547e3f345fbc5e0e41147b4586d714582dfdd76  src/3rdparty/chromium/third_party/mach_override/LICENSE
 sha256 0bbe88228fd63d20ec097f64e58d5a0a465123ae139140a18d406c60b48824b5  src/3rdparty/chromium/third_party/markupsafe/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/material_design_icons/LICENSE
 sha256 c93465d6a75e6ade8785edb4ec125ece083ab0910ed0417b4ff346792ba0f851  src/3rdparty/chromium/third_party/mesa_headers/LICENSE
@@ -348,7 +360,7 @@ sha256 83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  src/3rd
 sha256 8610954adbca6c6b85d8b1ae5613b44b0014e437d32fcad6683bb27541411686  src/3rdparty/chromium/third_party/minigbm/src/LICENSE
 sha256 4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204  src/3rdparty/chromium/third_party/minizip/src/lib/bzip2/LICENSE
 sha256 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  src/3rdparty/chromium/third_party/minizip/src/LICENSE
-sha256 e075583a46bca13a3f25af4181e2a0064f442c1f55c4312275cbcf05b892d3f4  src/3rdparty/chromium/third_party/mocha/LICENSE
+sha256 bd5663836feb58ffb7d0e6b9e62010f4c3399f2bb0a4cf6514a15d597bbdd577  src/3rdparty/chromium/third_party/mocha/LICENSE
 sha256 380893a2f01aea5c3328b1a8b08cdc488bf236916abac3af0d1f1a5d2634c31a  src/3rdparty/chromium/third_party/mockito/LICENSE
 sha256 d47e8390fb0d7ad4a18f26aedd6283c7ab6b5b4fabab536ccb4db7f9f6d90c08  src/3rdparty/chromium/third_party/modp_b64/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/motemplate/LICENSE
@@ -360,8 +372,9 @@ sha256 0cd1bd4b934ffdc5e7f1bcfa9d08bd17295e5414bdca99c06b1036278b01f0b1  src/3rd
 sha256 d41b608410d0f07157353639f967a561202236e6303f45c98aec47934b924700  src/3rdparty/chromium/third_party/nvml/LICENSE
 sha256 b5730da9a26472a405b0b1c61d3d166714d9d654ab3282e54e4a01a5f66316c3  src/3rdparty/chromium/third_party/objenesis/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/ocmock/License.txt
+sha256 8bed129a6a15e631c93a624985e631eb62a55f7e072b78f4e1c3dde7c745283d  src/3rdparty/chromium/third_party/one_euro_filter/LICENSE
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  src/3rdparty/chromium/third_party/openh264/src/LICENSE
-sha256 1599cc232dbd003e6691c7f4e360f2068f84ebaef6510a26ab919c3a7fec27fd  src/3rdparty/chromium/third_party/openmax_dl/LICENSE
+sha256 34a5c58db7cc4d3265d14a9aa26e38067fe114311d8bec31f909d1c240e626c4  src/3rdparty/chromium/third_party/openscreen/src/LICENSE
 sha256 f56ff606104d4ef18e617921a75c73ad73b5a1a1d70c69590c29de16919e04ad  src/3rdparty/chromium/third_party/openvr/src/LICENSE
 sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  src/3rdparty/chromium/third_party/opus/src/COPYING
 sha256 7efb4989e0cd1b256229bdf2f09300c5d14e35db0e7476bfb87fac243498273d  src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt
@@ -369,19 +382,21 @@ sha256 0d74de3c3cd3196a9ed1bc612cfd5f81d7509d66c4be34a50f99d61bd1ad00d4  src/3rd
 sha256 9dd8d2fb95ba862a5d166a167682c1c67a209acd3bf09b6fd03f76d3579729bc  src/3rdparty/chromium/third_party/ow2_asm/LICENSE
 sha256 b578cdd2345840ada550bd12519533812320d5f1d21cf4c1c7e1b1b0a31c98b7  src/3rdparty/chromium/third_party/pdfium/LICENSE
 sha256 32759d1397d8f7b9e15ece146e4038b22b90e93b4935b5a840bcef4d2ba5ea55  src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE
-sha256 913b3eb6f19defc77c00e2bebbbce464326331b0b59eb6d1d1b23d68a8c27f6b  src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE
+sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE
 sha256 c5b14f5a3814d2e57b9bb9520dcf57a2c3817b65c4f989e5c82e332c82af1038  src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt
 sha256 9f98bab33648b77578d85ac0f1d1c3941a72aa6d7e65015ba181f2fe804bb85d  src/3rdparty/chromium/third_party/pexpect/LICENSE
+sha256 a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/chromium/third_party/pffft/LICENSE
 sha256 dd4930c619afd8527591353c7d3d1c1d7f4bf62ed1cb411f4f507dbdee7738a2  src/3rdparty/chromium/third_party/ply/LICENSE
-sha256 685b3b09870f1361f8db2d3f37acdb765d5da1722a18b182765da4b79a8f63ff  src/3rdparty/chromium/third_party/ply/license.patch
+sha256 d6c873c08a8806f08fdafe1aa00ba38837f6ac29f91d6b26510614b0df2001e0  src/3rdparty/chromium/third_party/ply/license.patch
+sha256 24699c6858472311aa9acc6c2b7112ff9de6e7792569158ba9e439deb0529ef6  src/3rdparty/chromium/third_party/polymer/LICENSE.polymer
 sha256 a5adc2955c0dd848c97aa6afb14e0047a610f0fcfa6ce0011efad01a0e051406  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt
 sha256 984fb04a16a9f1e0145ffd891125dc366a01cd921f58c9b0369be400c720790d  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt
+sha256 a5adc2955c0dd848c97aa6afb14e0047a610f0fcfa6ce0011efad01a0e051406  src/3rdparty/chromium/third_party/polymer/v3_0/components-chromium/polymer/LICENSE.txt
 sha256 294f58267c6f473c4ce7270bf5c8d34b2003cb43804552459654c36553431276  src/3rdparty/chromium/third_party/proguard/LICENSE
 sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  src/3rdparty/chromium/third_party/protobuf/LICENSE
 sha256 2ab28b982a7f3150e1597befaa87e1636b9973c80aef3752597945d270c4c4e4  src/3rdparty/chromium/third_party/pycoverage/LICENSE
 sha256 f8d0c347a0dcc6ebe1671640dfae8d2411b6ded892e06a6764f8208b218b2af4  src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE
 sha256 f8c8ccecdbb044fd6fa1a586c596a055fb2b14fb3e335d8ed282db58d80b7410  src/3rdparty/chromium/third_party/pyelftools/LICENSE
-sha256 e88ae39d2e7c9ae8f5470bb23fdd7ce55fe58aca06f3d4399182f5bb0ffcf1dd  src/3rdparty/chromium/third_party/pyftpdlib/src/LICENSE
 sha256 cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  src/3rdparty/chromium/third_party/pyjson5/src/LICENSE
 sha256 c5b14f5a3814d2e57b9bb9520dcf57a2c3817b65c4f989e5c82e332c82af1038  src/3rdparty/chromium/third_party/pymock/LICENSE.txt
 sha256 318cea263a2fb726d767e2777771a431a3220008e6940dd5138a235a1fc498fc  src/3rdparty/chromium/third_party/pystache/LICENSE
@@ -389,6 +404,8 @@ sha256 956c3b678228a216142df38d039bba56ee6509d3298e7a4b8dd5bc3eaa80fe33  src/3rd
 sha256 23681c6986fb33d57957660543f6e9dcbbcf6d2ae2f9fa2dbdb5efec5aa0d95f  src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE
 sha256 c903100da706172066fa1b6f02eba60f202fea63036492d2c4a01267e32aa7a8  src/3rdparty/chromium/third_party/qcms/src/COPYING
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/quic_trace/src/LICENSE
+sha256 38751245389e1e23f73e6f5384b5cbe7fa972cc4410c5adc9c04b082a0b9561a  src/3rdparty/chromium/third_party/quic_trace/src/third_party/fonts/LICENSE
+sha256 8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  src/3rdparty/chromium/third_party/quic_trace/src/third_party/glew/LICENSE.txt
 sha256 f98f3db81b4dd3873d8672117e409286142cfae9b7673ab6d7aab4bae1527d20  src/3rdparty/chromium/third_party/qunit/LICENSE
 sha256 68834f116f8ff545f05d14753357b620748156d60ee36b26beab4cb3f317efe4  src/3rdparty/chromium/third_party/r8/LICENSE
 sha256 6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  src/3rdparty/chromium/third_party/re2/LICENSE
@@ -407,9 +424,10 @@ sha256 b5a00e94f058edc87e05978329b55730d8689abe61205d9018443d03de4f07da  src/3rd
 sha256 47e20ce182bc68fab1a0cfb129b03c326aaf4f2b6b7905aa9d376d31018bd29f  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools
 sha256 33c9a2fe619e1200937629f318895898ffcd1bf7d0ddd39adc382c030925e61e  src/3rdparty/chromium/third_party/simplejson/LICENSE.txt
 sha256 b25948e48c44312d04ffc626a9d52cae7c04539a1a8e0c1be47b7bfa0da03e1d  src/3rdparty/chromium/third_party/sinonjs/LICENSE
-sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/experimental/canvaskit/canvaskit/LICENSE
+sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/skcms/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/LICENSE
+sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/canvaskit/canvaskit/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE
 sha256 5366e97b4478f15a1e2fd7e6094337426597df28de50cd9fed3f2e7e87f1229e  src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE
@@ -426,16 +444,10 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/sqlite4java/LICENSE
 sha256 06545a6ec25fbbff6c62f205f94a35be49e38f33bea827a8cfb07d7b82e4b083  src/3rdparty/chromium/third_party/sqlite/LICENSE
-sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms
+sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms
+sha256 9c6479123f32a1ed50d9a0af203dfe8972e65035b0cdeef436b5f8d0924517fe  src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md
 sha256 28113a6e9e2fd7584187c738a7c5484452a1c383307a1741bec50a73262fac08  src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt
-sha256 a63ee63574ed21e930765c4418a4fa2fa571b72c47cd023ee588dbf8b21fb4ee  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/autoconf/LICENSE.TXT
-sha256 a012d664e4e01df52a65b2eeafdfb8aeb856fec0e6c372265d01b0109c3f5e2a  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/include/llvm/Support/LICENSE.TXT
-sha256 0a731c5e376f4b604b9fd099d4797d64a5c0bc6e3770baf17b55988cb7737e2e  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/LICENSE.TXT
-sha256 a63ee63574ed21e930765c4418a4fa2fa571b72c47cd023ee588dbf8b21fb4ee  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/projects/sample/autoconf/LICENSE.TXT
-sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT
-sha256 b2d24d77041fbf66b93519758cd80671425c55614b2f65262046fdbe8c3247a8  src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt
-sha256 c55ce1e876843853a8a2e5c936df6dc8dd3d185f83d85e6d113143b8c24f542e  src/3rdparty/chromium/third_party/swiftshader/third_party/subzero/LICENSE.TXT
 sha256 81ebf38708899097aacaac9723679b3ffa17640c14cd3193c46b75197de18b2c  src/3rdparty/chromium/third_party/tcmalloc/gperftools-2.0/vendor/COPYING
 sha256 ad4672b403488876635d2b455918f74b829d478da868ffc0c621a00fc99195f5  src/3rdparty/chromium/third_party/tcmalloc/LICENSE
 sha256 81ebf38708899097aacaac9723679b3ffa17640c14cd3193c46b75197de18b2c  src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING
@@ -448,7 +460,6 @@ sha256 6629d6edceffa9c68f4245b817137d2265fdab1e98068893420edb6689ccce9e  src/3rd
 sha256 7a4a31e05391919c05a996f09fc20ffc80c69af72cb3e69ac71b70c825fbdd1d  src/3rdparty/chromium/third_party/usrsctp/LICENSE
 sha256 fa53711b25af4b9a9b8dadfea3cb38166ec4b96760c8d62b284055554537d9ef  src/3rdparty/chromium/third_party/usrsctp/usrsctplib/LICENSE.md
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  src/3rdparty/chromium/third_party/v4l-utils/COPYING.libv4l
-sha256 846f295f64194ebcf615d6e35e445990645583764b52295177fc09a69051df1f  src/3rdparty/chromium/third_party/visualmetrics/src/LICENSE
 sha256 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  src/3rdparty/chromium/third_party/wds/LICENSE
 sha256 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  src/3rdparty/chromium/third_party/wds/src/COPYING
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/web-animations-js/LICENSE
@@ -470,12 +481,13 @@ sha256 a508773ebf00f8c777a910e941e5fd0072195843e1b72a90eb8787d26d4ab1d7  src/3rd
 sha256 905bc5ab1c66eea2669aee6cb5185488508264df6492f71ae1a6595180ff8c2b  src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/sigslot/LICENSE
 sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/LICENSE
 sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/cottontail/LICENSE.md
+sha256 47754d3064047c300714af25258efa782e144fdf1e835bfd1edbeb7f8f4ef9e4  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/dat.gui/LICENSE
+sha256 71819b5a0a080b6a3d35b3579817c2c558abcf3c92bb5abc052145a7c106573e  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/gl-matrix/LICENSE
 sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md
 sha256 20de375707692099b3132084695377ce5fec0aec05813dedcce094b8eda44386  src/3rdparty/chromium/third_party/widevine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/woff2/LICENSE
 sha256 b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  src/3rdparty/chromium/third_party/xdg-utils/LICENSE
 sha256 1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  src/3rdparty/chromium/third_party/xstream/LICENSE
-sha256 efdabc1c1f655528b8c3a59b03668d446746d87273fab76f8af800b6e8891bd2  src/3rdparty/chromium/third_party/yara/src/COPYING
 sha256 795f8d76eade6130129b680ac72ea81cb3e143467a65ea1f5f64946151d7fa20  src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING
 sha256 942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  src/3rdparty/chromium/third_party/zlib/LICENSE
 sha256 63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE
@@ -483,7 +495,7 @@ sha256 f5b244982699ca9fe5cc8fa8a7c08cf5dee5d3a0c8896892899e5df13316e1b7  src/3rd
 sha256 4fde1ca31ffe4e16a76098f56170166c61a5493d3bafcc6a5903d3cb60aa7560  src/3rdparty/chromium/tools/symsrc/COPYING-pefile
 sha256 7389900fb68d920c6cb21b70702a2bc240523472a3fd091023d6135cf01d1c5c  src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE
 sha256 284545e873c704952e5b1b39d457dd83a3b115a51d9f1eb5175137bd69b8fa1b  src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt
-sha256 5426333ff30d2ba9127bfe11ba51ca98be02d704ddac48afd19de47dc7748ee6  src/3rdparty/chromium/v8/LICENSE
+sha256 f10a1808e442ae7dbfecf6b54ae4de84193a768770e189a67d5f397730acdbc9  src/3rdparty/chromium/v8/LICENSE
 sha256 e7115e18444dae09d17f361ddc365fb1d342640fe500796209c63f7c80dfae10  src/3rdparty/chromium/v8/LICENSE.fdlibm
 sha256 6a585a9f466654abc8fc0829d56b1bc987e3a073d31faa03bba37d33640a23cd  src/3rdparty/chromium/v8/LICENSE.strongtalk
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/v8/LICENSE.v8
@@ -495,6 +507,7 @@ sha256 cfe7599e45f340a35b4635090382897ca1526bc49b5e1889047f0168d131c415  src/3rd
 sha256 15137d6c822e3ab097093a33c3a39a9df699f373f6438867ad534ff60762a947  src/3rdparty/chromium/v8/third_party/colorama/LICENSE
 sha256 b9be92f13356083392d97da13cab8ae543c7911f44eff5289b693da8b17b9e08  src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE
 sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2  src/3rdparty/chromium/v8/third_party/v8/builtins/LICENSE
+sha256 c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  src/3rdparty/chromium/v8/third_party/wasm-api/LICENSE
 sha256 5d85142a5609ad177a2d7a2e7cae060b886b8b42f25c5b9803cf0cb5ee04ad2f  src/3rdparty/gn/base/third_party/icu/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/gn/LICENSE
 sha256 eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  src/3rdparty/ninja/COPYING
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index e3db6da604..648f8a370f 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -4,6 +4,7 @@
 #	-a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' | \
 #	sort | sed 's%^\(.*\)$%\t\1 \\%') > package/qt5/qt5webengine/chromium-latest.inc
 QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
+	src/3rdparty/chromium/base/third_party/cityhash/COPYING \
 	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
 	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
 	src/3rdparty/chromium/base/third_party/icu/LICENSE \
@@ -31,9 +32,12 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE \
+	src/3rdparty/chromium/third_party/apache-mac/LICENSE \
 	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
 	src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE \
 	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
+	src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE \
 	src/3rdparty/chromium/third_party/arcore-android-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/axe-core/LICENSE \
 	src/3rdparty/chromium/third_party/bazel/LICENSE \
@@ -42,8 +46,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2 \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1 \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits2_worker/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits_worker/lighthouse/LICENSE \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE_python \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE \
@@ -51,6 +55,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/LICENSE \
 	src/3rdparty/chromium/third_party/blink/renderer/devtools/scripts/closure/COPYING \
+	src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Noto/LICENSE_OFL.txt \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE \
@@ -63,9 +68,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
-	src/3rdparty/chromium/third_party/boringssl/src/third_party/android-cmake/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/LICENSE \
+	src/3rdparty/chromium/third_party/boringssl/src/third_party/sike/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE \
 	src/3rdparty/chromium/third_party/bouncycastle/LICENSE \
 	src/3rdparty/chromium/third_party/breakpad/breakpad/LICENSE \
@@ -85,6 +90,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/d3/LICENSE \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/devscripts/COPYING \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/jpeg-js/LICENSE \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/jszip/LICENSE.markdown \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/mocha/LICENSE \
 	src/3rdparty/chromium/third_party/catapult/tracing/third_party/pako/LICENSE \
@@ -93,144 +99,150 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/chaijs/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
+	src/3rdparty/chromium/third_party/cld_3/LICENSE \
+	src/3rdparty/chromium/third_party/cld_3/src/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/getopt/LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/glibc/COPYING.LIB \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/xnu/APPLE_LICENSE \
 	src/3rdparty/chromium/third_party/crc32c/src/LICENSE \
 	src/3rdparty/chromium/third_party/cros_system_api/LICENSE \
 	src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE \
 	src/3rdparty/chromium/third_party/d3/src/LICENSE \
+	src/3rdparty/chromium/third_party/dav1d/libdav1d/COPYING \
+	src/3rdparty/chromium/third_party/dav1d/LICENSE \
 	src/3rdparty/chromium/third_party/dawn/LICENSE \
 	src/3rdparty/chromium/third_party/decklink/LICENSE \
 	src/3rdparty/chromium/third_party/devscripts/COPYING \
 	src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/node_modules/acorn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv-keywords/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-escapes/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/argparse/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/array-union/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/array-uniq/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/arrify/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/babel-code-frame/node_modules/chalk/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/babel-code-frame/node_modules/strip-ansi/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/astral-regex/license \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/code-frame/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/highlight/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/brace-expansion/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/callsites/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/node_modules/ansi-styles/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/node_modules/supports-color/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/circular-json/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-cursor/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-width/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/co/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-convert/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-name/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-map/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-stream/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/core-util-is/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/debug/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/deep-is/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/del/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.closure-compiler \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.esprima \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/emoji-regex/LICENSE-MIT.txt \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/escape-string-regexp/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-utils/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-visitor-keys/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/espree/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/license.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE.BSD \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/external-editor/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-deep-equal/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-json-stable-stringify/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE.md \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/figures/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/file-entry-cache/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flat-cache/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flatted/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fs.realpath/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/functional-red-black-tree/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globals/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globby/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/graceful-fs/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-ansi/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/node_modules/is-glob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/iconv-lite/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ignore/LICENSE-MIT \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/import-fresh/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inflight/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inherits/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/strip-ansi/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/isexe/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-extglob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-fullwidth-code-point/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-path-inside/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-glob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-promise/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-resolvable/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-schema-traverse/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-stable-stringify-without-jsonify/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-yaml/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/levn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lru-cache/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimatch/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimist/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mkdirp/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/license.md \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mute-stream/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/object-assign/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/nice-try/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/once/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/onetime/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/optionator/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/os-tmpdir/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/parent-module/license \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-dirname/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-absolute/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-inside/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pify/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pinkie/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pinkie-promise/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pluralize/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-key/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/prelude-ls/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/process-nextick-args/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/progress/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/pseudomap/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/readable-stream/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/require-uncached/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/punycode/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/regexpp/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/restore-cursor/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/run-async/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm2015/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm5/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safer-buffer/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/semver/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-command/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-regex/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/slice-ansi/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/sprintf-js/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string_decoder/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string-width/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/node_modules/ansi-regex/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-json-comments/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/string-width/license \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/strip-ansi/license \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/text-table/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.APACHE2 \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.MIT \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tmp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tslib/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/type-check/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/typedarray/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/util-deprecate/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/which/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wordwrap/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wrappy/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/write/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/yallist/LICENSE \
 	src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE \
+	src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE \
+	src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE \
 	src/3rdparty/chromium/third_party/errorprone/LICENSE \
 	src/3rdparty/chromium/third_party/espresso/LICENSE \
 	src/3rdparty/chromium/third_party/expat/files/COPYING \
@@ -244,7 +256,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv2.1 \
 	src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv3 \
 	src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md \
-	src/3rdparty/chromium/third_party/fips181/COPYING \
 	src/3rdparty/chromium/third_party/flac/COPYING.FDL \
 	src/3rdparty/chromium/third_party/flac/COPYING.GPL \
 	src/3rdparty/chromium/third_party/flac/COPYING.LGPL \
@@ -256,6 +267,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
 	src/3rdparty/chromium/third_party/fontconfig/src/COPYING \
 	src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/fuchsia-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/gestures/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gif_player/LICENSE \
@@ -273,7 +285,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
 	src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING \
-	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/hb-ucdn/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.LESSER \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.MPL \
@@ -288,8 +299,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/inspector_protocol/LICENSE \
 	src/3rdparty/chromium/third_party/intellij/LICENSE \
 	src/3rdparty/chromium/third_party/isimpledom/LICENSE \
+	src/3rdparty/chromium/third_party/jacoco/LICENSE \
+	src/3rdparty/chromium/third_party/javalang/LICENSE \
 	src/3rdparty/chromium/third_party/jinja2/LICENSE \
-	src/3rdparty/chromium/third_party/jmake/LICENSE \
 	src/3rdparty/chromium/third_party/jsoncpp/LICENSE \
 	src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE \
 	src/3rdparty/chromium/third_party/jstemplate/COPYING \
@@ -330,8 +342,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libxslt/linux/COPYING \
 	src/3rdparty/chromium/third_party/libxslt/src/Copyright \
 	src/3rdparty/chromium/third_party/libyuv/LICENSE \
+	src/3rdparty/chromium/third_party/lottie/LICENSE \
 	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
-	src/3rdparty/chromium/third_party/mach_override/LICENSE \
 	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
 	src/3rdparty/chromium/third_party/material_design_icons/LICENSE \
 	src/3rdparty/chromium/third_party/mesa_headers/LICENSE \
@@ -353,8 +365,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/nvml/LICENSE \
 	src/3rdparty/chromium/third_party/objenesis/LICENSE \
 	src/3rdparty/chromium/third_party/ocmock/License.txt \
+	src/3rdparty/chromium/third_party/one_euro_filter/LICENSE \
 	src/3rdparty/chromium/third_party/openh264/src/LICENSE \
-	src/3rdparty/chromium/third_party/openmax_dl/LICENSE \
+	src/3rdparty/chromium/third_party/openscreen/src/LICENSE \
 	src/3rdparty/chromium/third_party/openvr/src/LICENSE \
 	src/3rdparty/chromium/third_party/opus/src/COPYING \
 	src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt \
@@ -365,16 +378,18 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt \
 	src/3rdparty/chromium/third_party/pexpect/LICENSE \
+	src/3rdparty/chromium/third_party/pffft/LICENSE \
 	src/3rdparty/chromium/third_party/ply/LICENSE \
 	src/3rdparty/chromium/third_party/ply/license.patch \
+	src/3rdparty/chromium/third_party/polymer/LICENSE.polymer \
 	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt \
 	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
+	src/3rdparty/chromium/third_party/polymer/v3_0/components-chromium/polymer/LICENSE.txt \
 	src/3rdparty/chromium/third_party/proguard/LICENSE \
 	src/3rdparty/chromium/third_party/protobuf/LICENSE \
 	src/3rdparty/chromium/third_party/pycoverage/LICENSE \
 	src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE \
 	src/3rdparty/chromium/third_party/pyelftools/LICENSE \
-	src/3rdparty/chromium/third_party/pyftpdlib/src/LICENSE \
 	src/3rdparty/chromium/third_party/pyjson5/src/LICENSE \
 	src/3rdparty/chromium/third_party/pymock/LICENSE.txt \
 	src/3rdparty/chromium/third_party/pystache/LICENSE \
@@ -382,6 +397,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE \
 	src/3rdparty/chromium/third_party/qcms/src/COPYING \
 	src/3rdparty/chromium/third_party/quic_trace/src/LICENSE \
+	src/3rdparty/chromium/third_party/quic_trace/src/third_party/fonts/LICENSE \
+	src/3rdparty/chromium/third_party/quic_trace/src/third_party/glew/LICENSE.txt \
 	src/3rdparty/chromium/third_party/qunit/LICENSE \
 	src/3rdparty/chromium/third_party/r8/LICENSE \
 	src/3rdparty/chromium/third_party/re2/LICENSE \
@@ -400,9 +417,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
 	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
 	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
-	src/3rdparty/chromium/third_party/skia/experimental/canvaskit/canvaskit/LICENSE \
+	src/3rdparty/chromium/third_party/skia/include/third_party/skcms/LICENSE \
 	src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE \
 	src/3rdparty/chromium/third_party/skia/LICENSE \
+	src/3rdparty/chromium/third_party/skia/modules/canvaskit/canvaskit/LICENSE \
 	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE \
 	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
@@ -419,16 +437,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/LICENSE \
-	src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md \
 	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
 	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/autoconf/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/include/llvm/Support/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/projects/sample/autoconf/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/subzero/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/tcmalloc/gperftools-2.0/vendor/COPYING \
 	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
 	src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING \
@@ -441,7 +453,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/usrsctp/LICENSE \
 	src/3rdparty/chromium/third_party/usrsctp/usrsctplib/LICENSE.md \
 	src/3rdparty/chromium/third_party/v4l-utils/COPYING.libv4l \
-	src/3rdparty/chromium/third_party/visualmetrics/src/LICENSE \
 	src/3rdparty/chromium/third_party/wds/LICENSE \
 	src/3rdparty/chromium/third_party/wds/src/COPYING \
 	src/3rdparty/chromium/third_party/web-animations-js/LICENSE \
@@ -463,12 +474,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/sigslot/LICENSE \
 	src/3rdparty/chromium/third_party/webxr_test_pages/LICENSE \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/cottontail/LICENSE.md \
+	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/dat.gui/LICENSE \
+	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/gl-matrix/LICENSE \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md \
 	src/3rdparty/chromium/third_party/widevine/LICENSE \
 	src/3rdparty/chromium/third_party/woff2/LICENSE \
 	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
 	src/3rdparty/chromium/third_party/xstream/LICENSE \
-	src/3rdparty/chromium/third_party/yara/src/COPYING \
 	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING \
 	src/3rdparty/chromium/third_party/zlib/LICENSE \
 	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
@@ -488,6 +500,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/v8/third_party/colorama/LICENSE \
 	src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE \
 	src/3rdparty/chromium/v8/third_party/v8/builtins/LICENSE \
+	src/3rdparty/chromium/v8/third_party/wasm-api/LICENSE \
 	src/3rdparty/gn/base/third_party/icu/LICENSE \
 	src/3rdparty/gn/LICENSE \
 	src/3rdparty/ninja/COPYING \
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3660e20d7e..b9fc7ea966 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebsockets-everywhere-src-5.13.2.tar.xz.sha256
-sha256 fc11236c8bf69b27a4e237a27b9ea27fc90d8c25d81d1d451ce3a0b63cbc02d3 qtwebsockets-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtwebsockets-everywhere-src-5.14.0.tar.xz.sha256
+sha256 50b881e83225b21e6657361e1af9b0154117d5efc03ba8c87aecacee3e42b0ad qtwebsockets-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 2d1e85c45b..5322fe8381 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
 sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebview-everywhere-src-5.13.2.tar.xz.sha256
-sha256 394cc7a9cb29b7883816ff3137b022f30568151aada0739fc99a23789c21c015 qtwebview-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtwebview-everywhere-src-5.14.0.tar.xz.sha256
+sha256 a1ded2eae5d66d8ddde3e56077c0e895aff74ae029cebaf901f91f87c5a89dc3 qtwebview-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash b/package/qt5/qt5x11extras/5.14.0/qt5x11extras.hash
similarity index 65%
rename from package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.14.0/qt5x11extras.hash
index 48545ee9f5..5bc2987ae3 100644
--- a/package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.14.0/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtx11extras-everywhere-src-5.13.2.tar.xz.mirrorlist
-sha256 95a7c5c30f42e9575c3a17a2c0eb0cdbdd2d89dbcb3ee1426cd41bb07e28c51c qtx11extras-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtx11extras-everywhere-src-5.14.0.tar.xz.mirrorlist
+sha256 7a06de3b49d34b72fa773800f049c06c04c51eb3440833779f1e9300a94947b1 qtx11extras-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 71e03bdcc0..23aeeaeb8d 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtxmlpatterns-everywhere-src-5.13.2.tar.xz.sha256
-sha256 1e87d8c004ec0beea3b29d13f0964c563aa9fae51c392c998750ca4e386374e2 qtxmlpatterns-everywhere-src-5.13.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.0/submodules/qtxmlpatterns-everywhere-src-5.14.0.tar.xz.sha256
+sha256 935209e91942e89d569f977153f0ca209125c205065960e55d4f4065a96d90d9 qtxmlpatterns-everywhere-src-5.14.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.24.0
