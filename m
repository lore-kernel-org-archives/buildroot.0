From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 18 Dec 2019 22:34:21 +0100
Subject: [Buildroot] [RFC v1 1/2] package/qt5: bump latest version to 5.13.2
In-Reply-To: <20191218213422.21057-1-ps.report@gmx.net>
References: <20191218213422.21057-1-ps.report@gmx.net>
Message-ID: <20191218213422.21057-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base:
 - removed 0005-Fix-dependency_libs-entry-of-.la-files.patch (upstream
   applied/taken from???)

qt5canvas3d:
 - removed with 5.13 according to [1]

qt5location:
 - removed 0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
   (suberseeded by upstream commit [2])

qt5serialbus:
 - removed 0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
   (taken from upstream [3])

qt5webengine:
 - update 3rdparty license file list

[1] https://doc.qt.io/qt-5/whatsnew513.html
[2] https://code.qt.io/cgit/qt/qtlocation.git/commit/?id=7bafbdc91f83165710ed74639b76b48b4494937a
[3] https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                         |  4 +-
 package/qt5/qt5.mk                            |  4 +-
 package/qt5/qt53d/qt53d.hash                  |  4 +-
 ...tbase-Fix-build-error-when-using-EGL.patch |  0
 ...le-conversion-enable-for-microblaze.patch} |  0
 .../qt5base/{5.12.5 => 5.13.2}/qt5base.hash   |  4 +-
 package/qt5/qt5canvas3d/Config.in             |  5 +
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |  3 -
 package/qt5/qt5canvas3d/qt5canvas3d.mk        |  5 +-
 package/qt5/qt5charts/qt5charts.hash          |  4 +-
 .../{5.12.5 => 5.13.2}/qt5connectivity.hash   |  4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 .../qt5/qt5declarative/qt5declarative.hash    |  4 +-
 .../qt5graphicaleffects.hash                  |  4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |  4 +-
 package/qt5/qt5location/qt5location.hash      |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |  4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |  4 +-
 .../{5.12.5 => 5.13.2}/qt5quickcontrols2.hash |  4 +-
 package/qt5/qt5script/qt5script.hash          |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |  4 +-
 .../{5.12.5 => 5.13.2}/qt5serialbus.hash      |  4 +-
 .../{5.12.5 => 5.13.2}/qt5serialport.hash     |  4 +-
 package/qt5/qt5svg/qt5svg.hash                |  4 +-
 package/qt5/qt5tools/qt5tools.hash            |  4 +-
 .../qt5virtualkeyboard.hash                   |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |  4 +-
 .../{5.12.5 => 5.13.2}/qt5webengine.hash      | 99 +++++++++++++------
 package/qt5/qt5webengine/chromium-latest.inc  | 84 ++++++++++++----
 package/qt5/qt5websockets/qt5websockets.hash  |  4 +-
 package/qt5/qt5webview/qt5webview.hash        |  4 +-
 .../{5.12.5 => 5.13.2}/qt5x11extras.hash      |  4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  4 +-
 35 files changed, 195 insertions(+), 109 deletions(-)
 rename package/qt5/qt5base/{5.12.5 => 5.13.2}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.5/0002-double-conversion-enable-for-microblaze.patch => 5.13.2/0004-double-conversion-enable-for-microblaze.patch} (100%)
 rename package/qt5/qt5base/{5.12.5 => 5.13.2}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.12.5 => 5.13.2}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.12.5 => 5.13.2}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 rename package/qt5/qt5quickcontrols2/{5.12.5 => 5.13.2}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.12.5 => 5.13.2}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.12.5 => 5.13.2}/qt5serialport.hash (65%)
 rename package/qt5/qt5virtualkeyboard/{5.12.5 => 5.13.2}/qt5virtualkeyboard.hash (70%)
 rename package/qt5/qt5webengine/{5.12.5 => 5.13.2}/qt5webengine.hash (86%)
 rename package/qt5/qt5x11extras/{5.12.5 => 5.13.2}/qt5x11extras.hash (65%)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index def79fa680..3572990a13 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -33,13 +33,13 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.12)"
+	bool "Latest (5.13)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.12, which is licensed under
+	  This option builds Qt 5.13, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs a toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 8169faf7c7..fc1606df80 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).5
+QT5_VERSION_MAJOR = 5.13
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index a731bf764f..a854a7e4ac 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qt3d-everywhere-src-5.12.5.tar.xz.sha256
-sha256 2a35b144768c7ad8a9265d16a04f038d9bc51016bd2c4b2b516e374f81ff29c4  qt3d-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qt3d-everywhere-src-5.13.2.tar.xz.sha256
+sha256 d1b9fc0be82264b5f76c3a5330901dff95c1f2bcb67916c3fac6bad4ff69adc9 qt3d-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.13.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.13.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.13.2/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.13.2/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.5/qt5base.hash b/package/qt5/qt5base/5.13.2/qt5base.hash
similarity index 73%
rename from package/qt5/qt5base/5.12.5/qt5base.hash
rename to package/qt5/qt5base/5.13.2/qt5base.hash
index 6689d09efc..2ae6279926 100644
--- a/package/qt5/qt5base/5.12.5/qt5base.hash
+++ b/package/qt5/qt5base/5.13.2/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtbase-everywhere-src-5.12.5.tar.xz.sha256
-sha256 fc8abffbbda9da3e593d8d62b56bc17dbaab13ff71b72915ddda11dabde4d625 qtbase-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtbase-everywhere-src-5.13.2.tar.xz.sha256
+sha256 26b6b686d66a7ad28eaca349e55e2894e5a735f3831e45f2049e93b1daa92121 qtbase-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
index 04c04730bd..281055a232 100644
--- a/package/qt5/qt5canvas3d/Config.in
+++ b/package/qt5/qt5canvas3d/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5CANVAS3D
 	bool "qt5canvas3d"
+	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5DECLARATIVE
@@ -13,6 +14,10 @@ config BR2_PACKAGE_QT5CANVAS3D
 
 	  http://doc.qt.io/qt-5/qtcanvas3d-index.html
 
+comment "qt5scxml removed with qt-5.13"
+        depends on BR2_PACKAGE_QT5_VERSION_LATEST
+
 comment "qt5canvas3d needs an OpenGL-capable backend"
+        depends on !BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index a098ad7de0..4d931f5c0d 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,9 +1,6 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcanvas3d-everywhere-src-5.12.5.tar.xz.sha256
-sha256 1553e06ce3cc5afb36aed3698b85c00e734eac07f7f41895426bebd84216d80c  qtcanvas3d-everywhere-src-5.12.5.tar.xz
-
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index b550ff00f2..1566f30e37 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -10,10 +10,7 @@ QT5CANVAS3D_SOURCE = qtcanvas3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CANVAS3D_VERSI
 QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5CANVAS3D_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
