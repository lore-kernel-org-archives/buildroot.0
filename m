From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 11 Jul 2017 11:00:56 -0700
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
Message-ID: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt 5.9 is a Long Term Support version [1].

This removes the following patch only for 5.9.1 that have been upstreamed:
- qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch [2]

[1] https://www.qt.io/qt5-9/
[2] https://github.com/qt/qtwebkit/commit/548380af096f8277e460383c81a4ecdf2b77523f

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>

---

Notes:

Some license file changes are involved, a new dependency on pcre2, and some
filename changes.  qt5webkit popped back into the picture for 5.9.1 after
being absent for 5.9.0 "officially."

QT5_SNAPSHOTS_SITE is not currently used with this commit, and it's URL points
to a non-existent location.

This needs to be on top of pcre2: new package (49dfb330).
---
 package/qt5/Config.in                              |  4 +-
 package/qt5/qt5.mk                                 |  4 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 package/qt5/qt5base/Config.in                      |  9 ++-
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5base/qt5base.mk                     | 12 ++-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 .../qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch | 85 ----------------------
 .../5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch     | 85 ++++++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 34 files changed, 157 insertions(+), 144 deletions(-)
 delete mode 100644 package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
 create mode 100644 package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index cca04a6..abaa584 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,14 +35,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.8)"
+	bool "Latest (5.9)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.8, which is licensed under
+	  This option builds Qt 5.9, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 47c3e3b..a642918 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.8
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION_MAJOR = 5.9
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 else
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7eaf2cd..5616dcb 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
-sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5  qt3d-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4f1fe5b812d78987341b854e7f2907f0375dc188cfa6cf9db101b26e9dfd4996 qt3d-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 63c7f8f..5932d41 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_QT5BASE
 	bool "qt5base"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_16
-	select BR2_PACKAGE_PCRE_UTF
+	select BR2_PACKAGE_PCRE if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_16 if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_UTF if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE2 if BR2_PACKAGE_QT5_VERSION_LATEST
+	select BR2_PACKAGE_PCRE2_16 if BR2_PACKAGE_QT5_VERSION_LATEST
+	select BR2_PACKAGE_PCRE2_32 if BR2_PACKAGE_QT5_VERSION_LATEST
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 3f6af8a..5d86701 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtbase-opensource-src-5.8.0.tar.xz
-sha256 c17111ae02a44dc7be1ec2cf979a47ee9e58edf4904041a525c21f4fa53fc005  qtbase-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtbase-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 bc9a21e9f6fff9629019fdf9f989f064751d5073c3a28dc596def92f4d4275c6 qtbase-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c5d2aa1..d08633f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -8,7 +8,7 @@ QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
-QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
+QT5BASE_DEPENDENCIES = host-pkgconf zlib
 QT5BASE_INSTALL_STAGING = YES
 
 # A few comments:
