From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:46:48 +0100
Subject: [Buildroot] [git commit] qt5: add choice between version 5.6.2 and
	5.8.0
Message-ID: <20170207164722.A9B768215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa1c40ba3729b73618c28e82f89dbee82c34ff76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 5.8.0
- add hashes
- qt5 need C++11 compliant compiler since 5.7 ([1])
- use different licenses: since version 5.7 Qt removed the LGPL v2.1 option in favor
  of v3 with a different exception
- qt5base: renamed library to EglFSDeviceIntegration ([2])
- qt5base: remove ras-pi patch, commit c0cc5052097c723d0331a7619d686af9eb93d33c fix it ([3])
- qt5base: remove 0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [3b])
- qt5base: remove obsolete config-option -large ([4])
- qt5base: gstreamer support fully moved to qt5multimedia, so gstreamer
  related options are no longer passed ([5])
- add patch for python-pyqt5 to fix the build with Qt 5.8
- add tweak in libv4l to fix the build with Qt 5.8, originally provided
  by Peter Seiderer
- add patch from Peter Seiderer fixing a build issue with freetype

For 5.6.2
- moved patches to subdir, and renumber patches

[1]  http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
[2]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
[3]  https://codereview.qt-project.org/#/c/167172/
[3b] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda
[4]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
[5]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Thomas:
 - tweak commit log about GStreamer related changes, suggested by Arnout
 - move the gcc 4.8 dependency from the main qt5 option to just the
   qt5.8 selection, so that qt5.6 can still be built if gcc < 4.8 is
   used. Noticed by Arnout.
 - rename the options of the version selection to not include the
   version number itself so that we don't have to keep legacy
   symbols. Noticed by Arnout.
 - introduce changes to qt5quickcontrols2.mk needed to handle qt5.6
   vs. qt5.8, borrowed from a later patch in the series.
 - add patch for python-pyqt5 to fix the build with Qt 5.8.
 - add fix to libv4l.mk from Peter Seiderer to fix the build with Qt
   5.8.
 - renumber patches for 5.6.2, suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk                           |  4 +++
 ...owOkButtonHint-and-WindowCancelButtonHint.patch | 27 +++++++++++++++++
 package/qt5/Config.in                              | 22 ++++++++++++++
 package/qt5/qt5.mk                                 |  8 +++++
 package/qt5/qt53d/qt53d.hash                       |  3 ++
 .../0001-eglfs-rasp-pi-header-inclusion.patch}     |  0
 ...s-fix-eglfs_mali-compile-for-odroid-mali.patch} |  0
 ...lel-builds-with-qt-freetype-system-libpng.patch | 34 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.hash                   |  3 ++
 package/qt5/qt5base/qt5base.mk                     | 13 +++++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.hash   |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.mk     |  5 ++++
 package/qt5/qt5declarative/qt5declarative.hash     |  3 ++
 package/qt5/qt5declarative/qt5declarative.mk       |  5 ++++
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  3 ++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 ++++
 package/qt5/qt5imageformats/qt5imageformats.hash   |  3 ++
 package/qt5/qt5imageformats/qt5imageformats.mk     |  5 ++++
 package/qt5/qt5location/qt5location.hash           |  3 ++
 package/qt5/qt5location/qt5location.mk             |  5 ++++
 package/qt5/qt5multimedia/qt5multimedia.hash       |  3 ++
 package/qt5/qt5multimedia/qt5multimedia.mk         |  5 ++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  3 ++
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  3 ++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 12 ++++++++
 package/qt5/qt5script/qt5script.hash               |  3 ++
 package/qt5/qt5sensors/qt5sensors.hash             |  3 ++
 package/qt5/qt5sensors/qt5sensors.mk               |  5 ++++
 package/qt5/qt5serialbus/qt5serialbus.hash         |  3 ++
 package/qt5/qt5serialport/qt5serialport.hash       |  3 ++
 package/qt5/qt5serialport/qt5serialport.mk         |  5 ++++
 package/qt5/qt5svg/qt5svg.hash                     |  3 ++
 package/qt5/qt5svg/qt5svg.mk                       |  5 ++++
 package/qt5/qt5tools/qt5tools.hash                 |  3 ++
 package/qt5/qt5tools/qt5tools.mk                   |  5 ++++
 package/qt5/qt5webchannel/qt5webchannel.hash       |  3 ++
 package/qt5/qt5webchannel/qt5webchannel.mk         |  5 ++++
 package/qt5/qt5webkit/qt5webkit.hash               |  3 ++
 package/qt5/qt5websockets/qt5websockets.hash       |  3 ++
 package/qt5/qt5websockets/qt5websockets.mk         |  5 ++++
 package/qt5/qt5x11extras/qt5x11extras.hash         |  3 ++
 package/qt5/qt5x11extras/qt5x11extras.mk           |  5 ++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  3 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  5 ++++
 45 files changed, 256 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 78f9ddc..90ff045 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -66,6 +66,10 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