-QT5CANVAS3D_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
-else
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),)
 QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 endif
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index adc860f41a..f1111d3c47 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcharts-everywhere-src-5.12.5.tar.xz.sha256
-sha256 4c7c30a916ba0100a1635b89f48bc5a8af4cdedac79c3fc18456af54dc0a6608  qtcharts-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtcharts-everywhere-src-5.13.2.tar.xz.sha256
+sha256 3bad81c3cfb32cf72fb0ce2ac2794d031cf78a3902b4715f89c09b2d0e041e87 qtcharts-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash b/package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash
similarity index 65%
rename from package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash
index da757aef77..3567d91c86 100644
--- a/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.13.2/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtconnectivity-everywhere-src-5.12.5.tar.xz.sha256
-sha256 bdf62c72d689f47c4d17ecdde934d9f85a1164091e58fce02873de259e8de88b  qtconnectivity-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtconnectivity-everywhere-src-5.13.2.tar.xz.sha256
+sha256 644e234eb64f602ef5cdeb8802ef9b58e75478f1124f001937275d62ed692e17 qtconnectivity-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.13.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.13.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 6bac255578..bb23649ecf 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtdeclarative-everywhere-src-5.12.5.tar.xz.sha256
-sha256 22c5323d4b01259e6e352eef1b54129d6dfee00a406f0312905fa7db322b9190  qtdeclarative-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtdeclarative-everywhere-src-5.13.2.tar.xz.sha256
+sha256 d9a524f45fe9e136cda2252f9d7013ec17046d907e3f39606db920987c22d1fd qtdeclarative-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index b9cfe357f8..83bb0472d4 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtgraphicaleffects-everywhere-src-5.12.5.tar.xz.sha256
-sha256 bdbddba7e0e0d041809a98d97c07da8be8936ec48537335cbaea9b0049c646ad  qtgraphicaleffects-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtgraphicaleffects-everywhere-src-5.13.2.tar.xz.sha256
+sha256 297a89bb6c771f849c4ce866e5c98dadf665163b3dab03bc48a58f51424e7e66 qtgraphicaleffects-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 6215852a95..b78e14f8db 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtimageformats-everywhere-src-5.12.5.tar.xz.sha256
-sha256 9f19394830542fb9e6bde6806b6216b7207f96bff674b91e8e8a8f89699e1f0a  qtimageformats-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtimageformats-everywhere-src-5.13.2.tar.xz.sha256
+sha256 6968649fdccc7d633cf9ada25f1bdaf0a2fb45a214d58c2c47896166d4553ac0 qtimageformats-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 27ad8efd9e..5aeb73ef70 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtlocation-everywhere-src-5.12.5.tar.xz.sha256
-sha256 12c8b59755abc4ca56e135e8ae3db7c6ba1bd95c779060f10a01393ae1040122  qtlocation-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtlocation-everywhere-src-5.13.2.tar.xz.sha256
+sha256 5fe4b824d3dc6c800682ff986333ec09edb9c27582066e928b1862b4d58212e3 qtlocation-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 93bb6f1ccc..c497149f44 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtmultimedia-everywhere-src-5.12.5.tar.xz.sha256
-sha256 d5a0a4fddc5ef14d641160a1fc0011b190ff8d9f19009498d586516b8ee3479c  qtmultimedia-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtmultimedia-everywhere-src-5.13.2.tar.xz.sha256
+sha256 5f885459d46ea2f2bb24597678befd4913d8f88029730d01984f51f9c367b9f4 qtmultimedia-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 71727972b4..d2b61be2d3 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols-everywhere-src-5.12.5.tar.xz.sha256
-sha256 46deaefbdac3daa576c748e807956f5f82b2318923b1a36e434a3ff32d1d2559  qtquickcontrols-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtquickcontrols-everywhere-src-5.13.2.tar.xz.sha256
+sha256 d6e64d8db13ada55fcb0d5e8ca26097085680087d931435c6c6db859d87493ea qtquickcontrols-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash
similarity index 54%
rename from package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash
index e886661527..568dd84b15 100644
--- a/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.13.2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols2-everywhere-src-5.12.5.tar.xz.sha256
-sha256 d744bdc492486db6cb521b1d4891e2358719399825ca1cf2a50968a80f6acb8f  qtquickcontrols2-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtquickcontrols2-everywhere-src-5.13.2.tar.xz.sha256
+sha256 90ee8be7b66cc65f3f22e71a0b35adab5c169ac4f8ebc6f9e7685228bf8a7d70 qtquickcontrols2-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 86381865e7..4cb90eeea3 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscript-everywhere-src-5.12.5.tar.xz.sha256
-sha256 0083734ae827840334b774decb15de37f1b4ea5c88e442e2f485c530f24f1df4  qtscript-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtscript-everywhere-src-5.13.2.tar.xz.sha256
+sha256 3d92691c25577fbf7511d40253de0cd9d31444ea5a0aa860f65efb9fa0f3ce70 qtscript-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index e24cdfd445..3841a293a8 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscxml-everywhere-src-5.12.5.tar.xz.sha256
-sha256 6f1ec74100cdb2e7dfc3535e09d356fc53ba42e61b32fc3b93d5a7efed49960c  qtscxml-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtscxml-everywhere-src-5.13.2.tar.xz.sha256
+sha256 e489dff21e18c1e7f72ffd31af82404f845bd90824c6b978140591366398a9d9 qtscxml-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 3dc2d7ddb5..a14e6a590e 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsensors-everywhere-src-5.12.5.tar.xz.sha256
-sha256 e3a86a706f475bb23fc874de56026482de223ebd24f8cb4e94a28d1985ca0b85  qtsensors-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtsensors-everywhere-src-5.13.2.tar.xz.sha256
+sha256 46f73bbfddfd78a419c6424d6839318774b84c955a7f7a96c12c590f6d8fb177 qtsensors-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash b/package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash
similarity index 60%
rename from package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash
index 7ce82a33ef..cd5a39845c 100644
--- a/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.13.2/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialbus-everywhere-src-5.12.5.tar.xz.sha256
-sha256 8474ae61a703c56e327ae0755c27643f2eafe0d915e8c6afb21728548dc02c22  qtserialbus-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtserialbus-everywhere-src-5.13.2.tar.xz.sha256
+sha256 48159393b1368976b5324eac48424e2a6e5d63c783194d0576a978151f882da3 qtserialbus-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.5/qt5serialport.hash b/package/qt5/qt5serialport/5.13.2/qt5serialport.hash
similarity index 65%
rename from package/qt5/qt5serialport/5.12.5/qt5serialport.hash
rename to package/qt5/qt5serialport/5.13.2/qt5serialport.hash
index 3edb832537..b1cbe3cc72 100644
--- a/package/qt5/qt5serialport/5.12.5/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.13.2/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialport-everywhere-src-5.12.5.tar.xz.mirrorlist
-sha256 f8ef0321a59ecfe2c72adc2ee220e0047403439a3c7b9efb719b1476af1fb862 qtserialport-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtserialport-everywhere-src-5.13.2.tar.xz.mirrorlist
+sha256 7677ffc1dce3b75c0a98d07d215588a8dccb5c276c55b4ecd60c35ed1c89cb34 qtserialport-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 5c5300ae68..18f2c57095 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsvg-everywhere-src-5.12.5.tar.xz.sha256
-sha256 75a791cf749f671d7ea9090b403ca513f745795018db512e7eecbf418b679840  qtsvg-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtsvg-everywhere-src-5.13.2.tar.xz.sha256
+sha256 849e2e357e1333b64ecb728352f652cd8d916f029ed848f775b15d0b500cb7d7 qtsvg-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 344cc0a9d2..a14553486d 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qttools-everywhere-src-5.12.5.tar.xz.sha256
-sha256 28e095047b4985437dd66120cbcb49ac091bf4f12576ecad7ebc781b7dd44025  qttools-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qttools-everywhere-src-5.13.2.tar.xz.sha256
+sha256 919a2713b6d2d7873a09ad85bd93cf4282606e5bf84d5884250f665a253ec06e qttools-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash
similarity index 70%
rename from package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash
index 4b086f81aa..1301e51ef5 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.13.2/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz.sha256
-sha256 786d745b34b1f145073488d492325e98bcde81b07ab984032ea5eb2fb52e6e5e  qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtvirtualkeyboard-everywhere-src-5.13.2.tar.xz.sha256
+sha256 8e368dde237d21666f6cc8512a060e205388e519a4d7559c0505cc75224ed62b qtvirtualkeyboard-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 523ef9e9f2..42354cd36b 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwayland-everywhere-src-5.12.5.tar.xz.sha256
-sha256 29fd31267149451f93faa15f031e0a14506e704086033f70d51479522c6f3846  qtwayland-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwayland-everywhere-src-5.13.2.tar.xz.sha256
+sha256 3c9b2358d9cee02552b875db93b56f3b9bc3b0f4df7a2ff7e8b72f2a8f2ca952 qtwayland-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 42b2d9a6fe..08d681dafb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebchannel-everywhere-src-5.12.5.tar.xz.sha256
-sha256 9f1d1ac20722ee053ecf071d4ec0070a45a765cb67b6e31add61004fb4b3c5e8  qtwebchannel-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebchannel-everywhere-src-5.13.2.tar.xz.sha256
+sha256 f452d419d8b19b566835f316bbf282dabc8b1c2a74c9c98c1aec4184465e9c13 qtwebchannel-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.5/qt5webengine.hash b/package/qt5/qt5webengine/5.13.2/qt5webengine.hash
similarity index 86%
rename from package/qt5/qt5webengine/5.12.5/qt5webengine.hash
rename to package/qt5/qt5webengine/5.13.2/qt5webengine.hash
index 0956f504ed..8fc44e517e 100644
--- a/package/qt5/qt5webengine/5.12.5/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.13.2/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebengine-everywhere-src-5.12.5.tar.xz.sha256
-sha256 31881130e69eb8336e9480f9f33cd5a93e86de8d7323c0ae1893e1a72ce70743  qtwebengine-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebengine-everywhere-src-5.13.2.tar.xz.sha256
+sha256 adcf56b5de6f34744bba2307b696fc75611884f4270e87dfa760d6e99dd711bb qtwebengine-everywhere-src-5.13.2.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -21,17 +21,21 @@ sha256 538edc6f52c563cf06eca1bac8dd785ff60ef5a371a950265700d5d40386db6e  src/3rd
 sha256 79955cd80438f041387eb080f2675394e36a806b8b17eca63a4bc568d839509e  src/3rdparty/chromium/base/third_party/valgrind/LICENSE
 sha256 c45766baef552c59eeb1fdfbbc690e52e4cd5b135dfd325f21bdfe8ddfe28ce6  src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE
 sha256 18351de3d7e2dc469cc83e77d38a3e25d010251e34eb348bbd1a76275e313997  src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE
+sha256 88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  src/3rdparty/chromium/build/fuchsia/fidlgen_js/third_party/enum34/LICENSE
 sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/buildtools/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/LICENSE
 sha256 212c5a071f61512786b5e5840b3d70c85e017f3f82939ad4d4a870fc48b33477  src/3rdparty/chromium/LICENSE.chromium_os
 sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/mojo/public/LICENSE
 sha256 bed70fc84f1bea2b4b144564b9a0f9a5a3bc7b0d78f6e62092aeb689cac56bdd  src/3rdparty/chromium/net/third_party/mozilla_security_manager/LICENSE
 sha256 a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  src/3rdparty/chromium/net/third_party/nss/LICENSE
+sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/net/third_party/quiche/src/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/net/third_party/uri_template/LICENSE
 sha256 834ee20e8fc3235722ed801bae30cc539c2775be656ff9cc2810fe674e53d5ec  src/3rdparty/chromium/ppapi/LICENSE
-sha256 d3e2f59e1d71176dfdb555ece6a41f7a5aa0f52ff21211010ace314f57695f6b  src/3rdparty/chromium/third_party/abseil-cpp/LICENSE
+sha256 8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  src/3rdparty/chromium/third_party/abseil-cpp/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE
 sha256 bf4da21bd20bcfb5b60b7ecc67fa864a79be049e21d6178076887f178dd6c71a  src/3rdparty/chromium/third_party/angle/LICENSE
 sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE
+sha256 86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE
 sha256 a08ba10adec47027ef8078848729837b1c5a42f140718d7afd65c23f1eeec392  src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE
 sha256 31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE
 sha256 29028ec63522121b5545046e0c4d3ccc1e01fc8d9aaa3272554f74829cdacf84  src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE
@@ -41,7 +45,7 @@ sha256 584e795ba5833279c327245594d6dc216fc664144fa3626a0bdf136bc00af76c  src/3rd
 sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/axe-core/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/bazel/LICENSE
 sha256 0518cf49c09398259d54fcfff0b5fd36456162c6439886660e53627b3073ef22  src/3rdparty/chromium/third_party/blanketjs/LICENSE
-sha256 228eadfc94c664f3e31833d7eb2d682127038cb44a0d482b6d6c1026f3fce306  src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc
+sha256 a661d10f8f194b1963a75bb4d308f17b078cc064624313a556902d89705f6876  src/3rdparty/chromium/third_party/blink/LICENSE_FOR_ABOUT_CREDITS
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE
 sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2
 sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1
@@ -58,7 +62,11 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE
 sha256 4165ae4c9c71da3e655a9acee8ee3368bba20f0702f4dcc994da315132ab90de  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md
+sha256 88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/enum/enum/LICENSE
+sha256 663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/h2/LICENSE
+sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hpack/LICENSE
 sha256 16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/html5lib/LICENSE
+sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hyperframe/LICENSE
 sha256 63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE
 sha256 df336397e09e764416fc33b555703b1cdddd3a0cfea8a013ad1cad565c8be2f5  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE
 sha256 60bd7c54856bf9387221bde5ab55d516d7cea15870d0fed69406bcd1c8ec7c9d  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
@@ -74,16 +82,24 @@ sha256 015b2d5cedb3024339446a63963d073fa831544cf253c5ddd713fccc8d83e939  src/3rd
 sha256 3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  src/3rdparty/chromium/third_party/brotli/LICENSE
 sha256 98f8746a39f9a42da35df7046a15b56d0e2f4f76eefc352d67f1bf76e85360b4  src/3rdparty/chromium/third_party/bspatch/LICENSE
 sha256 b5730da9a26472a405b0b1c61d3d166714d9d654ab3282e54e4a01a5f66316c3  src/3rdparty/chromium/third_party/byte_buddy/LICENSE
+sha256 0154852797380b35195ecd829582f1efd00bfe244eab427a6bbf1e3f3dd57b1f  src/3rdparty/chromium/third_party/catapult/common/eslint/LICENSE
+sha256 65d4ed698fb5cbcd1d44c78bc6a02c5bf1da00df5395d2d6ac43bdafe6bc20dc  src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rcssmin/bench/LICENSE.cssmin
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rcssmin/LICENSE
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rjsmin/LICENSE
+sha256 984fb04a16a9f1e0145ffd891125dc366a01cd921f58c9b0369be400c720790d  src/3rdparty/chromium/third_party/catapult/third_party/polymer/components/polymer/LICENSE.txt
+sha256 f77133324f35589f9f170473456321fe76aa35b750293cb8a475e26afa8f2bac  src/3rdparty/chromium/third_party/catapult/tracing/LICENSE
+sha256 17afb4516438c26ee15213c5a082206340d976a68472b8eab2499d7bce4debec  src/3rdparty/chromium/third_party/catapult/tracing/third_party/chai/LICENSE
+sha256 1920d2326ebbad34dcbd9681b4fe4926f113aa5e7dc9a92fceb456d859ee142e  src/3rdparty/chromium/third_party/catapult/tracing/third_party/d3/LICENSE
+sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/catapult/tracing/third_party/devscripts/COPYING
+sha256 e8b80a53d0f95a3cf0f992f8cfc6b3911a7f32f47e0e4a8d4fd66582eeae9484  src/3rdparty/chromium/third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md
+sha256 aae03c510d63d96de72d37ce5650fbbac63b322d09ac0ee0df50b8950329e840  src/3rdparty/chromium/third_party/catapult/tracing/third_party/jszip/LICENSE.markdown
+sha256 1f194a987fa1dc60e4bcf5e04e0fc03fff8f2ee587c52136adb2cebb397250b8  src/3rdparty/chromium/third_party/catapult/tracing/third_party/mocha/LICENSE
+sha256 a04665b3b2de56c66730c1f720f528175739e4104f79073614aa611da1e85539  src/3rdparty/chromium/third_party/catapult/tracing/third_party/pako/LICENSE
 sha256 ef5b39dfcafe08323262e3f51a3a9de649978a55ed8ef8eef3c451f2c1e78a53  src/3rdparty/chromium/third_party/ced/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/ced/src/LICENSE
 sha256 3d1d2669d0ba87069b5e202f106193c4eb0e140a2aead31dca9670a0581dd979  src/3rdparty/chromium/third_party/chaijs/LICENSE
 sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  src/3rdparty/chromium/third_party/checkstyle/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20