@@ -27,6 +27,16 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+#  * -system-pcre because pcre is mandatory to build Qt, and we
+#    want to use the one packaged in Buildroot
+#    with Qt5.9 pcre should be > 10.20 (pcre2)
+QT5BASE_CONFIGURE_OPTS += -system-pcre
+QT5BASE_DEPENDENCIES += pcre
+else
+QT5BASE_DEPENDENCIES += pcre2
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 
 # Uses libgbm from mesa3d
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 2d84fe4..81386e0 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtcanvas3d-opensource-src-5.8.0.tar.xz
-sha256 5446f790f526f582df7790e1e1442357f61aac9c23ea9b00d4a791c9d78ccaa3  qtcanvas3d-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtcanvas3d-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4b8bf09330f03d2b3998f5447991546704715478c54f4f8d82d00bee3047de81 qtcanvas3d-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index d6b841a..b6762f4 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtconnectivity-opensource-src-5.8.0.tar.xz
-sha256 7b2d01e9d67f6390a9e64bdae62e81a965b0f0b21137cf1a021e08a28bb227f1  qtconnectivity-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtconnectivity-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 40638b715517bff8509fe9fe1e6a4e45e0f66e68920605048e080dd023ae7fd5 qtconnectivity-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 3a0473a..4369a41 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -12,7 +12,7 @@ QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 98a46f1..76f3f02 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtdeclarative-opensource-src-5.8.0.tar.xz
-sha256 32941eb9ad12d8735dfc64de8b50b5ab830a6d8705a421c57369de7cb5708a46  qtdeclarative-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtdeclarative-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 d2fe6c9c1a9f19af6e96553c6d75366ab8f397bc232acd67d31476955fee94ff qtdeclarative-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index ffb4079..de8b048 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -12,7 +12,7 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index ac4167b..816186b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtgraphicaleffects-opensource-src-5.8.0.tar.xz
-sha256 5f2a9b50530ac83d7c2b2ce73fbdf03ac61f83a9521e9d4b796fa17a969dd919  qtgraphicaleffects-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtgraphicaleffects-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 5f86c38e36d9553049cfbe56d4869e73cf8ab920905402cbcafb56dd8a1a59ff qtgraphicaleffects-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 0a63523..6e0448a 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtimageformats-opensource-src-5.8.0.tar.xz
-sha256 75045eeac11c96194260badbdb4d3e9eb7b7f9972d18d3491230ea820be4606f  qtimageformats-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtimageformats-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 79fee307310a66100bd3d907ea69bd039dcd727c15f27e990167e7a27d1b8a47 qtimageformats-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 6afc918..4046060 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtlocation-opensource-src-5.8.0.tar.xz
-sha256 48a1e39ed989f0133aeacaa379e9c3958ec9b08c043626bba503619891d21abb  qtlocation-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtlocation-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4bc43c1df69c5322f982588711d4a65f8408b71a36e43ba19b39d1aae87e1515 qtlocation-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index ffd8a77..3e85272 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtmultimedia-opensource-src-5.8.0.tar.xz
-sha256 a8bc044834f95208261915feefe5e2fdb6761b76f0f99e21062963bd9f9d4a07  qtmultimedia-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtmultimedia-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 e48fbe71b4418eb7caba5ef5aa422483fb28d0e894cbc41f3d8b73b3d7fee6e4 qtmultimedia-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 1a5ee10..835142e 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,7 +12,7 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 95657d2..aecc142 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols-opensource-src-5.8.0.tar.xz
-sha256 04e70d0ccfd9ba882691a5e8f81e3428ae1b72a76bb9f43ba242f1c33bd7b326  qtquickcontrols-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 520ed0e110f9d0977eb873ea0e05a3d205c9c1b1ad2dd606875708848b21ec2e qtquickcontrols-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 80a3103..fefaba8 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols2-opensource-src-5.8.0.tar.xz
-sha256 b099866ec74f13cf0047274c61f0486d1eba27716fa07b69f682c54d3a4ade1b  qtquickcontrols2-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols2-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 203be0321112d1513b722fce463f9e30d7d00befb33349901d9517f4f13408ff qtquickcontrols2-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 6e369d8..5177d68 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtscript-opensource-src-5.8.0.tar.xz
-sha256 293ab91d2d189d889dc80609aa259190fb7de636d360e904784a5ce1a45e5ad3  qtscript-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtscript-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 176a08865d5f66437b0f279fc5d7f381f359f20bafbffcebdcac61e86415188f qtscript-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 307ad6f..4abf631 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsensors-opensource-src-5.8.0.tar.xz
-sha256 3a5d0639ecf8cd30c8ca349c353a8f3c424889b53831e70b6d8c481fc45de796  qtsensors-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsensors-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 5af19397aa8ccd88c1fbb7cda4ee2a583f05bdf8ae090eb616bb276ff2e9e29c qtsensors-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index f15945c..c56cfb5 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialbus-opensource-src-5.8.0.tar.xz
-sha256 58343dd9f2e339d4900a2d4b54ee25ed959cf62bacb012fe61e6b99d7958c10a  qtserialbus-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialbus-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 caa9feefbf1d51b38d6bc923428009d524c0c5eb77f30e4b6d84fec1ce19f3c3 qtserialbus-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 18c590b..7851cd1 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialport-opensource-src-5.8.0.tar.xz
-sha256 52317fded73ad0beb0a2ecf93124a8e2dfdcf14270a762c1f4fd06fb075506ad  qtserialport-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialport-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 e1fe85bf292929c3a62cb4d21efaaa4e89f70f48ea10914da07d0670ec617a69 qtserialport-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 6855e85..c954efd 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsvg-opensource-src-5.8.0.tar.xz
-sha256 9873191c211ab4da9c0bc47b1e3549f475db4d448bba3175e0f86b24eefadc89  qtsvg-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsvg-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 99f294f874b13553e4ed49cd9465580ad0c9b92e29cdfa47b2e4096835c1e2e5 qtsvg-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 541d95b..ae8513f 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qttools-opensource-src-5.8.0.tar.xz
-sha256 95ec8e76d393b6ba26ffff5041fce41946d2bf3aec1402c6533e24d9fc269d83  qttools-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qttools-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 c4eb56cf24a75661b8317b566be37396c90357b4f6730ef12b8c97a7079ca0e8 qttools-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 7f5a75b..3638b74 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -21,7 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5TOOLS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index ea30fdb..4e66dc7 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
-sha256 35fdf5b39d930935b6299ac59f347bea89b983e16bd7961fee3f1b8e16f4e21c  qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtvirtualkeyboard-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 6b746a6dc3ab54edf3007d0f6a2f8f31281aed03629830f59acfbc8514d6e94c  qtvirtualkeyboard-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7fd01efb..27c3b0a 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebchannel-opensource-src-5.8.0.tar.xz
-sha256 5bf5b15413baa235ee2cbfd136ea3b9303b32879b54f9f25bfb4dc96d37d0b4a  qtwebchannel-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebchannel-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 80425f5a6df8784f5221809ffd664486ed38427f514ab4ec174e20456b027000 qtwebchannel-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
deleted file mode 100644
index 14352a1..0000000
--- a/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
-From: Magnus Granberg <zorry@gentoo.org>
-Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH] Remove TEXTREL tag in x86
-
-Fix textrel QA warnings when building qtwebkit for x86:
-
-  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
-
-Patch from upstream webkit:
-
-  https://bugs.webkit.org/show_bug.cgi?id=70610
-
-Minor refresh required to apply cleanly to the older webkit sources used
-by qtwebkit. Specifically, the patch needed to be modified to account
-for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
-part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
-
-Upstream status [webkit] : backport
-Upstream status [qtwebkit] : unclear
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0002-Remove-TEXTREL-tag-in-x86.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
- Source/WTF/wtf/InlineASM.h                    |  2 ++
- 2 files changed, 26 insertions(+)
-
-diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-index 9684df2..8af82d8 100644
---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-@@ -524,6 +524,30 @@ double jsRound(double d)
-     } \
-     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
- 
-+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
-+#define defineUnaryDoubleOpWrapper(function) \
-+    asm( \
-+        ".text\n" \
-+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
-+        HIDE_SYMBOL(function##Thunk) "\n" \
-+        SYMBOL_STRING(function##Thunk) ":" "\n" \
-+        "pushl %ebx\n" \
-+        "subl $20, %esp\n" \
-+        "movsd %xmm0, (%esp) \n" \
-+        "call __x86.get_pc_thunk.bx\n" \
-+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
-+        "call " GLOBAL_REFERENCE(function) "\n" \
-+        "fstpl (%esp) \n" \
-+        "movsd (%esp), %xmm0 \n" \
-+        "addl $20, %esp\n" \
-+        "popl %ebx\n" \
-+        "ret\n" \
-+    );\
-+    extern "C" { \
-+        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
-+    } \
-+    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
-+
- #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
- #define defineUnaryDoubleOpWrapper(function) \
-     asm( \
-diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
-index 0a2fe78..2dc40ef 100644
---- a/Source/WTF/wtf/InlineASM.h
-+++ b/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch
new file mode 100644
index 0000000..14352a1
--- /dev/null
+++ b/package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -0,0 +1,85 @@
+From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
+From: Magnus Granberg <zorry@gentoo.org>
+Date: Fri, 27 Feb 2015 11:55:09 +0100
+Subject: [PATCH] Remove TEXTREL tag in x86
+
+Fix textrel QA warnings when building qtwebkit for x86:
+
+  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
+
+Patch from upstream webkit:
+
+  https://bugs.webkit.org/show_bug.cgi?id=70610
+
+Minor refresh required to apply cleanly to the older webkit sources used
+by qtwebkit. Specifically, the patch needed to be modified to account
+for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
+part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
+
+Upstream status [webkit] : backport
+Upstream status [qtwebkit] : unclear
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Downloaded from:
+https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
+0002-Remove-TEXTREL-tag-in-x86.patch
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
+ Source/WTF/wtf/InlineASM.h                    |  2 ++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+index 9684df2..8af82d8 100644
+--- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
++++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+@@ -524,6 +524,30 @@ double jsRound(double d)
+     } \
+     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
+ 
++#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
++#define defineUnaryDoubleOpWrapper(function) \
++    asm( \
++        ".text\n" \
++        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
++        HIDE_SYMBOL(function##Thunk) "\n" \
++        SYMBOL_STRING(function##Thunk) ":" "\n" \
++        "pushl %ebx\n" \
++        "subl $20, %esp\n" \
++        "movsd %xmm0, (%esp) \n" \
++        "call __x86.get_pc_thunk.bx\n" \
++        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
++        "call " GLOBAL_REFERENCE(function) "\n" \
++        "fstpl (%esp) \n" \
++        "movsd (%esp), %xmm0 \n" \
++        "addl $20, %esp\n" \
++        "popl %ebx\n" \
++        "ret\n" \
++    );\
++    extern "C" { \
++        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
++    } \
++    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
++
+ #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
+ #define defineUnaryDoubleOpWrapper(function) \
+     asm( \
+diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
+index 0a2fe78..2dc40ef 100644
+--- a/Source/WTF/wtf/InlineASM.h
++++ b/Source/WTF/wtf/InlineASM.h
+@@ -46,6 +46,8 @@
+ #define GLOBAL_REFERENCE(name) #name "@plt"
+ #elif CPU(X86) && COMPILER(MINGW)
+ #define GLOBAL_REFERENCE(name) "@" #name "@4"
++#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
++#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
+ #else
+ #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
+ #endif
+-- 
+2.7.0
+
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 4431e2d..93f0594 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebkit-opensource-src-5.8.0.tar.xz
-sha256 79ae8660086bf92ffb0008b17566270e6477c8fa0daf9bb3ac29404fb5911bec  qtwebkit-opensource-src-5.8.0.tar.xz
+# hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 4136e35..7e9db76 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = $(QT5_SNAPSHOTS_SITE)
+QT5WEBKIT_SITE = $(QT5_SITE)
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index a91e084..c95027b 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebsockets-opensource-src-5.8.0.tar.xz
-sha256 aa110af297d0d3239f346c3ee0cd43621adf463eb62a04941bbfe3fcccb845f5  qtwebsockets-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebsockets-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 01277362430b5a75c19a16ded8cf4c53a3bccddcc0ba2f50648e0f2985f23464 qtwebsockets-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index eb0dc6c..a1ac2b7 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtx11extras-opensource-src-5.8.0.tar.xz
-sha256 bed7f2b5123a9849ec94afa67db5f296e6f527c6330f47a680c83586d3a4280e  qtx11extras-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtx11extras-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 a63d0e28958331d672dbd0f8c554bdaddbc974a27be37601f7f221a2ef1ad601 qtx11extras-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index c1bb663..bf8c04a 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtxmlpatterns-opensource-src-5.8.0.tar.xz
-sha256 7bffa65ea52e54fb1314b45222888612d55eaf51a936a6119b8756266439da04  qtxmlpatterns-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtxmlpatterns-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 b584686496ad1b1b3426d642bd705cab3fc02313b067a33d1b826a27aee29c24 qtxmlpatterns-opensource-src-5.9.1.tar.xz
-- 
2.7.4