+# qt5 needs c++11 (since qt-5.7)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
 else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt
diff --git a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
new file mode 100644
index 0000000..146cce0
--- /dev/null
+++ b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
@@ -0,0 +1,27 @@
+From bb7cbdede46f72468bbb1b9bbefd43a1dbad21c0 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Mon, 30 Jan 2017 18:28:15 +0100
+Subject: [PATCH] remove WindowOkButtonHint and WindowCancelButtonHint from
+ qnamespace.sip as they are removed from qt5.8
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ sip/QtCore/qnamespace.sip | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/sip/QtCore/qnamespace.sip b/sip/QtCore/qnamespace.sip
+index 2db83b7..559f410 100644
+--- a/sip/QtCore/qnamespace.sip
++++ b/sip/QtCore/qnamespace.sip
+@@ -209,8 +209,6 @@ namespace Qt
+         WindowContextHelpButtonHint,
+         WindowShadeButtonHint,
+         WindowStaysOnTopHint,
+-        WindowOkButtonHint,
+-        WindowCancelButtonHint,
+         WindowStaysOnBottomHint,
+         WindowCloseButtonHint,
+         MacWindowToolBarButtonHint,
+-- 
+2.7.4
+
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 234dfdd..88b25d5 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -30,6 +30,28 @@ menuconfig BR2_PACKAGE_QT5
 	  http://qt.io
 
 if BR2_PACKAGE_QT5