-sha256 5a12a0c01bfcdbc90b550c9cd8bfc3e90e6be9c9bbfdb58bfb5daaf6817eb78f  src/3rdparty/chromium/third_party/chromevox/LICENSE
-sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  src/3rdparty/chromium/third_party/chromevox/third_party/closure-library/LICENSE
-sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/chromevox/third_party/sre/LICENSE
-sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/LICENSE
-sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE
 sha256 212846e0145aa50fb3a5aef254a370311a93acf6c1e792e47e0068d64c8c3885  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE
 sha256 4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE
@@ -91,7 +107,8 @@ sha256 f40ee07401827b6ac9cf0aee1aaffb00e42a3f2c729f9c83f96a3daafef5d944  src/3rd
 sha256 a1f30b77c01e0995fa32a00119e00749e8731ee8a3c4c3549bce74083c72b0b6  src/3rdparty/chromium/third_party/crc32c/src/LICENSE
 sha256 e9427cf6abc4eaeda0bcd094fca46af4067970079f426b65d5cbacb87bff6366  src/3rdparty/chromium/third_party/cros_system_api/LICENSE
 sha256 09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE
-sha256 10054db83ace18e5a455749d0d247857ec50508cecda79a5abe66fe4778d7721  src/3rdparty/chromium/third_party/d3/src/LICENSE
+sha256 7a3cb0e5055874e67db9aa2d5fe26de23204fa994ffbad198901ffe9c812a717  src/3rdparty/chromium/third_party/d3/src/LICENSE
+sha256 b77e952e3feaebd807d27784988b19fb60f83f9fc9a0c03e6aedbbffd5d6f8ee  src/3rdparty/chromium/third_party/dawn/LICENSE
 sha256 43452b94e6aa0c2d076ad25b87f580c11571689d52f3aa1a1f7bdcab31a0bd15  src/3rdparty/chromium/third_party/decklink/LICENSE
 sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/devscripts/COPYING
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE
@@ -240,6 +257,7 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rd
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  src/3rdparty/chromium/third_party/flac/COPYING.LGPL
 sha256 946b733afbaa20a192c8dc022b4e43090e78f28fd293494d1b307f7301552c9b  src/3rdparty/chromium/third_party/flac/COPYING.Xiph
 sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/flatbuffers/LICENSE
+sha256 3112ebbfc0fe10ad40a97672f5590c4292536a28cbfe3506820b15dec70b2258  src/3rdparty/chromium/third_party/flatbuffers/src/dart/LICENSE
 sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt
 sha256 e09d954054165670b6a669e6da59673d9e85f343b9983e92a220623ff0198f8c  src/3rdparty/chromium/third_party/flot/LICENSE.txt
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/LICENSE
@@ -248,7 +266,9 @@ sha256 fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  src/3rd
 sha256 9f5db2544e04e3e0fb39ea277b9bb6f8efcc8bb84f6264630978ce4708495535  src/3rdparty/chromium/third_party/gestures/gestures/LICENSE
 sha256 4bd9e329f9b268bd0dec2df0560a03382fe426adf83daa7b314d2f46b9b22c9a  src/3rdparty/chromium/third_party/gestures/LICENSE
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/gif_player/LICENSE
+sha256 8ea14fdc7efee7fe53c79101b97049bd547dc6686cfa05df4f0686146a561423  src/3rdparty/chromium/third_party/glfw/src/LICENSE.md
 sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rdparty/chromium/third_party/glslang/LICENSE
+sha256 d3cbc77d99642114bc925cce51eda84b48ae4879947ac89941a2e2aa4150db76  src/3rdparty/chromium/third_party/glslang/src/LICENSE.txt
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/googletest/src/googlemock/LICENSE
 sha256 5e0df8c845c742e76f2f64d2d9ce1b7e74a2422fddbc577ae6a56319083de0bf  src/3rdparty/chromium/third_party/googletest/src/googlemock/scripts/generator/LICENSE
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/googletest/src/googletest/LICENSE
@@ -258,7 +278,6 @@ sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/guava/LICENSE
 sha256 ca382aa537f8923d6c0991fb976d184a2009eb76080313bf10dcecdc9311f0dd  src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE
 sha256 f54c49d3ff865458c5d3c68c3367a1f6e0d7b3f686f8c88a6a563ef90f84ad9e  src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE
-sha256 9f45b3cf29b76b5bf4ad467938b0e61a720eec6ef6c219c566f7c262b0cc7854  src/3rdparty/chromium/third_party/haha/LICENSE
 sha256 96e5bbd81970983d666e702fa56f67dfd2fdaa363b8a4266e8d98847374cd7c8  src/3rdparty/chromium/third_party/hamcrest/LICENSE
 sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING
 sha256 ec20cbe051200fc846caf4dc253cf660e874a2d9e4f3a682e08354b567fae409  src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/hb-ucdn/COPYING
@@ -272,22 +291,28 @@ sha256 4eac19453ddf356478db3be6b101a6d872d0046cdc8222df1ff5c997dd4b9fbe  src/3rd
 sha256 c62d7697c03979f5056d28b338fafc7a1152820f7b379adf4a9d88cd37160f96  src/3rdparty/chromium/third_party/icu/license.html
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/third_party/icu/scripts/LICENSE
 sha256 8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  src/3rdparty/chromium/third_party/ijar/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/ink/LICENSE
 sha256 b9be92f13356083392d97da13cab8ae543c7911f44eff5289b693da8b17b9e08  src/3rdparty/chromium/third_party/inspector_protocol/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/intellij/LICENSE
 sha256 7a92c5e7a83b5ddcc693bb84ea8bdb842308509c1758cffdfe24717609154c75  src/3rdparty/chromium/third_party/isimpledom/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/javax_inject/LICENSE
 sha256 7975c0027cfa5d08253fbb6ff4676acc38248bd5e046d0dbab3d810971e97970  src/3rdparty/chromium/third_party/jinja2/LICENSE
 sha256 923e74e5ae41345038da0a56dfdc983356917fbbb139176e654d1b33100b723f  src/3rdparty/chromium/third_party/jmake/LICENSE
 sha256 76c45ece83a26117f86f4e349e7df118708e061e87225328fb478ce1e8b3eb86  src/3rdparty/chromium/third_party/jsoncpp/LICENSE
+sha256 76c45ece83a26117f86f4e349e7df118708e061e87225328fb478ce1e8b3eb86  src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/jstemplate/COPYING
 sha256 71a19392a0eb3255ab2055ed978bb0f93865cea84d31a3510eaffb74d8981e7f  src/3rdparty/chromium/third_party/khronos/LICENSE
-sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/leakcanary/LICENSE
 sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  src/3rdparty/chromium/third_party/leveldatabase/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/libaddressinput/LICENSE
 sha256 c9a5bd7c8cc1267ddacdc5228c68ecd811cf6d74286e9141bc80d8af2eb1a025  src/3rdparty/chromium/third_party/libaddressinput/src/cpp/LICENSE.chromium
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/libaddressinput/src/LICENSE
+sha256 4764a286d8b2faeaf42f4418e7d7a28d58fc8fd4d00a3d0a7f44b0a4099de7f2  src/3rdparty/chromium/third_party/libaom/source/libaom/LICENSE
+sha256 043dcfd059386f9facd376351b2bd79325778744aa442177390cdfcca54babed  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/fastfeat/LICENSE
+sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/googletest/src/googletest/LICENSE
+sha256 5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/libwebm/LICENSE.TXT
+sha256 ff6c857ce2708e87701323078aef115c1872a1f80a9649f86dc899b48083bc60  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/vector/LICENSE
+sha256 719d8fa235f2068e0ae6d6a7dceb0a7720d7840f0f0ebed29957989e6ded3cd8  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE
 sha256 fb3ab1e1621c6c469499a6ba1e926c027f32af3063c0456282f89382591cc46a  src/3rdparty/chromium/third_party/libevdev/LICENSE
-sha256 721cb11de618fcf9bbb7d25a389207bf2227357e6694bc326ab32a6699f9b951  src/3rdparty/chromium/third_party/libFuzzer/LICENSE.TXT
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE
 sha256 19af539b1ec692ea9ccf71b6ea97d602bcf7187eab27b0ea806aea1cd10b0b13  src/3rdparty/chromium/third_party/libjpeg/LICENSE
 sha256 fffd497be5f4ae0a10b8258e191125fb58b90250ecbf3c79398d79604dd00b7d  src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md
@@ -316,23 +341,23 @@ sha256 6e3e0a978f1e136cb3efb89702f4314671581a0c70c9a52447669e00f7b129e8  src/3rd
 sha256 7973776647df23457a9910075547e3f345fbc5e0e41147b4586d714582dfdd76  src/3rdparty/chromium/third_party/mach_override/LICENSE
 sha256 0bbe88228fd63d20ec097f64e58d5a0a465123ae139140a18d406c60b48824b5  src/3rdparty/chromium/third_party/markupsafe/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/material_design_icons/LICENSE
-sha256 c93465d6a75e6ade8785edb4ec125ece083ab0910ed0417b4ff346792ba0f851  src/3rdparty/chromium/third_party/mesa/LICENSE
-sha256 e8800bd573e8f844a5b87cf43cc4d55767314b4e95a6092cf26ce9c6ed00b877  src/3rdparty/chromium/third_party/mesa/src/docs/COPYING
-sha256 1efd6dec259877be94db3dbd005c93a5c94a73a492bd85eede6e14885e480e0e  src/3rdparty/chromium/third_party/mesa/src/docs/license.html
-sha256 704179825bb7c4600acbff3d1fcd95f1eb61b2c4a11b66bb150d7cefea8f6371  src/3rdparty/chromium/third_party/mesa/src/src/gallium/drivers/radeon/LICENSE.TXT
+sha256 c93465d6a75e6ade8785edb4ec125ece083ab0910ed0417b4ff346792ba0f851  src/3rdparty/chromium/third_party/mesa_headers/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/third_party/metrics_proto/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/microsoft_webauthn/LICENSE
 sha256 83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  src/3rdparty/chromium/third_party/minigbm/LICENSE
 sha256 8610954adbca6c6b85d8b1ae5613b44b0014e437d32fcad6683bb27541411686  src/3rdparty/chromium/third_party/minigbm/src/LICENSE
+sha256 4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204  src/3rdparty/chromium/third_party/minizip/src/lib/bzip2/LICENSE
 sha256 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  src/3rdparty/chromium/third_party/minizip/src/LICENSE
 sha256 e075583a46bca13a3f25af4181e2a0064f442c1f55c4312275cbcf05b892d3f4  src/3rdparty/chromium/third_party/mocha/LICENSE
 sha256 380893a2f01aea5c3328b1a8b08cdc488bf236916abac3af0d1f1a5d2634c31a  src/3rdparty/chromium/third_party/mockito/LICENSE
 sha256 d47e8390fb0d7ad4a18f26aedd6283c7ab6b5b4fabab536ccb4db7f9f6d90c08  src/3rdparty/chromium/third_party/modp_b64/LICENSE
-sha256 5f593432ef4e7ecefa6326042babb8a03d8d6ce502b4f0b78b105e18d19f8052  src/3rdparty/chromium/third_party/molokocacao/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/motemplate/LICENSE
 sha256 7a92c5e7a83b5ddcc693bb84ea8bdb842308509c1758cffdfe24717609154c75  src/3rdparty/chromium/third_party/mozilla/LICENSE
+sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  src/3rdparty/chromium/third_party/nasm/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/netty4/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/netty-tcnative/LICENSE
 sha256 0cd1bd4b934ffdc5e7f1bcfa9d08bd17295e5414bdca99c06b1036278b01f0b1  src/3rdparty/chromium/third_party/node/LICENSE
+sha256 d41b608410d0f07157353639f967a561202236e6303f45c98aec47934b924700  src/3rdparty/chromium/third_party/nvml/LICENSE
 sha256 b5730da9a26472a405b0b1c61d3d166714d9d654ab3282e54e4a01a5f66316c3  src/3rdparty/chromium/third_party/objenesis/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/ocmock/License.txt
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  src/3rdparty/chromium/third_party/openh264/src/LICENSE
@@ -344,6 +369,7 @@ sha256 0d74de3c3cd3196a9ed1bc612cfd5f81d7509d66c4be34a50f99d61bd1ad00d4  src/3rd
 sha256 9dd8d2fb95ba862a5d166a167682c1c67a209acd3bf09b6fd03f76d3579729bc  src/3rdparty/chromium/third_party/ow2_asm/LICENSE
 sha256 b578cdd2345840ada550bd12519533812320d5f1d21cf4c1c7e1b1b0a31c98b7  src/3rdparty/chromium/third_party/pdfium/LICENSE
 sha256 32759d1397d8f7b9e15ece146e4038b22b90e93b4935b5a840bcef4d2ba5ea55  src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE
+sha256 913b3eb6f19defc77c00e2bebbbce464326331b0b59eb6d1d1b23d68a8c27f6b  src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE
 sha256 c5b14f5a3814d2e57b9bb9520dcf57a2c3817b65c4f989e5c82e332c82af1038  src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt
 sha256 9f98bab33648b77578d85ac0f1d1c3941a72aa6d7e65015ba181f2fe804bb85d  src/3rdparty/chromium/third_party/pexpect/LICENSE
 sha256 dd4930c619afd8527591353c7d3d1c1d7f4bf62ed1cb411f4f507dbdee7738a2  src/3rdparty/chromium/third_party/ply/LICENSE
@@ -351,7 +377,7 @@ sha256 685b3b09870f1361f8db2d3f37acdb765d5da1722a18b182765da4b79a8f63ff  src/3rd
 sha256 a5adc2955c0dd848c97aa6afb14e0047a610f0fcfa6ce0011efad01a0e051406  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt
 sha256 984fb04a16a9f1e0145ffd891125dc366a01cd921f58c9b0369be400c720790d  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt
 sha256 294f58267c6f473c4ce7270bf5c8d34b2003cb43804552459654c36553431276  src/3rdparty/chromium/third_party/proguard/LICENSE
-sha256 af67c58de2e18677a0b8cb5fffbe2232aabb8eb2930e8cd684769cef3d74a262  src/3rdparty/chromium/third_party/protobuf/LICENSE
+sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  src/3rdparty/chromium/third_party/protobuf/LICENSE
 sha256 2ab28b982a7f3150e1597befaa87e1636b9973c80aef3752597945d270c4c4e4  src/3rdparty/chromium/third_party/pycoverage/LICENSE
 sha256 f8d0c347a0dcc6ebe1671640dfae8d2411b6ded892e06a6764f8208b218b2af4  src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE
 sha256 f8c8ccecdbb044fd6fa1a586c596a055fb2b14fb3e335d8ed282db58d80b7410  src/3rdparty/chromium/third_party/pyelftools/LICENSE