+
+choice
+	prompt "Qt5 version"
+
+config BR2_QT5_VERSION_LATEST
+	bool "Latest (5.8)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  This option builds Qt 5.8, which is licensed under
+	  (L)GPLv3+.
+
+comment "Latest Qt version needs toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_QT5_VERSION_5_6
+	bool "LTS (5.6)"
+	help
+	  This option builds Qt 5.6, which is licensed under
+	  (L)GPLv2+.
+
+endchoice
+
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e937e23..9e20902 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,7 +1,15 @@
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5_VERSION_MAJOR = 5.8
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
+else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
+endif
+
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7179380..7eaf2cd 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
+sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5  qt3d-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/5.6.2/0001-eglfs-rasp-pi-header-inclusion.patch
similarity index 100%
rename from package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
rename to package/qt5/qt5base/5.6.2/0001-eglfs-rasp-pi-header-inclusion.patch
diff --git a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
similarity index 100%
rename from package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
rename to package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
diff --git a/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch b/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
new file mode 100644
index 0000000..8548ef0
--- /dev/null
+++ b/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
@@ -0,0 +1,34 @@
+From 74af93f5298b54bc2327843f390bf202776f2f48 Mon Sep 17 00:00:00 2001
+From: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
+Date: Tue, 10 Jan 2017 14:18:02 +0100
+Subject: [PATCH] fix parallel builds with -qt-freetype -system-libpng
+
+freetype has no dependency on gui, so it needs to pull in gui's
+configuration manually, as that's where the system libpng is found.
+
+Task-number: QTBUG-58038
+Change-Id: I881495f7d2a8f7c1a45d7d4c9e7698ff1d30f2a9
+Reviewed-by: Joerg Bornemann <joerg.bornemann@qt.io>
+Reviewed-by: Joni Poikelin <joni.poikelin@qt.io>
+
+Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/freetype/freetype.pro | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/3rdparty/freetype/freetype.pro b/src/3rdparty/freetype/freetype.pro
+index 5b1eb92e..390a6da7 100644
+--- a/src/3rdparty/freetype/freetype.pro
++++ b/src/3rdparty/freetype/freetype.pro
+@@ -69,6 +69,7 @@ DEFINES += FT_CONFIG_OPTION_SYSTEM_ZLIB
+ include(../zlib_dependency.pri)
+ 
+ DEFINES += FT_CONFIG_OPTION_USE_PNG
++include($$OUT_PWD/../../gui/qtgui-config.pri)
+ QMAKE_USE_PRIVATE += libpng
+ 
+ DEFINES += TT_CONFIG_OPTION_SUBPIXEL_HINTING
+-- 
+2.11.0
+
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 9808e9b..3f6af8a 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtbase-opensource-src-5.8.0.tar.xz
+sha256 c17111ae02a44dc7be1ec2cf979a47ee9e58edf4904041a525c21f4fa53fc005  qtbase-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4cd14c0..112259a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -43,12 +43,19 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
+ifeq ($(BR2_QT5_VERSION_5_6),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
+endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5BASE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
 QT5BASE_LICENSE_FILES += header.BSD
@@ -159,6 +166,7 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
+ifeq ($(BR2_QT5_VERSION_5_6),y)
 # gstreamer 0.10 support is broken in qt5multimedia
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
@@ -166,6 +174,7 @@ QT5BASE_DEPENDENCIES   += gst1-plugins-base
 else
 QT5BASE_CONFIGURE_OPTS += -no-gstreamer
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 QT5BASE_CONFIGURE_OPTS += -libinput
@@ -183,7 +192,11 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
+else
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
+endif
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 01819e4..2d84fe4 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtcanvas3d-opensource-src-5.8.0.tar.xz
+sha256 5446f790f526f582df7790e1e1442357f61aac9c23ea9b00d4a791c9d78ccaa3  qtcanvas3d-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 4574f3d..d6b841a 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtconnectivity-opensource-src-5.8.0.tar.xz
+sha256 7b2d01e9d67f6390a9e64bdae62e81a965b0f0b21137cf1a021e08a28bb227f1  qtconnectivity-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index c0a4d40..e8136c4 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -11,8 +11,13 @@ QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5CONNECTIVITY_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5CONNECTIVITY_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index d8d3a68..98a46f1 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtdeclarative-opensource-src-5.8.0.tar.xz
+sha256 32941eb9ad12d8735dfc64de8b50b5ab830a6d8705a421c57369de7cb5708a46  qtdeclarative-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index be3a7b7..5512baa 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,8 +11,13 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5DECLARATIVE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5DECLARATIVE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index ae29e3b..ac4167b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtgraphicaleffects-opensource-src-5.8.0.tar.xz
+sha256 5f2a9b50530ac83d7c2b2ce73fbdf03ac61f83a9521e9d4b796fa17a969dd919  qtgraphicaleffects-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 223374a..88abb0c 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -11,8 +11,13 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5GRAPHICALEFFECTS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5GRAPHICALEFFECTS_LICENSE = Commercial license
 QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 54b58e4..0a63523 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtimageformats-opensource-src-5.8.0.tar.xz
+sha256 75045eeac11c96194260badbdb4d3e9eb7b7f9972d18d3491230ea820be4606f  qtimageformats-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 921656d..0aa3971 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -11,8 +11,13 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5IMAGEFORMATS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5IMAGEFORMATS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5IMAGEFORMATS_LICENSE = Commercial license
 QT5IMAGEFORMATS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 374952f..6afc918 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtlocation-opensource-src-5.8.0.tar.xz
+sha256 48a1e39ed989f0133aeacaa379e9c3958ec9b08c043626bba503619891d21abb  qtlocation-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 358b162..460a4a4 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -11,8 +11,13 @@ QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5LOCATION_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5LOCATION_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5LOCATION_LICENSE = Commercial license
 QT5LOCATION_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 56a11fb..ffd8a77 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtmultimedia-opensource-src-5.8.0.tar.xz
+sha256 a8bc044834f95208261915feefe5e2fdb6761b76f0f99e21062963bd9f9d4a07  qtmultimedia-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 3075ffc..d2e0ff4 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,13 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5MULTIMEDIA_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5MULTIMEDIA_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 6db589d..95657d2 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols-opensource-src-5.8.0.tar.xz
+sha256 04e70d0ccfd9ba882691a5e8f81e3428ae1b72a76bb9f43ba242f1c33bd7b326  qtquickcontrols-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 0d85d48..80a3103 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols2-opensource-src-5.8.0.tar.xz
+sha256 b099866ec74f13cf0047274c61f0486d1eba27716fa07b69f682c54d3a4ade1b  qtquickcontrols2-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 8de7932..d412f69 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -36,6 +36,17 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
+	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
+endef
+else
 define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
@@ -43,5 +54,6 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
 	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
 endef
+endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index c8ecb75..6e369d8 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtscript-opensource-src-5.8.0.tar.xz
+sha256 293ab91d2d189d889dc80609aa259190fb7de636d360e904784a5ce1a45e5ad3  qtscript-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 65cd127..307ad6f 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsensors-opensource-src-5.8.0.tar.xz
+sha256 3a5d0639ecf8cd30c8ca349c353a8f3c424889b53831e70b6d8c481fc45de796  qtsensors-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 0dd952a..98c20ca 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -11,8 +11,13 @@ QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5SENSORS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SENSORS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SENSORS_LICENSE = Commercial license
 QT5SENSORS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 308c365..f15945c 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialbus-opensource-src-5.8.0.tar.xz
+sha256 58343dd9f2e339d4900a2d4b54ee25ed959cf62bacb012fe61e6b99d7958c10a  qtserialbus-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 2458e5d..18c590b 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialport-opensource-src-5.8.0.tar.xz
+sha256 52317fded73ad0beb0a2ecf93124a8e2dfdcf14270a762c1f4fd06fb075506ad  qtserialport-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 04df021..7ae7168 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -11,8 +11,13 @@ QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5SERIALPORT_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SERIALPORT_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SERIALPORT_LICENSE = Commercial license
 QT5SERIALPORT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 0c9e9eb..6855e85 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsvg-opensource-src-5.8.0.tar.xz
+sha256 9873191c211ab4da9c0bc47b1e3549f475db4d448bba3175e0f86b24eefadc89  qtsvg-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index ebd5cba..c21c3e8 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,8 +11,13 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5SVG_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5SVG_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index cc11b28..541d95b 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qttools-opensource-src-5.8.0.tar.xz
+sha256 95ec8e76d393b6ba26ffff5041fce41946d2bf3aec1402c6533e24d9fc269d83  qttools-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 6befb8b..e74911c 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -20,8 +20,13 @@ QT5TOOLS_DEPENDENCIES += qt5declarative
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5TOOLS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5TOOLS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5TOOLS_LICENSE = Commercial license
 QT5TOOLS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 0f9eaae..7fd01efb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebchannel-opensource-src-5.8.0.tar.xz
+sha256 5bf5b15413baa235ee2cbfd136ea3b9303b32879b54f9f25bfb4dc96d37d0b4a  qtwebchannel-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index c48757b..f5ccb20 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -11,8 +11,13 @@ QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5WEBCHANNEL_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5WEBCHANNEL_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 309f776..4431e2d 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebkit-opensource-src-5.8.0.tar.xz
+sha256 79ae8660086bf92ffb0008b17566270e6477c8fa0daf9bb3ac29404fb5911bec  qtwebkit-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3443476..a91e084 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebsockets-opensource-src-5.8.0.tar.xz
+sha256 aa110af297d0d3239f346c3ee0cd43621adf463eb62a04941bbfe3fcccb845f5  qtwebsockets-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 9771556..1794036 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,8 +11,13 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5WEBSOCKETS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools)
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
+else
 QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3c (examples)
 endif
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 297c578..eb0dc6c 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtx11extras-opensource-src-5.8.0.tar.xz
+sha256 bed7f2b5123a9849ec94afa67db5f296e6f527c6330f47a680c83586d3a4280e  qtx11extras-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index a0e1209..0ac0108 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -11,8 +11,13 @@ QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5X11EXTRAS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5X11EXTRAS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 else
 QT5X11EXTRAS_LICENSE = Commercial license
 QT5X11EXTRAS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index fa4e97f..c1bb663 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,2 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtxmlpatterns-opensource-src-5.8.0.tar.xz
+sha256 7bffa65ea52e54fb1314b45222888612d55eaf51a936a6119b8756266439da04  qtxmlpatterns-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 9fc44df..661c62d 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,13 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+QT5XMLPATTERNS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+else
 QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3c (examples)
 endif