@@ -378,18 +404,26 @@ sha256 e320e0b6915c2a93dc7f6db28c014f223ae32de61f5033300db2b75d506daa1f  src/3rd
 sha256 e320e0b6915c2a93dc7f6db28c014f223ae32de61f5033300db2b75d506daa1f  src/3rdparty/chromium/third_party/sfntly/src/cpp/COPYING.txt
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/shaderc/src/LICENSE
 sha256 b5a00e94f058edc87e05978329b55730d8689abe61205d9018443d03de4f07da  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang
-sha256 19096ed2f05a693b92433405a6bf1018044b31ed5fa8883ab865cf2cd166f6e9  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools
+sha256 47e20ce182bc68fab1a0cfb129b03c326aaf4f2b6b7905aa9d376d31018bd29f  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools
 sha256 33c9a2fe619e1200937629f318895898ffcd1bf7d0ddd39adc382c030925e61e  src/3rdparty/chromium/third_party/simplejson/LICENSE.txt
 sha256 b25948e48c44312d04ffc626a9d52cae7c04539a1a8e0c1be47b7bfa0da03e1d  src/3rdparty/chromium/third_party/sinonjs/LICENSE
+sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/experimental/canvaskit/canvaskit/LICENSE
+sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/LICENSE
+sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE
+sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE
+sha256 5366e97b4478f15a1e2fd7e6094337426597df28de50cd9fed3f2e7e87f1229e  src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE
 sha256 3e3a91ec5c3fa243ad1f5a25cedee0abafd9824d061378cd3c81c541b044bf09  src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/third_party/skcms/LICENSE
 sha256 e21477eed484b07902a861a1b18d1e4ecd3e6f22fa81e2410f0770cfb67290e8  src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/LICENSE
+sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/third_party/wuffs/LICENSE
 sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rdparty/chromium/third_party/smhasher/LICENSE
 sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  src/3rdparty/chromium/third_party/snappy/src/COPYING
-sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE
-sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/spirv-headers/LICENSE
+sha256 9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  src/3rdparty/chromium/third_party/spirv-headers/src/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/sqlite4java/LICENSE
 sha256 06545a6ec25fbbff6c62f205f94a35be49e38f33bea827a8cfb07d7b82e4b083  src/3rdparty/chromium/third_party/sqlite/LICENSE
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms
@@ -399,7 +433,6 @@ sha256 a63ee63574ed21e930765c4418a4fa2fa571b72c47cd023ee588dbf8b21fb4ee  src/3rd
 sha256 a012d664e4e01df52a65b2eeafdfb8aeb856fec0e6c372265d01b0109c3f5e2a  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/include/llvm/Support/LICENSE.TXT
 sha256 0a731c5e376f4b604b9fd099d4797d64a5c0bc6e3770baf17b55988cb7737e2e  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/LICENSE.TXT
 sha256 a63ee63574ed21e930765c4418a4fa2fa571b72c47cd023ee588dbf8b21fb4ee  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/projects/sample/autoconf/LICENSE.TXT
-sha256 9c9a05118ed1b6d96781a2e52335f7d4ec3dd6e7139340a8aa95fbf7eb4f199a  src/3rdparty/chromium/third_party/swiftshader/third_party/llvm-subzero/LICENSE.TXT
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT
 sha256 b2d24d77041fbf66b93519758cd80671425c55614b2f65262046fdbe8c3247a8  src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt
 sha256 c55ce1e876843853a8a2e5c936df6dc8dd3d185f83d85e6d113143b8c24f542e  src/3rdparty/chromium/third_party/swiftshader/third_party/subzero/LICENSE.TXT
@@ -422,20 +455,29 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/web-animations-js/sources/COPYING
 sha256 d51b39e7ed0391e75e0add75d1a162fdf4a0d6b49fba7635ed0ac4e16f324773  src/3rdparty/chromium/third_party/webdriver/COPYING
 sha256 6d83e980b9b843cf6fe24cb94714d00f9b0cf69cb00d0e3b0bed018d49d6f24f  src/3rdparty/chromium/third_party/webdriver/LICENSE
-sha256 a661d10f8f194b1963a75bb4d308f17b078cc064624313a556902d89705f6876  src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS
+sha256 25b7731b70c77ecd5f3bb19303fbaa99be18860f81d44f71da670fdcd04829db  src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/fft4g/LICENSE
+sha256 41d791701e3e1c1073470403de7e342442d1e6a2af72681023b13a2f45f2125c  src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/spl_sqrt_floor/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE
 sha256 26d2d16d48825edf1194cb3907c5c0b7d01f9c5527eb0fefb949c51f304635e9  src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md
 sha256 21a742dd8cceebb1d5df7c6f945c75ccf1ad4f0d4c17e404517500c1a7de86a4  src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/3rdparty/chromium/third_party/webrtc/LICENSE
 sha256 1f7a086c17fa2bdbe27d3eb6424a64b9bea9d7db89a4e220fef52ca24addb9e9  src/3rdparty/chromium/third_party/webrtc/license_template.txt
-sha256 3ee0b54b13060355b0f5d0d1476536d25ad10552211098cc4086a46fb8c61f42  src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY
+sha256 6fdbabd2c95c5efc6f1e46175278239afb9343120a3022ed0e0cb04267a6aeb3  src/3rdparty/chromium/third_party/webrtc/modules/third_party/fft/LICENSE
+sha256 b29c8f13f91feb2dab7d6655444369fa9f29c0d7121a52dab90ff97e40343a85  src/3rdparty/chromium/third_party/webrtc/modules/third_party/g711/LICENSE
+sha256 61862327fd00d6a4deb2c1276577782c2500f4fe103e072018fc369d8e37e876  src/3rdparty/chromium/third_party/webrtc/modules/third_party/g722/LICENSE
+sha256 641007ea2810c4cfc10a5d1a44db33983ec1409305e953c7119cc2457ec5c536  src/3rdparty/chromium/third_party/webrtc/modules/third_party/portaudio/LICENSE
+sha256 a508773ebf00f8c777a910e941e5fd0072195843e1b72a90eb8787d26d4ab1d7  src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/base64/LICENSE
+sha256 905bc5ab1c66eea2669aee6cb5185488508264df6492f71ae1a6595180ff8c2b  src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/sigslot/LICENSE
+sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/LICENSE
+sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/cottontail/LICENSE.md
+sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md
+sha256 20de375707692099b3132084695377ce5fec0aec05813dedcce094b8eda44386  src/3rdparty/chromium/third_party/widevine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/woff2/LICENSE
 sha256 b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  src/3rdparty/chromium/third_party/xdg-utils/LICENSE
 sha256 1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  src/3rdparty/chromium/third_party/xstream/LICENSE
 sha256 efdabc1c1f655528b8c3a59b03668d446746d87273fab76f8af800b6e8891bd2  src/3rdparty/chromium/third_party/yara/src/COPYING
 sha256 795f8d76eade6130129b680ac72ea81cb3e143467a65ea1f5f64946151d7fa20  src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING
 sha256 942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  src/3rdparty/chromium/third_party/zlib/LICENSE
-sha256 70eb89e4cb460d1b27173348c9f9fca5cf67c09d722ddaa07c5d0fcd6262a97e  src/3rdparty/chromium/tools/gyp/LICENSE
 sha256 63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE
 sha256 f5b244982699ca9fe5cc8fa8a7c08cf5dee5d3a0c8896892899e5df13316e1b7  src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE
 sha256 4fde1ca31ffe4e16a76098f56170166c61a5493d3bafcc6a5903d3cb60aa7560  src/3rdparty/chromium/tools/symsrc/COPYING-pefile
@@ -446,12 +488,13 @@ sha256 e7115e18444dae09d17f361ddc365fb1d342640fe500796209c63f7c80dfae10  src/3rd
 sha256 6a585a9f466654abc8fc0829d56b1bc987e3a073d31faa03bba37d33640a23cd  src/3rdparty/chromium/v8/LICENSE.strongtalk
 sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/v8/LICENSE.v8
 sha256 cae8c00ca6e90a682c321ec11e7a5a345d0d317aa0b8f038e03ef03a18095b2f  src/3rdparty/chromium/v8/LICENSE.valgrind
+sha256 36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  src/3rdparty/chromium/v8/src/third_party/siphash/LICENSE
 sha256 3f712e5fbdfdbd5ee7d9b8c8152580220df55de47f4eba2f26c95c4de19ad096  src/3rdparty/chromium/v8/src/third_party/utf8-decoder/LICENSE
 sha256 ebf25b8ce59c9e8883acd1ca75b6fc121937ca034f666c4077d2be739d2e1622  src/3rdparty/chromium/v8/src/third_party/valgrind/LICENSE
 sha256 cfe7599e45f340a35b4635090382897ca1526bc49b5e1889047f0168d131c415  src/3rdparty/chromium/v8/src/third_party/vtune/LICENSE
-sha256 b1b379fcaf3219593a4c433feb1b35c780bed23fafaae440b1ae2771a9521e3a  src/3rdparty/chromium/v8/third_party/antlr4/LICENSE.txt
 sha256 15137d6c822e3ab097093a33c3a39a9df699f373f6438867ad534ff60762a947  src/3rdparty/chromium/v8/third_party/colorama/LICENSE
 sha256 b9be92f13356083392d97da13cab8ae543c7911f44eff5289b693da8b17b9e08  src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE
+sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2  src/3rdparty/chromium/v8/third_party/v8/builtins/LICENSE
 sha256 5d85142a5609ad177a2d7a2e7cae060b886b8b42f25c5b9803cf0cb5ee04ad2f  src/3rdparty/gn/base/third_party/icu/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/gn/LICENSE
 sha256 eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  src/3rdparty/ninja/COPYING
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index 7c5aca81d4..e3db6da604 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -14,17 +14,21 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/base/third_party/valgrind/LICENSE \
 	src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE \
 	src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE \
+	src/3rdparty/chromium/build/fuchsia/fidlgen_js/third_party/enum34/LICENSE \
 	src/3rdparty/chromium/buildtools/LICENSE \
 	src/3rdparty/chromium/LICENSE \
 	src/3rdparty/chromium/LICENSE.chromium_os \
 	src/3rdparty/chromium/mojo/public/LICENSE \
 	src/3rdparty/chromium/net/third_party/mozilla_security_manager/LICENSE \
 	src/3rdparty/chromium/net/third_party/nss/LICENSE \
+	src/3rdparty/chromium/net/third_party/quiche/src/LICENSE \
+	src/3rdparty/chromium/net/third_party/uri_template/LICENSE \
 	src/3rdparty/chromium/ppapi/LICENSE \
 	src/3rdparty/chromium/third_party/abseil-cpp/LICENSE \
 	src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE \
 	src/3rdparty/chromium/third_party/angle/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
 	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
@@ -34,6 +38,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/axe-core/LICENSE \
 	src/3rdparty/chromium/third_party/bazel/LICENSE \
 	src/3rdparty/chromium/third_party/blanketjs/LICENSE \
+	src/3rdparty/chromium/third_party/blink/LICENSE_FOR_ABOUT_CREDITS \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2 \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1 \
@@ -50,7 +55,11 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/enum/enum/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/h2/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hpack/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/html5lib/LICENSE \
+	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hyperframe/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
@@ -66,16 +75,24 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/brotli/LICENSE \
 	src/3rdparty/chromium/third_party/bspatch/LICENSE \
 	src/3rdparty/chromium/third_party/byte_buddy/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/common/eslint/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rcssmin/bench/LICENSE.cssmin \
+	src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rcssmin/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/third_party/rjsmin/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/third_party/polymer/components/polymer/LICENSE.txt \
+	src/3rdparty/chromium/third_party/catapult/tracing/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/chai/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/d3/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/devscripts/COPYING \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/jszip/LICENSE.markdown \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/pako/LICENSE \
 	src/3rdparty/chromium/third_party/ced/LICENSE \
 	src/3rdparty/chromium/third_party/ced/src/LICENSE \
 	src/3rdparty/chromium/third_party/chaijs/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
-	src/3rdparty/chromium/third_party/chromevox/LICENSE \
-	src/3rdparty/chromium/third_party/chromevox/third_party/closure-library/LICENSE \
-	src/3rdparty/chromium/third_party/chromevox/third_party/sre/LICENSE \
-	src/3rdparty/chromium/third_party/cld_3/LICENSE \
-	src/3rdparty/chromium/third_party/cld_3/src/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE \
@@ -84,6 +101,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/cros_system_api/LICENSE \
 	src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE \
 	src/3rdparty/chromium/third_party/d3/src/LICENSE \
+	src/3rdparty/chromium/third_party/dawn/LICENSE \
 	src/3rdparty/chromium/third_party/decklink/LICENSE \
 	src/3rdparty/chromium/third_party/devscripts/COPYING \
 	src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE \
@@ -232,6 +250,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/flac/COPYING.LGPL \
 	src/3rdparty/chromium/third_party/flac/COPYING.Xiph \
 	src/3rdparty/chromium/third_party/flatbuffers/LICENSE \
+	src/3rdparty/chromium/third_party/flatbuffers/src/dart/LICENSE \
 	src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt \
 	src/3rdparty/chromium/third_party/flot/LICENSE.txt \
 	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
@@ -240,7 +259,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/gestures/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gif_player/LICENSE \
+	src/3rdparty/chromium/third_party/glfw/src/LICENSE.md \
 	src/3rdparty/chromium/third_party/glslang/LICENSE \
+	src/3rdparty/chromium/third_party/glslang/src/LICENSE.txt \
 	src/3rdparty/chromium/third_party/googletest/src/googlemock/LICENSE \
 	src/3rdparty/chromium/third_party/googletest/src/googlemock/scripts/generator/LICENSE \
 	src/3rdparty/chromium/third_party/googletest/src/googletest/LICENSE \
@@ -250,7 +271,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/guava/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE \
-	src/3rdparty/chromium/third_party/haha/LICENSE \
 	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
 	src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING \
 	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/hb-ucdn/COPYING \
@@ -264,22 +284,28 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/icu/license.html \
 	src/3rdparty/chromium/third_party/icu/scripts/LICENSE \
 	src/3rdparty/chromium/third_party/ijar/LICENSE \
+	src/3rdparty/chromium/third_party/ink/LICENSE \
 	src/3rdparty/chromium/third_party/inspector_protocol/LICENSE \
 	src/3rdparty/chromium/third_party/intellij/LICENSE \
 	src/3rdparty/chromium/third_party/isimpledom/LICENSE \
-	src/3rdparty/chromium/third_party/javax_inject/LICENSE \
 	src/3rdparty/chromium/third_party/jinja2/LICENSE \
 	src/3rdparty/chromium/third_party/jmake/LICENSE \
 	src/3rdparty/chromium/third_party/jsoncpp/LICENSE \
+	src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE \
 	src/3rdparty/chromium/third_party/jstemplate/COPYING \
 	src/3rdparty/chromium/third_party/khronos/LICENSE \
-	src/3rdparty/chromium/third_party/leakcanary/LICENSE \
 	src/3rdparty/chromium/third_party/leveldatabase/src/LICENSE \
 	src/3rdparty/chromium/third_party/libaddressinput/LICENSE \
 	src/3rdparty/chromium/third_party/libaddressinput/src/cpp/LICENSE.chromium \
 	src/3rdparty/chromium/third_party/libaddressinput/src/LICENSE \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/LICENSE \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/fastfeat/LICENSE \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/googletest/src/googletest/LICENSE \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/libwebm/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/vector/LICENSE \
+	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE \
+	src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE \
 	src/3rdparty/chromium/third_party/libevdev/LICENSE \
-	src/3rdparty/chromium/third_party/libFuzzer/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE \
 	src/3rdparty/chromium/third_party/libjpeg/LICENSE \
 	src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md \
@@ -308,23 +334,23 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/mach_override/LICENSE \
 	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
 	src/3rdparty/chromium/third_party/material_design_icons/LICENSE \
-	src/3rdparty/chromium/third_party/mesa/LICENSE \
-	src/3rdparty/chromium/third_party/mesa/src/docs/COPYING \
-	src/3rdparty/chromium/third_party/mesa/src/docs/license.html \
-	src/3rdparty/chromium/third_party/mesa/src/src/gallium/drivers/radeon/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/mesa_headers/LICENSE \
 	src/3rdparty/chromium/third_party/metrics_proto/LICENSE \
+	src/3rdparty/chromium/third_party/microsoft_webauthn/LICENSE \
 	src/3rdparty/chromium/third_party/minigbm/LICENSE \
 	src/3rdparty/chromium/third_party/minigbm/src/LICENSE \
+	src/3rdparty/chromium/third_party/minizip/src/lib/bzip2/LICENSE \
 	src/3rdparty/chromium/third_party/minizip/src/LICENSE \
 	src/3rdparty/chromium/third_party/mocha/LICENSE \
 	src/3rdparty/chromium/third_party/mockito/LICENSE \
 	src/3rdparty/chromium/third_party/modp_b64/LICENSE \
-	src/3rdparty/chromium/third_party/molokocacao/LICENSE \
 	src/3rdparty/chromium/third_party/motemplate/LICENSE \
 	src/3rdparty/chromium/third_party/mozilla/LICENSE \
+	src/3rdparty/chromium/third_party/nasm/LICENSE \
 	src/3rdparty/chromium/third_party/netty4/LICENSE \
 	src/3rdparty/chromium/third_party/netty-tcnative/LICENSE \
 	src/3rdparty/chromium/third_party/node/LICENSE \
+	src/3rdparty/chromium/third_party/nvml/LICENSE \
 	src/3rdparty/chromium/third_party/objenesis/LICENSE \
 	src/3rdparty/chromium/third_party/ocmock/License.txt \
 	src/3rdparty/chromium/third_party/openh264/src/LICENSE \
@@ -336,6 +362,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/ow2_asm/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt \
 	src/3rdparty/chromium/third_party/pexpect/LICENSE \
 	src/3rdparty/chromium/third_party/ply/LICENSE \
@@ -373,13 +400,21 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
 	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
 	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
+	src/3rdparty/chromium/third_party/skia/experimental/canvaskit/canvaskit/LICENSE \
+	src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE \
 	src/3rdparty/chromium/third_party/skia/LICENSE \
+	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE \
+	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/skcms/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt \
 	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/wuffs/LICENSE \
 	src/3rdparty/chromium/third_party/smhasher/LICENSE \
 	src/3rdparty/chromium/third_party/snappy/src/COPYING \
+	src/3rdparty/chromium/third_party/spirv-headers/LICENSE \
+	src/3rdparty/chromium/third_party/spirv-headers/src/LICENSE \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
@@ -391,7 +426,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/include/llvm/Support/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/projects/sample/autoconf/LICENSE.TXT \
-	src/3rdparty/chromium/third_party/swiftshader/third_party/llvm-subzero/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt \
 	src/3rdparty/chromium/third_party/swiftshader/third_party/subzero/LICENSE.TXT \
@@ -414,20 +448,29 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/web-animations-js/sources/COPYING \
 	src/3rdparty/chromium/third_party/webdriver/COPYING \
 	src/3rdparty/chromium/third_party/webdriver/LICENSE \
-	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
+	src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/fft4g/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/spl_sqrt_floor/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md \
 	src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/license_template.txt \
-	src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY \
+	src/3rdparty/chromium/third_party/webrtc/modules/third_party/fft/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/modules/third_party/g711/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/modules/third_party/g722/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/modules/third_party/portaudio/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/base64/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/rtc_base/third_party/sigslot/LICENSE \
+	src/3rdparty/chromium/third_party/webxr_test_pages/LICENSE \
+	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/cottontail/LICENSE.md \
+	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md \
+	src/3rdparty/chromium/third_party/widevine/LICENSE \
 	src/3rdparty/chromium/third_party/woff2/LICENSE \
 	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
 	src/3rdparty/chromium/third_party/xstream/LICENSE \
 	src/3rdparty/chromium/third_party/yara/src/COPYING \
 	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING \
 	src/3rdparty/chromium/third_party/zlib/LICENSE \
-	src/3rdparty/chromium/tools/gyp/LICENSE \
 	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
 	src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE \
 	src/3rdparty/chromium/tools/symsrc/COPYING-pefile \
@@ -438,12 +481,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/v8/LICENSE.strongtalk \
 	src/3rdparty/chromium/v8/LICENSE.v8 \
 	src/3rdparty/chromium/v8/LICENSE.valgrind \
+	src/3rdparty/chromium/v8/src/third_party/siphash/LICENSE \
 	src/3rdparty/chromium/v8/src/third_party/utf8-decoder/LICENSE \
 	src/3rdparty/chromium/v8/src/third_party/valgrind/LICENSE \
 	src/3rdparty/chromium/v8/src/third_party/vtune/LICENSE \
-	src/3rdparty/chromium/v8/third_party/antlr4/LICENSE.txt \
 	src/3rdparty/chromium/v8/third_party/colorama/LICENSE \
 	src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE \
+	src/3rdparty/chromium/v8/third_party/v8/builtins/LICENSE \
 	src/3rdparty/gn/base/third_party/icu/LICENSE \
 	src/3rdparty/gn/LICENSE \
-	src/3rdparty/ninja/COPYING
+	src/3rdparty/ninja/COPYING \
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index ae3b7c83e7..3660e20d7e 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebsockets-everywhere-src-5.12.5.tar.xz.sha256
-sha256 5d58e697c49c0ea19a8299deba84b5360dca8c336a1636d38de0351757293262  qtwebsockets-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebsockets-everywhere-src-5.13.2.tar.xz.sha256
+sha256 fc11236c8bf69b27a4e237a27b9ea27fc90d8c25d81d1d451ce3a0b63cbc02d3 qtwebsockets-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 2de27a0add..2d1e85c45b 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
 sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebview-everywhere-src-5.12.5.tar.xz.sha256
-sha256 a6d4d8c335cd6838f4638874fcd67655e80db569ed567a774a84f6bf7d332f26  qtwebview-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtwebview-everywhere-src-5.13.2.tar.xz.sha256
+sha256 394cc7a9cb29b7883816ff3137b022f30568151aada0739fc99a23789c21c015 qtwebview-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash b/package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash
similarity index 65%
rename from package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash
index b8f425109c..48545ee9f5 100644
--- a/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtx11extras-everywhere-src-5.12.5.tar.xz.mirrorlist
-sha256 89425af3e48b040878c6a64ace58c17a83b87c9330e6366b09a41d6797062a68 qtx11extras-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtx11extras-everywhere-src-5.13.2.tar.xz.mirrorlist
+sha256 95a7c5c30f42e9575c3a17a2c0eb0cdbdd2d89dbcb3ee1426cd41bb07e28c51c qtx11extras-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index a5ec76dbb2..71e03bdcc0 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtxmlpatterns-everywhere-src-5.12.5.tar.xz.sha256
-sha256 b905d9107f87798ef0f142942fc45c0f63fc113522ab041e791d3cb744a8babd  qtxmlpatterns-everywhere-src-5.12.5.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.13/5.13.2/submodules/qtxmlpatterns-everywhere-src-5.13.2.tar.xz.sha256
+sha256 1e87d8c004ec0beea3b29d13f0964c563aa9fae51c392c998750ca4e386374e2 qtxmlpatterns-everywhere-src-5.13.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.24.0
